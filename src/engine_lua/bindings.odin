#+private package
package engine_lua

import lua "../vendor/lua"
import "base:runtime"
import "core:c"
import rl "vendor:raylib"

bind_raylib :: proc(L: ^lua.State) {
	lua.newtable(L)

	lua.pushinteger(L, lua.Integer(6))
	lua.setfield(L, -2, "RAYLIB_VERSION_MAJOR")

	lua.pushinteger(L, lua.Integer(0))
	lua.setfield(L, -2, "RAYLIB_VERSION_MINOR")

	lua.pushinteger(L, lua.Integer(0))
	lua.setfield(L, -2, "RAYLIB_VERSION_PATCH")

	lua.pushstring(L, "6.0")
	lua.setfield(L, -2, "RAYLIB_VERSION")

	lua.pushnumber(L, lua.Number(3.141592653589793))
	lua.setfield(L, -2, "PI")

	tolua_Color(L, rl.LIGHTGRAY)
	lua.setfield(L, -2, "LIGHTGRAY")

	tolua_Color(L, rl.GRAY)
	lua.setfield(L, -2, "GRAY")

	tolua_Color(L, rl.DARKGRAY)
	lua.setfield(L, -2, "DARKGRAY")

	tolua_Color(L, rl.YELLOW)
	lua.setfield(L, -2, "YELLOW")

	tolua_Color(L, rl.GOLD)
	lua.setfield(L, -2, "GOLD")

	tolua_Color(L, rl.ORANGE)
	lua.setfield(L, -2, "ORANGE")

	tolua_Color(L, rl.PINK)
	lua.setfield(L, -2, "PINK")

	tolua_Color(L, rl.RED)
	lua.setfield(L, -2, "RED")

	tolua_Color(L, rl.MAROON)
	lua.setfield(L, -2, "MAROON")

	tolua_Color(L, rl.GREEN)
	lua.setfield(L, -2, "GREEN")

	tolua_Color(L, rl.LIME)
	lua.setfield(L, -2, "LIME")

	tolua_Color(L, rl.DARKGREEN)
	lua.setfield(L, -2, "DARKGREEN")

	tolua_Color(L, rl.SKYBLUE)
	lua.setfield(L, -2, "SKYBLUE")

	tolua_Color(L, rl.BLUE)
	lua.setfield(L, -2, "BLUE")

	tolua_Color(L, rl.DARKBLUE)
	lua.setfield(L, -2, "DARKBLUE")

	tolua_Color(L, rl.PURPLE)
	lua.setfield(L, -2, "PURPLE")

	tolua_Color(L, rl.VIOLET)
	lua.setfield(L, -2, "VIOLET")

	tolua_Color(L, rl.DARKPURPLE)
	lua.setfield(L, -2, "DARKPURPLE")

	tolua_Color(L, rl.BEIGE)
	lua.setfield(L, -2, "BEIGE")

	tolua_Color(L, rl.BROWN)
	lua.setfield(L, -2, "BROWN")

	tolua_Color(L, rl.DARKBROWN)
	lua.setfield(L, -2, "DARKBROWN")

	tolua_Color(L, rl.WHITE)
	lua.setfield(L, -2, "WHITE")

	tolua_Color(L, rl.BLACK)
	lua.setfield(L, -2, "BLACK")

	tolua_Color(L, rl.BLANK)
	lua.setfield(L, -2, "BLANK")

	tolua_Color(L, rl.MAGENTA)
	lua.setfield(L, -2, "MAGENTA")

	tolua_Color(L, rl.RAYWHITE)
	lua.setfield(L, -2, "RAYWHITE")

	lua.pushinteger(L, lua.Integer(64))
	lua.setfield(L, -2, "FLAG_VSYNC_HINT")

	lua.pushinteger(L, lua.Integer(2))
	lua.setfield(L, -2, "FLAG_FULLSCREEN_MODE")

	lua.pushinteger(L, lua.Integer(4))
	lua.setfield(L, -2, "FLAG_WINDOW_RESIZABLE")

	lua.pushinteger(L, lua.Integer(8))
	lua.setfield(L, -2, "FLAG_WINDOW_UNDECORATED")

	lua.pushinteger(L, lua.Integer(128))
	lua.setfield(L, -2, "FLAG_WINDOW_HIDDEN")

	lua.pushinteger(L, lua.Integer(512))
	lua.setfield(L, -2, "FLAG_WINDOW_MINIMIZED")

	lua.pushinteger(L, lua.Integer(1024))
	lua.setfield(L, -2, "FLAG_WINDOW_MAXIMIZED")

	lua.pushinteger(L, lua.Integer(2048))
	lua.setfield(L, -2, "FLAG_WINDOW_UNFOCUSED")

	lua.pushinteger(L, lua.Integer(4096))
	lua.setfield(L, -2, "FLAG_WINDOW_TOPMOST")

	lua.pushinteger(L, lua.Integer(256))
	lua.setfield(L, -2, "FLAG_WINDOW_ALWAYS_RUN")

	lua.pushinteger(L, lua.Integer(16))
	lua.setfield(L, -2, "FLAG_WINDOW_TRANSPARENT")

	lua.pushinteger(L, lua.Integer(8192))
	lua.setfield(L, -2, "FLAG_WINDOW_HIGHDPI")

	lua.pushinteger(L, lua.Integer(16384))
	lua.setfield(L, -2, "FLAG_WINDOW_MOUSE_PASSTHROUGH")

	lua.pushinteger(L, lua.Integer(32768))
	lua.setfield(L, -2, "FLAG_BORDERLESS_WINDOWED_MODE")

	lua.pushinteger(L, lua.Integer(32))
	lua.setfield(L, -2, "FLAG_MSAA_4X_HINT")

	lua.pushinteger(L, lua.Integer(65536))
	lua.setfield(L, -2, "FLAG_INTERLACED_HINT")

	lua.pushinteger(L, lua.Integer(0))
	lua.setfield(L, -2, "LOG_ALL")

	lua.pushinteger(L, lua.Integer(1))
	lua.setfield(L, -2, "LOG_TRACE")

	lua.pushinteger(L, lua.Integer(2))
	lua.setfield(L, -2, "LOG_DEBUG")

	lua.pushinteger(L, lua.Integer(3))
	lua.setfield(L, -2, "LOG_INFO")

	lua.pushinteger(L, lua.Integer(4))
	lua.setfield(L, -2, "LOG_WARNING")

	lua.pushinteger(L, lua.Integer(5))
	lua.setfield(L, -2, "LOG_ERROR")

	lua.pushinteger(L, lua.Integer(6))
	lua.setfield(L, -2, "LOG_FATAL")

	lua.pushinteger(L, lua.Integer(7))
	lua.setfield(L, -2, "LOG_NONE")

	lua.pushinteger(L, lua.Integer(0))
	lua.setfield(L, -2, "KEY_NULL")

	lua.pushinteger(L, lua.Integer(39))
	lua.setfield(L, -2, "KEY_APOSTROPHE")

	lua.pushinteger(L, lua.Integer(44))
	lua.setfield(L, -2, "KEY_COMMA")

	lua.pushinteger(L, lua.Integer(45))
	lua.setfield(L, -2, "KEY_MINUS")

	lua.pushinteger(L, lua.Integer(46))
	lua.setfield(L, -2, "KEY_PERIOD")

	lua.pushinteger(L, lua.Integer(47))
	lua.setfield(L, -2, "KEY_SLASH")

	lua.pushinteger(L, lua.Integer(48))
	lua.setfield(L, -2, "KEY_ZERO")

	lua.pushinteger(L, lua.Integer(49))
	lua.setfield(L, -2, "KEY_ONE")

	lua.pushinteger(L, lua.Integer(50))
	lua.setfield(L, -2, "KEY_TWO")

	lua.pushinteger(L, lua.Integer(51))
	lua.setfield(L, -2, "KEY_THREE")

	lua.pushinteger(L, lua.Integer(52))
	lua.setfield(L, -2, "KEY_FOUR")

	lua.pushinteger(L, lua.Integer(53))
	lua.setfield(L, -2, "KEY_FIVE")

	lua.pushinteger(L, lua.Integer(54))
	lua.setfield(L, -2, "KEY_SIX")

	lua.pushinteger(L, lua.Integer(55))
	lua.setfield(L, -2, "KEY_SEVEN")

	lua.pushinteger(L, lua.Integer(56))
	lua.setfield(L, -2, "KEY_EIGHT")

	lua.pushinteger(L, lua.Integer(57))
	lua.setfield(L, -2, "KEY_NINE")

	lua.pushinteger(L, lua.Integer(59))
	lua.setfield(L, -2, "KEY_SEMICOLON")

	lua.pushinteger(L, lua.Integer(61))
	lua.setfield(L, -2, "KEY_EQUAL")

	lua.pushinteger(L, lua.Integer(65))
	lua.setfield(L, -2, "KEY_A")

	lua.pushinteger(L, lua.Integer(66))
	lua.setfield(L, -2, "KEY_B")

	lua.pushinteger(L, lua.Integer(67))
	lua.setfield(L, -2, "KEY_C")

	lua.pushinteger(L, lua.Integer(68))
	lua.setfield(L, -2, "KEY_D")

	lua.pushinteger(L, lua.Integer(69))
	lua.setfield(L, -2, "KEY_E")

	lua.pushinteger(L, lua.Integer(70))
	lua.setfield(L, -2, "KEY_F")

	lua.pushinteger(L, lua.Integer(71))
	lua.setfield(L, -2, "KEY_G")

	lua.pushinteger(L, lua.Integer(72))
	lua.setfield(L, -2, "KEY_H")

	lua.pushinteger(L, lua.Integer(73))
	lua.setfield(L, -2, "KEY_I")

	lua.pushinteger(L, lua.Integer(74))
	lua.setfield(L, -2, "KEY_J")

	lua.pushinteger(L, lua.Integer(75))
	lua.setfield(L, -2, "KEY_K")

	lua.pushinteger(L, lua.Integer(76))
	lua.setfield(L, -2, "KEY_L")

	lua.pushinteger(L, lua.Integer(77))
	lua.setfield(L, -2, "KEY_M")

	lua.pushinteger(L, lua.Integer(78))
	lua.setfield(L, -2, "KEY_N")

	lua.pushinteger(L, lua.Integer(79))
	lua.setfield(L, -2, "KEY_O")

	lua.pushinteger(L, lua.Integer(80))
	lua.setfield(L, -2, "KEY_P")

	lua.pushinteger(L, lua.Integer(81))
	lua.setfield(L, -2, "KEY_Q")

	lua.pushinteger(L, lua.Integer(82))
	lua.setfield(L, -2, "KEY_R")

	lua.pushinteger(L, lua.Integer(83))
	lua.setfield(L, -2, "KEY_S")

	lua.pushinteger(L, lua.Integer(84))
	lua.setfield(L, -2, "KEY_T")

	lua.pushinteger(L, lua.Integer(85))
	lua.setfield(L, -2, "KEY_U")

	lua.pushinteger(L, lua.Integer(86))
	lua.setfield(L, -2, "KEY_V")

	lua.pushinteger(L, lua.Integer(87))
	lua.setfield(L, -2, "KEY_W")

	lua.pushinteger(L, lua.Integer(88))
	lua.setfield(L, -2, "KEY_X")

	lua.pushinteger(L, lua.Integer(89))
	lua.setfield(L, -2, "KEY_Y")

	lua.pushinteger(L, lua.Integer(90))
	lua.setfield(L, -2, "KEY_Z")

	lua.pushinteger(L, lua.Integer(91))
	lua.setfield(L, -2, "KEY_LEFT_BRACKET")

	lua.pushinteger(L, lua.Integer(92))
	lua.setfield(L, -2, "KEY_BACKSLASH")

	lua.pushinteger(L, lua.Integer(93))
	lua.setfield(L, -2, "KEY_RIGHT_BRACKET")

	lua.pushinteger(L, lua.Integer(96))
	lua.setfield(L, -2, "KEY_GRAVE")

	lua.pushinteger(L, lua.Integer(32))
	lua.setfield(L, -2, "KEY_SPACE")

	lua.pushinteger(L, lua.Integer(256))
	lua.setfield(L, -2, "KEY_ESCAPE")

	lua.pushinteger(L, lua.Integer(257))
	lua.setfield(L, -2, "KEY_ENTER")

	lua.pushinteger(L, lua.Integer(258))
	lua.setfield(L, -2, "KEY_TAB")

	lua.pushinteger(L, lua.Integer(259))
	lua.setfield(L, -2, "KEY_BACKSPACE")

	lua.pushinteger(L, lua.Integer(260))
	lua.setfield(L, -2, "KEY_INSERT")

	lua.pushinteger(L, lua.Integer(261))
	lua.setfield(L, -2, "KEY_DELETE")

	lua.pushinteger(L, lua.Integer(262))
	lua.setfield(L, -2, "KEY_RIGHT")

	lua.pushinteger(L, lua.Integer(263))
	lua.setfield(L, -2, "KEY_LEFT")

	lua.pushinteger(L, lua.Integer(264))
	lua.setfield(L, -2, "KEY_DOWN")

	lua.pushinteger(L, lua.Integer(265))
	lua.setfield(L, -2, "KEY_UP")

	lua.pushinteger(L, lua.Integer(266))
	lua.setfield(L, -2, "KEY_PAGE_UP")

	lua.pushinteger(L, lua.Integer(267))
	lua.setfield(L, -2, "KEY_PAGE_DOWN")

	lua.pushinteger(L, lua.Integer(268))
	lua.setfield(L, -2, "KEY_HOME")

	lua.pushinteger(L, lua.Integer(269))
	lua.setfield(L, -2, "KEY_END")

	lua.pushinteger(L, lua.Integer(280))
	lua.setfield(L, -2, "KEY_CAPS_LOCK")

	lua.pushinteger(L, lua.Integer(281))
	lua.setfield(L, -2, "KEY_SCROLL_LOCK")

	lua.pushinteger(L, lua.Integer(282))
	lua.setfield(L, -2, "KEY_NUM_LOCK")

	lua.pushinteger(L, lua.Integer(283))
	lua.setfield(L, -2, "KEY_PRINT_SCREEN")

	lua.pushinteger(L, lua.Integer(284))
	lua.setfield(L, -2, "KEY_PAUSE")

	lua.pushinteger(L, lua.Integer(290))
	lua.setfield(L, -2, "KEY_F1")

	lua.pushinteger(L, lua.Integer(291))
	lua.setfield(L, -2, "KEY_F2")

	lua.pushinteger(L, lua.Integer(292))
	lua.setfield(L, -2, "KEY_F3")

	lua.pushinteger(L, lua.Integer(293))
	lua.setfield(L, -2, "KEY_F4")

	lua.pushinteger(L, lua.Integer(294))
	lua.setfield(L, -2, "KEY_F5")

	lua.pushinteger(L, lua.Integer(295))
	lua.setfield(L, -2, "KEY_F6")

	lua.pushinteger(L, lua.Integer(296))
	lua.setfield(L, -2, "KEY_F7")

	lua.pushinteger(L, lua.Integer(297))
	lua.setfield(L, -2, "KEY_F8")

	lua.pushinteger(L, lua.Integer(298))
	lua.setfield(L, -2, "KEY_F9")

	lua.pushinteger(L, lua.Integer(299))
	lua.setfield(L, -2, "KEY_F10")

	lua.pushinteger(L, lua.Integer(300))
	lua.setfield(L, -2, "KEY_F11")

	lua.pushinteger(L, lua.Integer(301))
	lua.setfield(L, -2, "KEY_F12")

	lua.pushinteger(L, lua.Integer(340))
	lua.setfield(L, -2, "KEY_LEFT_SHIFT")

	lua.pushinteger(L, lua.Integer(341))
	lua.setfield(L, -2, "KEY_LEFT_CONTROL")

	lua.pushinteger(L, lua.Integer(342))
	lua.setfield(L, -2, "KEY_LEFT_ALT")

	lua.pushinteger(L, lua.Integer(343))
	lua.setfield(L, -2, "KEY_LEFT_SUPER")

	lua.pushinteger(L, lua.Integer(344))
	lua.setfield(L, -2, "KEY_RIGHT_SHIFT")

	lua.pushinteger(L, lua.Integer(345))
	lua.setfield(L, -2, "KEY_RIGHT_CONTROL")

	lua.pushinteger(L, lua.Integer(346))
	lua.setfield(L, -2, "KEY_RIGHT_ALT")

	lua.pushinteger(L, lua.Integer(347))
	lua.setfield(L, -2, "KEY_RIGHT_SUPER")

	lua.pushinteger(L, lua.Integer(348))
	lua.setfield(L, -2, "KEY_KB_MENU")

	lua.pushinteger(L, lua.Integer(320))
	lua.setfield(L, -2, "KEY_KP_0")

	lua.pushinteger(L, lua.Integer(321))
	lua.setfield(L, -2, "KEY_KP_1")

	lua.pushinteger(L, lua.Integer(322))
	lua.setfield(L, -2, "KEY_KP_2")

	lua.pushinteger(L, lua.Integer(323))
	lua.setfield(L, -2, "KEY_KP_3")

	lua.pushinteger(L, lua.Integer(324))
	lua.setfield(L, -2, "KEY_KP_4")

	lua.pushinteger(L, lua.Integer(325))
	lua.setfield(L, -2, "KEY_KP_5")

	lua.pushinteger(L, lua.Integer(326))
	lua.setfield(L, -2, "KEY_KP_6")

	lua.pushinteger(L, lua.Integer(327))
	lua.setfield(L, -2, "KEY_KP_7")

	lua.pushinteger(L, lua.Integer(328))
	lua.setfield(L, -2, "KEY_KP_8")

	lua.pushinteger(L, lua.Integer(329))
	lua.setfield(L, -2, "KEY_KP_9")

	lua.pushinteger(L, lua.Integer(330))
	lua.setfield(L, -2, "KEY_KP_DECIMAL")

	lua.pushinteger(L, lua.Integer(331))
	lua.setfield(L, -2, "KEY_KP_DIVIDE")

	lua.pushinteger(L, lua.Integer(332))
	lua.setfield(L, -2, "KEY_KP_MULTIPLY")

	lua.pushinteger(L, lua.Integer(333))
	lua.setfield(L, -2, "KEY_KP_SUBTRACT")

	lua.pushinteger(L, lua.Integer(334))
	lua.setfield(L, -2, "KEY_KP_ADD")

	lua.pushinteger(L, lua.Integer(335))
	lua.setfield(L, -2, "KEY_KP_ENTER")

	lua.pushinteger(L, lua.Integer(336))
	lua.setfield(L, -2, "KEY_KP_EQUAL")

	lua.pushinteger(L, lua.Integer(4))
	lua.setfield(L, -2, "KEY_BACK")

	lua.pushinteger(L, lua.Integer(5))
	lua.setfield(L, -2, "KEY_MENU")

	lua.pushinteger(L, lua.Integer(24))
	lua.setfield(L, -2, "KEY_VOLUME_UP")

	lua.pushinteger(L, lua.Integer(25))
	lua.setfield(L, -2, "KEY_VOLUME_DOWN")

	lua.pushinteger(L, lua.Integer(0))
	lua.setfield(L, -2, "MOUSE_BUTTON_LEFT")

	lua.pushinteger(L, lua.Integer(1))
	lua.setfield(L, -2, "MOUSE_BUTTON_RIGHT")

	lua.pushinteger(L, lua.Integer(2))
	lua.setfield(L, -2, "MOUSE_BUTTON_MIDDLE")

	lua.pushinteger(L, lua.Integer(3))
	lua.setfield(L, -2, "MOUSE_BUTTON_SIDE")

	lua.pushinteger(L, lua.Integer(4))
	lua.setfield(L, -2, "MOUSE_BUTTON_EXTRA")

	lua.pushinteger(L, lua.Integer(5))
	lua.setfield(L, -2, "MOUSE_BUTTON_FORWARD")

	lua.pushinteger(L, lua.Integer(6))
	lua.setfield(L, -2, "MOUSE_BUTTON_BACK")

	lua.pushinteger(L, lua.Integer(0))
	lua.setfield(L, -2, "MOUSE_CURSOR_DEFAULT")

	lua.pushinteger(L, lua.Integer(1))
	lua.setfield(L, -2, "MOUSE_CURSOR_ARROW")

	lua.pushinteger(L, lua.Integer(2))
	lua.setfield(L, -2, "MOUSE_CURSOR_IBEAM")

	lua.pushinteger(L, lua.Integer(3))
	lua.setfield(L, -2, "MOUSE_CURSOR_CROSSHAIR")

	lua.pushinteger(L, lua.Integer(4))
	lua.setfield(L, -2, "MOUSE_CURSOR_POINTING_HAND")

	lua.pushinteger(L, lua.Integer(5))
	lua.setfield(L, -2, "MOUSE_CURSOR_RESIZE_EW")

	lua.pushinteger(L, lua.Integer(6))
	lua.setfield(L, -2, "MOUSE_CURSOR_RESIZE_NS")

	lua.pushinteger(L, lua.Integer(7))
	lua.setfield(L, -2, "MOUSE_CURSOR_RESIZE_NWSE")

	lua.pushinteger(L, lua.Integer(8))
	lua.setfield(L, -2, "MOUSE_CURSOR_RESIZE_NESW")

	lua.pushinteger(L, lua.Integer(9))
	lua.setfield(L, -2, "MOUSE_CURSOR_RESIZE_ALL")

	lua.pushinteger(L, lua.Integer(10))
	lua.setfield(L, -2, "MOUSE_CURSOR_NOT_ALLOWED")

	lua.pushinteger(L, lua.Integer(0))
	lua.setfield(L, -2, "GAMEPAD_BUTTON_UNKNOWN")

	lua.pushinteger(L, lua.Integer(1))
	lua.setfield(L, -2, "GAMEPAD_BUTTON_LEFT_FACE_UP")

	lua.pushinteger(L, lua.Integer(2))
	lua.setfield(L, -2, "GAMEPAD_BUTTON_LEFT_FACE_RIGHT")

	lua.pushinteger(L, lua.Integer(3))
	lua.setfield(L, -2, "GAMEPAD_BUTTON_LEFT_FACE_DOWN")

	lua.pushinteger(L, lua.Integer(4))
	lua.setfield(L, -2, "GAMEPAD_BUTTON_LEFT_FACE_LEFT")

	lua.pushinteger(L, lua.Integer(5))
	lua.setfield(L, -2, "GAMEPAD_BUTTON_RIGHT_FACE_UP")

	lua.pushinteger(L, lua.Integer(6))
	lua.setfield(L, -2, "GAMEPAD_BUTTON_RIGHT_FACE_RIGHT")

	lua.pushinteger(L, lua.Integer(7))
	lua.setfield(L, -2, "GAMEPAD_BUTTON_RIGHT_FACE_DOWN")

	lua.pushinteger(L, lua.Integer(8))
	lua.setfield(L, -2, "GAMEPAD_BUTTON_RIGHT_FACE_LEFT")

	lua.pushinteger(L, lua.Integer(9))
	lua.setfield(L, -2, "GAMEPAD_BUTTON_LEFT_TRIGGER_1")

	lua.pushinteger(L, lua.Integer(10))
	lua.setfield(L, -2, "GAMEPAD_BUTTON_LEFT_TRIGGER_2")

	lua.pushinteger(L, lua.Integer(11))
	lua.setfield(L, -2, "GAMEPAD_BUTTON_RIGHT_TRIGGER_1")

	lua.pushinteger(L, lua.Integer(12))
	lua.setfield(L, -2, "GAMEPAD_BUTTON_RIGHT_TRIGGER_2")

	lua.pushinteger(L, lua.Integer(13))
	lua.setfield(L, -2, "GAMEPAD_BUTTON_MIDDLE_LEFT")

	lua.pushinteger(L, lua.Integer(14))
	lua.setfield(L, -2, "GAMEPAD_BUTTON_MIDDLE")

	lua.pushinteger(L, lua.Integer(15))
	lua.setfield(L, -2, "GAMEPAD_BUTTON_MIDDLE_RIGHT")

	lua.pushinteger(L, lua.Integer(16))
	lua.setfield(L, -2, "GAMEPAD_BUTTON_LEFT_THUMB")

	lua.pushinteger(L, lua.Integer(17))
	lua.setfield(L, -2, "GAMEPAD_BUTTON_RIGHT_THUMB")

	lua.pushinteger(L, lua.Integer(0))
	lua.setfield(L, -2, "GAMEPAD_AXIS_LEFT_X")

	lua.pushinteger(L, lua.Integer(1))
	lua.setfield(L, -2, "GAMEPAD_AXIS_LEFT_Y")

	lua.pushinteger(L, lua.Integer(2))
	lua.setfield(L, -2, "GAMEPAD_AXIS_RIGHT_X")

	lua.pushinteger(L, lua.Integer(3))
	lua.setfield(L, -2, "GAMEPAD_AXIS_RIGHT_Y")

	lua.pushinteger(L, lua.Integer(4))
	lua.setfield(L, -2, "GAMEPAD_AXIS_LEFT_TRIGGER")

	lua.pushinteger(L, lua.Integer(5))
	lua.setfield(L, -2, "GAMEPAD_AXIS_RIGHT_TRIGGER")

	lua.pushinteger(L, lua.Integer(0))
	lua.setfield(L, -2, "MATERIAL_MAP_ALBEDO")

	lua.pushinteger(L, lua.Integer(1))
	lua.setfield(L, -2, "MATERIAL_MAP_METALNESS")

	lua.pushinteger(L, lua.Integer(2))
	lua.setfield(L, -2, "MATERIAL_MAP_NORMAL")

	lua.pushinteger(L, lua.Integer(3))
	lua.setfield(L, -2, "MATERIAL_MAP_ROUGHNESS")

	lua.pushinteger(L, lua.Integer(4))
	lua.setfield(L, -2, "MATERIAL_MAP_OCCLUSION")

	lua.pushinteger(L, lua.Integer(5))
	lua.setfield(L, -2, "MATERIAL_MAP_EMISSION")

	lua.pushinteger(L, lua.Integer(6))
	lua.setfield(L, -2, "MATERIAL_MAP_HEIGHT")

	lua.pushinteger(L, lua.Integer(7))
	lua.setfield(L, -2, "MATERIAL_MAP_CUBEMAP")

	lua.pushinteger(L, lua.Integer(8))
	lua.setfield(L, -2, "MATERIAL_MAP_IRRADIANCE")

	lua.pushinteger(L, lua.Integer(9))
	lua.setfield(L, -2, "MATERIAL_MAP_PREFILTER")

	lua.pushinteger(L, lua.Integer(10))
	lua.setfield(L, -2, "MATERIAL_MAP_BRDF")

	lua.pushinteger(L, lua.Integer(0))
	lua.setfield(L, -2, "SHADER_LOC_VERTEX_POSITION")

	lua.pushinteger(L, lua.Integer(1))
	lua.setfield(L, -2, "SHADER_LOC_VERTEX_TEXCOORD01")

	lua.pushinteger(L, lua.Integer(2))
	lua.setfield(L, -2, "SHADER_LOC_VERTEX_TEXCOORD02")

	lua.pushinteger(L, lua.Integer(3))
	lua.setfield(L, -2, "SHADER_LOC_VERTEX_NORMAL")

	lua.pushinteger(L, lua.Integer(4))
	lua.setfield(L, -2, "SHADER_LOC_VERTEX_TANGENT")

	lua.pushinteger(L, lua.Integer(5))
	lua.setfield(L, -2, "SHADER_LOC_VERTEX_COLOR")

	lua.pushinteger(L, lua.Integer(6))
	lua.setfield(L, -2, "SHADER_LOC_MATRIX_MVP")

	lua.pushinteger(L, lua.Integer(7))
	lua.setfield(L, -2, "SHADER_LOC_MATRIX_VIEW")

	lua.pushinteger(L, lua.Integer(8))
	lua.setfield(L, -2, "SHADER_LOC_MATRIX_PROJECTION")

	lua.pushinteger(L, lua.Integer(9))
	lua.setfield(L, -2, "SHADER_LOC_MATRIX_MODEL")

	lua.pushinteger(L, lua.Integer(10))
	lua.setfield(L, -2, "SHADER_LOC_MATRIX_NORMAL")

	lua.pushinteger(L, lua.Integer(11))
	lua.setfield(L, -2, "SHADER_LOC_VECTOR_VIEW")

	lua.pushinteger(L, lua.Integer(12))
	lua.setfield(L, -2, "SHADER_LOC_COLOR_DIFFUSE")

	lua.pushinteger(L, lua.Integer(13))
	lua.setfield(L, -2, "SHADER_LOC_COLOR_SPECULAR")

	lua.pushinteger(L, lua.Integer(14))
	lua.setfield(L, -2, "SHADER_LOC_COLOR_AMBIENT")

	lua.pushinteger(L, lua.Integer(15))
	lua.setfield(L, -2, "SHADER_LOC_MAP_ALBEDO")

	lua.pushinteger(L, lua.Integer(16))
	lua.setfield(L, -2, "SHADER_LOC_MAP_METALNESS")

	lua.pushinteger(L, lua.Integer(17))
	lua.setfield(L, -2, "SHADER_LOC_MAP_NORMAL")

	lua.pushinteger(L, lua.Integer(18))
	lua.setfield(L, -2, "SHADER_LOC_MAP_ROUGHNESS")

	lua.pushinteger(L, lua.Integer(19))
	lua.setfield(L, -2, "SHADER_LOC_MAP_OCCLUSION")

	lua.pushinteger(L, lua.Integer(20))
	lua.setfield(L, -2, "SHADER_LOC_MAP_EMISSION")

	lua.pushinteger(L, lua.Integer(21))
	lua.setfield(L, -2, "SHADER_LOC_MAP_HEIGHT")

	lua.pushinteger(L, lua.Integer(22))
	lua.setfield(L, -2, "SHADER_LOC_MAP_CUBEMAP")

	lua.pushinteger(L, lua.Integer(23))
	lua.setfield(L, -2, "SHADER_LOC_MAP_IRRADIANCE")

	lua.pushinteger(L, lua.Integer(24))
	lua.setfield(L, -2, "SHADER_LOC_MAP_PREFILTER")

	lua.pushinteger(L, lua.Integer(25))
	lua.setfield(L, -2, "SHADER_LOC_MAP_BRDF")

	lua.pushinteger(L, lua.Integer(26))
	lua.setfield(L, -2, "SHADER_LOC_VERTEX_BONEIDS")

	lua.pushinteger(L, lua.Integer(27))
	lua.setfield(L, -2, "SHADER_LOC_VERTEX_BONEWEIGHTS")

	lua.pushinteger(L, lua.Integer(28))
	lua.setfield(L, -2, "SHADER_LOC_MATRIX_BONETRANSFORMS")

	lua.pushinteger(L, lua.Integer(29))
	lua.setfield(L, -2, "SHADER_LOC_VERTEX_INSTANCETRANSFORM")

	lua.pushinteger(L, lua.Integer(0))
	lua.setfield(L, -2, "SHADER_UNIFORM_FLOAT")

	lua.pushinteger(L, lua.Integer(1))
	lua.setfield(L, -2, "SHADER_UNIFORM_VEC2")

	lua.pushinteger(L, lua.Integer(2))
	lua.setfield(L, -2, "SHADER_UNIFORM_VEC3")

	lua.pushinteger(L, lua.Integer(3))
	lua.setfield(L, -2, "SHADER_UNIFORM_VEC4")

	lua.pushinteger(L, lua.Integer(4))
	lua.setfield(L, -2, "SHADER_UNIFORM_INT")

	lua.pushinteger(L, lua.Integer(5))
	lua.setfield(L, -2, "SHADER_UNIFORM_IVEC2")

	lua.pushinteger(L, lua.Integer(6))
	lua.setfield(L, -2, "SHADER_UNIFORM_IVEC3")

	lua.pushinteger(L, lua.Integer(7))
	lua.setfield(L, -2, "SHADER_UNIFORM_IVEC4")

	lua.pushinteger(L, lua.Integer(8))
	lua.setfield(L, -2, "SHADER_UNIFORM_UINT")

	lua.pushinteger(L, lua.Integer(9))
	lua.setfield(L, -2, "SHADER_UNIFORM_UIVEC2")

	lua.pushinteger(L, lua.Integer(10))
	lua.setfield(L, -2, "SHADER_UNIFORM_UIVEC3")

	lua.pushinteger(L, lua.Integer(11))
	lua.setfield(L, -2, "SHADER_UNIFORM_UIVEC4")

	lua.pushinteger(L, lua.Integer(12))
	lua.setfield(L, -2, "SHADER_UNIFORM_SAMPLER2D")

	lua.pushinteger(L, lua.Integer(0))
	lua.setfield(L, -2, "SHADER_ATTRIB_FLOAT")

	lua.pushinteger(L, lua.Integer(1))
	lua.setfield(L, -2, "SHADER_ATTRIB_VEC2")

	lua.pushinteger(L, lua.Integer(2))
	lua.setfield(L, -2, "SHADER_ATTRIB_VEC3")

	lua.pushinteger(L, lua.Integer(3))
	lua.setfield(L, -2, "SHADER_ATTRIB_VEC4")

	lua.pushinteger(L, lua.Integer(1))
	lua.setfield(L, -2, "PIXELFORMAT_UNCOMPRESSED_GRAYSCALE")

	lua.pushinteger(L, lua.Integer(2))
	lua.setfield(L, -2, "PIXELFORMAT_UNCOMPRESSED_GRAY_ALPHA")

	lua.pushinteger(L, lua.Integer(3))
	lua.setfield(L, -2, "PIXELFORMAT_UNCOMPRESSED_R5G6B5")

	lua.pushinteger(L, lua.Integer(4))
	lua.setfield(L, -2, "PIXELFORMAT_UNCOMPRESSED_R8G8B8")

	lua.pushinteger(L, lua.Integer(5))
	lua.setfield(L, -2, "PIXELFORMAT_UNCOMPRESSED_R5G5B5A1")

	lua.pushinteger(L, lua.Integer(6))
	lua.setfield(L, -2, "PIXELFORMAT_UNCOMPRESSED_R4G4B4A4")

	lua.pushinteger(L, lua.Integer(7))
	lua.setfield(L, -2, "PIXELFORMAT_UNCOMPRESSED_R8G8B8A8")

	lua.pushinteger(L, lua.Integer(8))
	lua.setfield(L, -2, "PIXELFORMAT_UNCOMPRESSED_R32")

	lua.pushinteger(L, lua.Integer(9))
	lua.setfield(L, -2, "PIXELFORMAT_UNCOMPRESSED_R32G32B32")

	lua.pushinteger(L, lua.Integer(10))
	lua.setfield(L, -2, "PIXELFORMAT_UNCOMPRESSED_R32G32B32A32")

	lua.pushinteger(L, lua.Integer(11))
	lua.setfield(L, -2, "PIXELFORMAT_UNCOMPRESSED_R16")

	lua.pushinteger(L, lua.Integer(12))
	lua.setfield(L, -2, "PIXELFORMAT_UNCOMPRESSED_R16G16B16")

	lua.pushinteger(L, lua.Integer(13))
	lua.setfield(L, -2, "PIXELFORMAT_UNCOMPRESSED_R16G16B16A16")

	lua.pushinteger(L, lua.Integer(14))
	lua.setfield(L, -2, "PIXELFORMAT_COMPRESSED_DXT1_RGB")

	lua.pushinteger(L, lua.Integer(15))
	lua.setfield(L, -2, "PIXELFORMAT_COMPRESSED_DXT1_RGBA")

	lua.pushinteger(L, lua.Integer(16))
	lua.setfield(L, -2, "PIXELFORMAT_COMPRESSED_DXT3_RGBA")

	lua.pushinteger(L, lua.Integer(17))
	lua.setfield(L, -2, "PIXELFORMAT_COMPRESSED_DXT5_RGBA")

	lua.pushinteger(L, lua.Integer(18))
	lua.setfield(L, -2, "PIXELFORMAT_COMPRESSED_ETC1_RGB")

	lua.pushinteger(L, lua.Integer(19))
	lua.setfield(L, -2, "PIXELFORMAT_COMPRESSED_ETC2_RGB")

	lua.pushinteger(L, lua.Integer(20))
	lua.setfield(L, -2, "PIXELFORMAT_COMPRESSED_ETC2_EAC_RGBA")

	lua.pushinteger(L, lua.Integer(21))
	lua.setfield(L, -2, "PIXELFORMAT_COMPRESSED_PVRT_RGB")

	lua.pushinteger(L, lua.Integer(22))
	lua.setfield(L, -2, "PIXELFORMAT_COMPRESSED_PVRT_RGBA")

	lua.pushinteger(L, lua.Integer(23))
	lua.setfield(L, -2, "PIXELFORMAT_COMPRESSED_ASTC_4x4_RGBA")

	lua.pushinteger(L, lua.Integer(24))
	lua.setfield(L, -2, "PIXELFORMAT_COMPRESSED_ASTC_8x8_RGBA")

	lua.pushinteger(L, lua.Integer(0))
	lua.setfield(L, -2, "TEXTURE_FILTER_POINT")

	lua.pushinteger(L, lua.Integer(1))
	lua.setfield(L, -2, "TEXTURE_FILTER_BILINEAR")

	lua.pushinteger(L, lua.Integer(2))
	lua.setfield(L, -2, "TEXTURE_FILTER_TRILINEAR")

	lua.pushinteger(L, lua.Integer(3))
	lua.setfield(L, -2, "TEXTURE_FILTER_ANISOTROPIC_4X")

	lua.pushinteger(L, lua.Integer(4))
	lua.setfield(L, -2, "TEXTURE_FILTER_ANISOTROPIC_8X")

	lua.pushinteger(L, lua.Integer(5))
	lua.setfield(L, -2, "TEXTURE_FILTER_ANISOTROPIC_16X")

	lua.pushinteger(L, lua.Integer(0))
	lua.setfield(L, -2, "TEXTURE_WRAP_REPEAT")

	lua.pushinteger(L, lua.Integer(1))
	lua.setfield(L, -2, "TEXTURE_WRAP_CLAMP")

	lua.pushinteger(L, lua.Integer(2))
	lua.setfield(L, -2, "TEXTURE_WRAP_MIRROR_REPEAT")

	lua.pushinteger(L, lua.Integer(3))
	lua.setfield(L, -2, "TEXTURE_WRAP_MIRROR_CLAMP")

	lua.pushinteger(L, lua.Integer(0))
	lua.setfield(L, -2, "CUBEMAP_LAYOUT_AUTO_DETECT")

	lua.pushinteger(L, lua.Integer(1))
	lua.setfield(L, -2, "CUBEMAP_LAYOUT_LINE_VERTICAL")

	lua.pushinteger(L, lua.Integer(2))
	lua.setfield(L, -2, "CUBEMAP_LAYOUT_LINE_HORIZONTAL")

	lua.pushinteger(L, lua.Integer(3))
	lua.setfield(L, -2, "CUBEMAP_LAYOUT_CROSS_THREE_BY_FOUR")

	lua.pushinteger(L, lua.Integer(4))
	lua.setfield(L, -2, "CUBEMAP_LAYOUT_CROSS_FOUR_BY_THREE")

	lua.pushinteger(L, lua.Integer(0))
	lua.setfield(L, -2, "FONT_DEFAULT")

	lua.pushinteger(L, lua.Integer(1))
	lua.setfield(L, -2, "FONT_BITMAP")

	lua.pushinteger(L, lua.Integer(2))
	lua.setfield(L, -2, "FONT_SDF")

	lua.pushinteger(L, lua.Integer(0))
	lua.setfield(L, -2, "BLEND_ALPHA")

	lua.pushinteger(L, lua.Integer(1))
	lua.setfield(L, -2, "BLEND_ADDITIVE")

	lua.pushinteger(L, lua.Integer(2))
	lua.setfield(L, -2, "BLEND_MULTIPLIED")

	lua.pushinteger(L, lua.Integer(3))
	lua.setfield(L, -2, "BLEND_ADD_COLORS")

	lua.pushinteger(L, lua.Integer(4))
	lua.setfield(L, -2, "BLEND_SUBTRACT_COLORS")

	lua.pushinteger(L, lua.Integer(5))
	lua.setfield(L, -2, "BLEND_ALPHA_PREMULTIPLY")

	lua.pushinteger(L, lua.Integer(6))
	lua.setfield(L, -2, "BLEND_CUSTOM")

	lua.pushinteger(L, lua.Integer(7))
	lua.setfield(L, -2, "BLEND_CUSTOM_SEPARATE")

	lua.pushinteger(L, lua.Integer(0))
	lua.setfield(L, -2, "GESTURE_NONE")

	lua.pushinteger(L, lua.Integer(1))
	lua.setfield(L, -2, "GESTURE_TAP")

	lua.pushinteger(L, lua.Integer(2))
	lua.setfield(L, -2, "GESTURE_DOUBLETAP")

	lua.pushinteger(L, lua.Integer(4))
	lua.setfield(L, -2, "GESTURE_HOLD")

	lua.pushinteger(L, lua.Integer(8))
	lua.setfield(L, -2, "GESTURE_DRAG")

	lua.pushinteger(L, lua.Integer(16))
	lua.setfield(L, -2, "GESTURE_SWIPE_RIGHT")

	lua.pushinteger(L, lua.Integer(32))
	lua.setfield(L, -2, "GESTURE_SWIPE_LEFT")

	lua.pushinteger(L, lua.Integer(64))
	lua.setfield(L, -2, "GESTURE_SWIPE_UP")

	lua.pushinteger(L, lua.Integer(128))
	lua.setfield(L, -2, "GESTURE_SWIPE_DOWN")

	lua.pushinteger(L, lua.Integer(256))
	lua.setfield(L, -2, "GESTURE_PINCH_IN")

	lua.pushinteger(L, lua.Integer(512))
	lua.setfield(L, -2, "GESTURE_PINCH_OUT")

	lua.pushinteger(L, lua.Integer(0))
	lua.setfield(L, -2, "CAMERA_CUSTOM")

	lua.pushinteger(L, lua.Integer(1))
	lua.setfield(L, -2, "CAMERA_FREE")

	lua.pushinteger(L, lua.Integer(2))
	lua.setfield(L, -2, "CAMERA_ORBITAL")

	lua.pushinteger(L, lua.Integer(3))
	lua.setfield(L, -2, "CAMERA_FIRST_PERSON")

	lua.pushinteger(L, lua.Integer(4))
	lua.setfield(L, -2, "CAMERA_THIRD_PERSON")

	lua.pushinteger(L, lua.Integer(0))
	lua.setfield(L, -2, "CAMERA_PERSPECTIVE")

	lua.pushinteger(L, lua.Integer(1))
	lua.setfield(L, -2, "CAMERA_ORTHOGRAPHIC")

	lua.pushinteger(L, lua.Integer(0))
	lua.setfield(L, -2, "NPATCH_NINE_PATCH")

	lua.pushinteger(L, lua.Integer(1))
	lua.setfield(L, -2, "NPATCH_THREE_PATCH_VERTICAL")

	lua.pushinteger(L, lua.Integer(2))
	lua.setfield(L, -2, "NPATCH_THREE_PATCH_HORIZONTAL")

	lua.pushcfunction(L, lua_InitWindow)
	lua.setfield(L, -2, "InitWindow")

	lua.pushcfunction(L, lua_CloseWindow)
	lua.setfield(L, -2, "CloseWindow")

	lua.pushcfunction(L, lua_WindowShouldClose)
	lua.setfield(L, -2, "WindowShouldClose")

	lua.pushcfunction(L, lua_IsWindowReady)
	lua.setfield(L, -2, "IsWindowReady")

	lua.pushcfunction(L, lua_IsWindowFullscreen)
	lua.setfield(L, -2, "IsWindowFullscreen")

	lua.pushcfunction(L, lua_IsWindowHidden)
	lua.setfield(L, -2, "IsWindowHidden")

	lua.pushcfunction(L, lua_IsWindowMinimized)
	lua.setfield(L, -2, "IsWindowMinimized")

	lua.pushcfunction(L, lua_IsWindowMaximized)
	lua.setfield(L, -2, "IsWindowMaximized")

	lua.pushcfunction(L, lua_IsWindowFocused)
	lua.setfield(L, -2, "IsWindowFocused")

	lua.pushcfunction(L, lua_IsWindowResized)
	lua.setfield(L, -2, "IsWindowResized")

	lua.pushcfunction(L, lua_IsWindowState)
	lua.setfield(L, -2, "IsWindowState")

	lua.pushcfunction(L, lua_SetWindowState)
	lua.setfield(L, -2, "SetWindowState")

	lua.pushcfunction(L, lua_ClearWindowState)
	lua.setfield(L, -2, "ClearWindowState")

	lua.pushcfunction(L, lua_ToggleFullscreen)
	lua.setfield(L, -2, "ToggleFullscreen")

	lua.pushcfunction(L, lua_ToggleBorderlessWindowed)
	lua.setfield(L, -2, "ToggleBorderlessWindowed")

	lua.pushcfunction(L, lua_MaximizeWindow)
	lua.setfield(L, -2, "MaximizeWindow")

	lua.pushcfunction(L, lua_MinimizeWindow)
	lua.setfield(L, -2, "MinimizeWindow")

	lua.pushcfunction(L, lua_RestoreWindow)
	lua.setfield(L, -2, "RestoreWindow")

	lua.pushcfunction(L, lua_SetWindowIcon)
	lua.setfield(L, -2, "SetWindowIcon")

	lua.pushcfunction(L, lua_SetWindowIcons)
	lua.setfield(L, -2, "SetWindowIcons")

	lua.pushcfunction(L, lua_SetWindowTitle)
	lua.setfield(L, -2, "SetWindowTitle")

	lua.pushcfunction(L, lua_SetWindowPosition)
	lua.setfield(L, -2, "SetWindowPosition")

	lua.pushcfunction(L, lua_SetWindowMonitor)
	lua.setfield(L, -2, "SetWindowMonitor")

	lua.pushcfunction(L, lua_SetWindowMinSize)
	lua.setfield(L, -2, "SetWindowMinSize")

	lua.pushcfunction(L, lua_SetWindowMaxSize)
	lua.setfield(L, -2, "SetWindowMaxSize")

	lua.pushcfunction(L, lua_SetWindowSize)
	lua.setfield(L, -2, "SetWindowSize")

	lua.pushcfunction(L, lua_SetWindowOpacity)
	lua.setfield(L, -2, "SetWindowOpacity")

	lua.pushcfunction(L, lua_SetWindowFocused)
	lua.setfield(L, -2, "SetWindowFocused")

	lua.pushcfunction(L, lua_GetScreenWidth)
	lua.setfield(L, -2, "GetScreenWidth")

	lua.pushcfunction(L, lua_GetScreenHeight)
	lua.setfield(L, -2, "GetScreenHeight")

	lua.pushcfunction(L, lua_GetRenderWidth)
	lua.setfield(L, -2, "GetRenderWidth")

	lua.pushcfunction(L, lua_GetRenderHeight)
	lua.setfield(L, -2, "GetRenderHeight")

	lua.pushcfunction(L, lua_GetMonitorCount)
	lua.setfield(L, -2, "GetMonitorCount")

	lua.pushcfunction(L, lua_GetCurrentMonitor)
	lua.setfield(L, -2, "GetCurrentMonitor")

	lua.pushcfunction(L, lua_GetMonitorPosition)
	lua.setfield(L, -2, "GetMonitorPosition")

	lua.pushcfunction(L, lua_GetMonitorWidth)
	lua.setfield(L, -2, "GetMonitorWidth")

	lua.pushcfunction(L, lua_GetMonitorHeight)
	lua.setfield(L, -2, "GetMonitorHeight")

	lua.pushcfunction(L, lua_GetMonitorPhysicalWidth)
	lua.setfield(L, -2, "GetMonitorPhysicalWidth")

	lua.pushcfunction(L, lua_GetMonitorPhysicalHeight)
	lua.setfield(L, -2, "GetMonitorPhysicalHeight")

	lua.pushcfunction(L, lua_GetMonitorRefreshRate)
	lua.setfield(L, -2, "GetMonitorRefreshRate")

	lua.pushcfunction(L, lua_GetWindowPosition)
	lua.setfield(L, -2, "GetWindowPosition")

	lua.pushcfunction(L, lua_GetWindowScaleDPI)
	lua.setfield(L, -2, "GetWindowScaleDPI")

	lua.pushcfunction(L, lua_GetMonitorName)
	lua.setfield(L, -2, "GetMonitorName")

	lua.pushcfunction(L, lua_SetClipboardText)
	lua.setfield(L, -2, "SetClipboardText")

	lua.pushcfunction(L, lua_GetClipboardText)
	lua.setfield(L, -2, "GetClipboardText")

	lua.pushcfunction(L, lua_GetClipboardImage)
	lua.setfield(L, -2, "GetClipboardImage")

	lua.pushcfunction(L, lua_EnableEventWaiting)
	lua.setfield(L, -2, "EnableEventWaiting")

	lua.pushcfunction(L, lua_DisableEventWaiting)
	lua.setfield(L, -2, "DisableEventWaiting")

	lua.pushcfunction(L, lua_ShowCursor)
	lua.setfield(L, -2, "ShowCursor")

	lua.pushcfunction(L, lua_HideCursor)
	lua.setfield(L, -2, "HideCursor")

	lua.pushcfunction(L, lua_IsCursorHidden)
	lua.setfield(L, -2, "IsCursorHidden")

	lua.pushcfunction(L, lua_EnableCursor)
	lua.setfield(L, -2, "EnableCursor")

	lua.pushcfunction(L, lua_DisableCursor)
	lua.setfield(L, -2, "DisableCursor")

	lua.pushcfunction(L, lua_IsCursorOnScreen)
	lua.setfield(L, -2, "IsCursorOnScreen")

	lua.pushcfunction(L, lua_ClearBackground)
	lua.setfield(L, -2, "ClearBackground")

	lua.pushcfunction(L, lua_BeginDrawing)
	lua.setfield(L, -2, "BeginDrawing")

	lua.pushcfunction(L, lua_EndDrawing)
	lua.setfield(L, -2, "EndDrawing")

	lua.pushcfunction(L, lua_BeginMode2D)
	lua.setfield(L, -2, "BeginMode2D")

	lua.pushcfunction(L, lua_EndMode2D)
	lua.setfield(L, -2, "EndMode2D")

	lua.pushcfunction(L, lua_BeginMode3D)
	lua.setfield(L, -2, "BeginMode3D")

	lua.pushcfunction(L, lua_EndMode3D)
	lua.setfield(L, -2, "EndMode3D")

	lua.pushcfunction(L, lua_BeginTextureMode)
	lua.setfield(L, -2, "BeginTextureMode")

	lua.pushcfunction(L, lua_EndTextureMode)
	lua.setfield(L, -2, "EndTextureMode")

	lua.pushcfunction(L, lua_BeginShaderMode)
	lua.setfield(L, -2, "BeginShaderMode")

	lua.pushcfunction(L, lua_EndShaderMode)
	lua.setfield(L, -2, "EndShaderMode")

	lua.pushcfunction(L, lua_BeginBlendMode)
	lua.setfield(L, -2, "BeginBlendMode")

	lua.pushcfunction(L, lua_EndBlendMode)
	lua.setfield(L, -2, "EndBlendMode")

	lua.pushcfunction(L, lua_BeginScissorMode)
	lua.setfield(L, -2, "BeginScissorMode")

	lua.pushcfunction(L, lua_EndScissorMode)
	lua.setfield(L, -2, "EndScissorMode")

	lua.pushcfunction(L, lua_EndVrStereoMode)
	lua.setfield(L, -2, "EndVrStereoMode")

	lua.pushcfunction(L, lua_LoadShader)
	lua.setfield(L, -2, "LoadShader")

	lua.pushcfunction(L, lua_LoadShaderFromMemory)
	lua.setfield(L, -2, "LoadShaderFromMemory")

	lua.pushcfunction(L, lua_IsShaderValid)
	lua.setfield(L, -2, "IsShaderValid")

	lua.pushcfunction(L, lua_GetShaderLocation)
	lua.setfield(L, -2, "GetShaderLocation")

	lua.pushcfunction(L, lua_GetShaderLocationAttrib)
	lua.setfield(L, -2, "GetShaderLocationAttrib")

	lua.pushcfunction(L, lua_SetShaderValue)
	lua.setfield(L, -2, "SetShaderValue")

	lua.pushcfunction(L, lua_SetShaderValueV)
	lua.setfield(L, -2, "SetShaderValueV")

	lua.pushcfunction(L, lua_SetShaderValueMatrix)
	lua.setfield(L, -2, "SetShaderValueMatrix")

	lua.pushcfunction(L, lua_SetShaderValueTexture)
	lua.setfield(L, -2, "SetShaderValueTexture")

	lua.pushcfunction(L, lua_UnloadShader)
	lua.setfield(L, -2, "UnloadShader")

	lua.pushcfunction(L, lua_GetScreenToWorldRay)
	lua.setfield(L, -2, "GetScreenToWorldRay")

	lua.pushcfunction(L, lua_GetScreenToWorldRayEx)
	lua.setfield(L, -2, "GetScreenToWorldRayEx")

	lua.pushcfunction(L, lua_GetWorldToScreen)
	lua.setfield(L, -2, "GetWorldToScreen")

	lua.pushcfunction(L, lua_GetWorldToScreenEx)
	lua.setfield(L, -2, "GetWorldToScreenEx")

	lua.pushcfunction(L, lua_GetWorldToScreen2D)
	lua.setfield(L, -2, "GetWorldToScreen2D")

	lua.pushcfunction(L, lua_GetScreenToWorld2D)
	lua.setfield(L, -2, "GetScreenToWorld2D")

	lua.pushcfunction(L, lua_GetCameraMatrix)
	lua.setfield(L, -2, "GetCameraMatrix")

	lua.pushcfunction(L, lua_GetCameraMatrix2D)
	lua.setfield(L, -2, "GetCameraMatrix2D")

	lua.pushcfunction(L, lua_SetTargetFPS)
	lua.setfield(L, -2, "SetTargetFPS")

	lua.pushcfunction(L, lua_GetFrameTime)
	lua.setfield(L, -2, "GetFrameTime")

	lua.pushcfunction(L, lua_GetTime)
	lua.setfield(L, -2, "GetTime")

	lua.pushcfunction(L, lua_GetFPS)
	lua.setfield(L, -2, "GetFPS")

	lua.pushcfunction(L, lua_SwapScreenBuffer)
	lua.setfield(L, -2, "SwapScreenBuffer")

	lua.pushcfunction(L, lua_PollInputEvents)
	lua.setfield(L, -2, "PollInputEvents")

	lua.pushcfunction(L, lua_WaitTime)
	lua.setfield(L, -2, "WaitTime")

	lua.pushcfunction(L, lua_SetRandomSeed)
	lua.setfield(L, -2, "SetRandomSeed")

	lua.pushcfunction(L, lua_GetRandomValue)
	lua.setfield(L, -2, "GetRandomValue")

	lua.pushcfunction(L, lua_TakeScreenshot)
	lua.setfield(L, -2, "TakeScreenshot")

	lua.pushcfunction(L, lua_SetConfigFlags)
	lua.setfield(L, -2, "SetConfigFlags")

	lua.pushcfunction(L, lua_OpenURL)
	lua.setfield(L, -2, "OpenURL")

	lua.pushcfunction(L, lua_SetTraceLogLevel)
	lua.setfield(L, -2, "SetTraceLogLevel")

	lua.pushcfunction(L, lua_LoadFileText)
	lua.setfield(L, -2, "LoadFileText")

	lua.pushcfunction(L, lua_SaveFileText)
	lua.setfield(L, -2, "SaveFileText")

	lua.pushcfunction(L, lua_FileRename)
	lua.setfield(L, -2, "FileRename")

	lua.pushcfunction(L, lua_FileRemove)
	lua.setfield(L, -2, "FileRemove")

	lua.pushcfunction(L, lua_FileCopy)
	lua.setfield(L, -2, "FileCopy")

	lua.pushcfunction(L, lua_FileMove)
	lua.setfield(L, -2, "FileMove")

	lua.pushcfunction(L, lua_FileTextReplace)
	lua.setfield(L, -2, "FileTextReplace")

	lua.pushcfunction(L, lua_FileTextFindIndex)
	lua.setfield(L, -2, "FileTextFindIndex")

	lua.pushcfunction(L, lua_FileExists)
	lua.setfield(L, -2, "FileExists")

	lua.pushcfunction(L, lua_DirectoryExists)
	lua.setfield(L, -2, "DirectoryExists")

	lua.pushcfunction(L, lua_IsFileExtension)
	lua.setfield(L, -2, "IsFileExtension")

	lua.pushcfunction(L, lua_GetFileLength)
	lua.setfield(L, -2, "GetFileLength")

	lua.pushcfunction(L, lua_GetFileModTime)
	lua.setfield(L, -2, "GetFileModTime")

	lua.pushcfunction(L, lua_GetFileExtension)
	lua.setfield(L, -2, "GetFileExtension")

	lua.pushcfunction(L, lua_GetFileName)
	lua.setfield(L, -2, "GetFileName")

	lua.pushcfunction(L, lua_GetFileNameWithoutExt)
	lua.setfield(L, -2, "GetFileNameWithoutExt")

	lua.pushcfunction(L, lua_GetDirectoryPath)
	lua.setfield(L, -2, "GetDirectoryPath")

	lua.pushcfunction(L, lua_GetPrevDirectoryPath)
	lua.setfield(L, -2, "GetPrevDirectoryPath")

	lua.pushcfunction(L, lua_GetWorkingDirectory)
	lua.setfield(L, -2, "GetWorkingDirectory")

	lua.pushcfunction(L, lua_GetApplicationDirectory)
	lua.setfield(L, -2, "GetApplicationDirectory")

	lua.pushcfunction(L, lua_MakeDirectory)
	lua.setfield(L, -2, "MakeDirectory")

	lua.pushcfunction(L, lua_ChangeDirectory)
	lua.setfield(L, -2, "ChangeDirectory")

	lua.pushcfunction(L, lua_IsPathFile)
	lua.setfield(L, -2, "IsPathFile")

	lua.pushcfunction(L, lua_IsFileNameValid)
	lua.setfield(L, -2, "IsFileNameValid")

	lua.pushcfunction(L, lua_LoadDirectoryFiles)
	lua.setfield(L, -2, "LoadDirectoryFiles")

	lua.pushcfunction(L, lua_LoadDirectoryFilesEx)
	lua.setfield(L, -2, "LoadDirectoryFilesEx")

	lua.pushcfunction(L, lua_UnloadDirectoryFiles)
	lua.setfield(L, -2, "UnloadDirectoryFiles")

	lua.pushcfunction(L, lua_IsFileDropped)
	lua.setfield(L, -2, "IsFileDropped")

	lua.pushcfunction(L, lua_LoadDroppedFiles)
	lua.setfield(L, -2, "LoadDroppedFiles")

	lua.pushcfunction(L, lua_UnloadDroppedFiles)
	lua.setfield(L, -2, "UnloadDroppedFiles")

	lua.pushcfunction(L, lua_SetAutomationEventBaseFrame)
	lua.setfield(L, -2, "SetAutomationEventBaseFrame")

	lua.pushcfunction(L, lua_StartAutomationEventRecording)
	lua.setfield(L, -2, "StartAutomationEventRecording")

	lua.pushcfunction(L, lua_StopAutomationEventRecording)
	lua.setfield(L, -2, "StopAutomationEventRecording")

	lua.pushcfunction(L, lua_IsKeyPressed)
	lua.setfield(L, -2, "IsKeyPressed")

	lua.pushcfunction(L, lua_IsKeyPressedRepeat)
	lua.setfield(L, -2, "IsKeyPressedRepeat")

	lua.pushcfunction(L, lua_IsKeyDown)
	lua.setfield(L, -2, "IsKeyDown")

	lua.pushcfunction(L, lua_IsKeyReleased)
	lua.setfield(L, -2, "IsKeyReleased")

	lua.pushcfunction(L, lua_IsKeyUp)
	lua.setfield(L, -2, "IsKeyUp")

	lua.pushcfunction(L, lua_GetKeyPressed)
	lua.setfield(L, -2, "GetKeyPressed")

	lua.pushcfunction(L, lua_GetCharPressed)
	lua.setfield(L, -2, "GetCharPressed")

	lua.pushcfunction(L, lua_GetKeyName)
	lua.setfield(L, -2, "GetKeyName")

	lua.pushcfunction(L, lua_SetExitKey)
	lua.setfield(L, -2, "SetExitKey")

	lua.pushcfunction(L, lua_IsGamepadAvailable)
	lua.setfield(L, -2, "IsGamepadAvailable")

	lua.pushcfunction(L, lua_GetGamepadName)
	lua.setfield(L, -2, "GetGamepadName")

	lua.pushcfunction(L, lua_IsGamepadButtonPressed)
	lua.setfield(L, -2, "IsGamepadButtonPressed")

	lua.pushcfunction(L, lua_IsGamepadButtonDown)
	lua.setfield(L, -2, "IsGamepadButtonDown")

	lua.pushcfunction(L, lua_IsGamepadButtonReleased)
	lua.setfield(L, -2, "IsGamepadButtonReleased")

	lua.pushcfunction(L, lua_IsGamepadButtonUp)
	lua.setfield(L, -2, "IsGamepadButtonUp")

	lua.pushcfunction(L, lua_GetGamepadButtonPressed)
	lua.setfield(L, -2, "GetGamepadButtonPressed")

	lua.pushcfunction(L, lua_GetGamepadAxisCount)
	lua.setfield(L, -2, "GetGamepadAxisCount")

	lua.pushcfunction(L, lua_GetGamepadAxisMovement)
	lua.setfield(L, -2, "GetGamepadAxisMovement")

	lua.pushcfunction(L, lua_SetGamepadMappings)
	lua.setfield(L, -2, "SetGamepadMappings")

	lua.pushcfunction(L, lua_SetGamepadVibration)
	lua.setfield(L, -2, "SetGamepadVibration")

	lua.pushcfunction(L, lua_IsMouseButtonPressed)
	lua.setfield(L, -2, "IsMouseButtonPressed")

	lua.pushcfunction(L, lua_IsMouseButtonDown)
	lua.setfield(L, -2, "IsMouseButtonDown")

	lua.pushcfunction(L, lua_IsMouseButtonReleased)
	lua.setfield(L, -2, "IsMouseButtonReleased")

	lua.pushcfunction(L, lua_IsMouseButtonUp)
	lua.setfield(L, -2, "IsMouseButtonUp")

	lua.pushcfunction(L, lua_GetMouseX)
	lua.setfield(L, -2, "GetMouseX")

	lua.pushcfunction(L, lua_GetMouseY)
	lua.setfield(L, -2, "GetMouseY")

	lua.pushcfunction(L, lua_GetMousePosition)
	lua.setfield(L, -2, "GetMousePosition")

	lua.pushcfunction(L, lua_GetMouseDelta)
	lua.setfield(L, -2, "GetMouseDelta")

	lua.pushcfunction(L, lua_SetMousePosition)
	lua.setfield(L, -2, "SetMousePosition")

	lua.pushcfunction(L, lua_SetMouseOffset)
	lua.setfield(L, -2, "SetMouseOffset")

	lua.pushcfunction(L, lua_SetMouseScale)
	lua.setfield(L, -2, "SetMouseScale")

	lua.pushcfunction(L, lua_GetMouseWheelMove)
	lua.setfield(L, -2, "GetMouseWheelMove")

	lua.pushcfunction(L, lua_GetMouseWheelMoveV)
	lua.setfield(L, -2, "GetMouseWheelMoveV")

	lua.pushcfunction(L, lua_SetMouseCursor)
	lua.setfield(L, -2, "SetMouseCursor")

	lua.pushcfunction(L, lua_GetTouchX)
	lua.setfield(L, -2, "GetTouchX")

	lua.pushcfunction(L, lua_GetTouchY)
	lua.setfield(L, -2, "GetTouchY")

	lua.pushcfunction(L, lua_GetTouchPosition)
	lua.setfield(L, -2, "GetTouchPosition")

	lua.pushcfunction(L, lua_GetTouchPointId)
	lua.setfield(L, -2, "GetTouchPointId")

	lua.pushcfunction(L, lua_GetTouchPointCount)
	lua.setfield(L, -2, "GetTouchPointCount")

	lua.pushcfunction(L, lua_SetGesturesEnabled)
	lua.setfield(L, -2, "SetGesturesEnabled")

	lua.pushcfunction(L, lua_IsGestureDetected)
	lua.setfield(L, -2, "IsGestureDetected")

	lua.pushcfunction(L, lua_GetGestureDetected)
	lua.setfield(L, -2, "GetGestureDetected")

	lua.pushcfunction(L, lua_GetGestureHoldDuration)
	lua.setfield(L, -2, "GetGestureHoldDuration")

	lua.pushcfunction(L, lua_GetGestureDragVector)
	lua.setfield(L, -2, "GetGestureDragVector")

	lua.pushcfunction(L, lua_GetGestureDragAngle)
	lua.setfield(L, -2, "GetGestureDragAngle")

	lua.pushcfunction(L, lua_GetGesturePinchVector)
	lua.setfield(L, -2, "GetGesturePinchVector")

	lua.pushcfunction(L, lua_GetGesturePinchAngle)
	lua.setfield(L, -2, "GetGesturePinchAngle")

	lua.pushcfunction(L, lua_UpdateCamera)
	lua.setfield(L, -2, "UpdateCamera")

	lua.pushcfunction(L, lua_UpdateCameraPro)
	lua.setfield(L, -2, "UpdateCameraPro")

	lua.pushcfunction(L, lua_SetShapesTexture)
	lua.setfield(L, -2, "SetShapesTexture")

	lua.pushcfunction(L, lua_GetShapesTexture)
	lua.setfield(L, -2, "GetShapesTexture")

	lua.pushcfunction(L, lua_GetShapesTextureRectangle)
	lua.setfield(L, -2, "GetShapesTextureRectangle")

	lua.pushcfunction(L, lua_DrawPixel)
	lua.setfield(L, -2, "DrawPixel")

	lua.pushcfunction(L, lua_DrawPixelV)
	lua.setfield(L, -2, "DrawPixelV")

	lua.pushcfunction(L, lua_DrawLine)
	lua.setfield(L, -2, "DrawLine")

	lua.pushcfunction(L, lua_DrawLineV)
	lua.setfield(L, -2, "DrawLineV")

	lua.pushcfunction(L, lua_DrawLineEx)
	lua.setfield(L, -2, "DrawLineEx")

	lua.pushcfunction(L, lua_DrawLineStrip)
	lua.setfield(L, -2, "DrawLineStrip")

	lua.pushcfunction(L, lua_DrawLineBezier)
	lua.setfield(L, -2, "DrawLineBezier")

	lua.pushcfunction(L, lua_DrawLineDashed)
	lua.setfield(L, -2, "DrawLineDashed")

	lua.pushcfunction(L, lua_DrawCircle)
	lua.setfield(L, -2, "DrawCircle")

	lua.pushcfunction(L, lua_DrawCircleV)
	lua.setfield(L, -2, "DrawCircleV")

	lua.pushcfunction(L, lua_DrawCircleGradient)
	lua.setfield(L, -2, "DrawCircleGradient")

	lua.pushcfunction(L, lua_DrawCircleSector)
	lua.setfield(L, -2, "DrawCircleSector")

	lua.pushcfunction(L, lua_DrawCircleSectorLines)
	lua.setfield(L, -2, "DrawCircleSectorLines")

	lua.pushcfunction(L, lua_DrawCircleLines)
	lua.setfield(L, -2, "DrawCircleLines")

	lua.pushcfunction(L, lua_DrawCircleLinesV)
	lua.setfield(L, -2, "DrawCircleLinesV")

	lua.pushcfunction(L, lua_DrawEllipse)
	lua.setfield(L, -2, "DrawEllipse")

	lua.pushcfunction(L, lua_DrawEllipseV)
	lua.setfield(L, -2, "DrawEllipseV")

	lua.pushcfunction(L, lua_DrawEllipseLines)
	lua.setfield(L, -2, "DrawEllipseLines")

	lua.pushcfunction(L, lua_DrawEllipseLinesV)
	lua.setfield(L, -2, "DrawEllipseLinesV")

	lua.pushcfunction(L, lua_DrawRing)
	lua.setfield(L, -2, "DrawRing")

	lua.pushcfunction(L, lua_DrawRingLines)
	lua.setfield(L, -2, "DrawRingLines")

	lua.pushcfunction(L, lua_DrawRectangle)
	lua.setfield(L, -2, "DrawRectangle")

	lua.pushcfunction(L, lua_DrawRectangleV)
	lua.setfield(L, -2, "DrawRectangleV")

	lua.pushcfunction(L, lua_DrawRectangleRec)
	lua.setfield(L, -2, "DrawRectangleRec")

	lua.pushcfunction(L, lua_DrawRectanglePro)
	lua.setfield(L, -2, "DrawRectanglePro")

	lua.pushcfunction(L, lua_DrawRectangleGradientV)
	lua.setfield(L, -2, "DrawRectangleGradientV")

	lua.pushcfunction(L, lua_DrawRectangleGradientH)
	lua.setfield(L, -2, "DrawRectangleGradientH")

	lua.pushcfunction(L, lua_DrawRectangleGradientEx)
	lua.setfield(L, -2, "DrawRectangleGradientEx")

	lua.pushcfunction(L, lua_DrawRectangleLines)
	lua.setfield(L, -2, "DrawRectangleLines")

	lua.pushcfunction(L, lua_DrawRectangleLinesEx)
	lua.setfield(L, -2, "DrawRectangleLinesEx")

	lua.pushcfunction(L, lua_DrawRectangleRounded)
	lua.setfield(L, -2, "DrawRectangleRounded")

	lua.pushcfunction(L, lua_DrawRectangleRoundedLines)
	lua.setfield(L, -2, "DrawRectangleRoundedLines")

	lua.pushcfunction(L, lua_DrawRectangleRoundedLinesEx)
	lua.setfield(L, -2, "DrawRectangleRoundedLinesEx")

	lua.pushcfunction(L, lua_DrawTriangle)
	lua.setfield(L, -2, "DrawTriangle")

	lua.pushcfunction(L, lua_DrawTriangleLines)
	lua.setfield(L, -2, "DrawTriangleLines")

	lua.pushcfunction(L, lua_DrawTriangleFan)
	lua.setfield(L, -2, "DrawTriangleFan")

	lua.pushcfunction(L, lua_DrawTriangleStrip)
	lua.setfield(L, -2, "DrawTriangleStrip")

	lua.pushcfunction(L, lua_DrawPoly)
	lua.setfield(L, -2, "DrawPoly")

	lua.pushcfunction(L, lua_DrawPolyLines)
	lua.setfield(L, -2, "DrawPolyLines")

	lua.pushcfunction(L, lua_DrawPolyLinesEx)
	lua.setfield(L, -2, "DrawPolyLinesEx")

	lua.pushcfunction(L, lua_DrawSplineLinear)
	lua.setfield(L, -2, "DrawSplineLinear")

	lua.pushcfunction(L, lua_DrawSplineBasis)
	lua.setfield(L, -2, "DrawSplineBasis")

	lua.pushcfunction(L, lua_DrawSplineCatmullRom)
	lua.setfield(L, -2, "DrawSplineCatmullRom")

	lua.pushcfunction(L, lua_DrawSplineBezierQuadratic)
	lua.setfield(L, -2, "DrawSplineBezierQuadratic")

	lua.pushcfunction(L, lua_DrawSplineBezierCubic)
	lua.setfield(L, -2, "DrawSplineBezierCubic")

	lua.pushcfunction(L, lua_DrawSplineSegmentLinear)
	lua.setfield(L, -2, "DrawSplineSegmentLinear")

	lua.pushcfunction(L, lua_DrawSplineSegmentBasis)
	lua.setfield(L, -2, "DrawSplineSegmentBasis")

	lua.pushcfunction(L, lua_DrawSplineSegmentCatmullRom)
	lua.setfield(L, -2, "DrawSplineSegmentCatmullRom")

	lua.pushcfunction(L, lua_DrawSplineSegmentBezierQuadratic)
	lua.setfield(L, -2, "DrawSplineSegmentBezierQuadratic")

	lua.pushcfunction(L, lua_DrawSplineSegmentBezierCubic)
	lua.setfield(L, -2, "DrawSplineSegmentBezierCubic")

	lua.pushcfunction(L, lua_GetSplinePointLinear)
	lua.setfield(L, -2, "GetSplinePointLinear")

	lua.pushcfunction(L, lua_GetSplinePointBasis)
	lua.setfield(L, -2, "GetSplinePointBasis")

	lua.pushcfunction(L, lua_GetSplinePointCatmullRom)
	lua.setfield(L, -2, "GetSplinePointCatmullRom")

	lua.pushcfunction(L, lua_GetSplinePointBezierQuad)
	lua.setfield(L, -2, "GetSplinePointBezierQuad")

	lua.pushcfunction(L, lua_GetSplinePointBezierCubic)
	lua.setfield(L, -2, "GetSplinePointBezierCubic")

	lua.pushcfunction(L, lua_CheckCollisionRecs)
	lua.setfield(L, -2, "CheckCollisionRecs")

	lua.pushcfunction(L, lua_CheckCollisionCircles)
	lua.setfield(L, -2, "CheckCollisionCircles")

	lua.pushcfunction(L, lua_CheckCollisionCircleRec)
	lua.setfield(L, -2, "CheckCollisionCircleRec")

	lua.pushcfunction(L, lua_CheckCollisionCircleLine)
	lua.setfield(L, -2, "CheckCollisionCircleLine")

	lua.pushcfunction(L, lua_CheckCollisionPointRec)
	lua.setfield(L, -2, "CheckCollisionPointRec")

	lua.pushcfunction(L, lua_CheckCollisionPointCircle)
	lua.setfield(L, -2, "CheckCollisionPointCircle")

	lua.pushcfunction(L, lua_CheckCollisionPointTriangle)
	lua.setfield(L, -2, "CheckCollisionPointTriangle")

	lua.pushcfunction(L, lua_CheckCollisionPointLine)
	lua.setfield(L, -2, "CheckCollisionPointLine")

	lua.pushcfunction(L, lua_CheckCollisionPointPoly)
	lua.setfield(L, -2, "CheckCollisionPointPoly")

	lua.pushcfunction(L, lua_CheckCollisionLines)
	lua.setfield(L, -2, "CheckCollisionLines")

	lua.pushcfunction(L, lua_GetCollisionRec)
	lua.setfield(L, -2, "GetCollisionRec")

	lua.pushcfunction(L, lua_LoadImage)
	lua.setfield(L, -2, "LoadImage")

	lua.pushcfunction(L, lua_LoadImageFromTexture)
	lua.setfield(L, -2, "LoadImageFromTexture")

	lua.pushcfunction(L, lua_LoadImageFromScreen)
	lua.setfield(L, -2, "LoadImageFromScreen")

	lua.pushcfunction(L, lua_IsImageValid)
	lua.setfield(L, -2, "IsImageValid")

	lua.pushcfunction(L, lua_UnloadImage)
	lua.setfield(L, -2, "UnloadImage")

	lua.pushcfunction(L, lua_ExportImage)
	lua.setfield(L, -2, "ExportImage")

	lua.pushcfunction(L, lua_ExportImageAsCode)
	lua.setfield(L, -2, "ExportImageAsCode")

	lua.pushcfunction(L, lua_GenImageColor)
	lua.setfield(L, -2, "GenImageColor")

	lua.pushcfunction(L, lua_GenImageGradientLinear)
	lua.setfield(L, -2, "GenImageGradientLinear")

	lua.pushcfunction(L, lua_GenImageGradientRadial)
	lua.setfield(L, -2, "GenImageGradientRadial")

	lua.pushcfunction(L, lua_GenImageGradientSquare)
	lua.setfield(L, -2, "GenImageGradientSquare")

	lua.pushcfunction(L, lua_GenImageChecked)
	lua.setfield(L, -2, "GenImageChecked")

	lua.pushcfunction(L, lua_GenImageWhiteNoise)
	lua.setfield(L, -2, "GenImageWhiteNoise")

	lua.pushcfunction(L, lua_GenImagePerlinNoise)
	lua.setfield(L, -2, "GenImagePerlinNoise")

	lua.pushcfunction(L, lua_GenImageCellular)
	lua.setfield(L, -2, "GenImageCellular")

	lua.pushcfunction(L, lua_GenImageText)
	lua.setfield(L, -2, "GenImageText")

	lua.pushcfunction(L, lua_ImageCopy)
	lua.setfield(L, -2, "ImageCopy")

	lua.pushcfunction(L, lua_ImageFromImage)
	lua.setfield(L, -2, "ImageFromImage")

	lua.pushcfunction(L, lua_ImageFromChannel)
	lua.setfield(L, -2, "ImageFromChannel")

	lua.pushcfunction(L, lua_ImageText)
	lua.setfield(L, -2, "ImageText")

	lua.pushcfunction(L, lua_ImageTextEx)
	lua.setfield(L, -2, "ImageTextEx")

	lua.pushcfunction(L, lua_ImageFormat)
	lua.setfield(L, -2, "ImageFormat")

	lua.pushcfunction(L, lua_ImageToPOT)
	lua.setfield(L, -2, "ImageToPOT")

	lua.pushcfunction(L, lua_ImageCrop)
	lua.setfield(L, -2, "ImageCrop")

	lua.pushcfunction(L, lua_ImageAlphaCrop)
	lua.setfield(L, -2, "ImageAlphaCrop")

	lua.pushcfunction(L, lua_ImageAlphaClear)
	lua.setfield(L, -2, "ImageAlphaClear")

	lua.pushcfunction(L, lua_ImageAlphaMask)
	lua.setfield(L, -2, "ImageAlphaMask")

	lua.pushcfunction(L, lua_ImageAlphaPremultiply)
	lua.setfield(L, -2, "ImageAlphaPremultiply")

	lua.pushcfunction(L, lua_ImageBlurGaussian)
	lua.setfield(L, -2, "ImageBlurGaussian")

	lua.pushcfunction(L, lua_ImageResize)
	lua.setfield(L, -2, "ImageResize")

	lua.pushcfunction(L, lua_ImageResizeNN)
	lua.setfield(L, -2, "ImageResizeNN")

	lua.pushcfunction(L, lua_ImageResizeCanvas)
	lua.setfield(L, -2, "ImageResizeCanvas")

	lua.pushcfunction(L, lua_ImageMipmaps)
	lua.setfield(L, -2, "ImageMipmaps")

	lua.pushcfunction(L, lua_ImageDither)
	lua.setfield(L, -2, "ImageDither")

	lua.pushcfunction(L, lua_ImageFlipVertical)
	lua.setfield(L, -2, "ImageFlipVertical")

	lua.pushcfunction(L, lua_ImageFlipHorizontal)
	lua.setfield(L, -2, "ImageFlipHorizontal")

	lua.pushcfunction(L, lua_ImageRotate)
	lua.setfield(L, -2, "ImageRotate")

	lua.pushcfunction(L, lua_ImageRotateCW)
	lua.setfield(L, -2, "ImageRotateCW")

	lua.pushcfunction(L, lua_ImageRotateCCW)
	lua.setfield(L, -2, "ImageRotateCCW")

	lua.pushcfunction(L, lua_ImageColorTint)
	lua.setfield(L, -2, "ImageColorTint")

	lua.pushcfunction(L, lua_ImageColorInvert)
	lua.setfield(L, -2, "ImageColorInvert")

	lua.pushcfunction(L, lua_ImageColorGrayscale)
	lua.setfield(L, -2, "ImageColorGrayscale")

	lua.pushcfunction(L, lua_ImageColorContrast)
	lua.setfield(L, -2, "ImageColorContrast")

	lua.pushcfunction(L, lua_ImageColorBrightness)
	lua.setfield(L, -2, "ImageColorBrightness")

	lua.pushcfunction(L, lua_ImageColorReplace)
	lua.setfield(L, -2, "ImageColorReplace")

	lua.pushcfunction(L, lua_GetImageAlphaBorder)
	lua.setfield(L, -2, "GetImageAlphaBorder")

	lua.pushcfunction(L, lua_GetImageColor)
	lua.setfield(L, -2, "GetImageColor")

	lua.pushcfunction(L, lua_ImageClearBackground)
	lua.setfield(L, -2, "ImageClearBackground")

	lua.pushcfunction(L, lua_ImageDrawPixel)
	lua.setfield(L, -2, "ImageDrawPixel")

	lua.pushcfunction(L, lua_ImageDrawPixelV)
	lua.setfield(L, -2, "ImageDrawPixelV")

	lua.pushcfunction(L, lua_ImageDrawLine)
	lua.setfield(L, -2, "ImageDrawLine")

	lua.pushcfunction(L, lua_ImageDrawLineV)
	lua.setfield(L, -2, "ImageDrawLineV")

	lua.pushcfunction(L, lua_ImageDrawLineEx)
	lua.setfield(L, -2, "ImageDrawLineEx")

	lua.pushcfunction(L, lua_ImageDrawCircle)
	lua.setfield(L, -2, "ImageDrawCircle")

	lua.pushcfunction(L, lua_ImageDrawCircleV)
	lua.setfield(L, -2, "ImageDrawCircleV")

	lua.pushcfunction(L, lua_ImageDrawCircleLines)
	lua.setfield(L, -2, "ImageDrawCircleLines")

	lua.pushcfunction(L, lua_ImageDrawCircleLinesV)
	lua.setfield(L, -2, "ImageDrawCircleLinesV")

	lua.pushcfunction(L, lua_ImageDrawRectangle)
	lua.setfield(L, -2, "ImageDrawRectangle")

	lua.pushcfunction(L, lua_ImageDrawRectangleV)
	lua.setfield(L, -2, "ImageDrawRectangleV")

	lua.pushcfunction(L, lua_ImageDrawRectangleRec)
	lua.setfield(L, -2, "ImageDrawRectangleRec")

	lua.pushcfunction(L, lua_ImageDrawRectangleLines)
	lua.setfield(L, -2, "ImageDrawRectangleLines")

	lua.pushcfunction(L, lua_ImageDrawTriangle)
	lua.setfield(L, -2, "ImageDrawTriangle")

	lua.pushcfunction(L, lua_ImageDrawTriangleEx)
	lua.setfield(L, -2, "ImageDrawTriangleEx")

	lua.pushcfunction(L, lua_ImageDrawTriangleLines)
	lua.setfield(L, -2, "ImageDrawTriangleLines")

	lua.pushcfunction(L, lua_ImageDrawTriangleFan)
	lua.setfield(L, -2, "ImageDrawTriangleFan")

	lua.pushcfunction(L, lua_ImageDrawTriangleStrip)
	lua.setfield(L, -2, "ImageDrawTriangleStrip")

	lua.pushcfunction(L, lua_ImageDraw)
	lua.setfield(L, -2, "ImageDraw")

	lua.pushcfunction(L, lua_ImageDrawText)
	lua.setfield(L, -2, "ImageDrawText")

	lua.pushcfunction(L, lua_ImageDrawTextEx)
	lua.setfield(L, -2, "ImageDrawTextEx")

	lua.pushcfunction(L, lua_LoadTexture)
	lua.setfield(L, -2, "LoadTexture")

	lua.pushcfunction(L, lua_LoadTextureFromImage)
	lua.setfield(L, -2, "LoadTextureFromImage")

	lua.pushcfunction(L, lua_LoadTextureCubemap)
	lua.setfield(L, -2, "LoadTextureCubemap")

	lua.pushcfunction(L, lua_LoadRenderTexture)
	lua.setfield(L, -2, "LoadRenderTexture")

	lua.pushcfunction(L, lua_IsTextureValid)
	lua.setfield(L, -2, "IsTextureValid")

	lua.pushcfunction(L, lua_UnloadTexture)
	lua.setfield(L, -2, "UnloadTexture")

	lua.pushcfunction(L, lua_IsRenderTextureValid)
	lua.setfield(L, -2, "IsRenderTextureValid")

	lua.pushcfunction(L, lua_UnloadRenderTexture)
	lua.setfield(L, -2, "UnloadRenderTexture")

	lua.pushcfunction(L, lua_UpdateTexture)
	lua.setfield(L, -2, "UpdateTexture")

	lua.pushcfunction(L, lua_UpdateTextureRec)
	lua.setfield(L, -2, "UpdateTextureRec")

	lua.pushcfunction(L, lua_GenTextureMipmaps)
	lua.setfield(L, -2, "GenTextureMipmaps")

	lua.pushcfunction(L, lua_SetTextureFilter)
	lua.setfield(L, -2, "SetTextureFilter")

	lua.pushcfunction(L, lua_SetTextureWrap)
	lua.setfield(L, -2, "SetTextureWrap")

	lua.pushcfunction(L, lua_DrawTexture)
	lua.setfield(L, -2, "DrawTexture")

	lua.pushcfunction(L, lua_DrawTextureV)
	lua.setfield(L, -2, "DrawTextureV")

	lua.pushcfunction(L, lua_DrawTextureEx)
	lua.setfield(L, -2, "DrawTextureEx")

	lua.pushcfunction(L, lua_DrawTextureRec)
	lua.setfield(L, -2, "DrawTextureRec")

	lua.pushcfunction(L, lua_DrawTexturePro)
	lua.setfield(L, -2, "DrawTexturePro")

	lua.pushcfunction(L, lua_DrawTextureNPatch)
	lua.setfield(L, -2, "DrawTextureNPatch")

	lua.pushcfunction(L, lua_Fade)
	lua.setfield(L, -2, "Fade")

	lua.pushcfunction(L, lua_ColorToInt)
	lua.setfield(L, -2, "ColorToInt")

	lua.pushcfunction(L, lua_ColorNormalize)
	lua.setfield(L, -2, "ColorNormalize")

	lua.pushcfunction(L, lua_ColorFromNormalized)
	lua.setfield(L, -2, "ColorFromNormalized")

	lua.pushcfunction(L, lua_ColorToHSV)
	lua.setfield(L, -2, "ColorToHSV")

	lua.pushcfunction(L, lua_ColorFromHSV)
	lua.setfield(L, -2, "ColorFromHSV")

	lua.pushcfunction(L, lua_ColorTint)
	lua.setfield(L, -2, "ColorTint")

	lua.pushcfunction(L, lua_ColorBrightness)
	lua.setfield(L, -2, "ColorBrightness")

	lua.pushcfunction(L, lua_ColorContrast)
	lua.setfield(L, -2, "ColorContrast")

	lua.pushcfunction(L, lua_ColorAlpha)
	lua.setfield(L, -2, "ColorAlpha")

	lua.pushcfunction(L, lua_ColorAlphaBlend)
	lua.setfield(L, -2, "ColorAlphaBlend")

	lua.pushcfunction(L, lua_ColorLerp)
	lua.setfield(L, -2, "ColorLerp")

	lua.pushcfunction(L, lua_GetColor)
	lua.setfield(L, -2, "GetColor")

	lua.pushcfunction(L, lua_GetPixelDataSize)
	lua.setfield(L, -2, "GetPixelDataSize")

	lua.pushcfunction(L, lua_GetFontDefault)
	lua.setfield(L, -2, "GetFontDefault")

	lua.pushcfunction(L, lua_LoadFont)
	lua.setfield(L, -2, "LoadFont")

	lua.pushcfunction(L, lua_LoadFontFromImage)
	lua.setfield(L, -2, "LoadFontFromImage")

	lua.pushcfunction(L, lua_IsFontValid)
	lua.setfield(L, -2, "IsFontValid")

	lua.pushcfunction(L, lua_UnloadFontData)
	lua.setfield(L, -2, "UnloadFontData")

	lua.pushcfunction(L, lua_UnloadFont)
	lua.setfield(L, -2, "UnloadFont")

	lua.pushcfunction(L, lua_ExportFontAsCode)
	lua.setfield(L, -2, "ExportFontAsCode")

	lua.pushcfunction(L, lua_DrawFPS)
	lua.setfield(L, -2, "DrawFPS")

	lua.pushcfunction(L, lua_DrawText)
	lua.setfield(L, -2, "DrawText")

	lua.pushcfunction(L, lua_DrawTextEx)
	lua.setfield(L, -2, "DrawTextEx")

	lua.pushcfunction(L, lua_DrawTextPro)
	lua.setfield(L, -2, "DrawTextPro")

	lua.pushcfunction(L, lua_DrawTextCodepoint)
	lua.setfield(L, -2, "DrawTextCodepoint")

	lua.pushcfunction(L, lua_SetTextLineSpacing)
	lua.setfield(L, -2, "SetTextLineSpacing")

	lua.pushcfunction(L, lua_MeasureText)
	lua.setfield(L, -2, "MeasureText")

	lua.pushcfunction(L, lua_MeasureTextEx)
	lua.setfield(L, -2, "MeasureTextEx")

	lua.pushcfunction(L, lua_GetGlyphIndex)
	lua.setfield(L, -2, "GetGlyphIndex")

	lua.pushcfunction(L, lua_GetGlyphInfo)
	lua.setfield(L, -2, "GetGlyphInfo")

	lua.pushcfunction(L, lua_GetGlyphAtlasRec)
	lua.setfield(L, -2, "GetGlyphAtlasRec")

	lua.pushcfunction(L, lua_GetCodepointCount)
	lua.setfield(L, -2, "GetCodepointCount")

	lua.pushcfunction(L, lua_TextSubtext)
	lua.setfield(L, -2, "TextSubtext")

	lua.pushcfunction(L, lua_TextRemoveSpaces)
	lua.setfield(L, -2, "TextRemoveSpaces")

	lua.pushcfunction(L, lua_TextFindIndex)
	lua.setfield(L, -2, "TextFindIndex")

	lua.pushcfunction(L, lua_TextToUpper)
	lua.setfield(L, -2, "TextToUpper")

	lua.pushcfunction(L, lua_TextToLower)
	lua.setfield(L, -2, "TextToLower")

	lua.pushcfunction(L, lua_TextToPascal)
	lua.setfield(L, -2, "TextToPascal")

	lua.pushcfunction(L, lua_TextToSnake)
	lua.setfield(L, -2, "TextToSnake")

	lua.pushcfunction(L, lua_TextToCamel)
	lua.setfield(L, -2, "TextToCamel")

	lua.pushcfunction(L, lua_TextToInteger)
	lua.setfield(L, -2, "TextToInteger")

	lua.pushcfunction(L, lua_TextToFloat)
	lua.setfield(L, -2, "TextToFloat")

	lua.pushcfunction(L, lua_DrawLine3D)
	lua.setfield(L, -2, "DrawLine3D")

	lua.pushcfunction(L, lua_DrawPoint3D)
	lua.setfield(L, -2, "DrawPoint3D")

	lua.pushcfunction(L, lua_DrawCircle3D)
	lua.setfield(L, -2, "DrawCircle3D")

	lua.pushcfunction(L, lua_DrawTriangle3D)
	lua.setfield(L, -2, "DrawTriangle3D")

	lua.pushcfunction(L, lua_DrawTriangleStrip3D)
	lua.setfield(L, -2, "DrawTriangleStrip3D")

	lua.pushcfunction(L, lua_DrawCube)
	lua.setfield(L, -2, "DrawCube")

	lua.pushcfunction(L, lua_DrawCubeV)
	lua.setfield(L, -2, "DrawCubeV")

	lua.pushcfunction(L, lua_DrawCubeWires)
	lua.setfield(L, -2, "DrawCubeWires")

	lua.pushcfunction(L, lua_DrawCubeWiresV)
	lua.setfield(L, -2, "DrawCubeWiresV")

	lua.pushcfunction(L, lua_DrawSphere)
	lua.setfield(L, -2, "DrawSphere")

	lua.pushcfunction(L, lua_DrawSphereEx)
	lua.setfield(L, -2, "DrawSphereEx")

	lua.pushcfunction(L, lua_DrawSphereWires)
	lua.setfield(L, -2, "DrawSphereWires")

	lua.pushcfunction(L, lua_DrawCylinder)
	lua.setfield(L, -2, "DrawCylinder")

	lua.pushcfunction(L, lua_DrawCylinderEx)
	lua.setfield(L, -2, "DrawCylinderEx")

	lua.pushcfunction(L, lua_DrawCylinderWires)
	lua.setfield(L, -2, "DrawCylinderWires")

	lua.pushcfunction(L, lua_DrawCylinderWiresEx)
	lua.setfield(L, -2, "DrawCylinderWiresEx")

	lua.pushcfunction(L, lua_DrawCapsule)
	lua.setfield(L, -2, "DrawCapsule")

	lua.pushcfunction(L, lua_DrawCapsuleWires)
	lua.setfield(L, -2, "DrawCapsuleWires")

	lua.pushcfunction(L, lua_DrawPlane)
	lua.setfield(L, -2, "DrawPlane")

	lua.pushcfunction(L, lua_DrawRay)
	lua.setfield(L, -2, "DrawRay")

	lua.pushcfunction(L, lua_DrawGrid)
	lua.setfield(L, -2, "DrawGrid")

	lua.pushcfunction(L, lua_DrawBoundingBox)
	lua.setfield(L, -2, "DrawBoundingBox")

	lua.pushcfunction(L, lua_DrawBillboard)
	lua.setfield(L, -2, "DrawBillboard")

	lua.pushcfunction(L, lua_DrawBillboardRec)
	lua.setfield(L, -2, "DrawBillboardRec")

	lua.pushcfunction(L, lua_DrawBillboardPro)
	lua.setfield(L, -2, "DrawBillboardPro")

	lua.pushcfunction(L, lua_CheckCollisionSpheres)
	lua.setfield(L, -2, "CheckCollisionSpheres")

	lua.pushcfunction(L, lua_CheckCollisionBoxes)
	lua.setfield(L, -2, "CheckCollisionBoxes")

	lua.pushcfunction(L, lua_CheckCollisionBoxSphere)
	lua.setfield(L, -2, "CheckCollisionBoxSphere")

	lua.pushcfunction(L, lua_GetRayCollisionSphere)
	lua.setfield(L, -2, "GetRayCollisionSphere")

	lua.pushcfunction(L, lua_GetRayCollisionBox)
	lua.setfield(L, -2, "GetRayCollisionBox")

	lua.pushcfunction(L, lua_GetRayCollisionTriangle)
	lua.setfield(L, -2, "GetRayCollisionTriangle")

	lua.pushcfunction(L, lua_GetRayCollisionQuad)
	lua.setfield(L, -2, "GetRayCollisionQuad")

	lua.pushcfunction(L, lua_InitAudioDevice)
	lua.setfield(L, -2, "InitAudioDevice")

	lua.pushcfunction(L, lua_CloseAudioDevice)
	lua.setfield(L, -2, "CloseAudioDevice")

	lua.pushcfunction(L, lua_IsAudioDeviceReady)
	lua.setfield(L, -2, "IsAudioDeviceReady")

	lua.pushcfunction(L, lua_SetMasterVolume)
	lua.setfield(L, -2, "SetMasterVolume")

	lua.pushcfunction(L, lua_GetMasterVolume)
	lua.setfield(L, -2, "GetMasterVolume")

	lua.pushcfunction(L, lua_LoadWave)
	lua.setfield(L, -2, "LoadWave")

	lua.pushcfunction(L, lua_IsWaveValid)
	lua.setfield(L, -2, "IsWaveValid")

	lua.pushcfunction(L, lua_LoadSound)
	lua.setfield(L, -2, "LoadSound")

	lua.pushcfunction(L, lua_LoadSoundFromWave)
	lua.setfield(L, -2, "LoadSoundFromWave")

	lua.pushcfunction(L, lua_LoadSoundAlias)
	lua.setfield(L, -2, "LoadSoundAlias")

	lua.pushcfunction(L, lua_IsSoundValid)
	lua.setfield(L, -2, "IsSoundValid")

	lua.pushcfunction(L, lua_UpdateSound)
	lua.setfield(L, -2, "UpdateSound")

	lua.pushcfunction(L, lua_UnloadWave)
	lua.setfield(L, -2, "UnloadWave")

	lua.pushcfunction(L, lua_UnloadSound)
	lua.setfield(L, -2, "UnloadSound")

	lua.pushcfunction(L, lua_UnloadSoundAlias)
	lua.setfield(L, -2, "UnloadSoundAlias")

	lua.pushcfunction(L, lua_ExportWave)
	lua.setfield(L, -2, "ExportWave")

	lua.pushcfunction(L, lua_ExportWaveAsCode)
	lua.setfield(L, -2, "ExportWaveAsCode")

	lua.pushcfunction(L, lua_PlaySound)
	lua.setfield(L, -2, "PlaySound")

	lua.pushcfunction(L, lua_StopSound)
	lua.setfield(L, -2, "StopSound")

	lua.pushcfunction(L, lua_PauseSound)
	lua.setfield(L, -2, "PauseSound")

	lua.pushcfunction(L, lua_ResumeSound)
	lua.setfield(L, -2, "ResumeSound")

	lua.pushcfunction(L, lua_IsSoundPlaying)
	lua.setfield(L, -2, "IsSoundPlaying")

	lua.pushcfunction(L, lua_SetSoundVolume)
	lua.setfield(L, -2, "SetSoundVolume")

	lua.pushcfunction(L, lua_SetSoundPitch)
	lua.setfield(L, -2, "SetSoundPitch")

	lua.pushcfunction(L, lua_SetSoundPan)
	lua.setfield(L, -2, "SetSoundPan")

	lua.pushcfunction(L, lua_WaveCopy)
	lua.setfield(L, -2, "WaveCopy")

	lua.pushcfunction(L, lua_LoadMusicStream)
	lua.setfield(L, -2, "LoadMusicStream")

	lua.pushcfunction(L, lua_IsMusicValid)
	lua.setfield(L, -2, "IsMusicValid")

	lua.pushcfunction(L, lua_UnloadMusicStream)
	lua.setfield(L, -2, "UnloadMusicStream")

	lua.pushcfunction(L, lua_PlayMusicStream)
	lua.setfield(L, -2, "PlayMusicStream")

	lua.pushcfunction(L, lua_IsMusicStreamPlaying)
	lua.setfield(L, -2, "IsMusicStreamPlaying")

	lua.pushcfunction(L, lua_UpdateMusicStream)
	lua.setfield(L, -2, "UpdateMusicStream")

	lua.pushcfunction(L, lua_StopMusicStream)
	lua.setfield(L, -2, "StopMusicStream")

	lua.pushcfunction(L, lua_PauseMusicStream)
	lua.setfield(L, -2, "PauseMusicStream")

	lua.pushcfunction(L, lua_ResumeMusicStream)
	lua.setfield(L, -2, "ResumeMusicStream")

	lua.pushcfunction(L, lua_SeekMusicStream)
	lua.setfield(L, -2, "SeekMusicStream")

	lua.pushcfunction(L, lua_SetMusicVolume)
	lua.setfield(L, -2, "SetMusicVolume")

	lua.pushcfunction(L, lua_SetMusicPitch)
	lua.setfield(L, -2, "SetMusicPitch")

	lua.pushcfunction(L, lua_SetMusicPan)
	lua.setfield(L, -2, "SetMusicPan")

	lua.pushcfunction(L, lua_GetMusicTimeLength)
	lua.setfield(L, -2, "GetMusicTimeLength")

	lua.pushcfunction(L, lua_GetMusicTimePlayed)
	lua.setfield(L, -2, "GetMusicTimePlayed")

	lua.pushcfunction(L, lua_LoadAudioStream)
	lua.setfield(L, -2, "LoadAudioStream")

	lua.pushcfunction(L, lua_IsAudioStreamValid)
	lua.setfield(L, -2, "IsAudioStreamValid")

	lua.pushcfunction(L, lua_UnloadAudioStream)
	lua.setfield(L, -2, "UnloadAudioStream")

	lua.pushcfunction(L, lua_UpdateAudioStream)
	lua.setfield(L, -2, "UpdateAudioStream")

	lua.pushcfunction(L, lua_IsAudioStreamProcessed)
	lua.setfield(L, -2, "IsAudioStreamProcessed")

	lua.pushcfunction(L, lua_PlayAudioStream)
	lua.setfield(L, -2, "PlayAudioStream")

	lua.pushcfunction(L, lua_PauseAudioStream)
	lua.setfield(L, -2, "PauseAudioStream")

	lua.pushcfunction(L, lua_ResumeAudioStream)
	lua.setfield(L, -2, "ResumeAudioStream")

	lua.pushcfunction(L, lua_IsAudioStreamPlaying)
	lua.setfield(L, -2, "IsAudioStreamPlaying")

	lua.pushcfunction(L, lua_StopAudioStream)
	lua.setfield(L, -2, "StopAudioStream")

	lua.pushcfunction(L, lua_SetAudioStreamVolume)
	lua.setfield(L, -2, "SetAudioStreamVolume")

	lua.pushcfunction(L, lua_SetAudioStreamPitch)
	lua.setfield(L, -2, "SetAudioStreamPitch")

	lua.pushcfunction(L, lua_SetAudioStreamPan)
	lua.setfield(L, -2, "SetAudioStreamPan")

	lua.pushcfunction(L, lua_SetAudioStreamBufferSizeDefault)
	lua.setfield(L, -2, "SetAudioStreamBufferSizeDefault")


	lua.setglobal(L, "ray")
}

