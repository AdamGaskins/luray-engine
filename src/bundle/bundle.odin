//! https://codeberg.org/brettchalupa/usagi/src/branch/main/src/bundle.rs
//! Bundle format for fused game binaries.
//!
//! A bundle is a flat collection of named byte blobs. It's written in a
//! simple sequential format (no offsets to patch up) so we can read it
//! with forward-only streams:
//!
//! ```text
//! [BUNDLE_MAGIC 8 bytes]
//! [version u32 LE]
//! [entry_count u32 LE]
//! repeated entry_count times:
//!   [name_len u32 LE]
//!   [name bytes]
//!   [data_len u64 LE]
//!   [data bytes]
//! ```
//!
//! When fused onto a base binary, the bundle is appended followed by a
//! 16-byte footer: `[bundle_size u64 LE][EXE_MAGIC 8 bytes]`. The runtime
//! reads the last 16 bytes of its own exe; if the magic matches it seeks
//! back `bundle_size` bytes and parses the bundle.

package bundle

import "core:bytes"
import "core:encoding/endian"
import "core:fmt"
import "core:io"
import "core:mem/virtual"
import "core:os"
import "core:slice"
import "core:strings"

@(rodata)
BUNDLE_MAGIC := [8]u8{'R', 'A', 'Y', 'L', 'B', 'B', 'N', 'D'}
@(rodata)
EXE_MAGIC := [8]u8{'R', 'A', 'Y', 'L', 'B', 'E', 'X', 'E'}
@(rodata)
VERSION: u32 = 1

Bundle :: struct {
	files: map[string][]u8,
	arena: virtual.Arena,
}

create :: proc() -> Bundle {
	b: Bundle
	b.files = make(map[string][]u8)
	return b
}

add_file :: proc(b: ^Bundle, name: string, data: []u8) {
	allocator := virtual.arena_allocator(&b.arena)

	name_copy := strings.clone(name, allocator)
	data_copy := slice.clone(data, allocator)
	b.files[name_copy] = data_copy
}

destroy :: proc(b: ^Bundle) {
	delete(b.files)
	virtual.arena_destroy(&b.arena)
}

serialize :: proc(b: Bundle, w: io.Writer) -> os.Error {
	_, err := io.write_full(w, BUNDLE_MAGIC[:])
	if err != nil {return err}

	_, err = write_u32(w, VERSION)
	if err != nil {return err}

	_, err = write_u32(w, cast(u32)len(b.files))
	if err != nil {return err}

	for name, data in b.files {
		_, err = write_len_and_bytes(w, u32, transmute([]byte)name)
		if err != nil {return err}

		_, err = write_len_and_bytes(w, u64, data)
		if err != nil {return err}
	}

	return nil
}

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

deserialize :: proc(r: io.Reader) -> (Bundle, bool) {
	b := create()

	if !read_magic(r, BUNDLE_MAGIC[:]) {
		fmt.eprintfln("Not a valid bundle")
		destroy(&b)
		return Bundle{}, false
	}

	bundle_version := read_u32(r)
	if bundle_version != VERSION {
		fmt.eprintfln("Unsupported bundle version %v", bundle_version)
		destroy(&b)
		return Bundle{}, false
	}

	file_count := read_u32(r)
	for _ in 0 ..< file_count {
		name_bytes, _ := read_len_and_bytes(r, u32)
		defer delete(name_bytes)

		data_bytes, _ := read_len_and_bytes(r, u64)
		defer delete(data_bytes)

		add_file(&b, string(name_bytes), data_bytes)
	}

	return b, true
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

