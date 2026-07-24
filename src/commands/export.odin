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
			fmt.println("== BUNDLE ==")
			export_name, _ := filepath.join([]string{export_path, "game.bundle"})
			defer delete(export_name)

			err = bundle.write_to_file(b, export_name)
			if err != nil {
				fmt.eprintfln("Error writing to %v: %v", export_name, err)
			} else {
				fmt.printfln("Wrote bundle to %v", export_name)
			}
			fmt.println()
		}

		// MAC
		{
			fmt.println("== MAC ==")
			export_name, _ := filepath.join([]string{export_path, "game-macos"})
			defer delete(export_name)

			ok := bundle.fuse(
				b,
				"/Users/adam/lang/games/odin-test/build/macos-arm64/raylua",
				export_name,
			)
			if !ok {
				fmt.eprintfln("Error writing mac build to %v", export_name)
			} else {
				fmt.printfln("Wrote mac build to %v", export_name)
			}
			fmt.println()
		}

		// WEB
		{
			fmt.println("== WEB ==")
			export_web_path, _ := filepath.join([]string{export_path, "game-web"})
			defer delete(export_web_path)

			err = os.copy_directory_all(
				export_web_path,
				"/Users/adam/lang/games/odin-test/build/web",
			)
			if err != nil {
				fmt.eprintfln("Failed to copy web assets: %v", err)
			}

			bundle_export_name, _ := filepath.join([]string{export_web_path, "game.bundle"})
			defer delete(bundle_export_name)
			err = bundle.write_to_file(b, bundle_export_name)
			if err != nil {
				fmt.eprintfln("Error writing to %v: %v", bundle_export_name, err)
			}
			fmt.printfln("Wrote web build to %v", export_web_path)
			fmt.printfln("Test with one of the following:")
			fmt.printfln("\tpython3 -m http.server 8000 --directory '%v'", export_web_path)
			fmt.printfln("\tnpx http-server '%v' -p 8000", export_web_path)
			fmt.printfln("\tphp -S localhost:8000 -t '%v'", export_web_path)
			fmt.printfln("\tsimple-http-server '%v' --index", export_web_path)
			fmt.println()
		}

	},
}

