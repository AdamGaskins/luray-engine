package watcher

import "../vfs"
import "core:strings"
import "core:time"

Watcher :: struct {
	paths: map[string]time.Time,
	vfs:   vfs.Vfs,
}

create :: proc(vfs: vfs.Vfs) -> Watcher {
	w := Watcher {
		paths = make(map[string]time.Time),
		vfs   = vfs,
	}

	poll(&w)

	return w
}

destroy :: proc(watcher: ^Watcher) {
	for p, _ in watcher.paths {
		delete(p)
	}
	delete(watcher.paths)
}

poll :: proc(watcher: ^Watcher) -> []string {
	updated: [dynamic]string

	files := watcher.vfs.get_files(watcher.vfs.data)
	defer vfs.destroy_vfs_files(&files)

	for file in files {
		if file.path not_in watcher.paths {
			path := strings.clone(file.path)
			append(&updated, path)
			watcher.paths[path] = file.last_modified
		} else if time.diff(watcher.paths[file.path], file.last_modified) > 0 {
			path := strings.clone(file.path)
			append(&updated, path)
			watcher.paths[path] = file.last_modified
		}
	}

	return updated[:]
}

