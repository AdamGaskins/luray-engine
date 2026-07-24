#+build darwin, linux, windows
package commands

import "../bundle"
import "../vfs"
import "core:fmt"
import "core:os"
import "core:path/filepath"

Export_Flags :: struct {
	dir: string `args:"pos=0" usage:"Directory containing the project to build. Defaults to current directory."`,
}

Command_Export :: Command {
	command = "export",
	execute = proc(args: []string) {
		options := parse_flags(Export_Flags, Command_Export, args)

		path, _ := os.get_absolute_path(options.dir, context.allocator)
		defer delete(path)

		fs := vfs.make_vfs_local(path)
		defer fs.destroy(fs.data)

		files := fs.get_files(fs.data)
		defer vfs.destroy_vfs_files(&files)

		b := bundle.create()
		defer bundle.destroy(&b)
		for file in files {
			if filepath.ext(file.path) != ".lua" {
				continue
			}

			data, ok := fs.get_file(fs.data, file.path)
			if !ok {
				fmt.eprintfln("Failed to load file for export (%v).", file.path)
				continue
			}
			defer delete(data)

			bundle.add_file(&b, file.path, data)
		}

		export_path, _ := filepath.join([]string{path, "exports"})
		defer delete(export_path)

		err := os.mkdir(export_path)
		if err != nil && err != .Exist {
			fmt.eprintfln("Failed to create directory %v: %v", export_path, err)
		}

		// BUNDLE
		{
			export_name, _ := filepath.join([]string{export_path, "game.bundle"})
			defer delete(export_name)

			err = bundle.write_to_file(b, export_name)
			if err != nil {
				fmt.eprintfln("Error writing to %v: %v", export_name, err)
			} else {
				fmt.printfln("Wrote bundle to %v", export_name)
			}
		}

		// MAC
		{
			export_name, _ := filepath.join([]string{export_path, "game-macos"})
			defer delete(export_name)

			ok := bundle.fuse(
				b,
				"/Users/adam/lang/games/odin-test/builds/macos-arm64/raylua",
				export_name,
			)
			if !ok {
				fmt.eprintfln("Error writing mac build to %v", export_name)
			} else {
				fmt.printfln("Wrote mac build to %v", export_name)
			}
		}

	},
}

