package watcher

import "core:os"
import "core:path/filepath"
import "core:strings"
import "core:time"

Watcher :: struct {
	paths: map[string]time.Time,
}

new :: proc() -> Watcher {
	w := Watcher {
		paths = make(map[string]time.Time),
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

	dir, _ := os.get_working_directory(context.allocator)
	defer delete(dir)
	walker := filepath.walker_create(dir)
	defer filepath.walker_destroy(&walker)
	for info in filepath.walker_walk(&walker) {
		if info.type != os.File_Type.Regular {
			continue
		}
		path := strings.clone(strings.trim_prefix(info.fullpath, dir)[1:], context.allocator)

		if path not_in watcher.paths {
			append(&updated, path)
			watcher.paths[path] = info.modification_time
		} else if time.diff(watcher.paths[path], info.modification_time) > 0 {
			append(&updated, path)
			watcher.paths[path] = info.modification_time
		}
	}

	return updated[:]
}