tolua_int :: proc "c" (L: ^lua.State, s: c.int, idx: c.int = -99) {
	lua.pushinteger(L, lua.Integer(s))
}
fromlua_int :: proc "c" (L: ^lua.State, idx: c.int) -> c.int {
	p_retval := c.int(lua.tonumber(L, idx))
	return p_retval
}

tolua_float :: proc "c" (L: ^lua.State, s: c.float, idx: c.int = -99) {
	lua.pushnumber(L, lua.Number(s))
}
fromlua_float :: proc "c" (L: ^lua.State, idx: c.int) -> c.float {
	p_retval := c.float(lua.tonumber(L, idx))
	return p_retval
}

tolua_Vector2 :: proc "c" (L: ^lua.State, s: rl.Vector2, idx: c.int = -99) {
	context = runtime.default_context()
	idx := idx
	if idx == -99 {
		lua.newtable(L)
		idx = -2
	}
	lua.pushnumber(L, lua.Number(s.x))
	lua.setfield(L, idx, "x")
	lua.pushnumber(L, lua.Number(s.y))
	lua.setfield(L, idx, "y")
}

fromlua_Vector2 :: proc "c" (L: ^lua.State, idx: c.int) -> rl.Vector2 {
	context = runtime.default_context()
	lua.getfield(L, idx, "x")
	p_x := c.float(lua.tonumber(L, -1))
	lua.pop(L, 1)
	lua.getfield(L, idx, "y")
	p_y := c.float(lua.tonumber(L, -1))
	lua.pop(L, 1)
	return rl.Vector2{p_x, p_y}
}

