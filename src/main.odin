package main

import "./bundle"
import "./engine"
import "./vfs"
import "commands"
import "core:fmt"

main :: proc() {
	b, ok := bundle.load_from_current_exe()

	if !ok {
		commands.execute_command_or_exit()
		return
	}


	fs := vfs.make_vfs_memory_from_bundle(&b)
	defer fs.destroy(fs.data)

	fmt.println("Starting engine")

	e := engine.create(fs, false)
	defer engine.destroy(&e)
	engine.run(&e)
}

