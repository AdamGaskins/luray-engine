package engine_lua

import lua "../vendor/lua"
import "core:c"
import "core:fmt"
import "core:slice"
import "core:strings"
import rl "vendor:raylib"

@(private)
Tracked_Resource :: struct {
	path: string,
	ref:  c.int,
}

@(private)
tracked_images: [dynamic]Tracked_Resource
@(private)
tracked_textures: [dynamic]Tracked_Resource

@(private)
tracking_active: bool

// The resource must be pushed to the stack already
@(private)
track_pushed_resource :: proc(L: ^lua.State, list: ^[dynamic]Tracked_Resource, path: cstring) {
	if tracking_active {
		lua.pushvalue(L, -1)
		ref := lua.L_ref(L, lua.REGISTRYINDEX)
		append(list, Tracked_Resource{path = strings.clone(string(path)), ref = ref})
	}
}

@(private)
clear_tracked_resources :: proc(L: ^lua.State, arr: ^[dynamic]Tracked_Resource) {
	for res in arr {
		lua.L_unref(L, lua.REGISTRYINDEX, res.ref)
		delete(res.path)
	}
	clear(arr)
}

// Calls the Lua _init() function. When dev_mode is true, any ray.LoadImage
// call made during _init() — directly, or through a helper function/required
// module — is tracked for hot reload; tracking is disarmed the moment
// _init() returns, so later LoadImage calls (in _update, say) are not
// tracked.
call_init :: proc(L: ^lua.State, dev_mode: bool) -> bool {
	if dev_mode {
		clear_tracked_resources(L, &tracked_images)
		clear_tracked_resources(L, &tracked_textures)
		tracking_active = true
	}
	ok := call(L, "_init")
	if dev_mode {
		tracking_active = false
	}
	return ok
}

hot_reload_code :: proc(L: ^lua.State, modules: []string) {
	if len(modules) > 0 {
		fmt.printfln("Updated files: %v", modules)
		clear_user_modules(L, modules)

		script, ok := global_vfs.get_file(global_vfs.data, MAIN_FILE)
		defer delete(script)
		if ok {
			load_script(L, script)
		}
	}
}

// Called every dev-mode frame with the list of files the watcher saw change
// this poll. Any tracked image whose path matches gets its pixel data
// reloaded from the VFS and its Lua table updated in place, so anything in
// Lua still holding that table (a global, an upvalue, a field on some other
// object) sees the new image automatically.
hot_reload_images :: proc(L: ^lua.State, updated_files: []string) {
	for img in tracked_images {
		if !slice.contains(updated_files, img.path) {
			continue
		}

		fileName_c := strings.clone_to_cstring(img.path, context.temp_allocator)
		new_image := load_image_via_vfs(global_vfs, fileName_c)
		if new_image.data == nil {
			fmt.eprintfln("Failed to hot-reload image: %v", img.path)
			continue
		}

		lua.rawgeti(L, lua.REGISTRYINDEX, lua.Integer(img.ref))
		idx := lua.gettop(L)

		old_image := fromlua_Image(L, idx)
		rl.UnloadImage(old_image)

		tolua_Image(L, new_image, idx)

		lua.pop(L, 1)

		fmt.printfln("Hot-reloaded image: %v", img.path)
	}
}

hot_reload_textures :: proc(L: ^lua.State, updated_files: []string) {
	for img in tracked_textures {
		if !slice.contains(updated_files, img.path) {
			continue
		}

		fileName_c := strings.clone_to_cstring(img.path, context.temp_allocator)
		new_image := load_image_via_vfs(global_vfs, fileName_c)
		if new_image.data == nil {
			fmt.eprintfln("Failed to hot-reload texture: %v", img.path)
			continue
		}
		new_texture := rl.LoadTextureFromImage(new_image)
		rl.UnloadImage(new_image)

		lua.rawgeti(L, lua.REGISTRYINDEX, lua.Integer(img.ref))
		idx := lua.gettop(L)

		old_tex := fromlua_Texture(L, idx)
		rl.UnloadTexture(old_tex)

		tolua_Texture(L, new_texture, idx)

		lua.pop(L, 1)

		fmt.printfln("Hot-reloaded texture: %v", img.path)
	}
}

