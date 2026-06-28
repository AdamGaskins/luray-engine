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

// tolua_Vector2 :: proc "c" (L: ^lua.State, v: rl.Vector2) {
//     packed := (u32(color.r) << 24) | (u32(color.g) << 16) | (u32(color.b) << 8) | u32(color.a)
//     lua.pushinteger(L, lua.Integer(packed))
// }
//
// fromlua_Vector2 :: proc "c" (L: ^lua.State, idx: c.int) -> rl.Color {
//     packed := u32(lua.tointeger(L, idx))
//     return rl.Color{u8(packed >> 24), u8(packed >> 16), u8(packed >> 8), u8(packed)}
// }


// get_color :: proc "c" (L: ^lua.State, idx: c.int) -> rl.Color {
//     get_u8_field :: proc "c" (L: ^lua.State, idx: c.int, field: cstring) -> u8 {
//         lua.getfield(L, idx, field)
//         val := u8(lua.tointeger(L, -1))
//         lua.pop(L, 1)
//         return val
//     }
//     return rl.Color{
//         r = get_u8_field(L, idx, "r"),
//         g = get_u8_field(L, idx, "g"),
//         b = get_u8_field(L, idx, "b"),
//         a = get_u8_field(L, idx, "a"),
//     }
// }
//

