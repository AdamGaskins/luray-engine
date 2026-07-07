package commands

import "../engine"
import "../vfs"
import "core:fmt"
import "core:os"

Run_Flags :: struct {
	main_dir: string `args:"pos=0,required" usage:"Path to directory containing main.lua"`,
}

Command_Run :: Command {
	command = "run",
	execute = proc(args: []string) {
		options := parse_flags(Run_Flags, Command_Run, args)

		e: engine.Engine
		path, _ := os.get_absolute_path(options.main_dir, context.allocator)
		fs := vfs.make_vfs_local(path)
		defer vfs.destroy_vfs_local(&fs)

		fmt.println("Starting engine")

		e = engine.create(fs, false)
		defer engine.destroy(&e)
		engine.run(&e)
	},
}

