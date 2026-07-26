package engine

import "../common"
import "../engine_lua"
import lua "../vendor/lua"
import "../vfs"
import "../watcher"
import "core:fmt"
import "core:strings"
import rl "vendor:raylib"

Engine :: struct {
	dev_mode: bool,
	watch:    watcher.Watcher,
	vfs:      vfs.Vfs,
	state:    ^lua.State,
	lua_ctx:  engine_lua.Lua_Context,
}

create :: proc(fs: vfs.Vfs, dev_mode: bool = false) -> Engine {
	fmt.printfln("Starting Luray Engine v%v (%v)", common.LURAY_VERSION, common.LURAY_COMMIT)

	engine := Engine {
		dev_mode = dev_mode,
		vfs      = fs,
	}

	if dev_mode {
		engine.watch = watcher.create(fs)
		fmt.printfln("Enabling hot-reload")
	}

	return engine
}

destroy :: proc(e: ^Engine) {
	if e.dev_mode {
		watcher.destroy(&e.watch)
	}
}

run :: proc(e: ^Engine) {
	game_init(e)

	for game_step(e) {}

	game_teardown(e)
}

game_init :: proc(e: ^Engine) -> bool {
	script, ok := e.vfs.get_file(e.vfs.data, engine_lua.MAIN_FILE)
	if !ok {
		fmt.eprintln("Failed to open main.lua")
		return false
	}

	state := engine_lua.create_state(&e.lua_ctx)
	e.state = state
	engine_lua.install_vfs_require(&e.lua_ctx, state, e.vfs)

	engine_lua.load_script(state, script)
	delete(script)

	// rl.SetTraceLogLevel(rl.TraceLogLevel.NONE)
	return engine_lua.call_init(&e.lua_ctx, state, e.dev_mode)
}

game_step :: proc(e: ^Engine) -> bool {
	engine_lua.call(e.state, "_update")

	if e.dev_mode {
		updated_files := watcher.poll(&e.watch)
		// No need to delete the strings inside
		defer delete(updated_files)
		if len(updated_files) > 0 {
			modules := modules_from_files(updated_files)
			defer free_modules(&modules)

			engine_lua.hot_reload_code(&e.lua_ctx, e.state, modules)
			engine_lua.hot_reload_images(&e.lua_ctx, e.state, updated_files)
			engine_lua.hot_reload_textures(&e.lua_ctx, e.state, updated_files)
		}
	}

	if is_reload_button_pressed() {
		engine_lua.call(e.state, "_destroy")
		engine_lua.call_init(&e.lua_ctx, e.state, e.dev_mode)
	}

	free_all(context.temp_allocator)

	when ODIN_OS == .JS {
		return true
	} else {
		return !rl.WindowShouldClose()
	}
}

game_teardown :: proc(e: ^Engine) {
	engine_lua.call(e.state, "_destroy")
	lua.close(e.state)
}

@(private)
modules_from_files :: proc(files: []string) -> []string {
	modules: [dynamic]string

	for file in files {
		if !strings.ends_with(file, ".lua") {
			continue
		}

		module_name := strings.trim_suffix(file, ".lua")
		module_name, _ = strings.replace_all(module_name, "/", ".")
		append(&modules, module_name)
	}

	return modules[:]
}

@(private)
free_modules :: proc(modules: ^[]string) {
	for module in modules {
		delete(module)
	}
	delete(modules^)
}

@(private)
is_reload_button_pressed :: proc() -> bool {
	if ODIN_OS == .Darwin {
		return(
			rl.IsKeyPressed(rl.KeyboardKey.R) &&
			(rl.IsKeyDown(rl.KeyboardKey.LEFT_SUPER) || rl.IsKeyDown(rl.KeyboardKey.RIGHT_SUPER)) \
		)
	}

	return(
		rl.IsKeyPressed(rl.KeyboardKey.R) &&
		(rl.IsKeyDown(rl.KeyboardKey.LEFT_CONTROL) || rl.IsKeyDown(rl.KeyboardKey.RIGHT_CONTROL)) \
	)
}

