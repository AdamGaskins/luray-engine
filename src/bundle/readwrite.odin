package bundle

import "core:bytes"
import "core:encoding/endian"
import "core:io"

@(private)
write_u32 :: proc(w: io.Writer, v: u32) -> (n: int, e: io.Error) {
	v_bytes: [4]u8
	endian.put_u32(v_bytes[:], .Little, v)
	return io.write_full(w, v_bytes[:])
}

@(private)
write_u64 :: proc(w: io.Writer, v: u64) -> (n: int, e: io.Error) {
	v_bytes: [8]u8
	endian.put_u64(v_bytes[:], .Little, v)
	return io.write_full(w, v_bytes[:])
}

@(private)
write_len_and_bytes :: proc(w: io.Writer, length_type: typeid, b: []byte) -> (int, io.Error) {
	n: int
	e: io.Error
	if length_type == u32 {
		n, e = write_u32(w, cast(u32)len(b))
	} else if length_type == u64 {
		n, e = write_u64(w, cast(u64)len(b))
	}
	if e != nil {
		return n, e
	}

	n2, e2 := io.write_full(w, b)
	return n + n2, e2
}

@(private)
read_u32 :: proc(r: io.Reader) -> u32 {
	buf: [4]byte
	io.read_full(r, buf[:])

	v, _ := endian.get_u32(buf[:], .Little)
	return v
}

@(private)
read_u64 :: proc(r: io.Reader) -> u64 {
	buf: [8]byte
	io.read_full(r, buf[:])

	v, _ := endian.get_u64(buf[:], .Little)
	return v
}

@(private)
read_len_and_bytes :: proc(r: io.Reader, length_type: typeid) -> ([]byte, io.Error) {
	length: int
	if length_type == u32 {
		length = cast(int)read_u32(r)
	} else if length_type == u64 {
		length = cast(int)read_u64(r)
	}

	buf := make([]byte, length)

	_, err := io.read_full(r, buf)
	if err != nil {
		delete(buf)
		return []byte{}, err
	}

	return buf, nil
}

@(private)
read_magic :: proc(r: io.Reader, b: []byte) -> bool {
	buf := make([]byte, len(b))
	defer delete(buf)

	_, err := io.read_full(r, buf)
	if err != nil {
		return false
	}

	return bytes.equal(buf, b)
}

