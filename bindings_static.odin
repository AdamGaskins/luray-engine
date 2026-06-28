package main

import "core:c"
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

tolua_ptr :: proc "c" (L: ^lua.State, pointer: ^$T) {
    ptr := cast(^T)lua.newuserdatauv(L, size_of(rl.Image), 0)
    ptr^ = img
}

fromlua_ptr :: proc "c" (L: ^lua.State, idx: c.int, $T: typeid) -> ^T {
    // TODO: type check?
    return cast(^T)lua.touserdata(L, idx)
}

