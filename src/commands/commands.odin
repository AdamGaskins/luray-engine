package commands

import "core:flags"
import "core:fmt"
import "core:os"

Command :: struct {
	command:     string,
	description: string,
	execute:     proc(args: []string),
}

Commands :: []Command{Command_Run, Command_Dev, Command_Init}

find_command :: proc(name: string) -> (Command, bool) {
	for c in Commands {
		if c.command == name {
			return c, true
		}
	}

	return Command{}, false
}

execute_command_or_exit :: proc() {
	if len(os.args) < 2 {
		print_usage()
		os.exit(1)
	}

	command, ok := find_command(os.args[1])

	if !ok {
		if os.args[1] != "--help" && os.args[1] != "help" && os.args[1] != "-h" {
			fmt.printfln("Unknown command: %v", os.args[1])
		}
		print_usage()
		os.exit(1)
	}

	command.execute(os.args[2:])
}

print_usage :: proc() {
	fmt.println("Usage: raylua [command]")
	fmt.println("Available commands:")
	for c in Commands {
		fmt.printfln("\t%v\t%v", c.command, c.description)
	}
}

@(private)
parse_flags :: proc($T: typeid, c: Command, args: []string) -> T {
	options: T
	err := flags.parse(&options, args, .Unix)
	if err != nil {
		program := fmt.tprintf("%v %v", "raylua", args[0])
		flags.write_usage(os.to_stream(os.stderr), T, program, .Unix)
		flags.print_errors(T, err, program, .Unix)
		os.exit(1)
	}
	return options
}

