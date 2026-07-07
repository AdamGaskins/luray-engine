package vfs

import "core:time"

VFile :: struct {
	path:          string,
	last_modified: time.Time,
}

Vfs :: struct {
	data:      rawptr,
	get_files: proc(vfsdata: rawptr) -> []VFile,
	get_file:  proc(vfsdata: rawptr, path: string) -> ([]byte, bool),
}

destroy_vfs_file :: proc(vfile: ^VFile) {
	delete(vfile.path)
}

destroy_vfs_files :: proc(vfiles: ^[]VFile) {
	for &vfile in vfiles^ {
		destroy_vfs_file(&vfile)
	}
	free(vfiles)
}

