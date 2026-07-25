#+build darwin, linux, windows
package common

import "core:fmt"
import "core:os"
import "core:path/filepath"
import "core:path/slashpath"
import "core:strings"

download_and_verify_and_unzip :: proc(
	folder_path: string,
	github_url: string,
	checksum_url: string,
) -> (
	string,
	bool,
) {
	fmt.printfln("Downloading %v", github_url)
	zippath, zip_ok := download(folder_path, github_url)
	if !zip_ok {
		return "", false
	}

	checksumpath, checksum_ok := download(folder_path, checksum_url)
	if !checksum_ok {
		return "", false
	}

	state, check_error := exec(folder_path, []string{"sha256sum", "--check", checksumpath})
	if check_error != nil || !state.success || state.exit_code != 0 {
		fmt.eprintfln("failed to verify checksum for downloaded binary %v", github_url)
		return "", false
	}
	fmt.printfln("Validated checksum.")

	unzip_path, _ := filepath.join(
		[]string{folder_path, strings.trim_suffix(github_url, ".tar.gz")},
		context.temp_allocator,
	)
	unzip_ok := unzip(zippath, unzip_path)
	if !unzip_ok {
		return "", false
	}

	return unzip_path, true
}

unzip :: proc(file: string, output_folder: string) -> bool {
	err := os.mkdir_all(output_folder)
	if err != nil {
		fmt.eprintfln("failed to make directory %v: %v", output_folder, err)
		return false
	}

	state, check_error := exec("", []string{"tar", "-xf", file, "-C", output_folder})
	if check_error != nil || !state.success || state.exit_code != 0 {
		fmt.eprintfln("failed to unzip", output_folder, check_error)
		return false
	}

	return true
}

@(private)
download :: proc(temp_folder: string, url: string) -> (string, bool) {
	file_name := slashpath.base(url)
	zip_path, _ := filepath.join({temp_folder, file_name}, context.temp_allocator)

	state, err := exec(temp_folder, []string{"curl", "--fail", "-L", "-o", file_name, url})
	if err != nil || !state.success || state.exit_code != 0 {
		return "", false
	}

	return zip_path, true
}

exec :: proc(pwd: string, cmd: []string) -> (os.Process_State, os.Error) {
	desc := os.Process_Desc {
		working_dir = pwd,
		command     = cmd,
	}

	process, start_err := os.process_start(desc)
	if start_err != nil {
		fmt.eprintln("failed to start command:", cmd, start_err)
		return os.Process_State{}, start_err
	}

	state, wait_err := os.process_wait(process)
	if wait_err != nil {
		fmt.eprintln("failed to wait for command:", cmd, wait_err)
		return os.Process_State{}, wait_err
	}

	return state, nil
}