tolua_Vector3 :: proc "c" (L: ^lua.State, s: rl.Vector3, idx: c.int = -99) {
	context = runtime.default_context()
	idx := idx
	if idx == -99 {
		lua.newtable(L)
		idx = -2
	}
	lua.pushnumber(L, lua.Number(s.x))
	lua.setfield(L, idx, "x")
	lua.pushnumber(L, lua.Number(s.y))
	lua.setfield(L, idx, "y")
	lua.pushnumber(L, lua.Number(s.z))
	lua.setfield(L, idx, "z")
}

fromlua_Vector3 :: proc "c" (L: ^lua.State, idx: c.int) -> rl.Vector3 {
	context = runtime.default_context()
	lua.getfield(L, idx, "x")
	p_x := c.float(lua.tonumber(L, -1))
	lua.pop(L, 1)
	lua.getfield(L, idx, "y")
	p_y := c.float(lua.tonumber(L, -1))
	lua.pop(L, 1)
	lua.getfield(L, idx, "z")
	p_z := c.float(lua.tonumber(L, -1))
	lua.pop(L, 1)
	return rl.Vector3{p_x, p_y, p_z}
}

tolua_Vector4 :: proc "c" (L: ^lua.State, s: rl.Vector4, idx: c.int = -99) {
	context = runtime.default_context()
	idx := idx
	if idx == -99 {
		lua.newtable(L)
		idx = -2
	}
	lua.pushnumber(L, lua.Number(s.x))
	lua.setfield(L, idx, "x")
	lua.pushnumber(L, lua.Number(s.y))
	lua.setfield(L, idx, "y")
	lua.pushnumber(L, lua.Number(s.z))
	lua.setfield(L, idx, "z")
	lua.pushnumber(L, lua.Number(s.w))
	lua.setfield(L, idx, "w")
}

fromlua_Vector4 :: proc "c" (L: ^lua.State, idx: c.int) -> rl.Vector4 {
	context = runtime.default_context()
	lua.getfield(L, idx, "x")
	p_x := c.float(lua.tonumber(L, -1))
	lua.pop(L, 1)
	lua.getfield(L, idx, "y")
	p_y := c.float(lua.tonumber(L, -1))
	lua.pop(L, 1)
	lua.getfield(L, idx, "z")
	p_z := c.float(lua.tonumber(L, -1))
	lua.pop(L, 1)
	lua.getfield(L, idx, "w")
	p_w := c.float(lua.tonumber(L, -1))
	lua.pop(L, 1)
	return rl.Vector4{p_x, p_y, p_z, p_w}
}

tolua_Matrix :: proc "c" (L: ^lua.State, s: rl.Matrix, idx: c.int = -99) {
	context = runtime.default_context()
	idx := idx
	if idx == -99 {
		lua.newtable(L)
		idx = -2
	}
	lua.pushnumber(L, lua.Number(s[0][0]))
	lua.setfield(L, idx, "m0")
	lua.pushnumber(L, lua.Number(s[1][0]))
	lua.setfield(L, idx, "m4")
	lua.pushnumber(L, lua.Number(s[2][0]))
	lua.setfield(L, idx, "m8")
	lua.pushnumber(L, lua.Number(s[3][0]))
	lua.setfield(L, idx, "m12")
	lua.pushnumber(L, lua.Number(s[0][1]))
	lua.setfield(L, idx, "m1")
	lua.pushnumber(L, lua.Number(s[1][1]))
	lua.setfield(L, idx, "m5")
	lua.pushnumber(L, lua.Number(s[2][1]))
	lua.setfield(L, idx, "m9")
	lua.pushnumber(L, lua.Number(s[3][1]))
	lua.setfield(L, idx, "m13")
	lua.pushnumber(L, lua.Number(s[0][2]))
	lua.setfield(L, idx, "m2")
	lua.pushnumber(L, lua.Number(s[1][2]))
	lua.setfield(L, idx, "m6")
	lua.pushnumber(L, lua.Number(s[2][2]))
	lua.setfield(L, idx, "m10")
	lua.pushnumber(L, lua.Number(s[3][2]))
	lua.setfield(L, idx, "m14")
	lua.pushnumber(L, lua.Number(s[0][3]))
	lua.setfield(L, idx, "m3")
	lua.pushnumber(L, lua.Number(s[1][3]))
	lua.setfield(L, idx, "m7")
	lua.pushnumber(L, lua.Number(s[2][3]))
	lua.setfield(L, idx, "m11")
	lua.pushnumber(L, lua.Number(s[3][3]))
	lua.setfield(L, idx, "m15")
}

fromlua_Matrix :: proc "c" (L: ^lua.State, idx: c.int) -> rl.Matrix {
	context = runtime.default_context()
	lua.getfield(L, idx, "m0")
	p_m0 := c.float(lua.tonumber(L, -1))
	lua.pop(L, 1)
	lua.getfield(L, idx, "m4")
	p_m4 := c.float(lua.tonumber(L, -1))
	lua.pop(L, 1)
	lua.getfield(L, idx, "m8")
	p_m8 := c.float(lua.tonumber(L, -1))
	lua.pop(L, 1)
	lua.getfield(L, idx, "m12")
	p_m12 := c.float(lua.tonumber(L, -1))
	lua.pop(L, 1)
	lua.getfield(L, idx, "m1")
	p_m1 := c.float(lua.tonumber(L, -1))
	lua.pop(L, 1)
	lua.getfield(L, idx, "m5")
	p_m5 := c.float(lua.tonumber(L, -1))
	lua.pop(L, 1)
	lua.getfield(L, idx, "m9")
	p_m9 := c.float(lua.tonumber(L, -1))
	lua.pop(L, 1)
	lua.getfield(L, idx, "m13")
	p_m13 := c.float(lua.tonumber(L, -1))
	lua.pop(L, 1)
	lua.getfield(L, idx, "m2")
	p_m2 := c.float(lua.tonumber(L, -1))
	lua.pop(L, 1)
	lua.getfield(L, idx, "m6")
	p_m6 := c.float(lua.tonumber(L, -1))
	lua.pop(L, 1)
	lua.getfield(L, idx, "m10")
	p_m10 := c.float(lua.tonumber(L, -1))
	lua.pop(L, 1)
	lua.getfield(L, idx, "m14")
	p_m14 := c.float(lua.tonumber(L, -1))
	lua.pop(L, 1)
	lua.getfield(L, idx, "m3")
	p_m3 := c.float(lua.tonumber(L, -1))
	lua.pop(L, 1)
	lua.getfield(L, idx, "m7")
	p_m7 := c.float(lua.tonumber(L, -1))
	lua.pop(L, 1)
	lua.getfield(L, idx, "m11")
	p_m11 := c.float(lua.tonumber(L, -1))
	lua.pop(L, 1)
	lua.getfield(L, idx, "m15")
	p_m15 := c.float(lua.tonumber(L, -1))
	lua.pop(L, 1)
	return rl.Matrix {
		p_m0,
		p_m4,
		p_m8,
		p_m12,
		p_m1,
		p_m5,
		p_m9,
		p_m13,
		p_m2,
		p_m6,
		p_m10,
		p_m14,
		p_m3,
		p_m7,
		p_m11,
		p_m15,
	}
}

