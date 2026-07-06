package engine

import "../engine_lua"
import "../watcher"
import "core:fmt"
import "core:os"
import "core:strings"
import lua "vendor:lua/5.4"
import rl "vendor:raylib"

Engine :: struct {
	dev_mode: bool,
	watch:    watcher.Watcher,
}

MAIN_FILE :: "main.lua"

new :: proc(main_dir: string, dev_mode: bool = false) -> Engine {
	os.set_working_directory(main_dir)

	if !os.exists(MAIN_FILE) {
		fmt.eprintfln("main.lua not found in %v", main_dir)
		os.exit(1)
	}

	engine := Engine {
		dev_mode = dev_mode,
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
	engine_lua.load_script(state, MAIN_FILE)
	rl.SetTraceLogLevel(rl.TraceLogLevel.NONE)
	engine_lua.call(state, "_init")

	for !rl.WindowShouldClose() {
		engine_lua.call(state, "_update")

		if e.dev_mode {
			updated_files := watcher.poll(&e.watch)
			if len(updated_files) > 0 {
				modules := modules_from_files(updated_files)
				fmt.printfln("Updated files: %v", modules)
				engine_lua.clear_user_modules(state, modules)
				engine_lua.load_script(state, MAIN_FILE)
			}
		}

		if is_reload_button_pressed() {
			engine_lua.call(state, "_destroy")
			engine_lua.call(state, "_init")
		}
	}

	engine_lua.call(state, "_destroy")
}

@(private)
modules_from_files :: proc(files: []string) -> []string {
	modules: [dynamic]string

	for file in files {
		if !strings.ends_with(file, ".lua") {
			continue
		}

		module_name := strings.trim_suffix(file, ".lua")
		append(&modules, module_name)
	}

	return modules[:]
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

