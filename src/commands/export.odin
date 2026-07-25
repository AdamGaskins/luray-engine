#+build darwin, linux, windows
package commands

import "../bundle"
import "../common"
import "../vfs"
import "core:fmt"
import "core:os"
import "core:path/filepath"

Export_Flags :: struct {
	dir: string `args:"pos=0" usage:"Directory containing the project to build. Defaults to current directory."`,
}

DOWNLOAD_URL_BASE :: "https://github.com/AdamGaskins/luray-engine/releases/download"

Command_Export :: Command {
	command = "export",
	execute = proc(args: []string) {
		options := parse_flags(Export_Flags, Command_Export, args)

		path, _ := os.get_absolute_path(options.dir, context.temp_allocator)

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

		export_path, _ := filepath.join([]string{path, "exports"}, context.temp_allocator)

		err := os.mkdir(export_path)
		if err != nil && err != .Exist {
			fmt.eprintfln("Failed to create directory %v: %v", export_path, err)
		}

		tmp_path, tmp_err := os.make_directory_temp("", "luray", context.allocator)
		if tmp_err != nil {
			fmt.eprintln("failed to make temp directory:", err)
			return
		}
		defer os.remove_all(tmp_path)

		// BUNDLE
		{
			fmt.println("== BUNDLE ==")
			export_name, _ := filepath.join(
				[]string{export_path, "game.bundle"},
				context.temp_allocator,
			)

			err = bundle.write_to_file(b, export_name)
			if err != nil {
				fmt.eprintfln("Error writing to %v: %v", export_name, err)
			} else {
				fmt.printfln("Wrote bundle to %v", simple_path(path, options.dir, export_name))
			}
		}
		fmt.println()

		// MAC
		mac: {
			fmt.println("== MAC ==")
			export_name, _ := filepath.join(
				[]string{export_path, "game-macos"},
				context.temp_allocator,
			)

			files, ok := common.download_and_verify_and_unzip(
				tmp_path,
				get_download_url("macos-arm", ""),
				get_download_url("macos-arm", ".sha256"),
			)
			if !ok {
				// break mac
				return
			}

			binary_path, _ := filepath.join([]string{files, "luray"}, context.temp_allocator)

			fuse_ok := bundle.fuse(b, binary_path, export_name)
			if !fuse_ok {
				fmt.eprintfln("Error writing mac build to %v", export_name)
			} else {
				fmt.printfln("Wrote mac build to %v", simple_path(path, options.dir, export_name))
			}
		}
		fmt.println()

		// WEB
		web: {
			fmt.println("== WEB ==")
			export_web_path, _ := filepath.join(
				[]string{export_path, "game-web"},
				context.temp_allocator,
			)

			files, dl_ok := common.download_and_verify_and_unzip(
				tmp_path,
				get_download_url("web", ""),
				get_download_url("web", ".sha256"),
			)
			if !dl_ok {
				break web
			}

			err = os.copy_directory_all(export_web_path, files)
			if err != nil {
				fmt.eprintfln("Failed to copy web assets: %v", err)
				break web
			}

			bundle_export_name, _ := filepath.join(
				[]string{export_web_path, "game.bundle"},
				context.temp_allocator,
			)
			err = bundle.write_to_file(b, bundle_export_name)
			if err != nil {
				fmt.eprintfln("Error writing to %v: %v", bundle_export_name, err)
				break web
			}
			fmt.printfln("Wrote web build to %v", simple_path(path, options.dir, export_web_path))
			fmt.printfln("Test with one of the following:")
			fmt.printfln("\tpython3 -m http.server 8000 --directory '%v'", export_web_path)
			fmt.printfln("\tnpx http-server '%v' -p 8000", export_web_path)
			fmt.printfln("\tphp -S localhost:8000 -t '%v'", export_web_path)
			fmt.printfln("\tsimple-http-server '%v' --index --nocache", export_web_path)
		}
		fmt.println()

		free_all(context.temp_allocator)
	},
}

simple_path :: proc(full_path: string, short_path: string, path: string) -> string {
	p, _ := filepath.rel(full_path, path, context.temp_allocator)
	pj, _ := filepath.join([]string{short_path, p}, context.temp_allocator)
	return pj
}

get_download_url :: proc(platform: string, suffix: string) -> string {
	version := common.LURAY_VERSION == "dev" ? common.LURAY_DEV_VERSION : common.LURAY_VERSION

	return fmt.tprintf(
		"%v/%v/luray-%v-%v.tar.gz%v",
		DOWNLOAD_URL_BASE,
		version,
		version,
		platform,
		suffix,
	)
}