tolua_Rectangle :: proc "c" (L: ^lua.State, s: rl.Rectangle, idx: c.int = -99) {
	context = runtime.default_context()
	idx := idx
	if idx == -99 {
		lua.newtable(L)
		idx = -2
	}
	lua.pushnumber(L, lua.Number(s.x))
	lua.setfield(L, idx, "x")
	lua.pushnumber(L, lua.Number(s.y))
	lua.setfield(L, idx, "y")
	lua.pushnumber(L, lua.Number(s.width))
	lua.setfield(L, idx, "width")
	lua.pushnumber(L, lua.Number(s.height))
	lua.setfield(L, idx, "height")
}

fromlua_Rectangle :: proc "c" (L: ^lua.State, idx: c.int) -> rl.Rectangle {
	context = runtime.default_context()
	lua.getfield(L, idx, "x")
	p_x := c.float(lua.tonumber(L, -1))
	lua.pop(L, 1)
	lua.getfield(L, idx, "y")
	p_y := c.float(lua.tonumber(L, -1))
	lua.pop(L, 1)
	lua.getfield(L, idx, "width")
	p_width := c.float(lua.tonumber(L, -1))
	lua.pop(L, 1)
	lua.getfield(L, idx, "height")
	p_height := c.float(lua.tonumber(L, -1))
	lua.pop(L, 1)
	return rl.Rectangle{x = p_x, y = p_y, width = p_width, height = p_height}
}

tolua_Image :: proc "c" (L: ^lua.State, s: rl.Image, idx: c.int = -99) {
	context = runtime.default_context()
	idx := idx
	if idx == -99 {
		lua.newtable(L)
		idx = -2
	}
	lua.pushlightuserdata(L, s.data)
	lua.setfield(L, idx, "data")
	lua.pushinteger(L, lua.Integer(s.width))
	lua.setfield(L, idx, "width")
	lua.pushinteger(L, lua.Integer(s.height))
	lua.setfield(L, idx, "height")
	lua.pushinteger(L, lua.Integer(s.mipmaps))
	lua.setfield(L, idx, "mipmaps")
	lua.pushinteger(L, lua.Integer(s.format))
	lua.setfield(L, idx, "format")
}

fromlua_Image :: proc "c" (L: ^lua.State, idx: c.int) -> rl.Image {
	context = runtime.default_context()
	lua.getfield(L, idx, "data")
	p_data := lua.touserdata(L, -1)
	lua.pop(L, 1)
	lua.getfield(L, idx, "width")
	p_width := c.int(lua.tonumber(L, -1))
	lua.pop(L, 1)
	lua.getfield(L, idx, "height")
	p_height := c.int(lua.tonumber(L, -1))
	lua.pop(L, 1)
	lua.getfield(L, idx, "mipmaps")
	p_mipmaps := c.int(lua.tonumber(L, -1))
	lua.pop(L, 1)
	lua.getfield(L, idx, "format")
	p_format := cast(rl.PixelFormat)c.int(lua.tonumber(L, -1))
	lua.pop(L, 1)
	return rl.Image {
		data = p_data,
		width = p_width,
		height = p_height,
		mipmaps = p_mipmaps,
		format = p_format,
	}
}

tolua_Texture :: proc "c" (L: ^lua.State, s: rl.Texture, idx: c.int = -99) {
	context = runtime.default_context()
	idx := idx
	if idx == -99 {
		lua.newtable(L)
		idx = -2
	}
	lua.pushinteger(L, lua.Integer(s.id))
	lua.setfield(L, idx, "id")
	lua.pushinteger(L, lua.Integer(s.width))
	lua.setfield(L, idx, "width")
	lua.pushinteger(L, lua.Integer(s.height))
	lua.setfield(L, idx, "height")
	lua.pushinteger(L, lua.Integer(s.mipmaps))
	lua.setfield(L, idx, "mipmaps")
	lua.pushinteger(L, lua.Integer(s.format))
	lua.setfield(L, idx, "format")
}

fromlua_Texture :: proc "c" (L: ^lua.State, idx: c.int) -> rl.Texture {
	context = runtime.default_context()
	lua.getfield(L, idx, "id")
	p_id := c.uint(lua.tonumber(L, -1))
	lua.pop(L, 1)
	lua.getfield(L, idx, "width")
	p_width := c.int(lua.tonumber(L, -1))
	lua.pop(L, 1)
	lua.getfield(L, idx, "height")
	p_height := c.int(lua.tonumber(L, -1))
	lua.pop(L, 1)
	lua.getfield(L, idx, "mipmaps")
	p_mipmaps := c.int(lua.tonumber(L, -1))
	lua.pop(L, 1)
	lua.getfield(L, idx, "format")
	p_format := cast(rl.PixelFormat)c.int(lua.tonumber(L, -1))
	lua.pop(L, 1)
	return rl.Texture {
		id = p_id,
		width = p_width,
		height = p_height,
		mipmaps = p_mipmaps,
		format = p_format,
	}
}

tolua_RenderTexture :: proc "c" (L: ^lua.State, s: rl.RenderTexture, idx: c.int = -99) {
	context = runtime.default_context()
	idx := idx
	if idx == -99 {
		lua.newtable(L)
		idx = -2
	}
	lua.pushinteger(L, lua.Integer(s.id))
	lua.setfield(L, idx, "id")
	tolua_Texture(L, s.texture)
	lua.setfield(L, idx, "texture")
	tolua_Texture(L, s.depth)
	lua.setfield(L, idx, "depth")
}

fromlua_RenderTexture :: proc "c" (L: ^lua.State, idx: c.int) -> rl.RenderTexture {
	context = runtime.default_context()
	lua.getfield(L, idx, "id")
	p_id := c.uint(lua.tonumber(L, -1))
	lua.pop(L, 1)
	lua.getfield(L, idx, "texture")
	p_texture := fromlua_Texture(L, -1)
	lua.pop(L, 1)
	lua.getfield(L, idx, "depth")
	p_depth := fromlua_Texture(L, -1)
	lua.pop(L, 1)
	return rl.RenderTexture{id = p_id, texture = p_texture, depth = p_depth}
}

tolua_NPatchInfo :: proc "c" (L: ^lua.State, s: rl.NPatchInfo, idx: c.int = -99) {
	context = runtime.default_context()
	idx := idx
	if idx == -99 {
		lua.newtable(L)
		idx = -2
	}
	tolua_Rectangle(L, s.source)
	lua.setfield(L, idx, "source")
	lua.pushinteger(L, lua.Integer(s.left))
	lua.setfield(L, idx, "left")
	lua.pushinteger(L, lua.Integer(s.top))
	lua.setfield(L, idx, "top")
	lua.pushinteger(L, lua.Integer(s.right))
	lua.setfield(L, idx, "right")
	lua.pushinteger(L, lua.Integer(s.bottom))
	lua.setfield(L, idx, "bottom")
	lua.pushinteger(L, lua.Integer(s.layout))
	lua.setfield(L, idx, "layout")
}

fromlua_NPatchInfo :: proc "c" (L: ^lua.State, idx: c.int) -> rl.NPatchInfo {
	context = runtime.default_context()
	lua.getfield(L, idx, "source")
	p_source := fromlua_Rectangle(L, -1)
	lua.pop(L, 1)
	lua.getfield(L, idx, "left")
	p_left := c.int(lua.tonumber(L, -1))
	lua.pop(L, 1)
	lua.getfield(L, idx, "top")
	p_top := c.int(lua.tonumber(L, -1))
	lua.pop(L, 1)
	lua.getfield(L, idx, "right")
	p_right := c.int(lua.tonumber(L, -1))
	lua.pop(L, 1)
	lua.getfield(L, idx, "bottom")
	p_bottom := c.int(lua.tonumber(L, -1))
	lua.pop(L, 1)
	lua.getfield(L, idx, "layout")
	p_layout := cast(rl.NPatchLayout)c.int(lua.tonumber(L, -1))
	lua.pop(L, 1)
	return rl.NPatchInfo {
		source = p_source,
		left = p_left,
		top = p_top,
		right = p_right,
		bottom = p_bottom,
		layout = p_layout,
	}
}

tolua_GlyphInfo :: proc "c" (L: ^lua.State, s: rl.GlyphInfo, idx: c.int = -99) {
	context = runtime.default_context()
	idx := idx
	if idx == -99 {
		lua.newtable(L)
		idx = -2
	}
	lua.pushinteger(L, lua.Integer(s.value))
	lua.setfield(L, idx, "value")
	lua.pushinteger(L, lua.Integer(s.offsetX))
	lua.setfield(L, idx, "offsetX")
	lua.pushinteger(L, lua.Integer(s.offsetY))
	lua.setfield(L, idx, "offsetY")
	lua.pushinteger(L, lua.Integer(s.advanceX))
	lua.setfield(L, idx, "advanceX")
	tolua_Image(L, s.image)
	lua.setfield(L, idx, "image")
}

fromlua_GlyphInfo :: proc "c" (L: ^lua.State, idx: c.int) -> rl.GlyphInfo {
	context = runtime.default_context()
	lua.getfield(L, idx, "value")
	p_value := cast(rune)c.int(lua.tonumber(L, -1))
	lua.pop(L, 1)
	lua.getfield(L, idx, "offsetX")
	p_offsetX := c.int(lua.tonumber(L, -1))
	lua.pop(L, 1)
	lua.getfield(L, idx, "offsetY")
	p_offsetY := c.int(lua.tonumber(L, -1))
	lua.pop(L, 1)
	lua.getfield(L, idx, "advanceX")
	p_advanceX := c.int(lua.tonumber(L, -1))
	lua.pop(L, 1)
	lua.getfield(L, idx, "image")
	p_image := fromlua_Image(L, -1)
	lua.pop(L, 1)
	return rl.GlyphInfo {
		value = p_value,
		offsetX = p_offsetX,
		offsetY = p_offsetY,
		advanceX = p_advanceX,
		image = p_image,
	}
}

tolua_Font :: proc "c" (L: ^lua.State, s: rl.Font, idx: c.int = -99) {
	context = runtime.default_context()
	idx := idx
	if idx == -99 {
		lua.newtable(L)
		idx = -2
	}
	lua.pushinteger(L, lua.Integer(s.baseSize))
	lua.setfield(L, idx, "baseSize")
	lua.pushinteger(L, lua.Integer(s.glyphCount))
	lua.setfield(L, idx, "glyphCount")
	lua.pushinteger(L, lua.Integer(s.glyphPadding))
	lua.setfield(L, idx, "glyphPadding")
	tolua_Texture2D(L, s.texture)
	lua.setfield(L, idx, "texture")
	tolua_array(L, s.recs, s.glyphCount, tolua_Rectangle)
	lua.setfield(L, idx, "recs")
	tolua_array(L, s.glyphs, s.glyphCount, tolua_GlyphInfo)
	lua.setfield(L, idx, "glyphs")
}

fromlua_Font :: proc "c" (L: ^lua.State, idx: c.int) -> rl.Font {
	context = runtime.default_context()
	lua.getfield(L, idx, "baseSize")
	p_baseSize := c.int(lua.tonumber(L, -1))
	lua.pop(L, 1)
	lua.getfield(L, idx, "glyphCount")
	p_glyphCount := c.int(lua.tonumber(L, -1))
	lua.pop(L, 1)
	lua.getfield(L, idx, "glyphPadding")
	p_glyphPadding := c.int(lua.tonumber(L, -1))
	lua.pop(L, 1)
	lua.getfield(L, idx, "texture")
	p_texture := fromlua_Texture2D(L, -1)
	lua.pop(L, 1)
	lua.getfield(L, idx, "recs")
	p_recs, _ := fromlua_array(L, -1, rl.Rectangle, fromlua_Rectangle)
	lua.pop(L, 1)
	lua.getfield(L, idx, "glyphs")
	p_glyphs, _ := fromlua_array(L, -1, rl.GlyphInfo, fromlua_GlyphInfo)
	lua.pop(L, 1)
	return rl.Font {
		baseSize = p_baseSize,
		glyphCount = p_glyphCount,
		glyphPadding = p_glyphPadding,
		texture = p_texture,
		recs = p_recs,
		glyphs = p_glyphs,
	}
}

tolua_Camera3D :: proc "c" (L: ^lua.State, s: rl.Camera3D, idx: c.int = -99) {
	context = runtime.default_context()
	idx := idx
	if idx == -99 {
		lua.newtable(L)
		idx = -2
	}
	tolua_Vector3(L, s.position)
	lua.setfield(L, idx, "position")
	tolua_Vector3(L, s.target)
	lua.setfield(L, idx, "target")
	tolua_Vector3(L, s.up)
	lua.setfield(L, idx, "up")
	lua.pushnumber(L, lua.Number(s.fovy))
	lua.setfield(L, idx, "fovy")
	lua.pushinteger(L, lua.Integer(s.projection))
	lua.setfield(L, idx, "projection")
}

fromlua_Camera3D :: proc "c" (L: ^lua.State, idx: c.int) -> rl.Camera3D {
	context = runtime.default_context()
	lua.getfield(L, idx, "position")
	p_position := fromlua_Vector3(L, -1)
	lua.pop(L, 1)
	lua.getfield(L, idx, "target")
	p_target := fromlua_Vector3(L, -1)
	lua.pop(L, 1)
	lua.getfield(L, idx, "up")
	p_up := fromlua_Vector3(L, -1)
	lua.pop(L, 1)
	lua.getfield(L, idx, "fovy")
	p_fovy := c.float(lua.tonumber(L, -1))
	lua.pop(L, 1)
	lua.getfield(L, idx, "projection")
	p_projection := cast(rl.CameraProjection)c.int(lua.tonumber(L, -1))
	lua.pop(L, 1)
	return rl.Camera3D {
		position = p_position,
		target = p_target,
		up = p_up,
		fovy = p_fovy,
		projection = p_projection,
	}
}

tolua_Camera2D :: proc "c" (L: ^lua.State, s: rl.Camera2D, idx: c.int = -99) {
	context = runtime.default_context()
	idx := idx
	if idx == -99 {
		lua.newtable(L)
		idx = -2
	}
	tolua_Vector2(L, s.offset)
	lua.setfield(L, idx, "offset")
	tolua_Vector2(L, s.target)
	lua.setfield(L, idx, "target")
	lua.pushnumber(L, lua.Number(s.rotation))
	lua.setfield(L, idx, "rotation")
	lua.pushnumber(L, lua.Number(s.zoom))
	lua.setfield(L, idx, "zoom")
}

fromlua_Camera2D :: proc "c" (L: ^lua.State, idx: c.int) -> rl.Camera2D {
	context = runtime.default_context()
	lua.getfield(L, idx, "offset")
	p_offset := fromlua_Vector2(L, -1)
	lua.pop(L, 1)
	lua.getfield(L, idx, "target")
	p_target := fromlua_Vector2(L, -1)
	lua.pop(L, 1)
	lua.getfield(L, idx, "rotation")
	p_rotation := c.float(lua.tonumber(L, -1))
	lua.pop(L, 1)
	lua.getfield(L, idx, "zoom")
	p_zoom := c.float(lua.tonumber(L, -1))
	lua.pop(L, 1)
	return rl.Camera2D{offset = p_offset, target = p_target, rotation = p_rotation, zoom = p_zoom}
}

tolua_Shader :: proc "c" (L: ^lua.State, s: rl.Shader, idx: c.int = -99) {
	context = runtime.default_context()
	idx := idx
	if idx == -99 {
		lua.newtable(L)
		idx = -2
	}
	lua.pushinteger(L, lua.Integer(s.id))
	lua.setfield(L, idx, "id")
	lua.pushlightuserdata(L, s.locs)
	lua.setfield(L, idx, "locs")
}

fromlua_Shader :: proc "c" (L: ^lua.State, idx: c.int) -> rl.Shader {
	context = runtime.default_context()
	lua.getfield(L, idx, "id")
	p_id := c.uint(lua.tonumber(L, -1))
	lua.pop(L, 1)
	lua.getfield(L, idx, "locs")
	p_locs := cast([^]c.int)lua.touserdata(L, -1)
	lua.pop(L, 1)
	return rl.Shader{id = p_id, locs = p_locs}
}

tolua_MaterialMap :: proc "c" (L: ^lua.State, s: rl.MaterialMap, idx: c.int = -99) {
	context = runtime.default_context()
	idx := idx
	if idx == -99 {
		lua.newtable(L)
		idx = -2
	}
	tolua_Texture2D(L, s.texture)
	lua.setfield(L, idx, "texture")
	tolua_Color(L, s.color)
	lua.setfield(L, idx, "color")
	lua.pushnumber(L, lua.Number(s.value))
	lua.setfield(L, idx, "value")
}

fromlua_MaterialMap :: proc "c" (L: ^lua.State, idx: c.int) -> rl.MaterialMap {
	context = runtime.default_context()
	lua.getfield(L, idx, "texture")
	p_texture := fromlua_Texture2D(L, -1)
	lua.pop(L, 1)
	lua.getfield(L, idx, "color")
	p_color := fromlua_Color(L, -1)
	lua.pop(L, 1)
	lua.getfield(L, idx, "value")
	p_value := c.float(lua.tonumber(L, -1))
	lua.pop(L, 1)
	return rl.MaterialMap{texture = p_texture, color = p_color, value = p_value}
}

tolua_Transform :: proc "c" (L: ^lua.State, s: rl.Transform, idx: c.int = -99) {
	context = runtime.default_context()
	idx := idx
	if idx == -99 {
		lua.newtable(L)
		idx = -2
	}
	tolua_Vector3(L, s.translation)
	lua.setfield(L, idx, "translation")
	tolua_Quaternion(L, s.rotation)
	lua.setfield(L, idx, "rotation")
	tolua_Vector3(L, s.scale)
	lua.setfield(L, idx, "scale")
}

fromlua_Transform :: proc "c" (L: ^lua.State, idx: c.int) -> rl.Transform {
	context = runtime.default_context()
	lua.getfield(L, idx, "translation")
	p_translation := fromlua_Vector3(L, -1)
	lua.pop(L, 1)
	lua.getfield(L, idx, "rotation")
	p_rotation := fromlua_Quaternion(L, -1)
	lua.pop(L, 1)
	lua.getfield(L, idx, "scale")
	p_scale := fromlua_Vector3(L, -1)
	lua.pop(L, 1)
	return rl.Transform{translation = p_translation, rotation = p_rotation, scale = p_scale}
}

tolua_Ray :: proc "c" (L: ^lua.State, s: rl.Ray, idx: c.int = -99) {
	context = runtime.default_context()
	idx := idx
	if idx == -99 {
		lua.newtable(L)
		idx = -2
	}
	tolua_Vector3(L, s.position)
	lua.setfield(L, idx, "position")
	tolua_Vector3(L, s.direction)
	lua.setfield(L, idx, "direction")
}

fromlua_Ray :: proc "c" (L: ^lua.State, idx: c.int) -> rl.Ray {
	context = runtime.default_context()
	lua.getfield(L, idx, "position")
	p_position := fromlua_Vector3(L, -1)
	lua.pop(L, 1)
	lua.getfield(L, idx, "direction")
	p_direction := fromlua_Vector3(L, -1)
	lua.pop(L, 1)
	return rl.Ray{position = p_position, direction = p_direction}
}

tolua_RayCollision :: proc "c" (L: ^lua.State, s: rl.RayCollision, idx: c.int = -99) {
	context = runtime.default_context()
	idx := idx
	if idx == -99 {
		lua.newtable(L)
		idx = -2
	}
	lua.pushboolean(L, b32(s.hit))
	lua.setfield(L, idx, "hit")
	lua.pushnumber(L, lua.Number(s.distance))
	lua.setfield(L, idx, "distance")
	tolua_Vector3(L, s.point)
	lua.setfield(L, idx, "point")
	tolua_Vector3(L, s.normal)
	lua.setfield(L, idx, "normal")
}

fromlua_RayCollision :: proc "c" (L: ^lua.State, idx: c.int) -> rl.RayCollision {
	context = runtime.default_context()
	lua.getfield(L, idx, "hit")
	p_hit := c.bool(lua.toboolean(L, -1))
	lua.pop(L, 1)
	lua.getfield(L, idx, "distance")
	p_distance := c.float(lua.tonumber(L, -1))
	lua.pop(L, 1)
	lua.getfield(L, idx, "point")
	p_point := fromlua_Vector3(L, -1)
	lua.pop(L, 1)
	lua.getfield(L, idx, "normal")
	p_normal := fromlua_Vector3(L, -1)
	lua.pop(L, 1)
	return rl.RayCollision{hit = p_hit, distance = p_distance, point = p_point, normal = p_normal}
}

tolua_BoundingBox :: proc "c" (L: ^lua.State, s: rl.BoundingBox, idx: c.int = -99) {
	context = runtime.default_context()
	idx := idx
	if idx == -99 {
		lua.newtable(L)
		idx = -2
	}
	tolua_Vector3(L, s.min)
	lua.setfield(L, idx, "min")
	tolua_Vector3(L, s.max)
	lua.setfield(L, idx, "max")
}

fromlua_BoundingBox :: proc "c" (L: ^lua.State, idx: c.int) -> rl.BoundingBox {
	context = runtime.default_context()
	lua.getfield(L, idx, "min")
	p_min := fromlua_Vector3(L, -1)
	lua.pop(L, 1)
	lua.getfield(L, idx, "max")
	p_max := fromlua_Vector3(L, -1)
	lua.pop(L, 1)
	return rl.BoundingBox{min = p_min, max = p_max}
}

tolua_Wave :: proc "c" (L: ^lua.State, s: rl.Wave, idx: c.int = -99) {
	context = runtime.default_context()
	idx := idx
	if idx == -99 {
		lua.newtable(L)
		idx = -2
	}
	lua.pushinteger(L, lua.Integer(s.frameCount))
	lua.setfield(L, idx, "frameCount")
	lua.pushinteger(L, lua.Integer(s.sampleRate))
	lua.setfield(L, idx, "sampleRate")
	lua.pushinteger(L, lua.Integer(s.sampleSize))
	lua.setfield(L, idx, "sampleSize")
	lua.pushinteger(L, lua.Integer(s.channels))
	lua.setfield(L, idx, "channels")
	lua.pushlightuserdata(L, s.data)
	lua.setfield(L, idx, "data")
}

fromlua_Wave :: proc "c" (L: ^lua.State, idx: c.int) -> rl.Wave {
	context = runtime.default_context()
	lua.getfield(L, idx, "frameCount")
	p_frameCount := c.uint(lua.tonumber(L, -1))
	lua.pop(L, 1)
	lua.getfield(L, idx, "sampleRate")
	p_sampleRate := c.uint(lua.tonumber(L, -1))
	lua.pop(L, 1)
	lua.getfield(L, idx, "sampleSize")
	p_sampleSize := c.uint(lua.tonumber(L, -1))
	lua.pop(L, 1)
	lua.getfield(L, idx, "channels")
	p_channels := c.uint(lua.tonumber(L, -1))
	lua.pop(L, 1)
	lua.getfield(L, idx, "data")
	p_data := lua.touserdata(L, -1)
	lua.pop(L, 1)
	return rl.Wave {
		frameCount = p_frameCount,
		sampleRate = p_sampleRate,
		sampleSize = p_sampleSize,
		channels = p_channels,
		data = p_data,
	}
}

tolua_AudioStream :: proc "c" (L: ^lua.State, s: rl.AudioStream, idx: c.int = -99) {
	context = runtime.default_context()
	idx := idx
	if idx == -99 {
		lua.newtable(L)
		idx = -2
	}
	lua.pushlightuserdata(L, s.buffer)
	lua.setfield(L, idx, "buffer")
	lua.pushlightuserdata(L, s.processor)
	lua.setfield(L, idx, "processor")
	lua.pushinteger(L, lua.Integer(s.sampleRate))
	lua.setfield(L, idx, "sampleRate")
	lua.pushinteger(L, lua.Integer(s.sampleSize))
	lua.setfield(L, idx, "sampleSize")
	lua.pushinteger(L, lua.Integer(s.channels))
	lua.setfield(L, idx, "channels")
}

fromlua_AudioStream :: proc "c" (L: ^lua.State, idx: c.int) -> rl.AudioStream {
	context = runtime.default_context()
	lua.getfield(L, idx, "buffer")
	p_buffer := lua.touserdata(L, -1)
	lua.pop(L, 1)
	lua.getfield(L, idx, "processor")
	p_processor := lua.touserdata(L, -1)
	lua.pop(L, 1)
	lua.getfield(L, idx, "sampleRate")
	p_sampleRate := c.uint(lua.tonumber(L, -1))
	lua.pop(L, 1)
	lua.getfield(L, idx, "sampleSize")
	p_sampleSize := c.uint(lua.tonumber(L, -1))
	lua.pop(L, 1)
	lua.getfield(L, idx, "channels")
	p_channels := c.uint(lua.tonumber(L, -1))
	lua.pop(L, 1)
	return rl.AudioStream {
		buffer = p_buffer,
		processor = p_processor,
		sampleRate = p_sampleRate,
		sampleSize = p_sampleSize,
		channels = p_channels,
	}
}

tolua_Sound :: proc "c" (L: ^lua.State, s: rl.Sound, idx: c.int = -99) {
	context = runtime.default_context()
	idx := idx
	if idx == -99 {
		lua.newtable(L)
		idx = -2
	}
	tolua_AudioStream(L, s.stream)
	lua.setfield(L, idx, "stream")
	lua.pushinteger(L, lua.Integer(s.frameCount))
	lua.setfield(L, idx, "frameCount")
}

fromlua_Sound :: proc "c" (L: ^lua.State, idx: c.int) -> rl.Sound {
	context = runtime.default_context()
	lua.getfield(L, idx, "stream")
	p_stream := fromlua_AudioStream(L, -1)
	lua.pop(L, 1)
	lua.getfield(L, idx, "frameCount")
	p_frameCount := c.uint(lua.tonumber(L, -1))
	lua.pop(L, 1)
	return rl.Sound{stream = p_stream, frameCount = p_frameCount}
}

tolua_Music :: proc "c" (L: ^lua.State, s: rl.Music, idx: c.int = -99) {
	context = runtime.default_context()
	idx := idx
	if idx == -99 {
		lua.newtable(L)
		idx = -2
	}
	tolua_AudioStream(L, s.stream)
	lua.setfield(L, idx, "stream")
	lua.pushinteger(L, lua.Integer(s.frameCount))
	lua.setfield(L, idx, "frameCount")
	lua.pushboolean(L, b32(s.looping))
	lua.setfield(L, idx, "looping")
	lua.pushinteger(L, lua.Integer(s.ctxType))
	lua.setfield(L, idx, "ctxType")
	lua.pushlightuserdata(L, s.ctxData)
	lua.setfield(L, idx, "ctxData")
}

fromlua_Music :: proc "c" (L: ^lua.State, idx: c.int) -> rl.Music {
	context = runtime.default_context()
	lua.getfield(L, idx, "stream")
	p_stream := fromlua_AudioStream(L, -1)
	lua.pop(L, 1)
	lua.getfield(L, idx, "frameCount")
	p_frameCount := c.uint(lua.tonumber(L, -1))
	lua.pop(L, 1)
	lua.getfield(L, idx, "looping")
	p_looping := c.bool(lua.toboolean(L, -1))
	lua.pop(L, 1)
	lua.getfield(L, idx, "ctxType")
	p_ctxType := c.int(lua.tonumber(L, -1))
	lua.pop(L, 1)
	lua.getfield(L, idx, "ctxData")
	p_ctxData := lua.touserdata(L, -1)
	lua.pop(L, 1)
	return rl.Music {
		stream = p_stream,
		frameCount = p_frameCount,
		looping = p_looping,
		ctxType = p_ctxType,
		ctxData = p_ctxData,
	}
}

tolua_FilePathList :: proc "c" (L: ^lua.State, s: rl.FilePathList, idx: c.int = -99) {
	context = runtime.default_context()
	idx := idx
	if idx == -99 {
		lua.newtable(L)
		idx = -2
	}
	lua.pushinteger(L, lua.Integer(s.count))
	lua.setfield(L, idx, "count")
	lua.pushlightuserdata(L, s.paths)
	lua.setfield(L, idx, "paths")
}

fromlua_FilePathList :: proc "c" (L: ^lua.State, idx: c.int) -> rl.FilePathList {
	context = runtime.default_context()
	lua.getfield(L, idx, "count")
	p_count := c.uint(lua.tonumber(L, -1))
	lua.pop(L, 1)
	lua.getfield(L, idx, "paths")
	p_paths := cast([^]cstring)lua.touserdata(L, -1)
	lua.pop(L, 1)
	return rl.FilePathList{count = p_count, paths = p_paths}
}

tolua_Quaternion :: proc "c" (L: ^lua.State, s: rl.Quaternion, idx: c.int = -99) {
	tolua_Vector4(L, transmute(rl.Vector4)s, idx)
}

fromlua_Quaternion :: proc "c" (L: ^lua.State, idx: c.int) -> rl.Quaternion {
	return transmute(rl.Quaternion)fromlua_Vector4(L, idx)
}

tolua_Texture2D :: proc "c" (L: ^lua.State, s: rl.Texture2D, idx: c.int = -99) {
	tolua_Texture(L, s, idx)
}

fromlua_Texture2D :: proc "c" (L: ^lua.State, idx: c.int) -> rl.Texture2D {
	return fromlua_Texture(L, idx)
}

tolua_TextureCubemap :: proc "c" (L: ^lua.State, s: rl.TextureCubemap, idx: c.int = -99) {
	tolua_Texture(L, s, idx)
}

fromlua_TextureCubemap :: proc "c" (L: ^lua.State, idx: c.int) -> rl.TextureCubemap {
	return fromlua_Texture(L, idx)
}

tolua_RenderTexture2D :: proc "c" (L: ^lua.State, s: rl.RenderTexture2D, idx: c.int = -99) {
	tolua_RenderTexture(L, s, idx)
}

fromlua_RenderTexture2D :: proc "c" (L: ^lua.State, idx: c.int) -> rl.RenderTexture2D {
	return fromlua_RenderTexture(L, idx)
}

tolua_Camera :: proc "c" (L: ^lua.State, s: rl.Camera, idx: c.int = -99) {
	tolua_Camera3D(L, s, idx)
}

fromlua_Camera :: proc "c" (L: ^lua.State, idx: c.int) -> rl.Camera {
	return fromlua_Camera3D(L, idx)
}

@(private)
lua_InitWindow :: proc "c" (L: ^lua.State) -> c.int {
	p_width := c.int(lua.tonumber(L, 1))
	p_height := c.int(lua.tonumber(L, 2))
	p_title := lua.tostring(L, 3)

	rl.InitWindow(p_width, p_height, p_title)

	return 0
}

@(private)
lua_CloseWindow :: proc "c" (L: ^lua.State) -> c.int {
	rl.CloseWindow()

	return 0
}

@(private)
lua_WindowShouldClose :: proc "c" (L: ^lua.State) -> c.int {
	result := rl.WindowShouldClose()

	lua.pushboolean(L, b32(result))
	return 1
}

@(private)
lua_IsWindowReady :: proc "c" (L: ^lua.State) -> c.int {
	result := rl.IsWindowReady()

	lua.pushboolean(L, b32(result))
	return 1
}

@(private)
lua_IsWindowFullscreen :: proc "c" (L: ^lua.State) -> c.int {
	result := rl.IsWindowFullscreen()

	lua.pushboolean(L, b32(result))
	return 1
}

@(private)
lua_IsWindowHidden :: proc "c" (L: ^lua.State) -> c.int {
	result := rl.IsWindowHidden()

	lua.pushboolean(L, b32(result))
	return 1
}

@(private)
lua_IsWindowMinimized :: proc "c" (L: ^lua.State) -> c.int {
	result := rl.IsWindowMinimized()

	lua.pushboolean(L, b32(result))
	return 1
}

@(private)
lua_IsWindowMaximized :: proc "c" (L: ^lua.State) -> c.int {
	result := rl.IsWindowMaximized()

	lua.pushboolean(L, b32(result))
	return 1
}

@(private)
lua_IsWindowFocused :: proc "c" (L: ^lua.State) -> c.int {
	result := rl.IsWindowFocused()

	lua.pushboolean(L, b32(result))
	return 1
}

@(private)
lua_IsWindowResized :: proc "c" (L: ^lua.State) -> c.int {
	result := rl.IsWindowResized()

	lua.pushboolean(L, b32(result))
	return 1
}

@(private)
lua_IsWindowState :: proc "c" (L: ^lua.State) -> c.int {
	p_flag := transmute(rl.ConfigFlags)c.uint(lua.tonumber(L, 1))

	result := rl.IsWindowState(p_flag)

	lua.pushboolean(L, b32(result))
	return 1
}

@(private)
lua_SetWindowState :: proc "c" (L: ^lua.State) -> c.int {
	p_flags := transmute(rl.ConfigFlags)c.uint(lua.tonumber(L, 1))

	rl.SetWindowState(p_flags)

	return 0
}

@(private)
lua_ClearWindowState :: proc "c" (L: ^lua.State) -> c.int {
	p_flags := transmute(rl.ConfigFlags)c.uint(lua.tonumber(L, 1))

	rl.ClearWindowState(p_flags)

	return 0
}

@(private)
lua_ToggleFullscreen :: proc "c" (L: ^lua.State) -> c.int {
	rl.ToggleFullscreen()

	return 0
}

@(private)
lua_ToggleBorderlessWindowed :: proc "c" (L: ^lua.State) -> c.int {
	rl.ToggleBorderlessWindowed()

	return 0
}

@(private)
lua_MaximizeWindow :: proc "c" (L: ^lua.State) -> c.int {
	rl.MaximizeWindow()

	return 0
}

@(private)
lua_MinimizeWindow :: proc "c" (L: ^lua.State) -> c.int {
	rl.MinimizeWindow()

	return 0
}

@(private)
lua_RestoreWindow :: proc "c" (L: ^lua.State) -> c.int {
	rl.RestoreWindow()

	return 0
}

@(private)
lua_SetWindowIcon :: proc "c" (L: ^lua.State) -> c.int {
	p_image := fromlua_Image(L, 1)

	rl.SetWindowIcon(p_image)

	return 0
}

@(private)
lua_SetWindowIcons :: proc "c" (L: ^lua.State) -> c.int {
	context = runtime.default_context()
	p_images, p_images_count := fromlua_array(L, 1, rl.Image, fromlua_Image)

	rl.SetWindowIcons(p_images, p_images_count)

	return 0
}

@(private)
lua_SetWindowTitle :: proc "c" (L: ^lua.State) -> c.int {
	p_title := lua.tostring(L, 1)

	rl.SetWindowTitle(p_title)

	return 0
}

@(private)
lua_SetWindowPosition :: proc "c" (L: ^lua.State) -> c.int {
	p_x := c.int(lua.tonumber(L, 1))
	p_y := c.int(lua.tonumber(L, 2))

	rl.SetWindowPosition(p_x, p_y)

	return 0
}

@(private)
lua_SetWindowMonitor :: proc "c" (L: ^lua.State) -> c.int {
	p_monitor := c.int(lua.tonumber(L, 1))

	rl.SetWindowMonitor(p_monitor)

	return 0
}

@(private)
lua_SetWindowMinSize :: proc "c" (L: ^lua.State) -> c.int {
	p_width := c.int(lua.tonumber(L, 1))
	p_height := c.int(lua.tonumber(L, 2))

	rl.SetWindowMinSize(p_width, p_height)

	return 0
}

@(private)
lua_SetWindowMaxSize :: proc "c" (L: ^lua.State) -> c.int {
	p_width := c.int(lua.tonumber(L, 1))
	p_height := c.int(lua.tonumber(L, 2))

	rl.SetWindowMaxSize(p_width, p_height)

	return 0
}

@(private)
lua_SetWindowSize :: proc "c" (L: ^lua.State) -> c.int {
	p_width := c.int(lua.tonumber(L, 1))
	p_height := c.int(lua.tonumber(L, 2))

	rl.SetWindowSize(p_width, p_height)

	return 0
}

@(private)
lua_SetWindowOpacity :: proc "c" (L: ^lua.State) -> c.int {
	p_opacity := c.float(lua.tonumber(L, 1))

	rl.SetWindowOpacity(p_opacity)

	return 0
}

@(private)
lua_SetWindowFocused :: proc "c" (L: ^lua.State) -> c.int {
	rl.SetWindowFocused()

	return 0
}

