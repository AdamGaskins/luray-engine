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
@(private = "file")
fs: vfs.Vfs

// Allows the JS to write the `game.bundle` bytes into a pointer.
// This is emscripten's malloc.
@(export)
web_alloc :: proc "c" (size: c.int) -> rawptr {
	return malloc(c.size_t(size))
}

@(export)
engine_start :: proc "c" (bundle_data: [^]byte, bundle_len: c.int) -> bool {
	context = runtime.default_context()
	context.allocator = emscripten_allocator()
	init_global_temporary_allocator(1 * mem.Megabyte)
	default_context = context

	r: bytes.Reader
	bytes.reader_init(&r, bundle_data[:bundle_len])
	b, ok := bundle.deserialize(bytes.reader_to_stream(&r))
	defer free(bundle_data)
	if !ok {
		return false
	}
	defer bundle.destroy(&b)

	fs = vfs.make_vfs_memory_from_bundle(&b)

	e = engine.create(fs, false)
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
	fs.destroy(fs.data)
	engine.destroy(&e)
}

@(export)
web_window_size_changed :: proc "c" (w: c.int, h: c.int) {
	context = default_context
}

