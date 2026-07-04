package main

import "core:fmt"
import "core:os"
import "core:path/filepath"
import "engine"

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

	e := engine.new(mainFileName, true)
	defer engine.destroy(&e)
	engine.run(&e)
}