@(private)
lua_GetScreenWidth :: proc "c" (L: ^lua.State) -> c.int {
	result := rl.GetScreenWidth()

	lua.pushinteger(L, lua.Integer(result))
	return 1
}

@(private)
lua_GetScreenHeight :: proc "c" (L: ^lua.State) -> c.int {
	result := rl.GetScreenHeight()

	lua.pushinteger(L, lua.Integer(result))
	return 1
}

@(private)
lua_GetRenderWidth :: proc "c" (L: ^lua.State) -> c.int {
	result := rl.GetRenderWidth()

	lua.pushinteger(L, lua.Integer(result))
	return 1
}

@(private)
lua_GetRenderHeight :: proc "c" (L: ^lua.State) -> c.int {
	result := rl.GetRenderHeight()

	lua.pushinteger(L, lua.Integer(result))
	return 1
}

@(private)
lua_GetMonitorCount :: proc "c" (L: ^lua.State) -> c.int {
	result := rl.GetMonitorCount()

	lua.pushinteger(L, lua.Integer(result))
	return 1
}

@(private)
lua_GetCurrentMonitor :: proc "c" (L: ^lua.State) -> c.int {
	result := rl.GetCurrentMonitor()

	lua.pushinteger(L, lua.Integer(result))
	return 1
}

@(private)
lua_GetMonitorPosition :: proc "c" (L: ^lua.State) -> c.int {
	p_monitor := c.int(lua.tonumber(L, 1))

	result := rl.GetMonitorPosition(p_monitor)

	tolua_Vector2(L, result)
	return 1
}

@(private)
lua_GetMonitorWidth :: proc "c" (L: ^lua.State) -> c.int {
	p_monitor := c.int(lua.tonumber(L, 1))

	result := rl.GetMonitorWidth(p_monitor)

	lua.pushinteger(L, lua.Integer(result))
	return 1
}

@(private)
lua_GetMonitorHeight :: proc "c" (L: ^lua.State) -> c.int {
	p_monitor := c.int(lua.tonumber(L, 1))

	result := rl.GetMonitorHeight(p_monitor)

	lua.pushinteger(L, lua.Integer(result))
	return 1
}

@(private)
lua_GetMonitorPhysicalWidth :: proc "c" (L: ^lua.State) -> c.int {
	p_monitor := c.int(lua.tonumber(L, 1))

	result := rl.GetMonitorPhysicalWidth(p_monitor)

	lua.pushinteger(L, lua.Integer(result))
	return 1
}

@(private)
lua_GetMonitorPhysicalHeight :: proc "c" (L: ^lua.State) -> c.int {
	p_monitor := c.int(lua.tonumber(L, 1))

	result := rl.GetMonitorPhysicalHeight(p_monitor)

	lua.pushinteger(L, lua.Integer(result))
	return 1
}

@(private)
lua_GetMonitorRefreshRate :: proc "c" (L: ^lua.State) -> c.int {
	p_monitor := c.int(lua.tonumber(L, 1))

	result := rl.GetMonitorRefreshRate(p_monitor)

	lua.pushinteger(L, lua.Integer(result))
	return 1
}

@(private)
lua_GetWindowPosition :: proc "c" (L: ^lua.State) -> c.int {
	result := rl.GetWindowPosition()

	tolua_Vector2(L, result)
	return 1
}

@(private)
lua_GetWindowScaleDPI :: proc "c" (L: ^lua.State) -> c.int {
	result := rl.GetWindowScaleDPI()

	tolua_Vector2(L, result)
	return 1
}

@(private)
lua_GetMonitorName :: proc "c" (L: ^lua.State) -> c.int {
	p_monitor := c.int(lua.tonumber(L, 1))

	result := rl.GetMonitorName(p_monitor)

	lua.pushstring(L, result)
	return 1
}

@(private)
lua_SetClipboardText :: proc "c" (L: ^lua.State) -> c.int {
	p_text := lua.tostring(L, 1)

	rl.SetClipboardText(p_text)

	return 0
}

@(private)
lua_GetClipboardText :: proc "c" (L: ^lua.State) -> c.int {
	result := rl.GetClipboardText()

	lua.pushstring(L, result)
	return 1
}

@(private)
lua_GetClipboardImage :: proc "c" (L: ^lua.State) -> c.int {
	result := rl.GetClipboardImage()

	tolua_Image(L, result)
	return 1
}

@(private)
lua_EnableEventWaiting :: proc "c" (L: ^lua.State) -> c.int {
	rl.EnableEventWaiting()

	return 0
}

@(private)
lua_DisableEventWaiting :: proc "c" (L: ^lua.State) -> c.int {
	rl.DisableEventWaiting()

	return 0
}

@(private)
lua_ShowCursor :: proc "c" (L: ^lua.State) -> c.int {
	rl.ShowCursor()

	return 0
}

@(private)
lua_HideCursor :: proc "c" (L: ^lua.State) -> c.int {
	rl.HideCursor()

	return 0
}

@(private)
lua_IsCursorHidden :: proc "c" (L: ^lua.State) -> c.int {
	result := rl.IsCursorHidden()

	lua.pushboolean(L, b32(result))
	return 1
}

@(private)
lua_EnableCursor :: proc "c" (L: ^lua.State) -> c.int {
	rl.EnableCursor()

	return 0
}

@(private)
lua_DisableCursor :: proc "c" (L: ^lua.State) -> c.int {
	rl.DisableCursor()

	return 0
}

@(private)
lua_IsCursorOnScreen :: proc "c" (L: ^lua.State) -> c.int {
	result := rl.IsCursorOnScreen()

	lua.pushboolean(L, b32(result))
	return 1
}

@(private)
lua_ClearBackground :: proc "c" (L: ^lua.State) -> c.int {
	p_color := fromlua_Color(L, 1)

	rl.ClearBackground(p_color)

	return 0
}

@(private)
lua_BeginDrawing :: proc "c" (L: ^lua.State) -> c.int {
	rl.BeginDrawing()

	return 0
}

@(private)
lua_EndDrawing :: proc "c" (L: ^lua.State) -> c.int {
	rl.EndDrawing()

	return 0
}

@(private)
lua_BeginMode2D :: proc "c" (L: ^lua.State) -> c.int {
	p_camera := fromlua_Camera2D(L, 1)

	rl.BeginMode2D(p_camera)

	return 0
}

@(private)
lua_EndMode2D :: proc "c" (L: ^lua.State) -> c.int {
	rl.EndMode2D()

	return 0
}

@(private)
lua_BeginMode3D :: proc "c" (L: ^lua.State) -> c.int {
	p_camera := fromlua_Camera3D(L, 1)

	rl.BeginMode3D(p_camera)

	return 0
}

@(private)
lua_EndMode3D :: proc "c" (L: ^lua.State) -> c.int {
	rl.EndMode3D()

	return 0
}

@(private)
lua_BeginTextureMode :: proc "c" (L: ^lua.State) -> c.int {
	p_target := fromlua_RenderTexture2D(L, 1)

	rl.BeginTextureMode(p_target)

	return 0
}

@(private)
lua_EndTextureMode :: proc "c" (L: ^lua.State) -> c.int {
	rl.EndTextureMode()

	return 0
}

@(private)
lua_BeginShaderMode :: proc "c" (L: ^lua.State) -> c.int {
	p_shader := fromlua_Shader(L, 1)

	rl.BeginShaderMode(p_shader)

	return 0
}

@(private)
lua_EndShaderMode :: proc "c" (L: ^lua.State) -> c.int {
	rl.EndShaderMode()

	return 0
}

@(private)
lua_BeginBlendMode :: proc "c" (L: ^lua.State) -> c.int {
	p_mode := cast(rl.BlendMode)c.int(lua.tonumber(L, 1))

	rl.BeginBlendMode(p_mode)

	return 0
}

@(private)
lua_EndBlendMode :: proc "c" (L: ^lua.State) -> c.int {
	rl.EndBlendMode()

	return 0
}

@(private)
lua_BeginScissorMode :: proc "c" (L: ^lua.State) -> c.int {
	p_x := c.int(lua.tonumber(L, 1))
	p_y := c.int(lua.tonumber(L, 2))
	p_width := c.int(lua.tonumber(L, 3))
	p_height := c.int(lua.tonumber(L, 4))

	rl.BeginScissorMode(p_x, p_y, p_width, p_height)

	return 0
}

@(private)
lua_EndScissorMode :: proc "c" (L: ^lua.State) -> c.int {
	rl.EndScissorMode()

	return 0
}

@(private)
lua_EndVrStereoMode :: proc "c" (L: ^lua.State) -> c.int {
	rl.EndVrStereoMode()

	return 0
}

@(private)
lua_LoadShader :: proc "c" (L: ^lua.State) -> c.int {
	p_vsFileName := lua.tostring(L, 1)
	p_fsFileName := lua.tostring(L, 2)

	result := rl.LoadShader(p_vsFileName, p_fsFileName)

	tolua_Shader(L, result)
	return 1
}

@(private)
lua_LoadShaderFromMemory :: proc "c" (L: ^lua.State) -> c.int {
	p_vsCode := lua.tostring(L, 1)
	p_fsCode := lua.tostring(L, 2)

	result := rl.LoadShaderFromMemory(p_vsCode, p_fsCode)

	tolua_Shader(L, result)
	return 1
}

@(private)
lua_IsShaderValid :: proc "c" (L: ^lua.State) -> c.int {
	p_shader := fromlua_Shader(L, 1)

	result := rl.IsShaderValid(p_shader)

	lua.pushboolean(L, b32(result))
	return 1
}

@(private)
lua_GetShaderLocation :: proc "c" (L: ^lua.State) -> c.int {
	p_shader := fromlua_Shader(L, 1)
	p_uniformName := lua.tostring(L, 2)

	result := rl.GetShaderLocation(p_shader, p_uniformName)

	lua.pushinteger(L, lua.Integer(result))
	return 1
}

@(private)
lua_GetShaderLocationAttrib :: proc "c" (L: ^lua.State) -> c.int {
	p_shader := fromlua_Shader(L, 1)
	p_attribName := lua.tostring(L, 2)

	result := rl.GetShaderLocationAttrib(p_shader, p_attribName)

	lua.pushinteger(L, lua.Integer(result))
	return 1
}

@(private)
lua_SetShaderValue :: proc "c" (L: ^lua.State) -> c.int {
	p_shader := fromlua_Shader(L, 1)
	p_locIndex := c.int(lua.tonumber(L, 2))
	p_uniformType := cast(rl.ShaderUniformDataType)c.int(lua.tonumber(L, 4))
	p_value := fromlua_shader_value(L, 3, p_uniformType)

	rl.SetShaderValue(p_shader, p_locIndex, &p_value, p_uniformType)

	return 0
}

@(private)
lua_SetShaderValueV :: proc "c" (L: ^lua.State) -> c.int {
	p_shader := fromlua_Shader(L, 1)
	p_locIndex := c.int(lua.tonumber(L, 2))
	p_uniformType := cast(rl.ShaderUniformDataType)c.int(lua.tonumber(L, 4))
	p_value := fromlua_shader_value(L, 3, p_uniformType)
	p_count := c.int(lua.tonumber(L, 5))

	rl.SetShaderValueV(p_shader, p_locIndex, &p_value, p_uniformType, p_count)

	return 0
}

@(private)
lua_SetShaderValueMatrix :: proc "c" (L: ^lua.State) -> c.int {
	p_shader := fromlua_Shader(L, 1)
	p_locIndex := c.int(lua.tonumber(L, 2))
	p_mat := fromlua_Matrix(L, 3)

	rl.SetShaderValueMatrix(p_shader, p_locIndex, p_mat)

	return 0
}

@(private)
lua_SetShaderValueTexture :: proc "c" (L: ^lua.State) -> c.int {
	p_shader := fromlua_Shader(L, 1)
	p_locIndex := c.int(lua.tonumber(L, 2))
	p_texture := fromlua_Texture2D(L, 3)

	rl.SetShaderValueTexture(p_shader, p_locIndex, p_texture)

	return 0
}

@(private)
lua_UnloadShader :: proc "c" (L: ^lua.State) -> c.int {
	p_shader := fromlua_Shader(L, 1)

	rl.UnloadShader(p_shader)

	return 0
}

@(private)
lua_GetScreenToWorldRay :: proc "c" (L: ^lua.State) -> c.int {
	p_position := fromlua_Vector2(L, 1)
	p_camera := fromlua_Camera(L, 2)

	result := rl.GetScreenToWorldRay(p_position, p_camera)

	tolua_Ray(L, result)
	return 1
}

@(private)
lua_GetScreenToWorldRayEx :: proc "c" (L: ^lua.State) -> c.int {
	p_position := fromlua_Vector2(L, 1)
	p_camera := fromlua_Camera(L, 2)
	p_width := c.int(lua.tonumber(L, 3))
	p_height := c.int(lua.tonumber(L, 4))

	result := rl.GetScreenToWorldRayEx(p_position, p_camera, p_width, p_height)

	tolua_Ray(L, result)
	return 1
}

@(private)
lua_GetWorldToScreen :: proc "c" (L: ^lua.State) -> c.int {
	p_position := fromlua_Vector3(L, 1)
	p_camera := fromlua_Camera(L, 2)

	result := rl.GetWorldToScreen(p_position, p_camera)

	tolua_Vector2(L, result)
	return 1
}

@(private)
lua_GetWorldToScreenEx :: proc "c" (L: ^lua.State) -> c.int {
	p_position := fromlua_Vector3(L, 1)
	p_camera := fromlua_Camera(L, 2)
	p_width := c.int(lua.tonumber(L, 3))
	p_height := c.int(lua.tonumber(L, 4))

	result := rl.GetWorldToScreenEx(p_position, p_camera, p_width, p_height)

	tolua_Vector2(L, result)
	return 1
}

@(private)
lua_GetWorldToScreen2D :: proc "c" (L: ^lua.State) -> c.int {
	p_position := fromlua_Vector2(L, 1)
	p_camera := fromlua_Camera2D(L, 2)

	result := rl.GetWorldToScreen2D(p_position, p_camera)

	tolua_Vector2(L, result)
	return 1
}

@(private)
lua_GetScreenToWorld2D :: proc "c" (L: ^lua.State) -> c.int {
	p_position := fromlua_Vector2(L, 1)
	p_camera := fromlua_Camera2D(L, 2)

	result := rl.GetScreenToWorld2D(p_position, p_camera)

	tolua_Vector2(L, result)
	return 1
}

@(private)
lua_GetCameraMatrix :: proc "c" (L: ^lua.State) -> c.int {
	p_camera := fromlua_Camera(L, 1)

	result := rl.GetCameraMatrix(p_camera)

	tolua_Matrix(L, result)
	return 1
}

@(private)
lua_GetCameraMatrix2D :: proc "c" (L: ^lua.State) -> c.int {
	p_camera := fromlua_Camera2D(L, 1)

	result := rl.GetCameraMatrix2D(p_camera)

	tolua_Matrix(L, result)
	return 1
}

@(private)
lua_SetTargetFPS :: proc "c" (L: ^lua.State) -> c.int {
	p_fps := c.int(lua.tonumber(L, 1))

	rl.SetTargetFPS(p_fps)

	return 0
}

@(private)
lua_GetFrameTime :: proc "c" (L: ^lua.State) -> c.int {
	result := rl.GetFrameTime()

	lua.pushnumber(L, lua.Number(result))
	return 1
}

@(private)
lua_GetTime :: proc "c" (L: ^lua.State) -> c.int {
	result := rl.GetTime()

	lua.pushnumber(L, lua.Number(result))
	return 1
}

@(private)
lua_GetFPS :: proc "c" (L: ^lua.State) -> c.int {
	result := rl.GetFPS()

	lua.pushinteger(L, lua.Integer(result))
	return 1
}

@(private)
lua_SwapScreenBuffer :: proc "c" (L: ^lua.State) -> c.int {
	rl.SwapScreenBuffer()

	return 0
}

@(private)
lua_PollInputEvents :: proc "c" (L: ^lua.State) -> c.int {
	rl.PollInputEvents()

	return 0
}

@(private)
lua_WaitTime :: proc "c" (L: ^lua.State) -> c.int {
	p_seconds := c.double(lua.tonumber(L, 1))

	rl.WaitTime(p_seconds)

	return 0
}

@(private)
lua_SetRandomSeed :: proc "c" (L: ^lua.State) -> c.int {
	p_seed := c.uint(lua.tonumber(L, 1))

	rl.SetRandomSeed(p_seed)

	return 0
}

@(private)
lua_GetRandomValue :: proc "c" (L: ^lua.State) -> c.int {
	p_min := c.int(lua.tonumber(L, 1))
	p_max := c.int(lua.tonumber(L, 2))

	result := rl.GetRandomValue(p_min, p_max)

	lua.pushinteger(L, lua.Integer(result))
	return 1
}

@(private)
lua_TakeScreenshot :: proc "c" (L: ^lua.State) -> c.int {
	p_fileName := lua.tostring(L, 1)

	rl.TakeScreenshot(p_fileName)

	return 0
}

@(private)
lua_SetConfigFlags :: proc "c" (L: ^lua.State) -> c.int {
	p_flags := transmute(rl.ConfigFlags)c.uint(lua.tonumber(L, 1))

	rl.SetConfigFlags(p_flags)

	return 0
}

@(private)
lua_OpenURL :: proc "c" (L: ^lua.State) -> c.int {
	p_url := lua.tostring(L, 1)

	rl.OpenURL(p_url)

	return 0
}

@(private)
lua_SetTraceLogLevel :: proc "c" (L: ^lua.State) -> c.int {
	p_logLevel := cast(rl.TraceLogLevel)c.int(lua.tonumber(L, 1))

	rl.SetTraceLogLevel(p_logLevel)

	return 0
}

@(private)
lua_LoadFileText :: proc "c" (L: ^lua.State) -> c.int {
	p_fileName := lua.tostring(L, 1)

	result := rl.LoadFileText(p_fileName)

	lua.pushstring(L, cast(cstring)result)
	rl.UnloadFileText(result)
	return 1
}

@(private)
lua_SaveFileText :: proc "c" (L: ^lua.State) -> c.int {
	p_fileName := lua.tostring(L, 1)
	p_text := cast(^u8)lua.tostring(L, 2)

	result := rl.SaveFileText(p_fileName, p_text)

	lua.pushboolean(L, b32(result))
	return 1
}

@(private)
lua_FileRename :: proc "c" (L: ^lua.State) -> c.int {
	p_fileName := lua.tostring(L, 1)
	p_fileRename := lua.tostring(L, 2)

	result := rl.FileRename(p_fileName, p_fileRename)

	lua.pushinteger(L, lua.Integer(result))
	return 1
}

@(private)
lua_FileRemove :: proc "c" (L: ^lua.State) -> c.int {
	p_fileName := lua.tostring(L, 1)

	result := rl.FileRemove(p_fileName)

	lua.pushinteger(L, lua.Integer(result))
	return 1
}

@(private)
lua_FileCopy :: proc "c" (L: ^lua.State) -> c.int {
	p_srcPath := lua.tostring(L, 1)
	p_dstPath := lua.tostring(L, 2)

	result := rl.FileCopy(p_srcPath, p_dstPath)

	lua.pushinteger(L, lua.Integer(result))
	return 1
}

@(private)
lua_FileMove :: proc "c" (L: ^lua.State) -> c.int {
	p_srcPath := lua.tostring(L, 1)
	p_dstPath := lua.tostring(L, 2)

	result := rl.FileMove(p_srcPath, p_dstPath)

	lua.pushinteger(L, lua.Integer(result))
	return 1
}

@(private)
lua_FileTextReplace :: proc "c" (L: ^lua.State) -> c.int {
	p_fileName := lua.tostring(L, 1)
	p_search := lua.tostring(L, 2)
	p_replacement := lua.tostring(L, 3)

	result := rl.FileTextReplace(p_fileName, p_search, p_replacement)

	lua.pushinteger(L, lua.Integer(result))
	return 1
}

@(private)
lua_FileTextFindIndex :: proc "c" (L: ^lua.State) -> c.int {
	p_fileName := lua.tostring(L, 1)
	p_search := lua.tostring(L, 2)

	result := rl.FileTextFindIndex(p_fileName, p_search)

	lua.pushinteger(L, lua.Integer(result))
	return 1
}

@(private)
lua_FileExists :: proc "c" (L: ^lua.State) -> c.int {
	p_fileName := lua.tostring(L, 1)

	result := rl.FileExists(p_fileName)

	lua.pushboolean(L, b32(result))
	return 1
}

@(private)
lua_DirectoryExists :: proc "c" (L: ^lua.State) -> c.int {
	p_dirPath := lua.tostring(L, 1)

	result := rl.DirectoryExists(p_dirPath)

	lua.pushboolean(L, b32(result))
	return 1
}

@(private)
lua_IsFileExtension :: proc "c" (L: ^lua.State) -> c.int {
	p_fileName := lua.tostring(L, 1)
	p_ext := lua.tostring(L, 2)

	result := rl.IsFileExtension(p_fileName, p_ext)

	lua.pushboolean(L, b32(result))
	return 1
}

@(private)
lua_GetFileLength :: proc "c" (L: ^lua.State) -> c.int {
	p_fileName := lua.tostring(L, 1)

	result := rl.GetFileLength(p_fileName)

	lua.pushinteger(L, lua.Integer(result))
	return 1
}

@(private)
lua_GetFileModTime :: proc "c" (L: ^lua.State) -> c.int {
	p_fileName := lua.tostring(L, 1)

	result := rl.GetFileModTime(p_fileName)

	lua.pushinteger(L, lua.Integer(result))
	return 1
}

@(private)
lua_GetFileExtension :: proc "c" (L: ^lua.State) -> c.int {
	p_fileName := lua.tostring(L, 1)

	result := rl.GetFileExtension(p_fileName)

	lua.pushstring(L, result)
	return 1
}

@(private)
lua_GetFileName :: proc "c" (L: ^lua.State) -> c.int {
	p_filePath := lua.tostring(L, 1)

	result := rl.GetFileName(p_filePath)

	lua.pushstring(L, result)
	return 1
}

@(private)
lua_GetFileNameWithoutExt :: proc "c" (L: ^lua.State) -> c.int {
	p_filePath := lua.tostring(L, 1)

	result := rl.GetFileNameWithoutExt(p_filePath)

	lua.pushstring(L, result)
	return 1
}

@(private)
lua_GetDirectoryPath :: proc "c" (L: ^lua.State) -> c.int {
	p_filePath := lua.tostring(L, 1)

	result := rl.GetDirectoryPath(p_filePath)

	lua.pushstring(L, result)
	return 1
}

@(private)
lua_GetPrevDirectoryPath :: proc "c" (L: ^lua.State) -> c.int {
	p_dirPath := lua.tostring(L, 1)

	result := rl.GetPrevDirectoryPath(p_dirPath)

	lua.pushstring(L, result)
	return 1
}

@(private)
lua_GetWorkingDirectory :: proc "c" (L: ^lua.State) -> c.int {
	result := rl.GetWorkingDirectory()

	lua.pushstring(L, result)
	return 1
}

@(private)
lua_GetApplicationDirectory :: proc "c" (L: ^lua.State) -> c.int {
	result := rl.GetApplicationDirectory()

	lua.pushstring(L, result)
	return 1
}

@(private)
lua_MakeDirectory :: proc "c" (L: ^lua.State) -> c.int {
	p_dirPath := lua.tostring(L, 1)

	result := rl.MakeDirectory(p_dirPath)

	lua.pushinteger(L, lua.Integer(result))
	return 1
}

@(private)
lua_ChangeDirectory :: proc "c" (L: ^lua.State) -> c.int {
	p_dirPath := lua.tostring(L, 1)

	result := rl.ChangeDirectory(p_dirPath)

	lua.pushboolean(L, b32(result))
	return 1
}

@(private)
lua_IsPathFile :: proc "c" (L: ^lua.State) -> c.int {
	p_path := lua.tostring(L, 1)

	result := rl.IsPathFile(p_path)

	lua.pushboolean(L, b32(result))
	return 1
}

@(private)
lua_IsFileNameValid :: proc "c" (L: ^lua.State) -> c.int {
	p_fileName := lua.tostring(L, 1)

	result := rl.IsFileNameValid(p_fileName)

	lua.pushboolean(L, b32(result))
	return 1
}

@(private)
lua_LoadDirectoryFiles :: proc "c" (L: ^lua.State) -> c.int {
	p_dirPath := lua.tostring(L, 1)

	result := rl.LoadDirectoryFiles(p_dirPath)

	tolua_FilePathList(L, result)
	return 1
}

@(private)
lua_LoadDirectoryFilesEx :: proc "c" (L: ^lua.State) -> c.int {
	p_basePath := lua.tostring(L, 1)
	p_filter := lua.tostring(L, 2)
	p_scanSubdirs := c.bool(lua.toboolean(L, 3))

	result := rl.LoadDirectoryFilesEx(p_basePath, p_filter, p_scanSubdirs)

	tolua_FilePathList(L, result)
	return 1
}

@(private)
lua_UnloadDirectoryFiles :: proc "c" (L: ^lua.State) -> c.int {
	p_files := fromlua_FilePathList(L, 1)

	rl.UnloadDirectoryFiles(p_files)

	return 0
}

@(private)
lua_IsFileDropped :: proc "c" (L: ^lua.State) -> c.int {
	result := rl.IsFileDropped()

	lua.pushboolean(L, b32(result))
	return 1
}

@(private)
lua_LoadDroppedFiles :: proc "c" (L: ^lua.State) -> c.int {
	result := rl.LoadDroppedFiles()

	tolua_FilePathList(L, result)
	return 1
}

@(private)
lua_UnloadDroppedFiles :: proc "c" (L: ^lua.State) -> c.int {
	p_files := fromlua_FilePathList(L, 1)

	rl.UnloadDroppedFiles(p_files)

	return 0
}

@(private)
lua_SetAutomationEventBaseFrame :: proc "c" (L: ^lua.State) -> c.int {
	p_frame := c.int(lua.tonumber(L, 1))

	rl.SetAutomationEventBaseFrame(p_frame)

	return 0
}

@(private)
lua_StartAutomationEventRecording :: proc "c" (L: ^lua.State) -> c.int {
	rl.StartAutomationEventRecording()

	return 0
}

@(private)
lua_StopAutomationEventRecording :: proc "c" (L: ^lua.State) -> c.int {
	rl.StopAutomationEventRecording()

	return 0
}

@(private)
lua_IsKeyPressed :: proc "c" (L: ^lua.State) -> c.int {
	p_key := cast(rl.KeyboardKey)c.int(lua.tonumber(L, 1))

	result := rl.IsKeyPressed(p_key)

	lua.pushboolean(L, b32(result))
	return 1
}

@(private)
lua_IsKeyPressedRepeat :: proc "c" (L: ^lua.State) -> c.int {
	p_key := cast(rl.KeyboardKey)c.int(lua.tonumber(L, 1))

	result := rl.IsKeyPressedRepeat(p_key)

	lua.pushboolean(L, b32(result))
	return 1
}

@(private)
lua_IsKeyDown :: proc "c" (L: ^lua.State) -> c.int {
	p_key := cast(rl.KeyboardKey)c.int(lua.tonumber(L, 1))

	result := rl.IsKeyDown(p_key)

	lua.pushboolean(L, b32(result))
	return 1
}

@(private)
lua_IsKeyReleased :: proc "c" (L: ^lua.State) -> c.int {
	p_key := cast(rl.KeyboardKey)c.int(lua.tonumber(L, 1))

	result := rl.IsKeyReleased(p_key)

	lua.pushboolean(L, b32(result))
	return 1
}

@(private)
lua_IsKeyUp :: proc "c" (L: ^lua.State) -> c.int {
	p_key := cast(rl.KeyboardKey)c.int(lua.tonumber(L, 1))

	result := rl.IsKeyUp(p_key)

	lua.pushboolean(L, b32(result))
	return 1
}

@(private)
lua_GetKeyPressed :: proc "c" (L: ^lua.State) -> c.int {
	result := rl.GetKeyPressed()

	lua.pushinteger(L, lua.Integer(result))
	return 1
}

@(private)
lua_GetCharPressed :: proc "c" (L: ^lua.State) -> c.int {
	result := rl.GetCharPressed()

	lua.pushinteger(L, lua.Integer(result))
	return 1
}

@(private)
lua_GetKeyName :: proc "c" (L: ^lua.State) -> c.int {
	p_key := cast(rl.KeyboardKey)c.int(lua.tonumber(L, 1))

	result := rl.GetKeyName(p_key)

	lua.pushstring(L, result)
	return 1
}

@(private)
lua_SetExitKey :: proc "c" (L: ^lua.State) -> c.int {
	p_key := cast(rl.KeyboardKey)c.int(lua.tonumber(L, 1))

	rl.SetExitKey(p_key)

	return 0
}

@(private)
lua_IsGamepadAvailable :: proc "c" (L: ^lua.State) -> c.int {
	p_gamepad := c.int(lua.tonumber(L, 1))

	result := rl.IsGamepadAvailable(p_gamepad)

	lua.pushboolean(L, b32(result))
	return 1
}

@(private)
lua_GetGamepadName :: proc "c" (L: ^lua.State) -> c.int {
	p_gamepad := c.int(lua.tonumber(L, 1))

	result := rl.GetGamepadName(p_gamepad)

	lua.pushstring(L, result)
	return 1
}

@(private)
lua_IsGamepadButtonPressed :: proc "c" (L: ^lua.State) -> c.int {
	p_gamepad := c.int(lua.tonumber(L, 1))
	p_button := cast(rl.GamepadButton)c.int(lua.tonumber(L, 2))

	result := rl.IsGamepadButtonPressed(p_gamepad, p_button)

	lua.pushboolean(L, b32(result))
	return 1
}

@(private)
lua_IsGamepadButtonDown :: proc "c" (L: ^lua.State) -> c.int {
	p_gamepad := c.int(lua.tonumber(L, 1))
	p_button := cast(rl.GamepadButton)c.int(lua.tonumber(L, 2))

	result := rl.IsGamepadButtonDown(p_gamepad, p_button)

	lua.pushboolean(L, b32(result))
	return 1
}

@(private)
lua_IsGamepadButtonReleased :: proc "c" (L: ^lua.State) -> c.int {
	p_gamepad := c.int(lua.tonumber(L, 1))
	p_button := cast(rl.GamepadButton)c.int(lua.tonumber(L, 2))

	result := rl.IsGamepadButtonReleased(p_gamepad, p_button)

	lua.pushboolean(L, b32(result))
	return 1
}

@(private)
lua_IsGamepadButtonUp :: proc "c" (L: ^lua.State) -> c.int {
	p_gamepad := c.int(lua.tonumber(L, 1))
	p_button := cast(rl.GamepadButton)c.int(lua.tonumber(L, 2))

	result := rl.IsGamepadButtonUp(p_gamepad, p_button)

	lua.pushboolean(L, b32(result))
	return 1
}

@(private)
lua_GetGamepadButtonPressed :: proc "c" (L: ^lua.State) -> c.int {
	result := rl.GetGamepadButtonPressed()

	lua.pushinteger(L, lua.Integer(result))
	return 1
}

@(private)
lua_GetGamepadAxisCount :: proc "c" (L: ^lua.State) -> c.int {
	p_gamepad := c.int(lua.tonumber(L, 1))

	result := rl.GetGamepadAxisCount(p_gamepad)

	lua.pushinteger(L, lua.Integer(result))
	return 1
}

@(private)
lua_GetGamepadAxisMovement :: proc "c" (L: ^lua.State) -> c.int {
	p_gamepad := c.int(lua.tonumber(L, 1))
	p_axis := cast(rl.GamepadAxis)c.int(lua.tonumber(L, 2))

	result := rl.GetGamepadAxisMovement(p_gamepad, p_axis)

	lua.pushnumber(L, lua.Number(result))
	return 1
}

@(private)
lua_SetGamepadMappings :: proc "c" (L: ^lua.State) -> c.int {
	p_mappings := lua.tostring(L, 1)

	result := rl.SetGamepadMappings(p_mappings)

	lua.pushinteger(L, lua.Integer(result))
	return 1
}

@(private)
lua_SetGamepadVibration :: proc "c" (L: ^lua.State) -> c.int {
	p_gamepad := c.int(lua.tonumber(L, 1))
	p_leftMotor := c.float(lua.tonumber(L, 2))
	p_rightMotor := c.float(lua.tonumber(L, 3))
	p_duration := c.float(lua.tonumber(L, 4))

	rl.SetGamepadVibration(p_gamepad, p_leftMotor, p_rightMotor, p_duration)

	return 0
}

@(private)
lua_IsMouseButtonPressed :: proc "c" (L: ^lua.State) -> c.int {
	p_button := cast(rl.MouseButton)c.int(lua.tonumber(L, 1))

	result := rl.IsMouseButtonPressed(p_button)

	lua.pushboolean(L, b32(result))
	return 1
}

@(private)
lua_IsMouseButtonDown :: proc "c" (L: ^lua.State) -> c.int {
	p_button := cast(rl.MouseButton)c.int(lua.tonumber(L, 1))

	result := rl.IsMouseButtonDown(p_button)

	lua.pushboolean(L, b32(result))
	return 1
}

@(private)
lua_IsMouseButtonReleased :: proc "c" (L: ^lua.State) -> c.int {
	p_button := cast(rl.MouseButton)c.int(lua.tonumber(L, 1))

	result := rl.IsMouseButtonReleased(p_button)

	lua.pushboolean(L, b32(result))
	return 1
}

@(private)
lua_IsMouseButtonUp :: proc "c" (L: ^lua.State) -> c.int {
	p_button := cast(rl.MouseButton)c.int(lua.tonumber(L, 1))

	result := rl.IsMouseButtonUp(p_button)

	lua.pushboolean(L, b32(result))
	return 1
}

@(private)
lua_GetMouseX :: proc "c" (L: ^lua.State) -> c.int {
	result := rl.GetMouseX()

	lua.pushinteger(L, lua.Integer(result))
	return 1
}

@(private)
lua_GetMouseY :: proc "c" (L: ^lua.State) -> c.int {
	result := rl.GetMouseY()

	lua.pushinteger(L, lua.Integer(result))
	return 1
}

@(private)
lua_GetMousePosition :: proc "c" (L: ^lua.State) -> c.int {
	result := rl.GetMousePosition()

	tolua_Vector2(L, result)
	return 1
}

@(private)
lua_GetMouseDelta :: proc "c" (L: ^lua.State) -> c.int {
	result := rl.GetMouseDelta()

	tolua_Vector2(L, result)
	return 1
}

@(private)
lua_SetMousePosition :: proc "c" (L: ^lua.State) -> c.int {
	p_x := c.int(lua.tonumber(L, 1))
	p_y := c.int(lua.tonumber(L, 2))

	rl.SetMousePosition(p_x, p_y)

	return 0
}

@(private)
lua_SetMouseOffset :: proc "c" (L: ^lua.State) -> c.int {
	p_offsetX := c.int(lua.tonumber(L, 1))
	p_offsetY := c.int(lua.tonumber(L, 2))

	rl.SetMouseOffset(p_offsetX, p_offsetY)

	return 0
}

@(private)
lua_SetMouseScale :: proc "c" (L: ^lua.State) -> c.int {
	p_scaleX := c.float(lua.tonumber(L, 1))
	p_scaleY := c.float(lua.tonumber(L, 2))

	rl.SetMouseScale(p_scaleX, p_scaleY)

	return 0
}

@(private)
lua_GetMouseWheelMove :: proc "c" (L: ^lua.State) -> c.int {
	result := rl.GetMouseWheelMove()

	lua.pushnumber(L, lua.Number(result))
	return 1
}

@(private)
lua_GetMouseWheelMoveV :: proc "c" (L: ^lua.State) -> c.int {
	result := rl.GetMouseWheelMoveV()

	tolua_Vector2(L, result)
	return 1
}

@(private)
lua_SetMouseCursor :: proc "c" (L: ^lua.State) -> c.int {
	p_cursor := cast(rl.MouseCursor)c.int(lua.tonumber(L, 1))

	rl.SetMouseCursor(p_cursor)

	return 0
}

@(private)
lua_GetTouchX :: proc "c" (L: ^lua.State) -> c.int {
	result := rl.GetTouchX()

	lua.pushinteger(L, lua.Integer(result))
	return 1
}

@(private)
lua_GetTouchY :: proc "c" (L: ^lua.State) -> c.int {
	result := rl.GetTouchY()

	lua.pushinteger(L, lua.Integer(result))
	return 1
}

@(private)
lua_GetTouchPosition :: proc "c" (L: ^lua.State) -> c.int {
	p_index := c.int(lua.tonumber(L, 1))

	result := rl.GetTouchPosition(p_index)

	tolua_Vector2(L, result)
	return 1
}

