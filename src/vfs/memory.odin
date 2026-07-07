package vfs

import "../bundle"
import "core:slice"
import "core:strings"
import "core:time"

@(private)
Vfs_Memory_Data :: struct {
	files: map[string][]u8,
}

@(private)
memory_get_files :: proc(vfsdata: rawptr) -> []VFile {
	data := cast(^Vfs_Memory_Data)vfsdata

	files: [dynamic]VFile

	for path, _ in data.files {
		path_copy := strings.clone(path)

		append(&files, VFile{path = path_copy, last_modified = time.from_nanoseconds(0)})
	}

	return files[:]
}

@(private)
memory_get_file :: proc(vfsdata: rawptr, path: string) -> ([]byte, bool) {
	data := cast(^Vfs_Memory_Data)vfsdata

	if path not_in data.files {
		return []byte{}, false
	}

	bytes_copy := slice.clone(data.files[path])

	return bytes_copy, true
}

make_vfs_memory :: proc() -> Vfs {
	data := new(Vfs_Memory_Data)
	data.files = make(map[string][]u8)
	return Vfs {
		data = data,
		get_file = memory_get_file,
		get_files = memory_get_files,
		destroy = destroy_vfs_memory,
	}
}

make_vfs_memory_from_bundle :: proc(b: ^bundle.Bundle) -> Vfs {
	fs := make_vfs_memory()
	fsdata := cast(^Vfs_Memory_Data)fs.data

	for path, data in b.files {
		path_copy, _ := strings.clone(path)
		data_copy, _ := slice.clone(data)

		fsdata.files[path_copy] = data_copy
	}

	return fs
}

@(private)
destroy_vfs_memory :: proc(vfsdata: rawptr) {
	data := cast(^Vfs_Memory_Data)vfsdata

	for path, data in data.files {
		delete(path)
		delete(data)
	}
	delete(data.files)

	free(data)
}

