#+build darwin, linux, windows
package main

import "../bundle"
import "../commands"
import "../engine"
import "../vfs"

main :: proc() {
	b, ok := bundle.load_from_current_exe()

	when ODIN_OS != .JS {
		if !ok {
			commands.execute_command_or_exit()
			return
		}
	}

	fs := vfs.make_vfs_memory_from_bundle(&b)
	defer fs.destroy(fs.data)

	e := engine.create(fs, false)
	defer engine.destroy(&e)
	engine.run(&e)
}

