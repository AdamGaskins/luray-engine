package vfs

import "core:os"
import "core:path/filepath"
import "core:strings"
@(private)
Vfs_Local_Data :: struct {
	base_path: string,
}

@(private)
local_get_files :: proc(vfsdata: rawptr) -> []VFile {
	data := cast(^Vfs_Local_Data)vfsdata

	walker := filepath.walker_create(data.base_path)
	defer filepath.walker_destroy(&walker)

	files: [dynamic]VFile

	for info in filepath.walker_walk(&walker) {
		if info.type != os.File_Type.Regular {
			continue
		}

		path := strings.clone(
			strings.trim_prefix(info.fullpath, data.base_path)[1:],
			context.allocator,
		)

		append(&files, VFile{path = path, last_modified = info.modification_time})
	}

	return files[:]
}

@(private)
local_get_file :: proc(vfsdata: rawptr, path: string) -> ([]byte, bool) {
	data := cast(^Vfs_Local_Data)vfsdata

	joined: string
	err: os.Error
	joined, err = os.join_path([]string{data.base_path, path}, context.allocator)
	if err != nil {
		return []byte{}, false
	}
	defer delete(joined)

	bytes: []byte
	bytes, err = os.read_entire_file(joined, context.allocator)
	if err != nil {
		return []byte{}, false
	}

	return bytes, true
}

make_vfs_local :: proc(base_path: string) -> Vfs {
	data := new(Vfs_Local_Data)
	data.base_path, _ = os.get_absolute_path(base_path, context.allocator)
	return Vfs{data = data, get_file = local_get_file, get_files = local_get_files}
}

destroy_vfs_local :: proc(vfs: ^Vfs) {
	data := cast(^Vfs_Local_Data)vfs.data
	delete(data.base_path)
	free(vfs.data)
}

