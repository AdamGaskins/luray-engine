package main

import "core:flags"
import "core:fmt"
import "core:os"
import "engine"
import "vendor:raylib"

Dev_Options :: struct {
	main_file: string `args:"pos=0"`,
}

Run_Options :: struct {
	main_file: string `args:"pos=0"`,
}

main :: proc() {
	raylib.SetTraceLogLevel(raylib.TraceLogLevel.NONE)
	if len(os.args) < 2 {
		fmt.println("Usage: raylua [subcommand] [flags]")
		fmt.println("Available subcommands: dev, run")
		os.exit(1)
	}

	e: engine.Engine
	switch os.args[1] {
	case "dev":
		opt: Dev_Options
		flags.parse_or_exit(&opt, os.args[1:], .Unix)
		e = engine.new(opt.main_file, true)
		fmt.println("Starting engine with hotreload")
	case "run":
		opt: Run_Options
		flags.parse_or_exit(&opt, os.args[1:], .Unix)
		e = engine.new(opt.main_file, false)
		fmt.println("Starting engine")
	}

	defer engine.destroy(&e)
	engine.run(&e)
}

