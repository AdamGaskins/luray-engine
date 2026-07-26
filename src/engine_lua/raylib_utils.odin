package engine_lua

import "../vfs"
import "core:c"
import "core:fmt"
import rl "vendor:raylib"

@(private)
load_image_via_vfs :: proc(fs: vfs.Vfs, fileName: cstring) -> rl.Image {
	context = callback_context

	data, ok := fs.get_file(fs.data, string(fileName))
	if !ok {
		fmt.eprintfln("Failed to load image (not found in project files): %v", fileName)
		return rl.Image{}
	}
	defer delete(data)

	ext := rl.GetFileExtension(fileName)
	return rl.LoadImageFromMemory(ext, raw_data(data), c.int(len(data)))
}

