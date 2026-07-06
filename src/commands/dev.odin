package commands

import "../engine"
import "core:fmt"

Dev_Flags :: struct {
	main_dir: string `args:"pos=0,required" usage:"Path to directory containing main.lua"`,
}

Command_Dev :: Command {
	command = "dev",
	execute = proc(args: []string) {
		options := parse_flags(Dev_Flags, Command_Dev, args)

		e: engine.Engine
		e = engine.new(options.main_dir, true)
		fmt.println("Starting engine with hotreload")
		defer engine.destroy(&e)
		engine.run(&e)
	},
}

