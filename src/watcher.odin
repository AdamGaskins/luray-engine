package main

import "core:time"

Watcher :: struct {
	paths: map[string]time.Time,
}

make_watcher :: proc() -> Watcher {
	w := Watcher {
		paths = make(map[string]time.Time),
	}

	return w
}

