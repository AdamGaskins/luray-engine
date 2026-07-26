#+private package
package engine_lua

import lua "../vendor/lua"
import "core:c"
import "core:fmt"
import rl "vendor:raylib"

@(private = "file")
bind_ctx_fn :: proc(ctx: ^Lua_Context, L: ^lua.State, fn: lua.CFunction, name: cstring) {
	lua.pushlightuserdata(L, ctx)
	lua.pushcclosure(L, fn, 1)
	lua.setfield(L, -2, name)
}

@(private)
bind_raylib_manual :: proc(ctx: ^Lua_Context, L: ^lua.State) {
	lua.getglobal(L, "ray")

	bind_ctx_fn(ctx, L, lua_LoadImage, "LoadImage")
	bind_ctx_fn(ctx, L, lua_LoadTexture, "LoadTexture")

	lua.pop(L, 1)
}

//
// FUNCTIONS
// Special behavior that's not worth auto-generating
//
@(private)
lua_LoadImage :: proc "c" (L: ^lua.State) -> c.int {
	context = callback_context
	ctx := get_ctx(L)
	p_fileName := lua.tostring(L, 1)

	result := load_image_via_vfs(ctx.vfs, p_fileName)

	tolua_Image(L, result)

	track_pushed_resource(ctx, L, &ctx.tracked_images, p_fileName)

	return 1
}

@(private)
lua_LoadTexture :: proc "c" (L: ^lua.State) -> c.int {
	context = callback_context
	ctx := get_ctx(L)
	p_fileName := lua.tostring(L, 1)

	img := load_image_via_vfs(ctx.vfs, p_fileName)
	result := rl.LoadTextureFromImage(img)
	rl.UnloadImage(img)

	tolua_Texture2D(L, result)

	track_pushed_resource(ctx, L, &ctx.tracked_textures, p_fileName)
	return 1
}

//
// HELPERS (used in generated bindings)
//
@(private)
tolua_Color :: proc "c" (L: ^lua.State, color: rl.Color) {
	packed := (u32(color.r) << 24) | (u32(color.g) << 16) | (u32(color.b) << 8) | u32(color.a)
	lua.pushinteger(L, lua.Integer(packed))
}

@(private)
fromlua_Color :: proc "c" (L: ^lua.State, idx: c.int) -> rl.Color {
	packed := u32(lua.tointeger(L, idx))
	return rl.Color{u8(packed >> 24), u8(packed >> 16), u8(packed >> 8), u8(packed)}
}

@(private)
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

@(private)
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

@(private)
fromlua_shader_value :: proc "c" (
	L: ^lua.State,
	idx: c.int,
	type: rl.ShaderUniformDataType,
) -> any {
	context = callback_context
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
