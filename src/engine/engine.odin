package engine

import "../engine_lua"
import "../watcher"
import "core:fmt"
import "core:os"
import "core:path/filepath"
import lua "vendor:lua/5.4"
import rl "vendor:raylib"

Engine :: struct {
	dev_mode:  bool,
	main_file: string,
	watch:     watcher.Watcher,
}

new :: proc(main_file: string, dev_mode: bool = false) -> Engine {
	os.set_working_directory(filepath.dir(main_file))
	main_file_name := filepath.base(main_file)

	if !os.exists(main_file_name) {
		fmt.eprintfln("Source file not found: %v", main_file_name)
		os.exit(1)
	}

	engine := Engine {
		dev_mode  = dev_mode,
		main_file = main_file_name,
	}

	if dev_mode {
		engine.watch = watcher.new()
	}

	return engine
}

destroy :: proc(e: ^Engine) {
	if e.dev_mode {
		watcher.destroy(&e.watch)
	}
}

run :: proc(e: ^Engine) {
	state := engine_lua.create_state()
	defer lua.close(state)
	engine_lua.load_script(state, e.main_file)
	engine_lua.call(state, "_init")

	if e.dev_mode {
		watcher.watch(&e.watch, e.main_file)
	}

	for !rl.WindowShouldClose() {
		engine_lua.call(state, "_update")

		if e.dev_mode && watcher.poll(&e.watch) {
			engine_lua.load_script(state, e.main_file)
		}

		if is_reload_button_pressed() {
			engine_lua.call(state, "_destroy")
			engine_lua.call(state, "_init")
		}
	}

	engine_lua.call(state, "_destroy")
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

