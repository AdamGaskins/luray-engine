package engine

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
}

MAIN_FILE :: "main.lua"

create :: proc(fs: vfs.Vfs, dev_mode: bool = false) -> Engine {
	engine := Engine {
		dev_mode = dev_mode,
		vfs      = fs,
	}

	if dev_mode {
		engine.watch = watcher.create(fs)
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
	script, ok := e.vfs.get_file(e.vfs.data, MAIN_FILE)
	if !ok {
		fmt.eprintln("Failed to open main.lua")
		return false
	}

	state := engine_lua.create_state()
	e.state = state
	defer lua.close(state)
	engine_lua.install_vfs_require(state, e.vfs)

	engine_lua.load_script(state, script)
	delete(script)

	// rl.SetTraceLogLevel(rl.TraceLogLevel.NONE)
	return engine_lua.call(state, "_init")
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
			fmt.printfln("Updated files: %v", modules)
			engine_lua.clear_user_modules(e.state, modules)

			script, ok := e.vfs.get_file(e.vfs.data, MAIN_FILE)
			defer delete(script)
			if ok {
				engine_lua.load_script(e.state, script)
			}
		}
	}

	if is_reload_button_pressed() {
		engine_lua.call(e.state, "_destroy")
		engine_lua.call(e.state, "_init")
	}

	return !rl.WindowShouldClose()
}

game_teardown :: proc(e: ^Engine) {
	engine_lua.call(e.state, "_destroy")
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

