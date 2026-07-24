#+build darwin, linux, windows
package bundle

import "core:bytes"
import "core:encoding/endian"
import "core:fmt"
import "core:io"
import "core:os"

write_to_file :: proc(b: Bundle, path: string) -> os.Error {
	file, err := os.create(path)
	if err != nil {
		return err
	}
	defer os.close(file)

	writer := os.to_writer(file)
	err = serialize(b, writer)

	return err
}

read_from_file :: proc(path: string) -> (Bundle, bool) {
	file, err := os.open(path)
	if err != nil {
		fmt.eprintfln("Error opening %v: %v", path, err)
		return Bundle{}, false
	}
	defer os.close(file)

	reader := os.to_reader(file)
	bundle, ok := deserialize(reader)

	return bundle, ok
}

fuse :: proc(b: Bundle, binary_path: string, dst_path: string) -> bool {
	os.copy_file(dst_path, binary_path)

	file, err := os.open(dst_path, os.File_Flags{.Append, .Write})
	if err != nil {
		fmt.eprintfln("Failed to open for appending %v", err)
		return false
	}
	defer os.close(file)

	binary_size_begin, _ := os.file_size(file)

	w := os.to_writer(file)
	_ = serialize(b, w)

	binary_size_end, _ := os.file_size(file)
	bundle_size := binary_size_end - binary_size_begin

	write_u64(w, cast(u64)bundle_size)
	io.write_full(w, EXE_MAGIC[:])
	return true
}

load_from_current_exe :: proc() -> (Bundle, bool) {
	exe_path, _ := os.get_executable_path(context.allocator)
	defer delete(exe_path)

	file, _ := os.open(exe_path)
	defer os.close(file)

	size, _ := os.file_size(file)

	if size < 16 {
		return Bundle{}, false
	}

	_, _ = os.seek(file, -16, .End)
	footer: [16]byte
	_, _ = os.read_full(file, footer[:])

	if !bytes.equal(footer[8:16], EXE_MAGIC[:]) {
		return Bundle{}, false
	}

	bundle_size, _ := endian.get_u64(footer[:8], .Little)
	if bundle_size > u64(size - 16) {
		return Bundle{}, false
	}

	offset := -(16 + bundle_size)
	_, _ = os.seek(file, cast(i64)offset, .End)
	buf := make([]byte, bundle_size)
	defer delete(buf)
	_, _ = os.read_full(file, buf)

	reader: bytes.Reader
	bytes.reader_init(&reader, buf)
	return deserialize(bytes.reader_to_stream(&reader))
}

