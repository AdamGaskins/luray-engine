package watcher

import "core:fmt"
import "core:os"
import "core:time"

@(private)
Watcher :: struct {
	paths: map[string]time.Time,
}

new :: proc() -> Watcher {
	w := Watcher {
		paths = make(map[string]time.Time),
	}

	return w
}

destroy :: proc(watcher: ^Watcher) {
	delete(watcher.paths)
}

watch :: proc(watcher: ^Watcher, path: string) -> bool {
	if path in watcher.paths {
		return true
	}

	last_modified, ok := get_last_modified(path)
	if !ok {
		fmt.eprintfln("Failed to watch %v: %v", path)
		return false
	}

	watcher.paths[path] = last_modified
	return true
}

poll :: proc(watcher: ^Watcher) -> bool {
	updated := false

	for path, last_modified in watcher.paths {
		new_last_modified, ok := get_last_modified(path)
		if !ok {
			continue
		}

		if time.diff(last_modified, new_last_modified) > 0 {
			updated = true
			watcher.paths[path] = new_last_modified
		}
	}

	return updated
}

@(private)
get_last_modified :: proc(path: string) -> (time.Time, bool) {
	info, err := os.stat(path, context.allocator)
	defer os.file_info_delete(info, context.allocator)
	if err != nil {
		return time.Time{}, false
	}

	return info.modification_time, true
}

