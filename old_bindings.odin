package main

import "core:c"
import lua "vendor:lua/5.4"
import rl "vendor:raylib"

// @(private)
// lua_InitWindow :: proc "c" (L: ^lua.State) -> c.int {
//     width := c.int(lua.tointeger(L, 1))
//     height := c.int(lua.tointeger(L, 2))
//     title := lua.tostring(L, 3)
//
//     rl.InitWindow(width, height, title)
//
//     return 0
// }
//
// @(private)
// lua_SetTargetFPS :: proc "c" (L: ^lua.State) -> c.int {
//     fps := c.int(lua.tointeger(L, 1))
//
//     rl.SetTargetFPS(fps)
//
//     return 0
// }
//
// @(private)
// lua_BeginDrawing :: proc "c" (L: ^lua.State) -> c.int {
//     rl.BeginDrawing()
//
//     return 0
// }
//
// @(private)
// lua_EndDrawing :: proc "c" (L: ^lua.State) -> c.int {
//     rl.EndDrawing()
//
//     return 0
// }
//
// @(private)
// lua_ClearBackground :: proc "c" (L: ^lua.State) -> c.int {
//     color := get_color(L, 1)
//
//     rl.ClearBackground(color)
//
//     return 0
// }
//
// @(private)
// lua_DrawText :: proc "c" (L: ^lua.State) -> c.int {
//     text := lua.tostring(L, 1)
//     x := c.int(lua.tointeger(L, 2))
//     y := c.int(lua.tointeger(L, 3))
//     fontsize := c.int(lua.tointeger(L, 4))
//     color := get_color(L, 5)
//
//     rl.DrawText(text, x, y, fontsize, color)
//
//     return 0
// }
//
// @(private)
// lua_DrawRectangle :: proc "c" (L: ^lua.State) -> c.int {
//     x := c.int(lua.tointeger(L, 1))
//     y := c.int(lua.tointeger(L, 2))
//     width := c.int(lua.tointeger(L, 3))
//     height := c.int(lua.tointeger(L, 4))
//     color := get_color(L, 5)
//
//     rl.DrawRectangle(x, y, width, height, color)
//
//     return 0
// }

// push_color :: proc "c" (L: ^lua.State, color: rl.Color) {
//     packed := (u32(color.r) << 24) | (u32(color.g) << 16) | (u32(color.b) << 8) | u32(color.a)
//     lua.pushinteger(L, lua.Integer(packed))
// }
//
// get_color :: proc "c" (L: ^lua.State, idx: c.int) -> rl.Color {
//     packed := u32(lua.tointeger(L, idx))
//     return rl.Color{u8(packed >> 24), u8(packed >> 16), u8(packed >> 8), u8(packed)}
// }

