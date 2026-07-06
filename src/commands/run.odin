package commands

import "../engine"
import "core:fmt"

Run_Flags :: struct {
	main_dir: string `args:"pos=0,required" usage:"Path to directory containing main.lua"`,
}

Command_Run :: Command {
	command = "run",
	execute = proc(args: []string) {
		options := parse_flags(Run_Flags, Command_Run, args)

		e: engine.Engine
		e = engine.new(options.main_dir, false)
		fmt.println("Starting engine")
		defer engine.destroy(&e)
		engine.run(&e)
	},
}

