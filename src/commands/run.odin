package commands

import "../engine"
import "core:fmt"

Run_Flags :: struct {
	main_file: string `args:"pos=0,required" usage:"Path to main.lua"`,
}

Command_Run :: Command {
	command = "run",
	execute = proc(args: []string) {
		options := parse_flags(Run_Flags, Command_Run, args)

		e: engine.Engine
		e = engine.new(options.main_file, false)
		fmt.println("Starting engine")
		defer engine.destroy(&e)
		engine.run(&e)
	},
}