@(private)
lua_GetTouchPointId :: proc "c" (L: ^lua.State) -> c.int {
	p_index := c.int(lua.tonumber(L, 1))

	result := rl.GetTouchPointId(p_index)

	lua.pushinteger(L, lua.Integer(result))
	return 1
}

@(private)
lua_GetTouchPointCount :: proc "c" (L: ^lua.State) -> c.int {
	result := rl.GetTouchPointCount()

	lua.pushinteger(L, lua.Integer(result))
	return 1
}

@(private)
lua_SetGesturesEnabled :: proc "c" (L: ^lua.State) -> c.int {
	p_flags := transmute(rl.Gestures)c.uint(lua.tonumber(L, 1))

	rl.SetGesturesEnabled(p_flags)

	return 0
}

@(private)
lua_IsGestureDetected :: proc "c" (L: ^lua.State) -> c.int {
	p_gesture := cast(rl.Gesture)c.uint(lua.tonumber(L, 1))

	result := rl.IsGestureDetected(p_gesture)

	lua.pushboolean(L, b32(result))
	return 1
}

@(private)
lua_GetGestureDetected :: proc "c" (L: ^lua.State) -> c.int {
	result := rl.GetGestureDetected()

	lua.pushinteger(L, lua.Integer(transmute(i32)result))
	return 1
}

@(private)
lua_GetGestureHoldDuration :: proc "c" (L: ^lua.State) -> c.int {
	result := rl.GetGestureHoldDuration()

	lua.pushnumber(L, lua.Number(result))
	return 1
}

@(private)
lua_GetGestureDragVector :: proc "c" (L: ^lua.State) -> c.int {
	result := rl.GetGestureDragVector()

	tolua_Vector2(L, result)
	return 1
}

@(private)
lua_GetGestureDragAngle :: proc "c" (L: ^lua.State) -> c.int {
	result := rl.GetGestureDragAngle()

	lua.pushnumber(L, lua.Number(result))
	return 1
}

@(private)
lua_GetGesturePinchVector :: proc "c" (L: ^lua.State) -> c.int {
	result := rl.GetGesturePinchVector()

	tolua_Vector2(L, result)
	return 1
}

@(private)
lua_GetGesturePinchAngle :: proc "c" (L: ^lua.State) -> c.int {
	result := rl.GetGesturePinchAngle()

	lua.pushnumber(L, lua.Number(result))
	return 1
}

@(private)
lua_UpdateCamera :: proc "c" (L: ^lua.State) -> c.int {
	p_camera := fromlua_Camera(L, 1)
	p_mode := cast(rl.CameraMode)c.int(lua.tonumber(L, 2))

	rl.UpdateCamera(&p_camera, p_mode)

	tolua_Camera(L, p_camera, 1)
	return 0
}

@(private)
lua_UpdateCameraPro :: proc "c" (L: ^lua.State) -> c.int {
	p_camera := fromlua_Camera(L, 1)
	p_movement := fromlua_Vector3(L, 2)
	p_rotation := fromlua_Vector3(L, 3)
	p_zoom := c.float(lua.tonumber(L, 4))

	rl.UpdateCameraPro(&p_camera, p_movement, p_rotation, p_zoom)

	tolua_Camera(L, p_camera, 1)
	return 0
}

@(private)
lua_SetShapesTexture :: proc "c" (L: ^lua.State) -> c.int {
	p_texture := fromlua_Texture2D(L, 1)
	p_source := fromlua_Rectangle(L, 2)

	rl.SetShapesTexture(p_texture, p_source)

	return 0
}

@(private)
lua_GetShapesTexture :: proc "c" (L: ^lua.State) -> c.int {
	result := rl.GetShapesTexture()

	tolua_Texture2D(L, result)
	return 1
}

@(private)
lua_GetShapesTextureRectangle :: proc "c" (L: ^lua.State) -> c.int {
	result := rl.GetShapesTextureRectangle()

	tolua_Rectangle(L, result)
	return 1
}

@(private)
lua_DrawPixel :: proc "c" (L: ^lua.State) -> c.int {
	p_posX := c.int(lua.tonumber(L, 1))
	p_posY := c.int(lua.tonumber(L, 2))
	p_color := fromlua_Color(L, 3)

	rl.DrawPixel(p_posX, p_posY, p_color)

	return 0
}

@(private)
lua_DrawPixelV :: proc "c" (L: ^lua.State) -> c.int {
	p_position := fromlua_Vector2(L, 1)
	p_color := fromlua_Color(L, 2)

	rl.DrawPixelV(p_position, p_color)

	return 0
}

@(private)
lua_DrawLine :: proc "c" (L: ^lua.State) -> c.int {
	p_startPosX := c.int(lua.tonumber(L, 1))
	p_startPosY := c.int(lua.tonumber(L, 2))
	p_endPosX := c.int(lua.tonumber(L, 3))
	p_endPosY := c.int(lua.tonumber(L, 4))
	p_color := fromlua_Color(L, 5)

	rl.DrawLine(p_startPosX, p_startPosY, p_endPosX, p_endPosY, p_color)

	return 0
}

@(private)
lua_DrawLineV :: proc "c" (L: ^lua.State) -> c.int {
	p_startPos := fromlua_Vector2(L, 1)
	p_endPos := fromlua_Vector2(L, 2)
	p_color := fromlua_Color(L, 3)

	rl.DrawLineV(p_startPos, p_endPos, p_color)

	return 0
}

@(private)
lua_DrawLineEx :: proc "c" (L: ^lua.State) -> c.int {
	p_startPos := fromlua_Vector2(L, 1)
	p_endPos := fromlua_Vector2(L, 2)
	p_thick := c.float(lua.tonumber(L, 3))
	p_color := fromlua_Color(L, 4)

	rl.DrawLineEx(p_startPos, p_endPos, p_thick, p_color)

	return 0
}

@(private)
lua_DrawLineStrip :: proc "c" (L: ^lua.State) -> c.int {
	context = runtime.default_context()
	p_points, p_points_count := fromlua_array(L, 1, rl.Vector2, fromlua_Vector2)
	p_color := fromlua_Color(L, 2)

	rl.DrawLineStrip(p_points, p_points_count, p_color)

	return 0
}

@(private)
lua_DrawLineBezier :: proc "c" (L: ^lua.State) -> c.int {
	p_startPos := fromlua_Vector2(L, 1)
	p_endPos := fromlua_Vector2(L, 2)
	p_thick := c.float(lua.tonumber(L, 3))
	p_color := fromlua_Color(L, 4)

	rl.DrawLineBezier(p_startPos, p_endPos, p_thick, p_color)

	return 0
}

@(private)
lua_DrawLineDashed :: proc "c" (L: ^lua.State) -> c.int {
	p_startPos := fromlua_Vector2(L, 1)
	p_endPos := fromlua_Vector2(L, 2)
	p_dashSize := c.int(lua.tonumber(L, 3))
	p_spaceSize := c.int(lua.tonumber(L, 4))
	p_color := fromlua_Color(L, 5)

	rl.DrawLineDashed(p_startPos, p_endPos, p_dashSize, p_spaceSize, p_color)

	return 0
}

@(private)
lua_DrawCircle :: proc "c" (L: ^lua.State) -> c.int {
	p_centerX := c.int(lua.tonumber(L, 1))
	p_centerY := c.int(lua.tonumber(L, 2))
	p_radius := c.float(lua.tonumber(L, 3))
	p_color := fromlua_Color(L, 4)

	rl.DrawCircle(p_centerX, p_centerY, p_radius, p_color)

	return 0
}

@(private)
lua_DrawCircleV :: proc "c" (L: ^lua.State) -> c.int {
	p_center := fromlua_Vector2(L, 1)
	p_radius := c.float(lua.tonumber(L, 2))
	p_color := fromlua_Color(L, 3)

	rl.DrawCircleV(p_center, p_radius, p_color)

	return 0
}

@(private)
lua_DrawCircleGradient :: proc "c" (L: ^lua.State) -> c.int {
	p_center := fromlua_Vector2(L, 1)
	p_radius := c.float(lua.tonumber(L, 2))
	p_inner := fromlua_Color(L, 3)
	p_outer := fromlua_Color(L, 4)

	rl.DrawCircleGradient(p_center, p_radius, p_inner, p_outer)

	return 0
}

@(private)
lua_DrawCircleSector :: proc "c" (L: ^lua.State) -> c.int {
	p_center := fromlua_Vector2(L, 1)
	p_radius := c.float(lua.tonumber(L, 2))
	p_startAngle := c.float(lua.tonumber(L, 3))
	p_endAngle := c.float(lua.tonumber(L, 4))
	p_segments := c.int(lua.tonumber(L, 5))
	p_color := fromlua_Color(L, 6)

	rl.DrawCircleSector(p_center, p_radius, p_startAngle, p_endAngle, p_segments, p_color)

	return 0
}

@(private)
lua_DrawCircleSectorLines :: proc "c" (L: ^lua.State) -> c.int {
	p_center := fromlua_Vector2(L, 1)
	p_radius := c.float(lua.tonumber(L, 2))
	p_startAngle := c.float(lua.tonumber(L, 3))
	p_endAngle := c.float(lua.tonumber(L, 4))
	p_segments := c.int(lua.tonumber(L, 5))
	p_color := fromlua_Color(L, 6)

	rl.DrawCircleSectorLines(p_center, p_radius, p_startAngle, p_endAngle, p_segments, p_color)

	return 0
}

@(private)
lua_DrawCircleLines :: proc "c" (L: ^lua.State) -> c.int {
	p_centerX := c.int(lua.tonumber(L, 1))
	p_centerY := c.int(lua.tonumber(L, 2))
	p_radius := c.float(lua.tonumber(L, 3))
	p_color := fromlua_Color(L, 4)

	rl.DrawCircleLines(p_centerX, p_centerY, p_radius, p_color)

	return 0
}

@(private)
lua_DrawCircleLinesV :: proc "c" (L: ^lua.State) -> c.int {
	p_center := fromlua_Vector2(L, 1)
	p_radius := c.float(lua.tonumber(L, 2))
	p_color := fromlua_Color(L, 3)

	rl.DrawCircleLinesV(p_center, p_radius, p_color)

	return 0
}

@(private)
lua_DrawEllipse :: proc "c" (L: ^lua.State) -> c.int {
	p_centerX := c.int(lua.tonumber(L, 1))
	p_centerY := c.int(lua.tonumber(L, 2))
	p_radiusH := c.float(lua.tonumber(L, 3))
	p_radiusV := c.float(lua.tonumber(L, 4))
	p_color := fromlua_Color(L, 5)

	rl.DrawEllipse(p_centerX, p_centerY, p_radiusH, p_radiusV, p_color)

	return 0
}

@(private)
lua_DrawEllipseV :: proc "c" (L: ^lua.State) -> c.int {
	p_center := fromlua_Vector2(L, 1)
	p_radiusH := c.float(lua.tonumber(L, 2))
	p_radiusV := c.float(lua.tonumber(L, 3))
	p_color := fromlua_Color(L, 4)

	rl.DrawEllipseV(p_center, p_radiusH, p_radiusV, p_color)

	return 0
}

@(private)
lua_DrawEllipseLines :: proc "c" (L: ^lua.State) -> c.int {
	p_centerX := c.int(lua.tonumber(L, 1))
	p_centerY := c.int(lua.tonumber(L, 2))
	p_radiusH := c.float(lua.tonumber(L, 3))
	p_radiusV := c.float(lua.tonumber(L, 4))
	p_color := fromlua_Color(L, 5)

	rl.DrawEllipseLines(p_centerX, p_centerY, p_radiusH, p_radiusV, p_color)

	return 0
}

@(private)
lua_DrawEllipseLinesV :: proc "c" (L: ^lua.State) -> c.int {
	p_center := fromlua_Vector2(L, 1)
	p_radiusH := c.float(lua.tonumber(L, 2))
	p_radiusV := c.float(lua.tonumber(L, 3))
	p_color := fromlua_Color(L, 4)

	rl.DrawEllipseLinesV(p_center, p_radiusH, p_radiusV, p_color)

	return 0
}

@(private)
lua_DrawRing :: proc "c" (L: ^lua.State) -> c.int {
	p_center := fromlua_Vector2(L, 1)
	p_innerRadius := c.float(lua.tonumber(L, 2))
	p_outerRadius := c.float(lua.tonumber(L, 3))
	p_startAngle := c.float(lua.tonumber(L, 4))
	p_endAngle := c.float(lua.tonumber(L, 5))
	p_segments := c.int(lua.tonumber(L, 6))
	p_color := fromlua_Color(L, 7)

	rl.DrawRing(
		p_center,
		p_innerRadius,
		p_outerRadius,
		p_startAngle,
		p_endAngle,
		p_segments,
		p_color,
	)

	return 0
}

@(private)
lua_DrawRingLines :: proc "c" (L: ^lua.State) -> c.int {
	p_center := fromlua_Vector2(L, 1)
	p_innerRadius := c.float(lua.tonumber(L, 2))
	p_outerRadius := c.float(lua.tonumber(L, 3))
	p_startAngle := c.float(lua.tonumber(L, 4))
	p_endAngle := c.float(lua.tonumber(L, 5))
	p_segments := c.int(lua.tonumber(L, 6))
	p_color := fromlua_Color(L, 7)

	rl.DrawRingLines(
		p_center,
		p_innerRadius,
		p_outerRadius,
		p_startAngle,
		p_endAngle,
		p_segments,
		p_color,
	)

	return 0
}

@(private)
lua_DrawRectangle :: proc "c" (L: ^lua.State) -> c.int {
	p_posX := c.int(lua.tonumber(L, 1))
	p_posY := c.int(lua.tonumber(L, 2))
	p_width := c.int(lua.tonumber(L, 3))
	p_height := c.int(lua.tonumber(L, 4))
	p_color := fromlua_Color(L, 5)

	rl.DrawRectangle(p_posX, p_posY, p_width, p_height, p_color)

	return 0
}

@(private)
lua_DrawRectangleV :: proc "c" (L: ^lua.State) -> c.int {
	p_position := fromlua_Vector2(L, 1)
	p_size := fromlua_Vector2(L, 2)
	p_color := fromlua_Color(L, 3)

	rl.DrawRectangleV(p_position, p_size, p_color)

	return 0
}

@(private)
lua_DrawRectangleRec :: proc "c" (L: ^lua.State) -> c.int {
	p_rec := fromlua_Rectangle(L, 1)
	p_color := fromlua_Color(L, 2)

	rl.DrawRectangleRec(p_rec, p_color)

	return 0
}

@(private)
lua_DrawRectanglePro :: proc "c" (L: ^lua.State) -> c.int {
	p_rec := fromlua_Rectangle(L, 1)
	p_origin := fromlua_Vector2(L, 2)
	p_rotation := c.float(lua.tonumber(L, 3))
	p_color := fromlua_Color(L, 4)

	rl.DrawRectanglePro(p_rec, p_origin, p_rotation, p_color)

	return 0
}

@(private)
lua_DrawRectangleGradientV :: proc "c" (L: ^lua.State) -> c.int {
	p_posX := c.int(lua.tonumber(L, 1))
	p_posY := c.int(lua.tonumber(L, 2))
	p_width := c.int(lua.tonumber(L, 3))
	p_height := c.int(lua.tonumber(L, 4))
	p_top := fromlua_Color(L, 5)
	p_bottom := fromlua_Color(L, 6)

	rl.DrawRectangleGradientV(p_posX, p_posY, p_width, p_height, p_top, p_bottom)

	return 0
}

@(private)
lua_DrawRectangleGradientH :: proc "c" (L: ^lua.State) -> c.int {
	p_posX := c.int(lua.tonumber(L, 1))
	p_posY := c.int(lua.tonumber(L, 2))
	p_width := c.int(lua.tonumber(L, 3))
	p_height := c.int(lua.tonumber(L, 4))
	p_left := fromlua_Color(L, 5)
	p_right := fromlua_Color(L, 6)

	rl.DrawRectangleGradientH(p_posX, p_posY, p_width, p_height, p_left, p_right)

	return 0
}

@(private)
lua_DrawRectangleGradientEx :: proc "c" (L: ^lua.State) -> c.int {
	p_rec := fromlua_Rectangle(L, 1)
	p_topLeft := fromlua_Color(L, 2)
	p_bottomLeft := fromlua_Color(L, 3)
	p_bottomRight := fromlua_Color(L, 4)
	p_topRight := fromlua_Color(L, 5)

	rl.DrawRectangleGradientEx(p_rec, p_topLeft, p_bottomLeft, p_bottomRight, p_topRight)

	return 0
}

@(private)
lua_DrawRectangleLines :: proc "c" (L: ^lua.State) -> c.int {
	p_posX := c.int(lua.tonumber(L, 1))
	p_posY := c.int(lua.tonumber(L, 2))
	p_width := c.int(lua.tonumber(L, 3))
	p_height := c.int(lua.tonumber(L, 4))
	p_color := fromlua_Color(L, 5)

	rl.DrawRectangleLines(p_posX, p_posY, p_width, p_height, p_color)

	return 0
}

@(private)
lua_DrawRectangleLinesEx :: proc "c" (L: ^lua.State) -> c.int {
	p_rec := fromlua_Rectangle(L, 1)
	p_lineThick := c.float(lua.tonumber(L, 2))
	p_color := fromlua_Color(L, 3)

	rl.DrawRectangleLinesEx(p_rec, p_lineThick, p_color)

	return 0
}

@(private)
lua_DrawRectangleRounded :: proc "c" (L: ^lua.State) -> c.int {
	p_rec := fromlua_Rectangle(L, 1)
	p_roundness := c.float(lua.tonumber(L, 2))
	p_segments := c.int(lua.tonumber(L, 3))
	p_color := fromlua_Color(L, 4)

	rl.DrawRectangleRounded(p_rec, p_roundness, p_segments, p_color)

	return 0
}

@(private)
lua_DrawRectangleRoundedLines :: proc "c" (L: ^lua.State) -> c.int {
	p_rec := fromlua_Rectangle(L, 1)
	p_roundness := c.float(lua.tonumber(L, 2))
	p_segments := c.int(lua.tonumber(L, 3))
	p_color := fromlua_Color(L, 4)

	rl.DrawRectangleRoundedLines(p_rec, p_roundness, p_segments, p_color)

	return 0
}

@(private)
lua_DrawRectangleRoundedLinesEx :: proc "c" (L: ^lua.State) -> c.int {
	p_rec := fromlua_Rectangle(L, 1)
	p_roundness := c.float(lua.tonumber(L, 2))
	p_segments := c.int(lua.tonumber(L, 3))
	p_lineThick := c.float(lua.tonumber(L, 4))
	p_color := fromlua_Color(L, 5)

	rl.DrawRectangleRoundedLinesEx(p_rec, p_roundness, p_segments, p_lineThick, p_color)

	return 0
}

@(private)
lua_DrawTriangle :: proc "c" (L: ^lua.State) -> c.int {
	p_v1 := fromlua_Vector2(L, 1)
	p_v2 := fromlua_Vector2(L, 2)
	p_v3 := fromlua_Vector2(L, 3)
	p_color := fromlua_Color(L, 4)

	rl.DrawTriangle(p_v1, p_v2, p_v3, p_color)

	return 0
}

@(private)
lua_DrawTriangleLines :: proc "c" (L: ^lua.State) -> c.int {
	p_v1 := fromlua_Vector2(L, 1)
	p_v2 := fromlua_Vector2(L, 2)
	p_v3 := fromlua_Vector2(L, 3)
	p_color := fromlua_Color(L, 4)

	rl.DrawTriangleLines(p_v1, p_v2, p_v3, p_color)

	return 0
}

@(private)
lua_DrawTriangleFan :: proc "c" (L: ^lua.State) -> c.int {
	context = runtime.default_context()
	p_points, p_points_count := fromlua_array(L, 1, rl.Vector2, fromlua_Vector2)
	p_color := fromlua_Color(L, 2)

	rl.DrawTriangleFan(p_points, p_points_count, p_color)

	return 0
}

@(private)
lua_DrawTriangleStrip :: proc "c" (L: ^lua.State) -> c.int {
	context = runtime.default_context()
	p_points, p_points_count := fromlua_array(L, 1, rl.Vector2, fromlua_Vector2)
	p_color := fromlua_Color(L, 2)

	rl.DrawTriangleStrip(p_points, p_points_count, p_color)

	return 0
}

@(private)
lua_DrawPoly :: proc "c" (L: ^lua.State) -> c.int {
	p_center := fromlua_Vector2(L, 1)
	p_sides := c.int(lua.tonumber(L, 2))
	p_radius := c.float(lua.tonumber(L, 3))
	p_rotation := c.float(lua.tonumber(L, 4))
	p_color := fromlua_Color(L, 5)

	rl.DrawPoly(p_center, p_sides, p_radius, p_rotation, p_color)

	return 0
}

@(private)
lua_DrawPolyLines :: proc "c" (L: ^lua.State) -> c.int {
	p_center := fromlua_Vector2(L, 1)
	p_sides := c.int(lua.tonumber(L, 2))
	p_radius := c.float(lua.tonumber(L, 3))
	p_rotation := c.float(lua.tonumber(L, 4))
	p_color := fromlua_Color(L, 5)

	rl.DrawPolyLines(p_center, p_sides, p_radius, p_rotation, p_color)

	return 0
}

@(private)
lua_DrawPolyLinesEx :: proc "c" (L: ^lua.State) -> c.int {
	p_center := fromlua_Vector2(L, 1)
	p_sides := c.int(lua.tonumber(L, 2))
	p_radius := c.float(lua.tonumber(L, 3))
	p_rotation := c.float(lua.tonumber(L, 4))
	p_lineThick := c.float(lua.tonumber(L, 5))
	p_color := fromlua_Color(L, 6)

	rl.DrawPolyLinesEx(p_center, p_sides, p_radius, p_rotation, p_lineThick, p_color)

	return 0
}

@(private)
lua_DrawSplineLinear :: proc "c" (L: ^lua.State) -> c.int {
	context = runtime.default_context()
	p_points, p_points_count := fromlua_array(L, 1, rl.Vector2, fromlua_Vector2)
	p_thick := c.float(lua.tonumber(L, 2))
	p_color := fromlua_Color(L, 3)

	rl.DrawSplineLinear(p_points, p_points_count, p_thick, p_color)

	return 0
}

@(private)
lua_DrawSplineBasis :: proc "c" (L: ^lua.State) -> c.int {
	context = runtime.default_context()
	p_points, p_points_count := fromlua_array(L, 1, rl.Vector2, fromlua_Vector2)
	p_thick := c.float(lua.tonumber(L, 2))
	p_color := fromlua_Color(L, 3)

	rl.DrawSplineBasis(p_points, p_points_count, p_thick, p_color)

	return 0
}

@(private)
lua_DrawSplineCatmullRom :: proc "c" (L: ^lua.State) -> c.int {
	context = runtime.default_context()
	p_points, p_points_count := fromlua_array(L, 1, rl.Vector2, fromlua_Vector2)
	p_thick := c.float(lua.tonumber(L, 2))
	p_color := fromlua_Color(L, 3)

	rl.DrawSplineCatmullRom(p_points, p_points_count, p_thick, p_color)

	return 0
}

@(private)
lua_DrawSplineBezierQuadratic :: proc "c" (L: ^lua.State) -> c.int {
	context = runtime.default_context()
	p_points, p_points_count := fromlua_array(L, 1, rl.Vector2, fromlua_Vector2)
	p_thick := c.float(lua.tonumber(L, 2))
	p_color := fromlua_Color(L, 3)

	rl.DrawSplineBezierQuadratic(p_points, p_points_count, p_thick, p_color)

	return 0
}

@(private)
lua_DrawSplineBezierCubic :: proc "c" (L: ^lua.State) -> c.int {
	context = runtime.default_context()
	p_points, p_points_count := fromlua_array(L, 1, rl.Vector2, fromlua_Vector2)
	p_thick := c.float(lua.tonumber(L, 2))
	p_color := fromlua_Color(L, 3)

	rl.DrawSplineBezierCubic(p_points, p_points_count, p_thick, p_color)

	return 0
}

@(private)
lua_DrawSplineSegmentLinear :: proc "c" (L: ^lua.State) -> c.int {
	p_p1 := fromlua_Vector2(L, 1)
	p_p2 := fromlua_Vector2(L, 2)
	p_thick := c.float(lua.tonumber(L, 3))
	p_color := fromlua_Color(L, 4)

	rl.DrawSplineSegmentLinear(p_p1, p_p2, p_thick, p_color)

	return 0
}

@(private)
lua_DrawSplineSegmentBasis :: proc "c" (L: ^lua.State) -> c.int {
	p_p1 := fromlua_Vector2(L, 1)
	p_p2 := fromlua_Vector2(L, 2)
	p_p3 := fromlua_Vector2(L, 3)
	p_p4 := fromlua_Vector2(L, 4)
	p_thick := c.float(lua.tonumber(L, 5))
	p_color := fromlua_Color(L, 6)

	rl.DrawSplineSegmentBasis(p_p1, p_p2, p_p3, p_p4, p_thick, p_color)

	return 0
}

@(private)
lua_DrawSplineSegmentCatmullRom :: proc "c" (L: ^lua.State) -> c.int {
	p_p1 := fromlua_Vector2(L, 1)
	p_p2 := fromlua_Vector2(L, 2)
	p_p3 := fromlua_Vector2(L, 3)
	p_p4 := fromlua_Vector2(L, 4)
	p_thick := c.float(lua.tonumber(L, 5))
	p_color := fromlua_Color(L, 6)

	rl.DrawSplineSegmentCatmullRom(p_p1, p_p2, p_p3, p_p4, p_thick, p_color)

	return 0
}

@(private)
lua_DrawSplineSegmentBezierQuadratic :: proc "c" (L: ^lua.State) -> c.int {
	p_p1 := fromlua_Vector2(L, 1)
	p_c2 := fromlua_Vector2(L, 2)
	p_p3 := fromlua_Vector2(L, 3)
	p_thick := c.float(lua.tonumber(L, 4))
	p_color := fromlua_Color(L, 5)

	rl.DrawSplineSegmentBezierQuadratic(p_p1, p_c2, p_p3, p_thick, p_color)

	return 0
}

@(private)
lua_DrawSplineSegmentBezierCubic :: proc "c" (L: ^lua.State) -> c.int {
	p_p1 := fromlua_Vector2(L, 1)
	p_c2 := fromlua_Vector2(L, 2)
	p_c3 := fromlua_Vector2(L, 3)
	p_p4 := fromlua_Vector2(L, 4)
	p_thick := c.float(lua.tonumber(L, 5))
	p_color := fromlua_Color(L, 6)

	rl.DrawSplineSegmentBezierCubic(p_p1, p_c2, p_c3, p_p4, p_thick, p_color)

	return 0
}

@(private)
lua_GetSplinePointLinear :: proc "c" (L: ^lua.State) -> c.int {
	p_startPos := fromlua_Vector2(L, 1)
	p_endPos := fromlua_Vector2(L, 2)
	p_t := c.float(lua.tonumber(L, 3))

	result := rl.GetSplinePointLinear(p_startPos, p_endPos, p_t)

	tolua_Vector2(L, result)
	return 1
}

@(private)
lua_GetSplinePointBasis :: proc "c" (L: ^lua.State) -> c.int {
	p_p1 := fromlua_Vector2(L, 1)
	p_p2 := fromlua_Vector2(L, 2)
	p_p3 := fromlua_Vector2(L, 3)
	p_p4 := fromlua_Vector2(L, 4)
	p_t := c.float(lua.tonumber(L, 5))

	result := rl.GetSplinePointBasis(p_p1, p_p2, p_p3, p_p4, p_t)

	tolua_Vector2(L, result)
	return 1
}

@(private)
lua_GetSplinePointCatmullRom :: proc "c" (L: ^lua.State) -> c.int {
	p_p1 := fromlua_Vector2(L, 1)
	p_p2 := fromlua_Vector2(L, 2)
	p_p3 := fromlua_Vector2(L, 3)
	p_p4 := fromlua_Vector2(L, 4)
	p_t := c.float(lua.tonumber(L, 5))

	result := rl.GetSplinePointCatmullRom(p_p1, p_p2, p_p3, p_p4, p_t)

	tolua_Vector2(L, result)
	return 1
}

@(private)
lua_GetSplinePointBezierQuad :: proc "c" (L: ^lua.State) -> c.int {
	p_p1 := fromlua_Vector2(L, 1)
	p_c2 := fromlua_Vector2(L, 2)
	p_p3 := fromlua_Vector2(L, 3)
	p_t := c.float(lua.tonumber(L, 4))

	result := rl.GetSplinePointBezierQuad(p_p1, p_c2, p_p3, p_t)

	tolua_Vector2(L, result)
	return 1
}

@(private)
lua_GetSplinePointBezierCubic :: proc "c" (L: ^lua.State) -> c.int {
	p_p1 := fromlua_Vector2(L, 1)
	p_c2 := fromlua_Vector2(L, 2)
	p_c3 := fromlua_Vector2(L, 3)
	p_p4 := fromlua_Vector2(L, 4)
	p_t := c.float(lua.tonumber(L, 5))

	result := rl.GetSplinePointBezierCubic(p_p1, p_c2, p_c3, p_p4, p_t)

	tolua_Vector2(L, result)
	return 1
}

@(private)
lua_CheckCollisionRecs :: proc "c" (L: ^lua.State) -> c.int {
	p_rec1 := fromlua_Rectangle(L, 1)
	p_rec2 := fromlua_Rectangle(L, 2)

	result := rl.CheckCollisionRecs(p_rec1, p_rec2)

	lua.pushboolean(L, b32(result))
	return 1
}

@(private)
lua_CheckCollisionCircles :: proc "c" (L: ^lua.State) -> c.int {
	p_center1 := fromlua_Vector2(L, 1)
	p_radius1 := c.float(lua.tonumber(L, 2))
	p_center2 := fromlua_Vector2(L, 3)
	p_radius2 := c.float(lua.tonumber(L, 4))

	result := rl.CheckCollisionCircles(p_center1, p_radius1, p_center2, p_radius2)

	lua.pushboolean(L, b32(result))
	return 1
}

@(private)
lua_CheckCollisionCircleRec :: proc "c" (L: ^lua.State) -> c.int {
	p_center := fromlua_Vector2(L, 1)
	p_radius := c.float(lua.tonumber(L, 2))
	p_rec := fromlua_Rectangle(L, 3)

	result := rl.CheckCollisionCircleRec(p_center, p_radius, p_rec)

	lua.pushboolean(L, b32(result))
	return 1
}

@(private)
lua_CheckCollisionCircleLine :: proc "c" (L: ^lua.State) -> c.int {
	p_center := fromlua_Vector2(L, 1)
	p_radius := c.float(lua.tonumber(L, 2))
	p_p1 := fromlua_Vector2(L, 3)
	p_p2 := fromlua_Vector2(L, 4)

	result := rl.CheckCollisionCircleLine(p_center, p_radius, p_p1, p_p2)

	lua.pushboolean(L, b32(result))
	return 1
}

@(private)
lua_CheckCollisionPointRec :: proc "c" (L: ^lua.State) -> c.int {
	p_point := fromlua_Vector2(L, 1)
	p_rec := fromlua_Rectangle(L, 2)

	result := rl.CheckCollisionPointRec(p_point, p_rec)

	lua.pushboolean(L, b32(result))
	return 1
}

@(private)
lua_CheckCollisionPointCircle :: proc "c" (L: ^lua.State) -> c.int {
	p_point := fromlua_Vector2(L, 1)
	p_center := fromlua_Vector2(L, 2)
	p_radius := c.float(lua.tonumber(L, 3))

	result := rl.CheckCollisionPointCircle(p_point, p_center, p_radius)

	lua.pushboolean(L, b32(result))
	return 1
}

@(private)
lua_CheckCollisionPointTriangle :: proc "c" (L: ^lua.State) -> c.int {
	p_point := fromlua_Vector2(L, 1)
	p_p1 := fromlua_Vector2(L, 2)
	p_p2 := fromlua_Vector2(L, 3)
	p_p3 := fromlua_Vector2(L, 4)

	result := rl.CheckCollisionPointTriangle(p_point, p_p1, p_p2, p_p3)

	lua.pushboolean(L, b32(result))
	return 1
}

@(private)
lua_CheckCollisionPointLine :: proc "c" (L: ^lua.State) -> c.int {
	p_point := fromlua_Vector2(L, 1)
	p_p1 := fromlua_Vector2(L, 2)
	p_p2 := fromlua_Vector2(L, 3)
	p_threshold := c.int(lua.tonumber(L, 4))

	result := rl.CheckCollisionPointLine(p_point, p_p1, p_p2, p_threshold)

	lua.pushboolean(L, b32(result))
	return 1
}

@(private)
lua_CheckCollisionPointPoly :: proc "c" (L: ^lua.State) -> c.int {
	p_point := fromlua_Vector2(L, 1)
	context = runtime.default_context()
	p_points, p_points_count := fromlua_array(L, 2, rl.Vector2, fromlua_Vector2)

	result := rl.CheckCollisionPointPoly(p_point, p_points, p_points_count)

	lua.pushboolean(L, b32(result))
	return 1
}

@(private)
lua_CheckCollisionLines :: proc "c" (L: ^lua.State) -> c.int {
	p_startPos1 := fromlua_Vector2(L, 1)
	p_endPos1 := fromlua_Vector2(L, 2)
	p_startPos2 := fromlua_Vector2(L, 3)
	p_endPos2 := fromlua_Vector2(L, 4)
	p_collisionPoint := fromlua_Vector2(L, 5)

	result := rl.CheckCollisionLines(
		p_startPos1,
		p_endPos1,
		p_startPos2,
		p_endPos2,
		&p_collisionPoint,
	)

	tolua_Vector2(L, p_collisionPoint, 5)
	lua.pushboolean(L, b32(result))
	return 1
}

@(private)
lua_GetCollisionRec :: proc "c" (L: ^lua.State) -> c.int {
	p_rec1 := fromlua_Rectangle(L, 1)
	p_rec2 := fromlua_Rectangle(L, 2)

	result := rl.GetCollisionRec(p_rec1, p_rec2)

	tolua_Rectangle(L, result)
	return 1
}

@(private)
lua_LoadImage :: proc "c" (L: ^lua.State) -> c.int {
	p_fileName := lua.tostring(L, 1)

	result := rl.LoadImage(p_fileName)

	tolua_Image(L, result)
	return 1
}

@(private)
lua_LoadImageFromTexture :: proc "c" (L: ^lua.State) -> c.int {
	p_texture := fromlua_Texture2D(L, 1)

	result := rl.LoadImageFromTexture(p_texture)

	tolua_Image(L, result)
	return 1
}

@(private)
lua_LoadImageFromScreen :: proc "c" (L: ^lua.State) -> c.int {
	result := rl.LoadImageFromScreen()

	tolua_Image(L, result)
	return 1
}

@(private)
lua_IsImageValid :: proc "c" (L: ^lua.State) -> c.int {
	p_image := fromlua_Image(L, 1)

	result := rl.IsImageValid(p_image)

	lua.pushboolean(L, b32(result))
	return 1
}

@(private)
lua_UnloadImage :: proc "c" (L: ^lua.State) -> c.int {
	p_image := fromlua_Image(L, 1)

	rl.UnloadImage(p_image)

	return 0
}

@(private)
lua_ExportImage :: proc "c" (L: ^lua.State) -> c.int {
	p_image := fromlua_Image(L, 1)
	p_fileName := lua.tostring(L, 2)

	result := rl.ExportImage(p_image, p_fileName)

	lua.pushboolean(L, b32(result))
	return 1
}

@(private)
lua_ExportImageAsCode :: proc "c" (L: ^lua.State) -> c.int {
	p_image := fromlua_Image(L, 1)
	p_fileName := lua.tostring(L, 2)

	result := rl.ExportImageAsCode(p_image, p_fileName)

	lua.pushboolean(L, b32(result))
	return 1
}

@(private)
lua_GenImageColor :: proc "c" (L: ^lua.State) -> c.int {
	p_width := c.int(lua.tonumber(L, 1))
	p_height := c.int(lua.tonumber(L, 2))
	p_color := fromlua_Color(L, 3)

	result := rl.GenImageColor(p_width, p_height, p_color)

	tolua_Image(L, result)
	return 1
}

