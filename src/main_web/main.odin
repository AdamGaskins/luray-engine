// These procs are the ones that will be called from `index.html`, which is
// generated from `index_template.html`.

package main_web

import "../bundle"
import "../engine"
import "../vfs"
import "base:runtime"
import "core:bytes"
import "core:c"
import "core:mem"

@(private)
default_context: runtime.Context

@(private = "file")
e: engine.Engine

@(export)
engine_start :: proc "c" () -> bool {
	context = runtime.default_context()
	context.allocator = emscripten_allocator()
	init_global_temporary_allocator(1 * mem.Megabyte)
	default_context = context

	r: bytes.Reader
	bytes.reader_init(&r, #load("../../luatest/exports/game.bundle"))
	b, ok := bundle.deserialize(bytes.reader_to_stream(&r))
	if !ok {
		return false
	}
	defer bundle.destroy(&b)

	fs := vfs.make_vfs_memory()
	defer fs.destroy(fs.data)

	e = engine.create(fs, false)
	defer engine.destroy(&e)
	return engine.game_init(&e)
}

@(export)
engine_update :: proc "c" () -> bool {
	context = default_context

	return engine.game_step(&e)
}

@(export)
engine_end :: proc "c" () {
	context = default_context

	engine.game_teardown(&e)
}

@(export)
web_window_size_changed :: proc "c" (w: c.int, h: c.int) {
	context = default_context
}

