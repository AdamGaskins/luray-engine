package engine_lua

import lua "../vendor/lua"
import "../vfs"
import "base:runtime"
import "core:c"
import "core:fmt"
import "core:strings"

// Captured by `create_state` so that the `proc "c"` Lua callbacks can inherit
// the proper context. This is because Emscripten needs a special allocator.
callback_context: runtime.Context

create_state :: proc() -> ^lua.State {
	callback_context = context
	state := lua.L_newstate()
	lua.L_openlibs(state)
	bind_raylib(state)
	return state
}

load_script :: proc(state: ^lua.State, script: []byte) {
	script_c, _ := strings.clone_to_cstring(string(script))
	defer delete(script_c)

	if lua.L_dostring(state, script_c) != 0 {
		err := lua.tostring(state, -1)
		fmt.eprintln("Failed to load script: ", err)
		lua.pop(state, 1)
	}
}

clear_user_modules :: proc(state: ^lua.State, modules: []string) {
	lua.L_getsubtable(state, lua.REGISTRYINDEX, lua.LOADED_TABLE)
	loaded_idx := lua.gettop(state)

	for module in modules {
		cname := strings.clone_to_cstring(module, context.allocator)
		defer delete(cname)
		lua.pushnil(state)
		lua.setfield(state, loaded_idx, cname) // package.loaded[name] = nil
	}
}

call :: proc(state: ^lua.State, name: cstring) -> bool {
	lua.getglobal(state, "debug")
	lua.getfield(state, -1, "traceback")
	lua.remove(state, -2)
	msgh_index := lua.gettop(state)

	lua.getglobal(state, name)
	if lua.pcall(state, 0, 0, msgh_index) != 0 {
		err := lua.tostring(state, -1)
		fmt.eprintfln("(%v): %v", name, err)
		lua.pop(state, 1)
		return false
	}

	return true
}

// ugly, I know :(
global_vfs: vfs.Vfs
install_vfs_require :: proc(L: ^lua.State, fs: vfs.Vfs) {
	global_vfs = fs

	lua.getglobal(L, "package") // stack: [package]
	lua.getfield(L, -1, "searchers") // stack: [package, searchers]

	// find current length so we can clear everything after slot 1 (preload)
	n := lua.rawlen(L, -1)
	i: lua.Unsigned = 2
	for i <= n {
		lua.pushnil(L)
		lua.rawseti(L, -2, lua.Integer(i))
		i += 1
	}

	// install ours at index 2, right after package.preload
	lua.pushcfunction(L, vfs_searcher)
	lua.rawseti(L, -2, 2)

	lua.pop(L, 2) // pop searchers, package
}


@(private)
vfs_searcher :: proc "c" (L: ^lua.State) -> c.int {
	context = callback_context

	mod_cstr := lua.tostring(L, 1)
	modname := string(mod_cstr)

	// dotted module name -> path, e.g. "ui.button" -> "ui/button.lua"
	dotted := strings.clone(modname, context.temp_allocator)
	path_no_ext, _ := strings.replace_all(dotted, ".", "/", context.temp_allocator)

	candidates := [2]string {
		strings.concatenate({path_no_ext, ".lua"}, context.temp_allocator),
		strings.concatenate({path_no_ext, "/init.lua"}, context.temp_allocator),
	}

	for path in candidates {
		data, ok := global_vfs.get_file(global_vfs.data, path)
		if !ok do continue
		defer delete(data)

		chunkname := strings.concatenate({"@", path}, context.temp_allocator)
		chunkname_c := strings.clone_to_cstring(chunkname, context.temp_allocator)

		status := lua.L_loadbuffer(L, raw_data(data), len(data), chunkname_c)

		if status != lua.OK {
			// syntax error in the module itself — abort require with the message
			// (loadbuffer already pushed the error string onto the stack)
			lua.error(L)
		}

		return 1 // loader function is on top of the stack
	}

	// nothing matched — tell require() why, in the format it expects
	msg := strings.concatenate(
		{"\n\tno file '", path_no_ext, ".lua' in virtual filesystem"},
		context.temp_allocator,
	)
	lua.pushstring(L, strings.clone_to_cstring(msg, context.temp_allocator))
	return 1
}