@(private)
lua_GenImageGradientLinear :: proc "c" (L: ^lua.State) -> c.int {
	p_width := c.int(lua.tonumber(L, 1))
	p_height := c.int(lua.tonumber(L, 2))
	p_direction := c.int(lua.tonumber(L, 3))
	p_start := fromlua_Color(L, 4)
	p_end := fromlua_Color(L, 5)

	result := rl.GenImageGradientLinear(p_width, p_height, p_direction, p_start, p_end)

	tolua_Image(L, result)
	return 1
}

@(private)
lua_GenImageGradientRadial :: proc "c" (L: ^lua.State) -> c.int {
	p_width := c.int(lua.tonumber(L, 1))
	p_height := c.int(lua.tonumber(L, 2))
	p_density := c.float(lua.tonumber(L, 3))
	p_inner := fromlua_Color(L, 4)
	p_outer := fromlua_Color(L, 5)

	result := rl.GenImageGradientRadial(p_width, p_height, p_density, p_inner, p_outer)

	tolua_Image(L, result)
	return 1
}

@(private)
lua_GenImageGradientSquare :: proc "c" (L: ^lua.State) -> c.int {
	p_width := c.int(lua.tonumber(L, 1))
	p_height := c.int(lua.tonumber(L, 2))
	p_density := c.float(lua.tonumber(L, 3))
	p_inner := fromlua_Color(L, 4)
	p_outer := fromlua_Color(L, 5)

	result := rl.GenImageGradientSquare(p_width, p_height, p_density, p_inner, p_outer)

	tolua_Image(L, result)
	return 1
}

@(private)
lua_GenImageChecked :: proc "c" (L: ^lua.State) -> c.int {
	p_width := c.int(lua.tonumber(L, 1))
	p_height := c.int(lua.tonumber(L, 2))
	p_checksX := c.int(lua.tonumber(L, 3))
	p_checksY := c.int(lua.tonumber(L, 4))
	p_col1 := fromlua_Color(L, 5)
	p_col2 := fromlua_Color(L, 6)

	result := rl.GenImageChecked(p_width, p_height, p_checksX, p_checksY, p_col1, p_col2)

	tolua_Image(L, result)
	return 1
}

@(private)
lua_GenImageWhiteNoise :: proc "c" (L: ^lua.State) -> c.int {
	p_width := c.int(lua.tonumber(L, 1))
	p_height := c.int(lua.tonumber(L, 2))
	p_factor := c.float(lua.tonumber(L, 3))

	result := rl.GenImageWhiteNoise(p_width, p_height, p_factor)

	tolua_Image(L, result)
	return 1
}

@(private)
lua_GenImagePerlinNoise :: proc "c" (L: ^lua.State) -> c.int {
	p_width := c.int(lua.tonumber(L, 1))
	p_height := c.int(lua.tonumber(L, 2))
	p_offsetX := c.int(lua.tonumber(L, 3))
	p_offsetY := c.int(lua.tonumber(L, 4))
	p_scale := c.float(lua.tonumber(L, 5))

	result := rl.GenImagePerlinNoise(p_width, p_height, p_offsetX, p_offsetY, p_scale)

	tolua_Image(L, result)
	return 1
}

@(private)
lua_GenImageCellular :: proc "c" (L: ^lua.State) -> c.int {
	p_width := c.int(lua.tonumber(L, 1))
	p_height := c.int(lua.tonumber(L, 2))
	p_tileSize := c.int(lua.tonumber(L, 3))

	result := rl.GenImageCellular(p_width, p_height, p_tileSize)

	tolua_Image(L, result)
	return 1
}

@(private)
lua_GenImageText :: proc "c" (L: ^lua.State) -> c.int {
	p_width := c.int(lua.tonumber(L, 1))
	p_height := c.int(lua.tonumber(L, 2))
	p_text := lua.tostring(L, 3)

	result := rl.GenImageText(p_width, p_height, p_text)

	tolua_Image(L, result)
	return 1
}

@(private)
lua_ImageCopy :: proc "c" (L: ^lua.State) -> c.int {
	p_image := fromlua_Image(L, 1)

	result := rl.ImageCopy(p_image)

	tolua_Image(L, result)
	return 1
}

@(private)
lua_ImageFromImage :: proc "c" (L: ^lua.State) -> c.int {
	p_image := fromlua_Image(L, 1)
	p_rec := fromlua_Rectangle(L, 2)

	result := rl.ImageFromImage(p_image, p_rec)

	tolua_Image(L, result)
	return 1
}

@(private)
lua_ImageFromChannel :: proc "c" (L: ^lua.State) -> c.int {
	p_image := fromlua_Image(L, 1)
	p_selectedChannel := c.int(lua.tonumber(L, 2))

	result := rl.ImageFromChannel(p_image, p_selectedChannel)

	tolua_Image(L, result)
	return 1
}

@(private)
lua_ImageText :: proc "c" (L: ^lua.State) -> c.int {
	p_text := lua.tostring(L, 1)
	p_fontSize := c.int(lua.tonumber(L, 2))
	p_color := fromlua_Color(L, 3)

	result := rl.ImageText(p_text, p_fontSize, p_color)

	tolua_Image(L, result)
	return 1
}

@(private)
lua_ImageTextEx :: proc "c" (L: ^lua.State) -> c.int {
	p_font := fromlua_Font(L, 1)
	p_text := lua.tostring(L, 2)
	p_fontSize := c.float(lua.tonumber(L, 3))
	p_spacing := c.float(lua.tonumber(L, 4))
	p_tint := fromlua_Color(L, 5)

	result := rl.ImageTextEx(p_font, p_text, p_fontSize, p_spacing, p_tint)

	tolua_Image(L, result)
	return 1
}

@(private)
lua_ImageFormat :: proc "c" (L: ^lua.State) -> c.int {
	p_image := fromlua_Image(L, 1)
	p_newFormat := cast(rl.PixelFormat)c.int(lua.tonumber(L, 2))

	rl.ImageFormat(&p_image, p_newFormat)

	tolua_Image(L, p_image, 1)
	return 0
}

@(private)
lua_ImageToPOT :: proc "c" (L: ^lua.State) -> c.int {
	p_image := fromlua_Image(L, 1)
	p_fill := fromlua_Color(L, 2)

	rl.ImageToPOT(&p_image, p_fill)

	tolua_Image(L, p_image, 1)
	return 0
}

@(private)
lua_ImageCrop :: proc "c" (L: ^lua.State) -> c.int {
	p_image := fromlua_Image(L, 1)
	p_crop := fromlua_Rectangle(L, 2)

	rl.ImageCrop(&p_image, p_crop)

	tolua_Image(L, p_image, 1)
	return 0
}

@(private)
lua_ImageAlphaCrop :: proc "c" (L: ^lua.State) -> c.int {
	p_image := fromlua_Image(L, 1)
	p_threshold := c.float(lua.tonumber(L, 2))

	rl.ImageAlphaCrop(&p_image, p_threshold)

	tolua_Image(L, p_image, 1)
	return 0
}

@(private)
lua_ImageAlphaClear :: proc "c" (L: ^lua.State) -> c.int {
	p_image := fromlua_Image(L, 1)
	p_color := fromlua_Color(L, 2)
	p_threshold := c.float(lua.tonumber(L, 3))

	rl.ImageAlphaClear(&p_image, p_color, p_threshold)

	tolua_Image(L, p_image, 1)
	return 0
}

@(private)
lua_ImageAlphaMask :: proc "c" (L: ^lua.State) -> c.int {
	p_image := fromlua_Image(L, 1)
	p_alphaMask := fromlua_Image(L, 2)

	rl.ImageAlphaMask(&p_image, p_alphaMask)

	tolua_Image(L, p_image, 1)
	return 0
}

@(private)
lua_ImageAlphaPremultiply :: proc "c" (L: ^lua.State) -> c.int {
	p_image := fromlua_Image(L, 1)

	rl.ImageAlphaPremultiply(&p_image)

	tolua_Image(L, p_image, 1)
	return 0
}

@(private)
lua_ImageBlurGaussian :: proc "c" (L: ^lua.State) -> c.int {
	p_image := fromlua_Image(L, 1)
	p_blurSize := c.int(lua.tonumber(L, 2))

	rl.ImageBlurGaussian(&p_image, p_blurSize)

	tolua_Image(L, p_image, 1)
	return 0
}

@(private)
lua_ImageResize :: proc "c" (L: ^lua.State) -> c.int {
	p_image := fromlua_Image(L, 1)
	p_newWidth := c.int(lua.tonumber(L, 2))
	p_newHeight := c.int(lua.tonumber(L, 3))

	rl.ImageResize(&p_image, p_newWidth, p_newHeight)

	tolua_Image(L, p_image, 1)
	return 0
}

@(private)
lua_ImageResizeNN :: proc "c" (L: ^lua.State) -> c.int {
	p_image := fromlua_Image(L, 1)
	p_newWidth := c.int(lua.tonumber(L, 2))
	p_newHeight := c.int(lua.tonumber(L, 3))

	rl.ImageResizeNN(&p_image, p_newWidth, p_newHeight)

	tolua_Image(L, p_image, 1)
	return 0
}

@(private)
lua_ImageResizeCanvas :: proc "c" (L: ^lua.State) -> c.int {
	p_image := fromlua_Image(L, 1)
	p_newWidth := c.int(lua.tonumber(L, 2))
	p_newHeight := c.int(lua.tonumber(L, 3))
	p_offsetX := c.int(lua.tonumber(L, 4))
	p_offsetY := c.int(lua.tonumber(L, 5))
	p_fill := fromlua_Color(L, 6)

	rl.ImageResizeCanvas(&p_image, p_newWidth, p_newHeight, p_offsetX, p_offsetY, p_fill)

	tolua_Image(L, p_image, 1)
	return 0
}

@(private)
lua_ImageMipmaps :: proc "c" (L: ^lua.State) -> c.int {
	p_image := fromlua_Image(L, 1)

	rl.ImageMipmaps(&p_image)

	tolua_Image(L, p_image, 1)
	return 0
}

@(private)
lua_ImageDither :: proc "c" (L: ^lua.State) -> c.int {
	p_image := fromlua_Image(L, 1)
	p_rBpp := c.int(lua.tonumber(L, 2))
	p_gBpp := c.int(lua.tonumber(L, 3))
	p_bBpp := c.int(lua.tonumber(L, 4))
	p_aBpp := c.int(lua.tonumber(L, 5))

	rl.ImageDither(&p_image, p_rBpp, p_gBpp, p_bBpp, p_aBpp)

	tolua_Image(L, p_image, 1)
	return 0
}

@(private)
lua_ImageFlipVertical :: proc "c" (L: ^lua.State) -> c.int {
	p_image := fromlua_Image(L, 1)

	rl.ImageFlipVertical(&p_image)

	tolua_Image(L, p_image, 1)
	return 0
}

@(private)
lua_ImageFlipHorizontal :: proc "c" (L: ^lua.State) -> c.int {
	p_image := fromlua_Image(L, 1)

	rl.ImageFlipHorizontal(&p_image)

	tolua_Image(L, p_image, 1)
	return 0
}

@(private)
lua_ImageRotate :: proc "c" (L: ^lua.State) -> c.int {
	p_image := fromlua_Image(L, 1)
	p_degrees := c.int(lua.tonumber(L, 2))

	rl.ImageRotate(&p_image, p_degrees)

	tolua_Image(L, p_image, 1)
	return 0
}

@(private)
lua_ImageRotateCW :: proc "c" (L: ^lua.State) -> c.int {
	p_image := fromlua_Image(L, 1)

	rl.ImageRotateCW(&p_image)

	tolua_Image(L, p_image, 1)
	return 0
}

@(private)
lua_ImageRotateCCW :: proc "c" (L: ^lua.State) -> c.int {
	p_image := fromlua_Image(L, 1)

	rl.ImageRotateCCW(&p_image)

	tolua_Image(L, p_image, 1)
	return 0
}

@(private)
lua_ImageColorTint :: proc "c" (L: ^lua.State) -> c.int {
	p_image := fromlua_Image(L, 1)
	p_color := fromlua_Color(L, 2)

	rl.ImageColorTint(&p_image, p_color)

	tolua_Image(L, p_image, 1)
	return 0
}

@(private)
lua_ImageColorInvert :: proc "c" (L: ^lua.State) -> c.int {
	p_image := fromlua_Image(L, 1)

	rl.ImageColorInvert(&p_image)

	tolua_Image(L, p_image, 1)
	return 0
}

@(private)
lua_ImageColorGrayscale :: proc "c" (L: ^lua.State) -> c.int {
	p_image := fromlua_Image(L, 1)

	rl.ImageColorGrayscale(&p_image)

	tolua_Image(L, p_image, 1)
	return 0
}

@(private)
lua_ImageColorContrast :: proc "c" (L: ^lua.State) -> c.int {
	p_image := fromlua_Image(L, 1)
	p_contrast := c.float(lua.tonumber(L, 2))

	rl.ImageColorContrast(&p_image, p_contrast)

	tolua_Image(L, p_image, 1)
	return 0
}

@(private)
lua_ImageColorBrightness :: proc "c" (L: ^lua.State) -> c.int {
	p_image := fromlua_Image(L, 1)
	p_brightness := c.int(lua.tonumber(L, 2))

	rl.ImageColorBrightness(&p_image, p_brightness)

	tolua_Image(L, p_image, 1)
	return 0
}

@(private)
lua_ImageColorReplace :: proc "c" (L: ^lua.State) -> c.int {
	p_image := fromlua_Image(L, 1)
	p_color := fromlua_Color(L, 2)
	p_replace := fromlua_Color(L, 3)

	rl.ImageColorReplace(&p_image, p_color, p_replace)

	tolua_Image(L, p_image, 1)
	return 0
}

@(private)
lua_GetImageAlphaBorder :: proc "c" (L: ^lua.State) -> c.int {
	p_image := fromlua_Image(L, 1)
	p_threshold := c.float(lua.tonumber(L, 2))

	result := rl.GetImageAlphaBorder(p_image, p_threshold)

	tolua_Rectangle(L, result)
	return 1
}

@(private)
lua_GetImageColor :: proc "c" (L: ^lua.State) -> c.int {
	p_image := fromlua_Image(L, 1)
	p_x := c.int(lua.tonumber(L, 2))
	p_y := c.int(lua.tonumber(L, 3))

	result := rl.GetImageColor(p_image, p_x, p_y)

	tolua_Color(L, result)
	return 1
}

@(private)
lua_ImageClearBackground :: proc "c" (L: ^lua.State) -> c.int {
	p_dst := fromlua_Image(L, 1)
	p_color := fromlua_Color(L, 2)

	rl.ImageClearBackground(&p_dst, p_color)

	tolua_Image(L, p_dst, 1)
	return 0
}

@(private)
lua_ImageDrawPixel :: proc "c" (L: ^lua.State) -> c.int {
	p_dst := fromlua_Image(L, 1)
	p_posX := c.int(lua.tonumber(L, 2))
	p_posY := c.int(lua.tonumber(L, 3))
	p_color := fromlua_Color(L, 4)

	rl.ImageDrawPixel(&p_dst, p_posX, p_posY, p_color)

	tolua_Image(L, p_dst, 1)
	return 0
}

@(private)
lua_ImageDrawPixelV :: proc "c" (L: ^lua.State) -> c.int {
	p_dst := fromlua_Image(L, 1)
	p_position := fromlua_Vector2(L, 2)
	p_color := fromlua_Color(L, 3)

	rl.ImageDrawPixelV(&p_dst, p_position, p_color)

	tolua_Image(L, p_dst, 1)
	return 0
}

@(private)
lua_ImageDrawLine :: proc "c" (L: ^lua.State) -> c.int {
	p_dst := fromlua_Image(L, 1)
	p_startPosX := c.int(lua.tonumber(L, 2))
	p_startPosY := c.int(lua.tonumber(L, 3))
	p_endPosX := c.int(lua.tonumber(L, 4))
	p_endPosY := c.int(lua.tonumber(L, 5))
	p_color := fromlua_Color(L, 6)

	rl.ImageDrawLine(&p_dst, p_startPosX, p_startPosY, p_endPosX, p_endPosY, p_color)

	tolua_Image(L, p_dst, 1)
	return 0
}

@(private)
lua_ImageDrawLineV :: proc "c" (L: ^lua.State) -> c.int {
	p_dst := fromlua_Image(L, 1)
	p_start := fromlua_Vector2(L, 2)
	p_end := fromlua_Vector2(L, 3)
	p_color := fromlua_Color(L, 4)

	rl.ImageDrawLineV(&p_dst, p_start, p_end, p_color)

	tolua_Image(L, p_dst, 1)
	return 0
}

@(private)
lua_ImageDrawLineEx :: proc "c" (L: ^lua.State) -> c.int {
	p_dst := fromlua_Image(L, 1)
	p_start := fromlua_Vector2(L, 2)
	p_end := fromlua_Vector2(L, 3)
	p_thick := c.int(lua.tonumber(L, 4))
	p_color := fromlua_Color(L, 5)

	rl.ImageDrawLineEx(&p_dst, p_start, p_end, p_thick, p_color)

	tolua_Image(L, p_dst, 1)
	return 0
}

@(private)
lua_ImageDrawCircle :: proc "c" (L: ^lua.State) -> c.int {
	p_dst := fromlua_Image(L, 1)
	p_centerX := c.int(lua.tonumber(L, 2))
	p_centerY := c.int(lua.tonumber(L, 3))
	p_radius := c.int(lua.tonumber(L, 4))
	p_color := fromlua_Color(L, 5)

	rl.ImageDrawCircle(&p_dst, p_centerX, p_centerY, p_radius, p_color)

	tolua_Image(L, p_dst, 1)
	return 0
}

@(private)
lua_ImageDrawCircleV :: proc "c" (L: ^lua.State) -> c.int {
	p_dst := fromlua_Image(L, 1)
	p_center := fromlua_Vector2(L, 2)
	p_radius := c.int(lua.tonumber(L, 3))
	p_color := fromlua_Color(L, 4)

	rl.ImageDrawCircleV(&p_dst, p_center, p_radius, p_color)

	tolua_Image(L, p_dst, 1)
	return 0
}

@(private)
lua_ImageDrawCircleLines :: proc "c" (L: ^lua.State) -> c.int {
	p_dst := fromlua_Image(L, 1)
	p_centerX := c.int(lua.tonumber(L, 2))
	p_centerY := c.int(lua.tonumber(L, 3))
	p_radius := c.int(lua.tonumber(L, 4))
	p_color := fromlua_Color(L, 5)

	rl.ImageDrawCircleLines(&p_dst, p_centerX, p_centerY, p_radius, p_color)

	tolua_Image(L, p_dst, 1)
	return 0
}

@(private)
lua_ImageDrawCircleLinesV :: proc "c" (L: ^lua.State) -> c.int {
	p_dst := fromlua_Image(L, 1)
	p_center := fromlua_Vector2(L, 2)
	p_radius := c.int(lua.tonumber(L, 3))
	p_color := fromlua_Color(L, 4)

	rl.ImageDrawCircleLinesV(&p_dst, p_center, p_radius, p_color)

	tolua_Image(L, p_dst, 1)
	return 0
}

@(private)
lua_ImageDrawRectangle :: proc "c" (L: ^lua.State) -> c.int {
	p_dst := fromlua_Image(L, 1)
	p_posX := c.int(lua.tonumber(L, 2))
	p_posY := c.int(lua.tonumber(L, 3))
	p_width := c.int(lua.tonumber(L, 4))
	p_height := c.int(lua.tonumber(L, 5))
	p_color := fromlua_Color(L, 6)

	rl.ImageDrawRectangle(&p_dst, p_posX, p_posY, p_width, p_height, p_color)

	tolua_Image(L, p_dst, 1)
	return 0
}

@(private)
lua_ImageDrawRectangleV :: proc "c" (L: ^lua.State) -> c.int {
	p_dst := fromlua_Image(L, 1)
	p_position := fromlua_Vector2(L, 2)
	p_size := fromlua_Vector2(L, 3)
	p_color := fromlua_Color(L, 4)

	rl.ImageDrawRectangleV(&p_dst, p_position, p_size, p_color)

	tolua_Image(L, p_dst, 1)
	return 0
}

@(private)
lua_ImageDrawRectangleRec :: proc "c" (L: ^lua.State) -> c.int {
	p_dst := fromlua_Image(L, 1)
	p_rec := fromlua_Rectangle(L, 2)
	p_color := fromlua_Color(L, 3)

	rl.ImageDrawRectangleRec(&p_dst, p_rec, p_color)

	tolua_Image(L, p_dst, 1)
	return 0
}

@(private)
lua_ImageDrawRectangleLines :: proc "c" (L: ^lua.State) -> c.int {
	p_dst := fromlua_Image(L, 1)
	p_rec := fromlua_Rectangle(L, 2)
	p_thick := c.int(lua.tonumber(L, 3))
	p_color := fromlua_Color(L, 4)

	rl.ImageDrawRectangleLines(&p_dst, p_rec, p_thick, p_color)

	tolua_Image(L, p_dst, 1)
	return 0
}

@(private)
lua_ImageDrawTriangle :: proc "c" (L: ^lua.State) -> c.int {
	p_dst := fromlua_Image(L, 1)
	p_v1 := fromlua_Vector2(L, 2)
	p_v2 := fromlua_Vector2(L, 3)
	p_v3 := fromlua_Vector2(L, 4)
	p_color := fromlua_Color(L, 5)

	rl.ImageDrawTriangle(&p_dst, p_v1, p_v2, p_v3, p_color)

	tolua_Image(L, p_dst, 1)
	return 0
}

@(private)
lua_ImageDrawTriangleEx :: proc "c" (L: ^lua.State) -> c.int {
	p_dst := fromlua_Image(L, 1)
	p_v1 := fromlua_Vector2(L, 2)
	p_v2 := fromlua_Vector2(L, 3)
	p_v3 := fromlua_Vector2(L, 4)
	p_c1 := fromlua_Color(L, 5)
	p_c2 := fromlua_Color(L, 6)
	p_c3 := fromlua_Color(L, 7)

	rl.ImageDrawTriangleEx(&p_dst, p_v1, p_v2, p_v3, p_c1, p_c2, p_c3)

	tolua_Image(L, p_dst, 1)
	return 0
}

@(private)
lua_ImageDrawTriangleLines :: proc "c" (L: ^lua.State) -> c.int {
	p_dst := fromlua_Image(L, 1)
	p_v1 := fromlua_Vector2(L, 2)
	p_v2 := fromlua_Vector2(L, 3)
	p_v3 := fromlua_Vector2(L, 4)
	p_color := fromlua_Color(L, 5)

	rl.ImageDrawTriangleLines(&p_dst, p_v1, p_v2, p_v3, p_color)

	tolua_Image(L, p_dst, 1)
	return 0
}

@(private)
lua_ImageDrawTriangleFan :: proc "c" (L: ^lua.State) -> c.int {
	p_dst := fromlua_Image(L, 1)
	context = runtime.default_context()
	p_points, p_points_count := fromlua_array(L, 2, rl.Vector2, fromlua_Vector2)
	p_color := fromlua_Color(L, 3)

	rl.ImageDrawTriangleFan(&p_dst, p_points, p_points_count, p_color)

	tolua_Image(L, p_dst, 1)
	return 0
}

@(private)
lua_ImageDrawTriangleStrip :: proc "c" (L: ^lua.State) -> c.int {
	p_dst := fromlua_Image(L, 1)
	context = runtime.default_context()
	p_points, p_points_count := fromlua_array(L, 2, rl.Vector2, fromlua_Vector2)
	p_color := fromlua_Color(L, 3)

	rl.ImageDrawTriangleStrip(&p_dst, p_points, p_points_count, p_color)

	tolua_Image(L, p_dst, 1)
	return 0
}

@(private)
lua_ImageDraw :: proc "c" (L: ^lua.State) -> c.int {
	p_dst := fromlua_Image(L, 1)
	p_src := fromlua_Image(L, 2)
	p_srcRec := fromlua_Rectangle(L, 3)
	p_dstRec := fromlua_Rectangle(L, 4)
	p_tint := fromlua_Color(L, 5)

	rl.ImageDraw(&p_dst, p_src, p_srcRec, p_dstRec, p_tint)

	tolua_Image(L, p_dst, 1)
	return 0
}

@(private)
lua_ImageDrawText :: proc "c" (L: ^lua.State) -> c.int {
	p_dst := fromlua_Image(L, 1)
	p_text := lua.tostring(L, 2)
	p_posX := c.int(lua.tonumber(L, 3))
	p_posY := c.int(lua.tonumber(L, 4))
	p_fontSize := c.int(lua.tonumber(L, 5))
	p_color := fromlua_Color(L, 6)

	rl.ImageDrawText(&p_dst, p_text, p_posX, p_posY, p_fontSize, p_color)

	tolua_Image(L, p_dst, 1)
	return 0
}

@(private)
lua_ImageDrawTextEx :: proc "c" (L: ^lua.State) -> c.int {
	p_dst := fromlua_Image(L, 1)
	p_font := fromlua_Font(L, 2)
	p_text := lua.tostring(L, 3)
	p_position := fromlua_Vector2(L, 4)
	p_fontSize := c.float(lua.tonumber(L, 5))
	p_spacing := c.float(lua.tonumber(L, 6))
	p_tint := fromlua_Color(L, 7)

	rl.ImageDrawTextEx(&p_dst, p_font, p_text, p_position, p_fontSize, p_spacing, p_tint)

	tolua_Image(L, p_dst, 1)
	return 0
}

@(private)
lua_LoadTexture :: proc "c" (L: ^lua.State) -> c.int {
	p_fileName := lua.tostring(L, 1)

	result := rl.LoadTexture(p_fileName)

	tolua_Texture2D(L, result)
	return 1
}

@(private)
lua_LoadTextureFromImage :: proc "c" (L: ^lua.State) -> c.int {
	p_image := fromlua_Image(L, 1)

	result := rl.LoadTextureFromImage(p_image)

	tolua_Texture2D(L, result)
	return 1
}

@(private)
lua_LoadTextureCubemap :: proc "c" (L: ^lua.State) -> c.int {
	p_image := fromlua_Image(L, 1)
	p_layout := cast(rl.CubemapLayout)c.int(lua.tonumber(L, 2))

	result := rl.LoadTextureCubemap(p_image, p_layout)

	tolua_TextureCubemap(L, result)
	return 1
}

@(private)
lua_LoadRenderTexture :: proc "c" (L: ^lua.State) -> c.int {
	p_width := c.int(lua.tonumber(L, 1))
	p_height := c.int(lua.tonumber(L, 2))

	result := rl.LoadRenderTexture(p_width, p_height)

	tolua_RenderTexture2D(L, result)
	return 1
}

@(private)
lua_IsTextureValid :: proc "c" (L: ^lua.State) -> c.int {
	p_texture := fromlua_Texture2D(L, 1)

	result := rl.IsTextureValid(p_texture)

	lua.pushboolean(L, b32(result))
	return 1
}

@(private)
lua_UnloadTexture :: proc "c" (L: ^lua.State) -> c.int {
	p_texture := fromlua_Texture2D(L, 1)

	rl.UnloadTexture(p_texture)

	return 0
}

@(private)
lua_IsRenderTextureValid :: proc "c" (L: ^lua.State) -> c.int {
	p_target := fromlua_RenderTexture2D(L, 1)

	result := rl.IsRenderTextureValid(p_target)

	lua.pushboolean(L, b32(result))
	return 1
}

@(private)
lua_UnloadRenderTexture :: proc "c" (L: ^lua.State) -> c.int {
	p_target := fromlua_RenderTexture2D(L, 1)

	rl.UnloadRenderTexture(p_target)

	return 0
}

@(private)
lua_UpdateTexture :: proc "c" (L: ^lua.State) -> c.int {
	p_texture := fromlua_Texture2D(L, 1)
	p_pixels := lua.touserdata(L, 2)

	rl.UpdateTexture(p_texture, p_pixels)

	return 0
}

@(private)
lua_UpdateTextureRec :: proc "c" (L: ^lua.State) -> c.int {
	p_texture := fromlua_Texture2D(L, 1)
	p_rec := fromlua_Rectangle(L, 2)
	p_pixels := lua.touserdata(L, 3)

	rl.UpdateTextureRec(p_texture, p_rec, p_pixels)

	return 0
}

@(private)
lua_GenTextureMipmaps :: proc "c" (L: ^lua.State) -> c.int {
	p_texture := fromlua_Texture2D(L, 1)

	rl.GenTextureMipmaps(&p_texture)

	tolua_Texture2D(L, p_texture, 1)
	return 0
}

@(private)
lua_SetTextureFilter :: proc "c" (L: ^lua.State) -> c.int {
	p_texture := fromlua_Texture2D(L, 1)
	p_filter := cast(rl.TextureFilter)c.int(lua.tonumber(L, 2))

	rl.SetTextureFilter(p_texture, p_filter)

	return 0
}

@(private)
lua_SetTextureWrap :: proc "c" (L: ^lua.State) -> c.int {
	p_texture := fromlua_Texture2D(L, 1)
	p_wrap := cast(rl.TextureWrap)c.int(lua.tonumber(L, 2))

	rl.SetTextureWrap(p_texture, p_wrap)

	return 0
}

@(private)
lua_DrawTexture :: proc "c" (L: ^lua.State) -> c.int {
	p_texture := fromlua_Texture2D(L, 1)
	p_posX := c.int(lua.tonumber(L, 2))
	p_posY := c.int(lua.tonumber(L, 3))
	p_tint := fromlua_Color(L, 4)

	rl.DrawTexture(p_texture, p_posX, p_posY, p_tint)

	return 0
}

@(private)
lua_DrawTextureV :: proc "c" (L: ^lua.State) -> c.int {
	p_texture := fromlua_Texture2D(L, 1)
	p_position := fromlua_Vector2(L, 2)
	p_tint := fromlua_Color(L, 3)

	rl.DrawTextureV(p_texture, p_position, p_tint)

	return 0
}

@(private)
lua_DrawTextureEx :: proc "c" (L: ^lua.State) -> c.int {
	p_texture := fromlua_Texture2D(L, 1)
	p_position := fromlua_Vector2(L, 2)
	p_rotation := c.float(lua.tonumber(L, 3))
	p_scale := c.float(lua.tonumber(L, 4))
	p_tint := fromlua_Color(L, 5)

	rl.DrawTextureEx(p_texture, p_position, p_rotation, p_scale, p_tint)

	return 0
}

@(private)
lua_DrawTextureRec :: proc "c" (L: ^lua.State) -> c.int {
	p_texture := fromlua_Texture2D(L, 1)
	p_source := fromlua_Rectangle(L, 2)
	p_position := fromlua_Vector2(L, 3)
	p_tint := fromlua_Color(L, 4)

	rl.DrawTextureRec(p_texture, p_source, p_position, p_tint)

	return 0
}

@(private)
lua_DrawTexturePro :: proc "c" (L: ^lua.State) -> c.int {
	p_texture := fromlua_Texture2D(L, 1)
	p_source := fromlua_Rectangle(L, 2)
	p_dest := fromlua_Rectangle(L, 3)
	p_origin := fromlua_Vector2(L, 4)
	p_rotation := c.float(lua.tonumber(L, 5))
	p_tint := fromlua_Color(L, 6)

	rl.DrawTexturePro(p_texture, p_source, p_dest, p_origin, p_rotation, p_tint)

	return 0
}

@(private)
lua_DrawTextureNPatch :: proc "c" (L: ^lua.State) -> c.int {
	p_texture := fromlua_Texture2D(L, 1)
	p_nPatchInfo := fromlua_NPatchInfo(L, 2)
	p_dest := fromlua_Rectangle(L, 3)
	p_origin := fromlua_Vector2(L, 4)
	p_rotation := c.float(lua.tonumber(L, 5))
	p_tint := fromlua_Color(L, 6)

	rl.DrawTextureNPatch(p_texture, p_nPatchInfo, p_dest, p_origin, p_rotation, p_tint)

	return 0
}

@(private)
lua_Fade :: proc "c" (L: ^lua.State) -> c.int {
	p_color := fromlua_Color(L, 1)
	p_alpha := c.float(lua.tonumber(L, 2))

	result := rl.Fade(p_color, p_alpha)

	tolua_Color(L, result)
	return 1
}

@(private)
lua_ColorToInt :: proc "c" (L: ^lua.State) -> c.int {
	p_color := fromlua_Color(L, 1)

	result := rl.ColorToInt(p_color)

	lua.pushinteger(L, lua.Integer(result))
	return 1
}

@(private)
lua_ColorNormalize :: proc "c" (L: ^lua.State) -> c.int {
	p_color := fromlua_Color(L, 1)

	result := rl.ColorNormalize(p_color)

	tolua_Vector4(L, result)
	return 1
}

@(private)
lua_ColorFromNormalized :: proc "c" (L: ^lua.State) -> c.int {
	p_normalized := fromlua_Vector4(L, 1)

	result := rl.ColorFromNormalized(p_normalized)

	tolua_Color(L, result)
	return 1
}

@(private)
lua_ColorToHSV :: proc "c" (L: ^lua.State) -> c.int {
	p_color := fromlua_Color(L, 1)

	result := rl.ColorToHSV(p_color)

	tolua_Vector3(L, result)
	return 1
}

@(private)
lua_ColorFromHSV :: proc "c" (L: ^lua.State) -> c.int {
	p_hue := c.float(lua.tonumber(L, 1))
	p_saturation := c.float(lua.tonumber(L, 2))
	p_value := c.float(lua.tonumber(L, 3))

	result := rl.ColorFromHSV(p_hue, p_saturation, p_value)

	tolua_Color(L, result)
	return 1
}

@(private)
lua_ColorTint :: proc "c" (L: ^lua.State) -> c.int {
	p_color := fromlua_Color(L, 1)
	p_tint := fromlua_Color(L, 2)

	result := rl.ColorTint(p_color, p_tint)

	tolua_Color(L, result)
	return 1
}

@(private)
lua_ColorBrightness :: proc "c" (L: ^lua.State) -> c.int {
	p_color := fromlua_Color(L, 1)
	p_factor := c.float(lua.tonumber(L, 2))

	result := rl.ColorBrightness(p_color, p_factor)

	tolua_Color(L, result)
	return 1
}

@(private)
lua_ColorContrast :: proc "c" (L: ^lua.State) -> c.int {
	p_color := fromlua_Color(L, 1)
	p_contrast := c.float(lua.tonumber(L, 2))

	result := rl.ColorContrast(p_color, p_contrast)

	tolua_Color(L, result)
	return 1
}

@(private)
lua_ColorAlpha :: proc "c" (L: ^lua.State) -> c.int {
	p_color := fromlua_Color(L, 1)
	p_alpha := c.float(lua.tonumber(L, 2))

	result := rl.ColorAlpha(p_color, p_alpha)

	tolua_Color(L, result)
	return 1
}

@(private)
lua_ColorAlphaBlend :: proc "c" (L: ^lua.State) -> c.int {
	p_dst := fromlua_Color(L, 1)
	p_src := fromlua_Color(L, 2)
	p_tint := fromlua_Color(L, 3)

	result := rl.ColorAlphaBlend(p_dst, p_src, p_tint)

	tolua_Color(L, result)
	return 1
}

@(private)
lua_ColorLerp :: proc "c" (L: ^lua.State) -> c.int {
	p_color1 := fromlua_Color(L, 1)
	p_color2 := fromlua_Color(L, 2)
	p_factor := c.float(lua.tonumber(L, 3))

	result := rl.ColorLerp(p_color1, p_color2, p_factor)

	tolua_Color(L, result)
	return 1
}

@(private)
lua_GetColor :: proc "c" (L: ^lua.State) -> c.int {
	p_hexValue := c.uint(lua.tonumber(L, 1))

	result := rl.GetColor(p_hexValue)

	tolua_Color(L, result)
	return 1
}

@(private)
lua_GetPixelDataSize :: proc "c" (L: ^lua.State) -> c.int {
	p_width := c.int(lua.tonumber(L, 1))
	p_height := c.int(lua.tonumber(L, 2))
	p_format := cast(rl.PixelFormat)c.int(lua.tonumber(L, 3))

	result := rl.GetPixelDataSize(p_width, p_height, p_format)

	lua.pushinteger(L, lua.Integer(result))
	return 1
}

@(private)
lua_GetFontDefault :: proc "c" (L: ^lua.State) -> c.int {
	result := rl.GetFontDefault()

	tolua_Font(L, result)
	return 1
}

@(private)
lua_LoadFont :: proc "c" (L: ^lua.State) -> c.int {
	p_fileName := lua.tostring(L, 1)

	result := rl.LoadFont(p_fileName)

	tolua_Font(L, result)
	return 1
}

