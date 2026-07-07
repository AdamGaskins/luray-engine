package commands

import "core:fmt"
import "core:os"
import "core:path/filepath"

Init_Flags :: struct {
	dir: string `args:"pos=0" usage:"Directory to initiate project in. Defaults to current directory."`,
}

Command_Init :: Command {
	command = "init",
	execute = proc(args: []string) {
		options := parse_flags(Init_Flags, Command_Init, args)

		copy_file(options, ".luarc.json", #load("../../.luarc.json"))
		copy_file(options, "main.lua", #load("../../template/main.lua"))
		copy_file(options, ".gitignore", #load("../../template/.gitignore"))
		copy_file(options, "meta/raylib.lua", #load("../../meta/raylib.lua"))
	},
}

@(private)
copy_file :: proc(options: Init_Flags, name: string, data: []byte) {
	joined, _ := filepath.join([]string{options.dir, name})
	dir := os.dir(joined)

	if dir != "" {
		err := os.make_directory_all(dir)
		if err != .Exist {
			fmt.eprintfln("Failed to create directory %v: %v", dir, err)
		}
	}

	err := os.write_entire_file(joined, data)
	if err != nil {
		fmt.eprintfln("Failed to copy %v: %v", name, err)
	}
	fmt.printfln("Created %v", joined)
}

