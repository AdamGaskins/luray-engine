package main

import "base:runtime"
import "core:c"
import "core:fmt"
import lua "vendor:lua/5.4"
import rl "vendor:raylib"

tolua_Color :: proc "c" (L: ^lua.State, color: rl.Color) {
	packed := (u32(color.r) << 24) | (u32(color.g) << 16) | (u32(color.b) << 8) | u32(color.a)
	lua.pushinteger(L, lua.Integer(packed))
}

fromlua_Color :: proc "c" (L: ^lua.State, idx: c.int) -> rl.Color {
	packed := u32(lua.tointeger(L, idx))
	return rl.Color{u8(packed >> 24), u8(packed >> 16), u8(packed >> 8), u8(packed)}
}

tolua_array :: proc(
	L: ^lua.State,
	arr: [^]$T,
	count: c.int,
	tolua: proc "c" (_: ^lua.State, _: T, _: c.int = -99),
) {
	lua.newtable(L)
	for i in 0 ..< count {
		tolua(L, arr[i])
		lua.rawseti(L, -2, lua.Integer(i + 1))
	}
}

fromlua_array :: proc(
	L: ^lua.State,
	idx: c.int,
	$T: typeid,
	fromlua: proc "c" (_: ^lua.State, _: c.int) -> T,
) -> (
	[^]T,
	c.int,
) {
	n := c.int(lua.rawlen(L, idx))
	arr := make([^]T, n)
	for i in 0 ..< n {
		lua.rawgeti(L, idx, lua.Integer(i + 1))
		arr[i] = fromlua(L, -1)
		lua.pop(L, 1)
	}
	return arr, n
}

fromlua_shader_value :: proc "c" (
	L: ^lua.State,
	idx: c.int,
	type: rl.ShaderUniformDataType,
) -> any {
	context = runtime.default_context()
	if type == rl.ShaderUniformDataType.FLOAT {
		return fromlua_float(L, idx)
	} else if type == rl.ShaderUniformDataType.INT {
		return fromlua_int(L, idx)
	} else if type == rl.ShaderUniformDataType.VEC2 {
		return fromlua_int(L, idx)
	} else if type == rl.ShaderUniformDataType.VEC3 {
		return fromlua_int(L, idx)
	} else if type == rl.ShaderUniformDataType.VEC4 {
		return fromlua_int(L, idx)
	}
	fmt.printfln("Unsupported shader type: %v", type)
	return 0
}

tolua_ptr :: proc "c" (L: ^lua.State, pointer: ^$T) {
	ptr := cast(^T)lua.newuserdatauv(L, size_of(rl.Image), 0)
	ptr^ = img
}

fromlua_ptr :: proc "c" (L: ^lua.State, idx: c.int, $T: typeid) -> ^T {
	// TODO: type check?
	return cast(^T)lua.touserdata(L, idx)
}