@(private)
lua_LoadFontFromImage :: proc "c" (L: ^lua.State) -> c.int {
	p_image := fromlua_Image(L, 1)
	p_key := fromlua_Color(L, 2)
	p_firstChar := cast(rune)c.int(lua.tonumber(L, 3))

	result := rl.LoadFontFromImage(p_image, p_key, p_firstChar)

	tolua_Font(L, result)
	return 1
}

@(private)
lua_IsFontValid :: proc "c" (L: ^lua.State) -> c.int {
	p_font := fromlua_Font(L, 1)

	result := rl.IsFontValid(p_font)

	lua.pushboolean(L, b32(result))
	return 1
}

@(private)
lua_UnloadFontData :: proc "c" (L: ^lua.State) -> c.int {
	context = runtime.default_context()
	p_glyphs, p_glyphs_count := fromlua_array(L, 1, rl.GlyphInfo, fromlua_GlyphInfo)

	rl.UnloadFontData(p_glyphs, p_glyphs_count)

	return 0
}

@(private)
lua_UnloadFont :: proc "c" (L: ^lua.State) -> c.int {
	p_font := fromlua_Font(L, 1)

	rl.UnloadFont(p_font)

	return 0
}

@(private)
lua_ExportFontAsCode :: proc "c" (L: ^lua.State) -> c.int {
	p_font := fromlua_Font(L, 1)
	p_fileName := lua.tostring(L, 2)

	result := rl.ExportFontAsCode(p_font, p_fileName)

	lua.pushboolean(L, b32(result))
	return 1
}

@(private)
lua_DrawFPS :: proc "c" (L: ^lua.State) -> c.int {
	p_posX := c.int(lua.tonumber(L, 1))
	p_posY := c.int(lua.tonumber(L, 2))

	rl.DrawFPS(p_posX, p_posY)

	return 0
}

@(private)
lua_DrawText :: proc "c" (L: ^lua.State) -> c.int {
	p_text := lua.tostring(L, 1)
	p_posX := c.int(lua.tonumber(L, 2))
	p_posY := c.int(lua.tonumber(L, 3))
	p_fontSize := c.int(lua.tonumber(L, 4))
	p_color := fromlua_Color(L, 5)

	rl.DrawText(p_text, p_posX, p_posY, p_fontSize, p_color)

	return 0
}

@(private)
lua_DrawTextEx :: proc "c" (L: ^lua.State) -> c.int {
	p_font := fromlua_Font(L, 1)
	p_text := lua.tostring(L, 2)
	p_position := fromlua_Vector2(L, 3)
	p_fontSize := c.float(lua.tonumber(L, 4))
	p_spacing := c.float(lua.tonumber(L, 5))
	p_tint := fromlua_Color(L, 6)

	rl.DrawTextEx(p_font, p_text, p_position, p_fontSize, p_spacing, p_tint)

	return 0
}

@(private)
lua_DrawTextPro :: proc "c" (L: ^lua.State) -> c.int {
	p_font := fromlua_Font(L, 1)
	p_text := lua.tostring(L, 2)
	p_position := fromlua_Vector2(L, 3)
	p_origin := fromlua_Vector2(L, 4)
	p_rotation := c.float(lua.tonumber(L, 5))
	p_fontSize := c.float(lua.tonumber(L, 6))
	p_spacing := c.float(lua.tonumber(L, 7))
	p_tint := fromlua_Color(L, 8)

	rl.DrawTextPro(p_font, p_text, p_position, p_origin, p_rotation, p_fontSize, p_spacing, p_tint)

	return 0
}

@(private)
lua_DrawTextCodepoint :: proc "c" (L: ^lua.State) -> c.int {
	p_font := fromlua_Font(L, 1)
	p_codepoint := cast(rune)c.int(lua.tonumber(L, 2))
	p_position := fromlua_Vector2(L, 3)
	p_fontSize := c.float(lua.tonumber(L, 4))
	p_tint := fromlua_Color(L, 5)

	rl.DrawTextCodepoint(p_font, p_codepoint, p_position, p_fontSize, p_tint)

	return 0
}

@(private)
lua_SetTextLineSpacing :: proc "c" (L: ^lua.State) -> c.int {
	p_spacing := c.int(lua.tonumber(L, 1))

	rl.SetTextLineSpacing(p_spacing)

	return 0
}

@(private)
lua_MeasureText :: proc "c" (L: ^lua.State) -> c.int {
	p_text := lua.tostring(L, 1)
	p_fontSize := c.int(lua.tonumber(L, 2))

	result := rl.MeasureText(p_text, p_fontSize)

	lua.pushinteger(L, lua.Integer(result))
	return 1
}

@(private)
lua_MeasureTextEx :: proc "c" (L: ^lua.State) -> c.int {
	p_font := fromlua_Font(L, 1)
	p_text := lua.tostring(L, 2)
	p_fontSize := c.float(lua.tonumber(L, 3))
	p_spacing := c.float(lua.tonumber(L, 4))

	result := rl.MeasureTextEx(p_font, p_text, p_fontSize, p_spacing)

	tolua_Vector2(L, result)
	return 1
}

@(private)
lua_GetGlyphIndex :: proc "c" (L: ^lua.State) -> c.int {
	p_font := fromlua_Font(L, 1)
	p_codepoint := cast(rune)c.int(lua.tonumber(L, 2))

	result := rl.GetGlyphIndex(p_font, p_codepoint)

	lua.pushinteger(L, lua.Integer(result))
	return 1
}

@(private)
lua_GetGlyphInfo :: proc "c" (L: ^lua.State) -> c.int {
	p_font := fromlua_Font(L, 1)
	p_codepoint := cast(rune)c.int(lua.tonumber(L, 2))

	result := rl.GetGlyphInfo(p_font, p_codepoint)

	tolua_GlyphInfo(L, result)
	return 1
}

@(private)
lua_GetGlyphAtlasRec :: proc "c" (L: ^lua.State) -> c.int {
	p_font := fromlua_Font(L, 1)
	p_codepoint := cast(rune)c.int(lua.tonumber(L, 2))

	result := rl.GetGlyphAtlasRec(p_font, p_codepoint)

	tolua_Rectangle(L, result)
	return 1
}

@(private)
lua_GetCodepointCount :: proc "c" (L: ^lua.State) -> c.int {
	p_text := lua.tostring(L, 1)

	result := rl.GetCodepointCount(p_text)

	lua.pushinteger(L, lua.Integer(result))
	return 1
}

@(private)
lua_TextSubtext :: proc "c" (L: ^lua.State) -> c.int {
	p_text := lua.tostring(L, 1)
	p_position := c.int(lua.tonumber(L, 2))
	p_length := c.int(lua.tonumber(L, 3))

	result := rl.TextSubtext(p_text, p_position, p_length)

	lua.pushstring(L, result)
	return 1
}

@(private)
lua_TextRemoveSpaces :: proc "c" (L: ^lua.State) -> c.int {
	p_text := lua.tostring(L, 1)

	result := rl.TextRemoveSpaces(p_text)

	lua.pushstring(L, result)
	return 1
}

@(private)
lua_TextFindIndex :: proc "c" (L: ^lua.State) -> c.int {
	p_text := lua.tostring(L, 1)
	p_search := lua.tostring(L, 2)

	result := rl.TextFindIndex(p_text, p_search)

	lua.pushinteger(L, lua.Integer(result))
	return 1
}

@(private)
lua_TextToUpper :: proc "c" (L: ^lua.State) -> c.int {
	p_text := lua.tostring(L, 1)

	result := rl.TextToUpper(p_text)

	lua.pushstring(L, result)
	return 1
}

@(private)
lua_TextToLower :: proc "c" (L: ^lua.State) -> c.int {
	p_text := lua.tostring(L, 1)

	result := rl.TextToLower(p_text)

	lua.pushstring(L, result)
	return 1
}

@(private)
lua_TextToPascal :: proc "c" (L: ^lua.State) -> c.int {
	p_text := lua.tostring(L, 1)

	result := rl.TextToPascal(p_text)

	lua.pushstring(L, result)
	return 1
}

@(private)
lua_TextToSnake :: proc "c" (L: ^lua.State) -> c.int {
	p_text := lua.tostring(L, 1)

	result := rl.TextToSnake(p_text)

	lua.pushstring(L, result)
	return 1
}

@(private)
lua_TextToCamel :: proc "c" (L: ^lua.State) -> c.int {
	p_text := lua.tostring(L, 1)

	result := rl.TextToCamel(p_text)

	lua.pushstring(L, result)
	return 1
}

@(private)
lua_TextToInteger :: proc "c" (L: ^lua.State) -> c.int {
	p_text := lua.tostring(L, 1)

	result := rl.TextToInteger(p_text)

	lua.pushinteger(L, lua.Integer(result))
	return 1
}

@(private)
lua_TextToFloat :: proc "c" (L: ^lua.State) -> c.int {
	p_text := lua.tostring(L, 1)

	result := rl.TextToFloat(p_text)

	lua.pushnumber(L, lua.Number(result))
	return 1
}

@(private)
lua_DrawLine3D :: proc "c" (L: ^lua.State) -> c.int {
	p_startPos := fromlua_Vector3(L, 1)
	p_endPos := fromlua_Vector3(L, 2)
	p_color := fromlua_Color(L, 3)

	rl.DrawLine3D(p_startPos, p_endPos, p_color)

	return 0
}

@(private)
lua_DrawPoint3D :: proc "c" (L: ^lua.State) -> c.int {
	p_position := fromlua_Vector3(L, 1)
	p_color := fromlua_Color(L, 2)

	rl.DrawPoint3D(p_position, p_color)

	return 0
}

@(private)
lua_DrawCircle3D :: proc "c" (L: ^lua.State) -> c.int {
	p_center := fromlua_Vector3(L, 1)
	p_radius := c.float(lua.tonumber(L, 2))
	p_rotationAxis := fromlua_Vector3(L, 3)
	p_rotationAngle := c.float(lua.tonumber(L, 4))
	p_color := fromlua_Color(L, 5)

	rl.DrawCircle3D(p_center, p_radius, p_rotationAxis, p_rotationAngle, p_color)

	return 0
}

@(private)
lua_DrawTriangle3D :: proc "c" (L: ^lua.State) -> c.int {
	p_v1 := fromlua_Vector3(L, 1)
	p_v2 := fromlua_Vector3(L, 2)
	p_v3 := fromlua_Vector3(L, 3)
	p_color := fromlua_Color(L, 4)

	rl.DrawTriangle3D(p_v1, p_v2, p_v3, p_color)

	return 0
}

@(private)
lua_DrawTriangleStrip3D :: proc "c" (L: ^lua.State) -> c.int {
	context = runtime.default_context()
	p_points, p_points_count := fromlua_array(L, 1, rl.Vector3, fromlua_Vector3)
	p_color := fromlua_Color(L, 2)

	rl.DrawTriangleStrip3D(p_points, p_points_count, p_color)

	return 0
}

@(private)
lua_DrawCube :: proc "c" (L: ^lua.State) -> c.int {
	p_position := fromlua_Vector3(L, 1)
	p_width := c.float(lua.tonumber(L, 2))
	p_height := c.float(lua.tonumber(L, 3))
	p_length := c.float(lua.tonumber(L, 4))
	p_color := fromlua_Color(L, 5)

	rl.DrawCube(p_position, p_width, p_height, p_length, p_color)

	return 0
}

@(private)
lua_DrawCubeV :: proc "c" (L: ^lua.State) -> c.int {
	p_position := fromlua_Vector3(L, 1)
	p_size := fromlua_Vector3(L, 2)
	p_color := fromlua_Color(L, 3)

	rl.DrawCubeV(p_position, p_size, p_color)

	return 0
}

@(private)
lua_DrawCubeWires :: proc "c" (L: ^lua.State) -> c.int {
	p_position := fromlua_Vector3(L, 1)
	p_width := c.float(lua.tonumber(L, 2))
	p_height := c.float(lua.tonumber(L, 3))
	p_length := c.float(lua.tonumber(L, 4))
	p_color := fromlua_Color(L, 5)

	rl.DrawCubeWires(p_position, p_width, p_height, p_length, p_color)

	return 0
}

@(private)
lua_DrawCubeWiresV :: proc "c" (L: ^lua.State) -> c.int {
	p_position := fromlua_Vector3(L, 1)
	p_size := fromlua_Vector3(L, 2)
	p_color := fromlua_Color(L, 3)

	rl.DrawCubeWiresV(p_position, p_size, p_color)

	return 0
}

@(private)
lua_DrawSphere :: proc "c" (L: ^lua.State) -> c.int {
	p_centerPos := fromlua_Vector3(L, 1)
	p_radius := c.float(lua.tonumber(L, 2))
	p_color := fromlua_Color(L, 3)

	rl.DrawSphere(p_centerPos, p_radius, p_color)

	return 0
}

@(private)
lua_DrawSphereEx :: proc "c" (L: ^lua.State) -> c.int {
	p_centerPos := fromlua_Vector3(L, 1)
	p_radius := c.float(lua.tonumber(L, 2))
	p_rings := c.int(lua.tonumber(L, 3))
	p_slices := c.int(lua.tonumber(L, 4))
	p_color := fromlua_Color(L, 5)

	rl.DrawSphereEx(p_centerPos, p_radius, p_rings, p_slices, p_color)

	return 0
}

@(private)
lua_DrawSphereWires :: proc "c" (L: ^lua.State) -> c.int {
	p_centerPos := fromlua_Vector3(L, 1)
	p_radius := c.float(lua.tonumber(L, 2))
	p_rings := c.int(lua.tonumber(L, 3))
	p_slices := c.int(lua.tonumber(L, 4))
	p_color := fromlua_Color(L, 5)

	rl.DrawSphereWires(p_centerPos, p_radius, p_rings, p_slices, p_color)

	return 0
}

@(private)
lua_DrawCylinder :: proc "c" (L: ^lua.State) -> c.int {
	p_position := fromlua_Vector3(L, 1)
	p_radiusTop := c.float(lua.tonumber(L, 2))
	p_radiusBottom := c.float(lua.tonumber(L, 3))
	p_height := c.float(lua.tonumber(L, 4))
	p_slices := c.int(lua.tonumber(L, 5))
	p_color := fromlua_Color(L, 6)

	rl.DrawCylinder(p_position, p_radiusTop, p_radiusBottom, p_height, p_slices, p_color)

	return 0
}

@(private)
lua_DrawCylinderEx :: proc "c" (L: ^lua.State) -> c.int {
	p_startPos := fromlua_Vector3(L, 1)
	p_endPos := fromlua_Vector3(L, 2)
	p_startRadius := c.float(lua.tonumber(L, 3))
	p_endRadius := c.float(lua.tonumber(L, 4))
	p_sides := c.int(lua.tonumber(L, 5))
	p_color := fromlua_Color(L, 6)

	rl.DrawCylinderEx(p_startPos, p_endPos, p_startRadius, p_endRadius, p_sides, p_color)

	return 0
}

@(private)
lua_DrawCylinderWires :: proc "c" (L: ^lua.State) -> c.int {
	p_position := fromlua_Vector3(L, 1)
	p_radiusTop := c.float(lua.tonumber(L, 2))
	p_radiusBottom := c.float(lua.tonumber(L, 3))
	p_height := c.float(lua.tonumber(L, 4))
	p_slices := c.int(lua.tonumber(L, 5))
	p_color := fromlua_Color(L, 6)

	rl.DrawCylinderWires(p_position, p_radiusTop, p_radiusBottom, p_height, p_slices, p_color)

	return 0
}

@(private)
lua_DrawCylinderWiresEx :: proc "c" (L: ^lua.State) -> c.int {
	p_startPos := fromlua_Vector3(L, 1)
	p_endPos := fromlua_Vector3(L, 2)
	p_startRadius := c.float(lua.tonumber(L, 3))
	p_endRadius := c.float(lua.tonumber(L, 4))
	p_sides := c.int(lua.tonumber(L, 5))
	p_color := fromlua_Color(L, 6)

	rl.DrawCylinderWiresEx(p_startPos, p_endPos, p_startRadius, p_endRadius, p_sides, p_color)

	return 0
}

@(private)
lua_DrawCapsule :: proc "c" (L: ^lua.State) -> c.int {
	p_startPos := fromlua_Vector3(L, 1)
	p_endPos := fromlua_Vector3(L, 2)
	p_radius := c.float(lua.tonumber(L, 3))
	p_slices := c.int(lua.tonumber(L, 4))
	p_rings := c.int(lua.tonumber(L, 5))
	p_color := fromlua_Color(L, 6)

	rl.DrawCapsule(p_startPos, p_endPos, p_radius, p_slices, p_rings, p_color)

	return 0
}

@(private)
lua_DrawCapsuleWires :: proc "c" (L: ^lua.State) -> c.int {
	p_startPos := fromlua_Vector3(L, 1)
	p_endPos := fromlua_Vector3(L, 2)
	p_radius := c.float(lua.tonumber(L, 3))
	p_slices := c.int(lua.tonumber(L, 4))
	p_rings := c.int(lua.tonumber(L, 5))
	p_color := fromlua_Color(L, 6)

	rl.DrawCapsuleWires(p_startPos, p_endPos, p_radius, p_slices, p_rings, p_color)

	return 0
}

@(private)
lua_DrawPlane :: proc "c" (L: ^lua.State) -> c.int {
	p_centerPos := fromlua_Vector3(L, 1)
	p_size := fromlua_Vector2(L, 2)
	p_color := fromlua_Color(L, 3)

	rl.DrawPlane(p_centerPos, p_size, p_color)

	return 0
}

@(private)
lua_DrawRay :: proc "c" (L: ^lua.State) -> c.int {
	p_ray := fromlua_Ray(L, 1)
	p_color := fromlua_Color(L, 2)

	rl.DrawRay(p_ray, p_color)

	return 0
}

@(private)
lua_DrawGrid :: proc "c" (L: ^lua.State) -> c.int {
	p_slices := c.int(lua.tonumber(L, 1))
	p_spacing := c.float(lua.tonumber(L, 2))

	rl.DrawGrid(p_slices, p_spacing)

	return 0
}

@(private)
lua_DrawBoundingBox :: proc "c" (L: ^lua.State) -> c.int {
	p_box := fromlua_BoundingBox(L, 1)
	p_color := fromlua_Color(L, 2)

	rl.DrawBoundingBox(p_box, p_color)

	return 0
}

@(private)
lua_DrawBillboard :: proc "c" (L: ^lua.State) -> c.int {
	p_camera := fromlua_Camera(L, 1)
	p_texture := fromlua_Texture2D(L, 2)
	p_position := fromlua_Vector3(L, 3)
	p_scale := c.float(lua.tonumber(L, 4))
	p_tint := fromlua_Color(L, 5)

	rl.DrawBillboard(p_camera, p_texture, p_position, p_scale, p_tint)

	return 0
}

@(private)
lua_DrawBillboardRec :: proc "c" (L: ^lua.State) -> c.int {
	p_camera := fromlua_Camera(L, 1)
	p_texture := fromlua_Texture2D(L, 2)
	p_source := fromlua_Rectangle(L, 3)
	p_position := fromlua_Vector3(L, 4)
	p_size := fromlua_Vector2(L, 5)
	p_tint := fromlua_Color(L, 6)

	rl.DrawBillboardRec(p_camera, p_texture, p_source, p_position, p_size, p_tint)

	return 0
}

@(private)
lua_DrawBillboardPro :: proc "c" (L: ^lua.State) -> c.int {
	p_camera := fromlua_Camera(L, 1)
	p_texture := fromlua_Texture2D(L, 2)
	p_source := fromlua_Rectangle(L, 3)
	p_position := fromlua_Vector3(L, 4)
	p_up := fromlua_Vector3(L, 5)
	p_size := fromlua_Vector2(L, 6)
	p_origin := fromlua_Vector2(L, 7)
	p_rotation := c.float(lua.tonumber(L, 8))
	p_tint := fromlua_Color(L, 9)

	rl.DrawBillboardPro(
		p_camera,
		p_texture,
		p_source,
		p_position,
		p_up,
		p_size,
		p_origin,
		p_rotation,
		p_tint,
	)

	return 0
}

@(private)
lua_CheckCollisionSpheres :: proc "c" (L: ^lua.State) -> c.int {
	p_center1 := fromlua_Vector3(L, 1)
	p_radius1 := c.float(lua.tonumber(L, 2))
	p_center2 := fromlua_Vector3(L, 3)
	p_radius2 := c.float(lua.tonumber(L, 4))

	result := rl.CheckCollisionSpheres(p_center1, p_radius1, p_center2, p_radius2)

	lua.pushboolean(L, b32(result))
	return 1
}

@(private)
lua_CheckCollisionBoxes :: proc "c" (L: ^lua.State) -> c.int {
	p_box1 := fromlua_BoundingBox(L, 1)
	p_box2 := fromlua_BoundingBox(L, 2)

	result := rl.CheckCollisionBoxes(p_box1, p_box2)

	lua.pushboolean(L, b32(result))
	return 1
}

@(private)
lua_CheckCollisionBoxSphere :: proc "c" (L: ^lua.State) -> c.int {
	p_box := fromlua_BoundingBox(L, 1)
	p_center := fromlua_Vector3(L, 2)
	p_radius := c.float(lua.tonumber(L, 3))

	result := rl.CheckCollisionBoxSphere(p_box, p_center, p_radius)

	lua.pushboolean(L, b32(result))
	return 1
}

@(private)
lua_GetRayCollisionSphere :: proc "c" (L: ^lua.State) -> c.int {
	p_ray := fromlua_Ray(L, 1)
	p_center := fromlua_Vector3(L, 2)
	p_radius := c.float(lua.tonumber(L, 3))

	result := rl.GetRayCollisionSphere(p_ray, p_center, p_radius)

	tolua_RayCollision(L, result)
	return 1
}

@(private)
lua_GetRayCollisionBox :: proc "c" (L: ^lua.State) -> c.int {
	p_ray := fromlua_Ray(L, 1)
	p_box := fromlua_BoundingBox(L, 2)

	result := rl.GetRayCollisionBox(p_ray, p_box)

	tolua_RayCollision(L, result)
	return 1
}

@(private)
lua_GetRayCollisionTriangle :: proc "c" (L: ^lua.State) -> c.int {
	p_ray := fromlua_Ray(L, 1)
	p_p1 := fromlua_Vector3(L, 2)
	p_p2 := fromlua_Vector3(L, 3)
	p_p3 := fromlua_Vector3(L, 4)

	result := rl.GetRayCollisionTriangle(p_ray, p_p1, p_p2, p_p3)

	tolua_RayCollision(L, result)
	return 1
}

@(private)
lua_GetRayCollisionQuad :: proc "c" (L: ^lua.State) -> c.int {
	p_ray := fromlua_Ray(L, 1)
	p_p1 := fromlua_Vector3(L, 2)
	p_p2 := fromlua_Vector3(L, 3)
	p_p3 := fromlua_Vector3(L, 4)
	p_p4 := fromlua_Vector3(L, 5)

	result := rl.GetRayCollisionQuad(p_ray, p_p1, p_p2, p_p3, p_p4)

	tolua_RayCollision(L, result)
	return 1
}

@(private)
lua_InitAudioDevice :: proc "c" (L: ^lua.State) -> c.int {
	rl.InitAudioDevice()

	return 0
}

@(private)
lua_CloseAudioDevice :: proc "c" (L: ^lua.State) -> c.int {
	rl.CloseAudioDevice()

	return 0
}

@(private)
lua_IsAudioDeviceReady :: proc "c" (L: ^lua.State) -> c.int {
	result := rl.IsAudioDeviceReady()

	lua.pushboolean(L, b32(result))
	return 1
}

@(private)
lua_SetMasterVolume :: proc "c" (L: ^lua.State) -> c.int {
	p_volume := c.float(lua.tonumber(L, 1))

	rl.SetMasterVolume(p_volume)

	return 0
}

@(private)
lua_GetMasterVolume :: proc "c" (L: ^lua.State) -> c.int {
	result := rl.GetMasterVolume()

	lua.pushnumber(L, lua.Number(result))
	return 1
}

@(private)
lua_LoadWave :: proc "c" (L: ^lua.State) -> c.int {
	p_fileName := lua.tostring(L, 1)

	result := rl.LoadWave(p_fileName)

	tolua_Wave(L, result)
	return 1
}

@(private)
lua_IsWaveValid :: proc "c" (L: ^lua.State) -> c.int {
	p_wave := fromlua_Wave(L, 1)

	result := rl.IsWaveValid(p_wave)

	lua.pushboolean(L, b32(result))
	return 1
}

@(private)
lua_LoadSound :: proc "c" (L: ^lua.State) -> c.int {
	p_fileName := lua.tostring(L, 1)

	result := rl.LoadSound(p_fileName)

	tolua_Sound(L, result)
	return 1
}

@(private)
lua_LoadSoundFromWave :: proc "c" (L: ^lua.State) -> c.int {
	p_wave := fromlua_Wave(L, 1)

	result := rl.LoadSoundFromWave(p_wave)

	tolua_Sound(L, result)
	return 1
}

@(private)
lua_LoadSoundAlias :: proc "c" (L: ^lua.State) -> c.int {
	p_source := fromlua_Sound(L, 1)

	result := rl.LoadSoundAlias(p_source)

	tolua_Sound(L, result)
	return 1
}

@(private)
lua_IsSoundValid :: proc "c" (L: ^lua.State) -> c.int {
	p_sound := fromlua_Sound(L, 1)

	result := rl.IsSoundValid(p_sound)

	lua.pushboolean(L, b32(result))
	return 1
}

@(private)
lua_UpdateSound :: proc "c" (L: ^lua.State) -> c.int {
	p_sound := fromlua_Sound(L, 1)
	p_data := lua.touserdata(L, 2)
	p_sampleCount := c.int(lua.tonumber(L, 3))

	rl.UpdateSound(p_sound, p_data, p_sampleCount)

	return 0
}

@(private)
lua_UnloadWave :: proc "c" (L: ^lua.State) -> c.int {
	p_wave := fromlua_Wave(L, 1)

	rl.UnloadWave(p_wave)

	return 0
}

@(private)
lua_UnloadSound :: proc "c" (L: ^lua.State) -> c.int {
	p_sound := fromlua_Sound(L, 1)

	rl.UnloadSound(p_sound)

	return 0
}

@(private)
lua_UnloadSoundAlias :: proc "c" (L: ^lua.State) -> c.int {
	p_alias := fromlua_Sound(L, 1)

	rl.UnloadSoundAlias(p_alias)

	return 0
}

@(private)
lua_ExportWave :: proc "c" (L: ^lua.State) -> c.int {
	p_wave := fromlua_Wave(L, 1)
	p_fileName := lua.tostring(L, 2)

	result := rl.ExportWave(p_wave, p_fileName)

	lua.pushboolean(L, b32(result))
	return 1
}

@(private)
lua_ExportWaveAsCode :: proc "c" (L: ^lua.State) -> c.int {
	p_wave := fromlua_Wave(L, 1)
	p_fileName := lua.tostring(L, 2)

	result := rl.ExportWaveAsCode(p_wave, p_fileName)

	lua.pushboolean(L, b32(result))
	return 1
}

@(private)
lua_PlaySound :: proc "c" (L: ^lua.State) -> c.int {
	p_sound := fromlua_Sound(L, 1)

	rl.PlaySound(p_sound)

	return 0
}

@(private)
lua_StopSound :: proc "c" (L: ^lua.State) -> c.int {
	p_sound := fromlua_Sound(L, 1)

	rl.StopSound(p_sound)

	return 0
}

@(private)
lua_PauseSound :: proc "c" (L: ^lua.State) -> c.int {
	p_sound := fromlua_Sound(L, 1)

	rl.PauseSound(p_sound)

	return 0
}

@(private)
lua_ResumeSound :: proc "c" (L: ^lua.State) -> c.int {
	p_sound := fromlua_Sound(L, 1)

	rl.ResumeSound(p_sound)

	return 0
}

@(private)
lua_IsSoundPlaying :: proc "c" (L: ^lua.State) -> c.int {
	p_sound := fromlua_Sound(L, 1)

	result := rl.IsSoundPlaying(p_sound)

	lua.pushboolean(L, b32(result))
	return 1
}

@(private)
lua_SetSoundVolume :: proc "c" (L: ^lua.State) -> c.int {
	p_sound := fromlua_Sound(L, 1)
	p_volume := c.float(lua.tonumber(L, 2))

	rl.SetSoundVolume(p_sound, p_volume)

	return 0
}

@(private)
lua_SetSoundPitch :: proc "c" (L: ^lua.State) -> c.int {
	p_sound := fromlua_Sound(L, 1)
	p_pitch := c.float(lua.tonumber(L, 2))

	rl.SetSoundPitch(p_sound, p_pitch)

	return 0
}

@(private)
lua_SetSoundPan :: proc "c" (L: ^lua.State) -> c.int {
	p_sound := fromlua_Sound(L, 1)
	p_pan := c.float(lua.tonumber(L, 2))

	rl.SetSoundPan(p_sound, p_pan)

	return 0
}

@(private)
lua_WaveCopy :: proc "c" (L: ^lua.State) -> c.int {
	p_wave := fromlua_Wave(L, 1)

	result := rl.WaveCopy(p_wave)

	tolua_Wave(L, result)
	return 1
}

@(private)
lua_LoadMusicStream :: proc "c" (L: ^lua.State) -> c.int {
	p_fileName := lua.tostring(L, 1)

	result := rl.LoadMusicStream(p_fileName)

	tolua_Music(L, result)
	return 1
}

@(private)
lua_IsMusicValid :: proc "c" (L: ^lua.State) -> c.int {
	p_music := fromlua_Music(L, 1)

	result := rl.IsMusicValid(p_music)

	lua.pushboolean(L, b32(result))
	return 1
}

@(private)
lua_UnloadMusicStream :: proc "c" (L: ^lua.State) -> c.int {
	p_music := fromlua_Music(L, 1)

	rl.UnloadMusicStream(p_music)

	return 0
}

@(private)
lua_PlayMusicStream :: proc "c" (L: ^lua.State) -> c.int {
	p_music := fromlua_Music(L, 1)

	rl.PlayMusicStream(p_music)

	return 0
}

@(private)
lua_IsMusicStreamPlaying :: proc "c" (L: ^lua.State) -> c.int {
	p_music := fromlua_Music(L, 1)

	result := rl.IsMusicStreamPlaying(p_music)

	lua.pushboolean(L, b32(result))
	return 1
}

@(private)
lua_UpdateMusicStream :: proc "c" (L: ^lua.State) -> c.int {
	p_music := fromlua_Music(L, 1)

	rl.UpdateMusicStream(p_music)

	return 0
}

@(private)
lua_StopMusicStream :: proc "c" (L: ^lua.State) -> c.int {
	p_music := fromlua_Music(L, 1)

	rl.StopMusicStream(p_music)

	return 0
}

@(private)
lua_PauseMusicStream :: proc "c" (L: ^lua.State) -> c.int {
	p_music := fromlua_Music(L, 1)

	rl.PauseMusicStream(p_music)

	return 0
}

@(private)
lua_ResumeMusicStream :: proc "c" (L: ^lua.State) -> c.int {
	p_music := fromlua_Music(L, 1)

	rl.ResumeMusicStream(p_music)

	return 0
}

@(private)
lua_SeekMusicStream :: proc "c" (L: ^lua.State) -> c.int {
	p_music := fromlua_Music(L, 1)
	p_position := c.float(lua.tonumber(L, 2))

	rl.SeekMusicStream(p_music, p_position)

	return 0
}

@(private)
lua_SetMusicVolume :: proc "c" (L: ^lua.State) -> c.int {
	p_music := fromlua_Music(L, 1)
	p_volume := c.float(lua.tonumber(L, 2))

	rl.SetMusicVolume(p_music, p_volume)

	return 0
}

@(private)
lua_SetMusicPitch :: proc "c" (L: ^lua.State) -> c.int {
	p_music := fromlua_Music(L, 1)
	p_pitch := c.float(lua.tonumber(L, 2))

	rl.SetMusicPitch(p_music, p_pitch)

	return 0
}

@(private)
lua_SetMusicPan :: proc "c" (L: ^lua.State) -> c.int {
	p_music := fromlua_Music(L, 1)
	p_pan := c.float(lua.tonumber(L, 2))

	rl.SetMusicPan(p_music, p_pan)

	return 0
}

@(private)
lua_GetMusicTimeLength :: proc "c" (L: ^lua.State) -> c.int {
	p_music := fromlua_Music(L, 1)

	result := rl.GetMusicTimeLength(p_music)

	lua.pushnumber(L, lua.Number(result))
	return 1
}

@(private)
lua_GetMusicTimePlayed :: proc "c" (L: ^lua.State) -> c.int {
	p_music := fromlua_Music(L, 1)

	result := rl.GetMusicTimePlayed(p_music)

	lua.pushnumber(L, lua.Number(result))
	return 1
}

@(private)
lua_LoadAudioStream :: proc "c" (L: ^lua.State) -> c.int {
	p_sampleRate := c.uint(lua.tonumber(L, 1))
	p_sampleSize := c.uint(lua.tonumber(L, 2))
	p_channels := c.uint(lua.tonumber(L, 3))

	result := rl.LoadAudioStream(p_sampleRate, p_sampleSize, p_channels)

	tolua_AudioStream(L, result)
	return 1
}

@(private)
lua_IsAudioStreamValid :: proc "c" (L: ^lua.State) -> c.int {
	p_stream := fromlua_AudioStream(L, 1)

	result := rl.IsAudioStreamValid(p_stream)

	lua.pushboolean(L, b32(result))
	return 1
}

@(private)
lua_UnloadAudioStream :: proc "c" (L: ^lua.State) -> c.int {
	p_stream := fromlua_AudioStream(L, 1)

	rl.UnloadAudioStream(p_stream)

	return 0
}

@(private)
lua_UpdateAudioStream :: proc "c" (L: ^lua.State) -> c.int {
	p_stream := fromlua_AudioStream(L, 1)
	p_data := lua.touserdata(L, 2)
	p_frameCount := c.int(lua.tonumber(L, 3))

	rl.UpdateAudioStream(p_stream, p_data, p_frameCount)

	return 0
}

@(private)
lua_IsAudioStreamProcessed :: proc "c" (L: ^lua.State) -> c.int {
	p_stream := fromlua_AudioStream(L, 1)

	result := rl.IsAudioStreamProcessed(p_stream)

	lua.pushboolean(L, b32(result))
	return 1
}

@(private)
lua_PlayAudioStream :: proc "c" (L: ^lua.State) -> c.int {
	p_stream := fromlua_AudioStream(L, 1)

	rl.PlayAudioStream(p_stream)

	return 0
}

@(private)
lua_PauseAudioStream :: proc "c" (L: ^lua.State) -> c.int {
	p_stream := fromlua_AudioStream(L, 1)

	rl.PauseAudioStream(p_stream)

	return 0
}

@(private)
lua_ResumeAudioStream :: proc "c" (L: ^lua.State) -> c.int {
	p_stream := fromlua_AudioStream(L, 1)

	rl.ResumeAudioStream(p_stream)

	return 0
}

@(private)
lua_IsAudioStreamPlaying :: proc "c" (L: ^lua.State) -> c.int {
	p_stream := fromlua_AudioStream(L, 1)

	result := rl.IsAudioStreamPlaying(p_stream)

	lua.pushboolean(L, b32(result))
	return 1
}

@(private)
lua_StopAudioStream :: proc "c" (L: ^lua.State) -> c.int {
	p_stream := fromlua_AudioStream(L, 1)

	rl.StopAudioStream(p_stream)

	return 0
}

@(private)
lua_SetAudioStreamVolume :: proc "c" (L: ^lua.State) -> c.int {
	p_stream := fromlua_AudioStream(L, 1)
	p_volume := c.float(lua.tonumber(L, 2))

	rl.SetAudioStreamVolume(p_stream, p_volume)

	return 0
}

@(private)
lua_SetAudioStreamPitch :: proc "c" (L: ^lua.State) -> c.int {
	p_stream := fromlua_AudioStream(L, 1)
	p_pitch := c.float(lua.tonumber(L, 2))

	rl.SetAudioStreamPitch(p_stream, p_pitch)

	return 0
}

@(private)
lua_SetAudioStreamPan :: proc "c" (L: ^lua.State) -> c.int {
	p_stream := fromlua_AudioStream(L, 1)
	p_pan := c.float(lua.tonumber(L, 2))

	rl.SetAudioStreamPan(p_stream, p_pan)

	return 0
}

@(private)
lua_SetAudioStreamBufferSizeDefault :: proc "c" (L: ^lua.State) -> c.int {
	p_size := c.int(lua.tonumber(L, 1))

	rl.SetAudioStreamBufferSizeDefault(p_size)

	return 0
}
