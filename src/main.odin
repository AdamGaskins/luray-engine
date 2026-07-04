package main

import "core:fmt"
import "core:os"
import "core:path/filepath"
import lua "vendor:lua/5.4"
import rl "vendor:raylib"
import "watcher"

main :: proc() {
	mainPath := "main.lua"
	if len(os.args) > 1 {
		mainPath = os.args[1]
	}
	mainFileName := filepath.base(mainPath)
	mainDir := filepath.dir(mainPath)
	os.set_working_directory(mainDir)

	if !os.exists(mainFileName) {
		fmt.eprintfln("Source file not found: %v", mainPath)
		fmt.eprintfln("")
		fmt.eprintfln("Usage: executable [path/to/main.lua]")
		return
	}

	state := lua_create_state()
	defer lua.close(state)

	lua_load_script(state, mainFileName)

	lua_call(state, "_init")

	watch := watcher.new()
	defer watcher.destroy(&watch)
	watcher.watch(&watch, mainFileName)

	for !rl.WindowShouldClose() {
		lua_call(state, "_update")

		if watcher.poll(&watch) {
			lua_load_script(state, mainFileName)
		}

		if is_reload_button_pressed() {
			lua_call(state, "_destroy")
			lua_call(state, "_init")
		}
	}

	lua_call(state, "_destroy")
}

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

