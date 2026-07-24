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

import "core:fmt"
import "core:io"
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
}

create :: proc() -> Bundle {
	b: Bundle
	b.files = make(map[string][]u8)
	return b
}

add_file :: proc(b: ^Bundle, name: string, data: []u8) {
	name_copy := strings.clone(name)
	data_copy := slice.clone(data)
	b.files[name_copy] = data_copy
}

destroy :: proc(b: ^Bundle) {
	for name, data in b.files {
		delete(name)
		delete(data)
	}
	delete(b.files)
}

serialize :: proc(b: Bundle, w: io.Writer) -> io.Error {
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

