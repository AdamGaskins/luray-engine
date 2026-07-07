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
write_len_and_bytes :: proc(w: io.Writer, b: []byte) -> (int, io.Error) {
	n, e := write_u32(w, cast(u32)len(b))
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
read_len_and_bytes :: proc(r: io.Reader) -> ([]byte, io.Error) {
	length := read_u32(r)

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

