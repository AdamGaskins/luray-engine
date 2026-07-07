package commands

import "../engine"
import "../vfs"
import "core:fmt"
import "core:os"

Dev_Flags :: struct {
	main_dir: string `args:"pos=0,required" usage:"Path to directory containing main.lua"`,
}

Command_Dev :: Command {
	command = "dev",
	execute = proc(args: []string) {
		options := parse_flags(Dev_Flags, Command_Dev, args)

		e: engine.Engine
		path, _ := os.get_absolute_path(options.main_dir, context.allocator)
		defer delete(path)
		fs := vfs.make_vfs_local(path)
		defer fs.destroy(fs.data)

		fmt.println("Starting engine with hot reload")

		e = engine.create(fs, true)
		defer engine.destroy(&e)
		engine.run(&e)
	},
}

