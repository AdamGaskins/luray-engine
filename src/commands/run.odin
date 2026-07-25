#+build darwin, linux, windows
package commands

import "../bundle"
import "../engine"
import "../vfs"
import "core:os"

Run_Flags :: struct {
	path: string `args:"pos=0,required" usage:"Path to directory containing main.lua"`,
}

Command_Run :: Command {
	command = "run",
	execute = proc(args: []string) {
		options := parse_flags(Run_Flags, Command_Run, args)

		e: engine.Engine

		fs: vfs.Vfs
		if os.ext(options.path) == ".bundle" {
			b, ok := bundle.read_from_file(options.path)
			if !ok {return}
			defer bundle.destroy(&b)

			fs = vfs.make_vfs_memory_from_bundle(&b)
		} else {
			path, _ := os.get_absolute_path(options.path, context.allocator)
			defer delete(path)

			fs = vfs.make_vfs_local(path)
		}

		defer fs.destroy(fs.data)

		e = engine.create(fs, false)
		defer engine.destroy(&e)
		engine.run(&e)
	},
}

