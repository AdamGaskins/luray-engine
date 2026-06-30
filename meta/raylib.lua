---@meta
-- Raylib API stubs for lua-language-server.
-- Declarations only; this file is never executed by the runtime.

---@class Raylib.Raylib
---@field RAYLIB_VERSION_MAJOR integer 5
---@field RAYLIB_VERSION_MINOR integer 5
---@field RAYLIB_VERSION_PATCH integer 0
---@field RAYLIB_VERSION string 5.5
---@field PI number 3.141592653589793
---@field LIGHTGRAY Raylib.Color 
---@field GRAY Raylib.Color 
---@field DARKGRAY Raylib.Color 
---@field YELLOW Raylib.Color 
---@field GOLD Raylib.Color 
---@field ORANGE Raylib.Color 
---@field PINK Raylib.Color 
---@field RED Raylib.Color 
---@field MAROON Raylib.Color 
---@field GREEN Raylib.Color 
---@field LIME Raylib.Color 
---@field DARKGREEN Raylib.Color 
---@field SKYBLUE Raylib.Color 
---@field BLUE Raylib.Color 
---@field DARKBLUE Raylib.Color 
---@field PURPLE Raylib.Color 
---@field VIOLET Raylib.Color 
---@field DARKPURPLE Raylib.Color 
---@field BEIGE Raylib.Color 
---@field BROWN Raylib.Color 
---@field DARKBROWN Raylib.Color 
---@field WHITE Raylib.Color 
---@field BLACK Raylib.Color 
---@field BLANK Raylib.Color 
---@field MAGENTA Raylib.Color 
---@field RAYWHITE Raylib.Color 
---@field FLAG_VSYNC_HINT integer 64
---@field FLAG_FULLSCREEN_MODE integer 2
---@field FLAG_WINDOW_RESIZABLE integer 4
---@field FLAG_WINDOW_UNDECORATED integer 8
---@field FLAG_WINDOW_HIDDEN integer 128
---@field FLAG_WINDOW_MINIMIZED integer 512
---@field FLAG_WINDOW_MAXIMIZED integer 1024
---@field FLAG_WINDOW_UNFOCUSED integer 2048
---@field FLAG_WINDOW_TOPMOST integer 4096
---@field FLAG_WINDOW_ALWAYS_RUN integer 256
---@field FLAG_WINDOW_TRANSPARENT integer 16
---@field FLAG_WINDOW_HIGHDPI integer 8192
---@field FLAG_WINDOW_MOUSE_PASSTHROUGH integer 16384
---@field FLAG_BORDERLESS_WINDOWED_MODE integer 32768
---@field FLAG_MSAA_4X_HINT integer 32
---@field FLAG_INTERLACED_HINT integer 65536
---@field LOG_ALL integer 0
---@field LOG_TRACE integer 1
---@field LOG_DEBUG integer 2
---@field LOG_INFO integer 3
---@field LOG_WARNING integer 4
---@field LOG_ERROR integer 5
---@field LOG_FATAL integer 6
---@field LOG_NONE integer 7
---@field KEY_NULL integer 0
---@field KEY_APOSTROPHE integer 39
---@field KEY_COMMA integer 44
---@field KEY_MINUS integer 45
---@field KEY_PERIOD integer 46
---@field KEY_SLASH integer 47
---@field KEY_ZERO integer 48
---@field KEY_ONE integer 49
---@field KEY_TWO integer 50
---@field KEY_THREE integer 51
---@field KEY_FOUR integer 52
---@field KEY_FIVE integer 53
---@field KEY_SIX integer 54
---@field KEY_SEVEN integer 55
---@field KEY_EIGHT integer 56
---@field KEY_NINE integer 57
---@field KEY_SEMICOLON integer 59
---@field KEY_EQUAL integer 61
---@field KEY_A integer 65
---@field KEY_B integer 66
---@field KEY_C integer 67
---@field KEY_D integer 68
---@field KEY_E integer 69
---@field KEY_F integer 70
---@field KEY_G integer 71
---@field KEY_H integer 72
---@field KEY_I integer 73
---@field KEY_J integer 74
---@field KEY_K integer 75
---@field KEY_L integer 76
---@field KEY_M integer 77
---@field KEY_N integer 78
---@field KEY_O integer 79
---@field KEY_P integer 80
---@field KEY_Q integer 81
---@field KEY_R integer 82
---@field KEY_S integer 83
---@field KEY_T integer 84
---@field KEY_U integer 85
---@field KEY_V integer 86
---@field KEY_W integer 87
---@field KEY_X integer 88
---@field KEY_Y integer 89
---@field KEY_Z integer 90
---@field KEY_LEFT_BRACKET integer 91
---@field KEY_BACKSLASH integer 92
---@field KEY_RIGHT_BRACKET integer 93
---@field KEY_GRAVE integer 96
---@field KEY_SPACE integer 32
---@field KEY_ESCAPE integer 256
---@field KEY_ENTER integer 257
---@field KEY_TAB integer 258
---@field KEY_BACKSPACE integer 259
---@field KEY_INSERT integer 260
---@field KEY_DELETE integer 261
---@field KEY_RIGHT integer 262
---@field KEY_LEFT integer 263
---@field KEY_DOWN integer 264
---@field KEY_UP integer 265
---@field KEY_PAGE_UP integer 266
---@field KEY_PAGE_DOWN integer 267
---@field KEY_HOME integer 268
---@field KEY_END integer 269
---@field KEY_CAPS_LOCK integer 280
---@field KEY_SCROLL_LOCK integer 281
---@field KEY_NUM_LOCK integer 282
---@field KEY_PRINT_SCREEN integer 283
---@field KEY_PAUSE integer 284
---@field KEY_F1 integer 290
---@field KEY_F2 integer 291
---@field KEY_F3 integer 292
---@field KEY_F4 integer 293
---@field KEY_F5 integer 294
---@field KEY_F6 integer 295
---@field KEY_F7 integer 296
---@field KEY_F8 integer 297
---@field KEY_F9 integer 298
---@field KEY_F10 integer 299
---@field KEY_F11 integer 300
---@field KEY_F12 integer 301
---@field KEY_LEFT_SHIFT integer 340
---@field KEY_LEFT_CONTROL integer 341
---@field KEY_LEFT_ALT integer 342
---@field KEY_LEFT_SUPER integer 343
---@field KEY_RIGHT_SHIFT integer 344
---@field KEY_RIGHT_CONTROL integer 345
---@field KEY_RIGHT_ALT integer 346
---@field KEY_RIGHT_SUPER integer 347
---@field KEY_KB_MENU integer 348
---@field KEY_KP_0 integer 320
---@field KEY_KP_1 integer 321
---@field KEY_KP_2 integer 322
---@field KEY_KP_3 integer 323
---@field KEY_KP_4 integer 324
---@field KEY_KP_5 integer 325
---@field KEY_KP_6 integer 326
---@field KEY_KP_7 integer 327
---@field KEY_KP_8 integer 328
---@field KEY_KP_9 integer 329
---@field KEY_KP_DECIMAL integer 330
---@field KEY_KP_DIVIDE integer 331
---@field KEY_KP_MULTIPLY integer 332
---@field KEY_KP_SUBTRACT integer 333
---@field KEY_KP_ADD integer 334
---@field KEY_KP_ENTER integer 335
---@field KEY_KP_EQUAL integer 336
---@field KEY_BACK integer 4
---@field KEY_MENU integer 5
---@field KEY_VOLUME_UP integer 24
---@field KEY_VOLUME_DOWN integer 25
---@field MOUSE_BUTTON_LEFT integer 0
---@field MOUSE_BUTTON_RIGHT integer 1
---@field MOUSE_BUTTON_MIDDLE integer 2
---@field MOUSE_BUTTON_SIDE integer 3
---@field MOUSE_BUTTON_EXTRA integer 4
---@field MOUSE_BUTTON_FORWARD integer 5
---@field MOUSE_BUTTON_BACK integer 6
---@field MOUSE_CURSOR_DEFAULT integer 0
---@field MOUSE_CURSOR_ARROW integer 1
---@field MOUSE_CURSOR_IBEAM integer 2
---@field MOUSE_CURSOR_CROSSHAIR integer 3
---@field MOUSE_CURSOR_POINTING_HAND integer 4
---@field MOUSE_CURSOR_RESIZE_EW integer 5
---@field MOUSE_CURSOR_RESIZE_NS integer 6
---@field MOUSE_CURSOR_RESIZE_NWSE integer 7
---@field MOUSE_CURSOR_RESIZE_NESW integer 8
---@field MOUSE_CURSOR_RESIZE_ALL integer 9
---@field MOUSE_CURSOR_NOT_ALLOWED integer 10
---@field GAMEPAD_BUTTON_UNKNOWN integer 0
---@field GAMEPAD_BUTTON_LEFT_FACE_UP integer 1
---@field GAMEPAD_BUTTON_LEFT_FACE_RIGHT integer 2
---@field GAMEPAD_BUTTON_LEFT_FACE_DOWN integer 3
---@field GAMEPAD_BUTTON_LEFT_FACE_LEFT integer 4
---@field GAMEPAD_BUTTON_RIGHT_FACE_UP integer 5
---@field GAMEPAD_BUTTON_RIGHT_FACE_RIGHT integer 6
---@field GAMEPAD_BUTTON_RIGHT_FACE_DOWN integer 7
---@field GAMEPAD_BUTTON_RIGHT_FACE_LEFT integer 8
---@field GAMEPAD_BUTTON_LEFT_TRIGGER_1 integer 9
---@field GAMEPAD_BUTTON_LEFT_TRIGGER_2 integer 10
---@field GAMEPAD_BUTTON_RIGHT_TRIGGER_1 integer 11
---@field GAMEPAD_BUTTON_RIGHT_TRIGGER_2 integer 12
---@field GAMEPAD_BUTTON_MIDDLE_LEFT integer 13
---@field GAMEPAD_BUTTON_MIDDLE integer 14
---@field GAMEPAD_BUTTON_MIDDLE_RIGHT integer 15
---@field GAMEPAD_BUTTON_LEFT_THUMB integer 16
---@field GAMEPAD_BUTTON_RIGHT_THUMB integer 17
---@field GAMEPAD_AXIS_LEFT_X integer 0
---@field GAMEPAD_AXIS_LEFT_Y integer 1
---@field GAMEPAD_AXIS_RIGHT_X integer 2
---@field GAMEPAD_AXIS_RIGHT_Y integer 3
---@field GAMEPAD_AXIS_LEFT_TRIGGER integer 4
---@field GAMEPAD_AXIS_RIGHT_TRIGGER integer 5
---@field MATERIAL_MAP_ALBEDO integer 0
---@field MATERIAL_MAP_METALNESS integer 1
---@field MATERIAL_MAP_NORMAL integer 2
---@field MATERIAL_MAP_ROUGHNESS integer 3
---@field MATERIAL_MAP_OCCLUSION integer 4
---@field MATERIAL_MAP_EMISSION integer 5
---@field MATERIAL_MAP_HEIGHT integer 6
---@field MATERIAL_MAP_CUBEMAP integer 7
---@field MATERIAL_MAP_IRRADIANCE integer 8
---@field MATERIAL_MAP_PREFILTER integer 9
---@field MATERIAL_MAP_BRDF integer 10
---@field SHADER_LOC_VERTEX_POSITION integer 0
---@field SHADER_LOC_VERTEX_TEXCOORD01 integer 1
---@field SHADER_LOC_VERTEX_TEXCOORD02 integer 2
---@field SHADER_LOC_VERTEX_NORMAL integer 3
---@field SHADER_LOC_VERTEX_TANGENT integer 4
---@field SHADER_LOC_VERTEX_COLOR integer 5
---@field SHADER_LOC_MATRIX_MVP integer 6
---@field SHADER_LOC_MATRIX_VIEW integer 7
---@field SHADER_LOC_MATRIX_PROJECTION integer 8
---@field SHADER_LOC_MATRIX_MODEL integer 9
---@field SHADER_LOC_MATRIX_NORMAL integer 10
---@field SHADER_LOC_VECTOR_VIEW integer 11
---@field SHADER_LOC_COLOR_DIFFUSE integer 12
---@field SHADER_LOC_COLOR_SPECULAR integer 13
---@field SHADER_LOC_COLOR_AMBIENT integer 14
---@field SHADER_LOC_MAP_ALBEDO integer 15
---@field SHADER_LOC_MAP_METALNESS integer 16
---@field SHADER_LOC_MAP_NORMAL integer 17
---@field SHADER_LOC_MAP_ROUGHNESS integer 18
---@field SHADER_LOC_MAP_OCCLUSION integer 19
---@field SHADER_LOC_MAP_EMISSION integer 20
---@field SHADER_LOC_MAP_HEIGHT integer 21
---@field SHADER_LOC_MAP_CUBEMAP integer 22
---@field SHADER_LOC_MAP_IRRADIANCE integer 23
---@field SHADER_LOC_MAP_PREFILTER integer 24
---@field SHADER_LOC_MAP_BRDF integer 25
---@field SHADER_LOC_VERTEX_BONEIDS integer 26
---@field SHADER_LOC_VERTEX_BONEWEIGHTS integer 27
---@field SHADER_LOC_BONE_MATRICES integer 28
---@field SHADER_UNIFORM_FLOAT integer 0
---@field SHADER_UNIFORM_VEC2 integer 1
---@field SHADER_UNIFORM_VEC3 integer 2
---@field SHADER_UNIFORM_VEC4 integer 3
---@field SHADER_UNIFORM_INT integer 4
---@field SHADER_UNIFORM_IVEC2 integer 5
---@field SHADER_UNIFORM_IVEC3 integer 6
---@field SHADER_UNIFORM_IVEC4 integer 7
---@field SHADER_UNIFORM_SAMPLER2D integer 8
---@field SHADER_ATTRIB_FLOAT integer 0
---@field SHADER_ATTRIB_VEC2 integer 1
---@field SHADER_ATTRIB_VEC3 integer 2
---@field SHADER_ATTRIB_VEC4 integer 3
---@field PIXELFORMAT_UNCOMPRESSED_GRAYSCALE integer 1
---@field PIXELFORMAT_UNCOMPRESSED_GRAY_ALPHA integer 2
---@field PIXELFORMAT_UNCOMPRESSED_R5G6B5 integer 3
---@field PIXELFORMAT_UNCOMPRESSED_R8G8B8 integer 4
---@field PIXELFORMAT_UNCOMPRESSED_R5G5B5A1 integer 5
---@field PIXELFORMAT_UNCOMPRESSED_R4G4B4A4 integer 6
---@field PIXELFORMAT_UNCOMPRESSED_R8G8B8A8 integer 7
---@field PIXELFORMAT_UNCOMPRESSED_R32 integer 8
---@field PIXELFORMAT_UNCOMPRESSED_R32G32B32 integer 9
---@field PIXELFORMAT_UNCOMPRESSED_R32G32B32A32 integer 10
---@field PIXELFORMAT_UNCOMPRESSED_R16 integer 11
---@field PIXELFORMAT_UNCOMPRESSED_R16G16B16 integer 12
---@field PIXELFORMAT_UNCOMPRESSED_R16G16B16A16 integer 13
---@field PIXELFORMAT_COMPRESSED_DXT1_RGB integer 14
---@field PIXELFORMAT_COMPRESSED_DXT1_RGBA integer 15
---@field PIXELFORMAT_COMPRESSED_DXT3_RGBA integer 16
---@field PIXELFORMAT_COMPRESSED_DXT5_RGBA integer 17
---@field PIXELFORMAT_COMPRESSED_ETC1_RGB integer 18
---@field PIXELFORMAT_COMPRESSED_ETC2_RGB integer 19
---@field PIXELFORMAT_COMPRESSED_ETC2_EAC_RGBA integer 20
---@field PIXELFORMAT_COMPRESSED_PVRT_RGB integer 21
---@field PIXELFORMAT_COMPRESSED_PVRT_RGBA integer 22
---@field PIXELFORMAT_COMPRESSED_ASTC_4x4_RGBA integer 23
---@field PIXELFORMAT_COMPRESSED_ASTC_8x8_RGBA integer 24
---@field TEXTURE_FILTER_POINT integer 0
---@field TEXTURE_FILTER_BILINEAR integer 1
---@field TEXTURE_FILTER_TRILINEAR integer 2
---@field TEXTURE_FILTER_ANISOTROPIC_4X integer 3
---@field TEXTURE_FILTER_ANISOTROPIC_8X integer 4
---@field TEXTURE_FILTER_ANISOTROPIC_16X integer 5
---@field TEXTURE_WRAP_REPEAT integer 0
---@field TEXTURE_WRAP_CLAMP integer 1
---@field TEXTURE_WRAP_MIRROR_REPEAT integer 2
---@field TEXTURE_WRAP_MIRROR_CLAMP integer 3
---@field CUBEMAP_LAYOUT_AUTO_DETECT integer 0
---@field CUBEMAP_LAYOUT_LINE_VERTICAL integer 1
---@field CUBEMAP_LAYOUT_LINE_HORIZONTAL integer 2
---@field CUBEMAP_LAYOUT_CROSS_THREE_BY_FOUR integer 3
---@field CUBEMAP_LAYOUT_CROSS_FOUR_BY_THREE integer 4
---@field FONT_DEFAULT integer 0
---@field FONT_BITMAP integer 1
---@field FONT_SDF integer 2
---@field BLEND_ALPHA integer 0
---@field BLEND_ADDITIVE integer 1
---@field BLEND_MULTIPLIED integer 2
---@field BLEND_ADD_COLORS integer 3
---@field BLEND_SUBTRACT_COLORS integer 4
---@field BLEND_ALPHA_PREMULTIPLY integer 5
---@field BLEND_CUSTOM integer 6
---@field BLEND_CUSTOM_SEPARATE integer 7
---@field GESTURE_NONE integer 0
---@field GESTURE_TAP integer 1
---@field GESTURE_DOUBLETAP integer 2
---@field GESTURE_HOLD integer 4
---@field GESTURE_DRAG integer 8
---@field GESTURE_SWIPE_RIGHT integer 16
---@field GESTURE_SWIPE_LEFT integer 32
---@field GESTURE_SWIPE_UP integer 64
---@field GESTURE_SWIPE_DOWN integer 128
---@field GESTURE_PINCH_IN integer 256
---@field GESTURE_PINCH_OUT integer 512
---@field CAMERA_CUSTOM integer 0
---@field CAMERA_FREE integer 1
---@field CAMERA_ORBITAL integer 2
---@field CAMERA_FIRST_PERSON integer 3
---@field CAMERA_THIRD_PERSON integer 4
---@field CAMERA_PERSPECTIVE integer 0
---@field CAMERA_ORTHOGRAPHIC integer 1
---@field NPATCH_NINE_PATCH integer 0
---@field NPATCH_THREE_PATCH_VERTICAL integer 1
---@field NPATCH_THREE_PATCH_HORIZONTAL integer 2
ray = {}

---@alias Raylib.Color integer

function _init() end

function _update() end

---@class Raylib.Vector2
---@field x number Vector x component
---@field y number Vector y component

---@class Raylib.Vector3
---@field x number Vector x component
---@field y number Vector y component
---@field z number Vector z component

---@class Raylib.Vector4
---@field x number Vector x component
---@field y number Vector y component
---@field z number Vector z component
---@field w number Vector w component

---@class Raylib.Matrix
---@field m0 number Matrix first row (4 components)
---@field m4 number Matrix first row (4 components)
---@field m8 number Matrix first row (4 components)
---@field m12 number Matrix first row (4 components)
---@field m1 number Matrix second row (4 components)
---@field m5 number Matrix second row (4 components)
---@field m9 number Matrix second row (4 components)
---@field m13 number Matrix second row (4 components)
---@field m2 number Matrix third row (4 components)
---@field m6 number Matrix third row (4 components)
---@field m10 number Matrix third row (4 components)
---@field m14 number Matrix third row (4 components)
---@field m3 number Matrix fourth row (4 components)
---@field m7 number Matrix fourth row (4 components)
---@field m11 number Matrix fourth row (4 components)
---@field m15 number Matrix fourth row (4 components)

---@class Raylib.Rectangle
---@field x number Rectangle top-left corner position x
---@field y number Rectangle top-left corner position y
---@field width number Rectangle width
---@field height number Rectangle height

---@class Raylib.Image
---@field data any Image raw data
---@field width integer Image base width
---@field height integer Image base height
---@field mipmaps integer Mipmap levels, 1 by default
---@field format integer Data format (PixelFormat type)

---@class Raylib.Texture
---@field id integer OpenGL texture id
---@field width integer Texture base width
---@field height integer Texture base height
---@field mipmaps integer Mipmap levels, 1 by default
---@field format integer Data format (PixelFormat type)

---@class Raylib.RenderTexture
---@field id integer OpenGL framebuffer object id
---@field texture Raylib.Texture Color buffer attachment texture
---@field depth Raylib.Texture Depth buffer attachment texture

---@class Raylib.NPatchInfo
---@field source Raylib.Rectangle Texture source rectangle
---@field left integer Left border offset
---@field top integer Top border offset
---@field right integer Right border offset
---@field bottom integer Bottom border offset
---@field layout integer Layout of the n-patch: 3x3, 1x3 or 3x1

---@class Raylib.GlyphInfo
---@field value integer Character value (Unicode)
---@field offsetX integer Character offset X when drawing
---@field offsetY integer Character offset Y when drawing
---@field advanceX integer Character advance position X
---@field image Raylib.Image Character image data

---@class Raylib.Camera3D
---@field position Raylib.Vector3 Camera position
---@field target Raylib.Vector3 Camera target it looks-at
---@field up Raylib.Vector3 Camera up vector (rotation over its axis)
---@field fovy number Camera field-of-view aperture in Y (degrees) in perspective, used as near plane width in orthographic
---@field projection integer Camera projection: CAMERA_PERSPECTIVE or CAMERA_ORTHOGRAPHIC

---@class Raylib.Camera2D
---@field offset Raylib.Vector2 Camera offset (displacement from target)
---@field target Raylib.Vector2 Camera target (rotation and zoom origin)
---@field rotation number Camera rotation in degrees
---@field zoom number Camera zoom (scaling), should be 1.0f by default

---@class Raylib.MaterialMap
---@field texture Raylib.Texture2D Material map texture
---@field color Raylib.Color Material map color
---@field value number Material map value

---@class Raylib.Transform
---@field translation Raylib.Vector3 Translation
---@field rotation Raylib.Quaternion Rotation
---@field scale Raylib.Vector3 Scale

---@class Raylib.Ray
---@field position Raylib.Vector3 Ray position (origin)
---@field direction Raylib.Vector3 Ray direction (normalized)

---@class Raylib.RayCollision
---@field hit boolean Did the ray hit something?
---@field distance number Distance to the nearest hit
---@field point Raylib.Vector3 Point of the nearest hit
---@field normal Raylib.Vector3 Surface normal of hit

---@class Raylib.BoundingBox
---@field min Raylib.Vector3 Minimum vertex box-corner
---@field max Raylib.Vector3 Maximum vertex box-corner

---@class Raylib.Wave
---@field frameCount integer Total number of frames (considering channels)
---@field sampleRate integer Frequency (samples per second)
---@field sampleSize integer Bit depth (bits per sample): 8, 16, 32 (24 not supported)
---@field channels integer Number of channels (1-mono, 2-stereo, ...)
---@field data any Buffer data pointer

---@class Raylib.FilePathList
---@field capacity integer Filepaths max entries
---@field count integer Filepaths entries count
---@field paths any Filepaths entries

---@alias Raylib.Quaternion Raylib.Vector4

---@alias Raylib.Texture2D Raylib.Texture

---@alias Raylib.TextureCubemap Raylib.Texture

---@alias Raylib.RenderTexture2D Raylib.RenderTexture

---@alias Raylib.Camera Raylib.Camera3D

---Initialize window and OpenGL context
---@param width integer
---@param height integer
---@param title string
function ray.InitWindow(width, height, title) end

---Close window and unload OpenGL context
function ray.CloseWindow() end

---Check if application should close (KEY_ESCAPE pressed or windows close icon clicked)
---@return boolean
function ray.WindowShouldClose() end

---Check if window has been initialized successfully
---@return boolean
function ray.IsWindowReady() end

---Check if window is currently fullscreen
---@return boolean
function ray.IsWindowFullscreen() end

---Check if window is currently hidden
---@return boolean
function ray.IsWindowHidden() end

---Check if window is currently minimized
---@return boolean
function ray.IsWindowMinimized() end

---Check if window is currently maximized
---@return boolean
function ray.IsWindowMaximized() end

---Check if window is currently focused
---@return boolean
function ray.IsWindowFocused() end

---Check if window has been resized last frame
---@return boolean
function ray.IsWindowResized() end

---Check if one specific window flag is enabled
---@param flag integer
---@return boolean
function ray.IsWindowState(flag) end

---Set window configuration state using flags
---@param flags integer
function ray.SetWindowState(flags) end

---Clear window configuration state flags
---@param flags integer
function ray.ClearWindowState(flags) end

---Toggle window state: fullscreen/windowed, resizes monitor to match window resolution
function ray.ToggleFullscreen() end

---Toggle window state: borderless windowed, resizes window to match monitor resolution
function ray.ToggleBorderlessWindowed() end

---Set window state: maximized, if resizable
function ray.MaximizeWindow() end

---Set window state: minimized, if resizable
function ray.MinimizeWindow() end

---Set window state: not minimized/maximized
function ray.RestoreWindow() end

---Set icon for window (single image, RGBA 32bit)
---@param image Raylib.Image
function ray.SetWindowIcon(image) end

---Set icon for window (multiple images, RGBA 32bit)
---@param images Raylib.Image[]
function ray.SetWindowIcons(images) end

---Set title for window
---@param title string
function ray.SetWindowTitle(title) end

---Set window position on screen
---@param x integer
---@param y integer
function ray.SetWindowPosition(x, y) end

---Set monitor for the current window
---@param monitor integer
function ray.SetWindowMonitor(monitor) end

---Set window minimum dimensions (for FLAG_WINDOW_RESIZABLE)
---@param width integer
---@param height integer
function ray.SetWindowMinSize(width, height) end

---Set window maximum dimensions (for FLAG_WINDOW_RESIZABLE)
---@param width integer
---@param height integer
function ray.SetWindowMaxSize(width, height) end

---Set window dimensions
---@param width integer
---@param height integer
function ray.SetWindowSize(width, height) end

---Set window opacity [0.0f..1.0f]
---@param opacity number
function ray.SetWindowOpacity(opacity) end

---Set window focused
function ray.SetWindowFocused() end

---Get current screen width
---@return integer
function ray.GetScreenWidth() end

---Get current screen height
---@return integer
function ray.GetScreenHeight() end

---Get current render width (it considers HiDPI)
---@return integer
function ray.GetRenderWidth() end

---Get current render height (it considers HiDPI)
---@return integer
function ray.GetRenderHeight() end

---Get number of connected monitors
---@return integer
function ray.GetMonitorCount() end

---Get current monitor where window is placed
---@return integer
function ray.GetCurrentMonitor() end

---Get specified monitor position
---@param monitor integer
---@return Raylib.Vector2
function ray.GetMonitorPosition(monitor) end

---Get specified monitor width (current video mode used by monitor)
---@param monitor integer
---@return integer
function ray.GetMonitorWidth(monitor) end

---Get specified monitor height (current video mode used by monitor)
---@param monitor integer
---@return integer
function ray.GetMonitorHeight(monitor) end

---Get specified monitor physical width in millimetres
---@param monitor integer
---@return integer
function ray.GetMonitorPhysicalWidth(monitor) end

---Get specified monitor physical height in millimetres
---@param monitor integer
---@return integer
function ray.GetMonitorPhysicalHeight(monitor) end

---Get specified monitor refresh rate
---@param monitor integer
---@return integer
function ray.GetMonitorRefreshRate(monitor) end

---Get window position XY on monitor
---@return Raylib.Vector2
function ray.GetWindowPosition() end

---Get window scale DPI factor
---@return Raylib.Vector2
function ray.GetWindowScaleDPI() end

---Get the human-readable, UTF-8 encoded name of the specified monitor
---@param monitor integer
---@return string
function ray.GetMonitorName(monitor) end

---Set clipboard text content
---@param text string
function ray.SetClipboardText(text) end

---Get clipboard text content
---@return string
function ray.GetClipboardText() end

---Get clipboard image content
---@return Raylib.Image
function ray.GetClipboardImage() end

---Enable waiting for events on EndDrawing(), no automatic event polling
function ray.EnableEventWaiting() end

---Disable waiting for events on EndDrawing(), automatic events polling
function ray.DisableEventWaiting() end

---Shows cursor
function ray.ShowCursor() end

---Hides cursor
function ray.HideCursor() end

---Check if cursor is not visible
---@return boolean
function ray.IsCursorHidden() end

---Enables cursor (unlock cursor)
function ray.EnableCursor() end

---Disables cursor (lock cursor)
function ray.DisableCursor() end

---Check if cursor is on the screen
---@return boolean
function ray.IsCursorOnScreen() end

---Set background color (framebuffer clear color)
---@param color Raylib.Color
function ray.ClearBackground(color) end

---Setup canvas (framebuffer) to start drawing
function ray.BeginDrawing() end

---End canvas drawing and swap buffers (double buffering)
function ray.EndDrawing() end

---Begin 2D mode with custom camera (2D)
---@param camera Raylib.Camera2D
function ray.BeginMode2D(camera) end

---Ends 2D mode with custom camera
function ray.EndMode2D() end

---Begin 3D mode with custom camera (3D)
---@param camera Raylib.Camera3D
function ray.BeginMode3D(camera) end

---Ends 3D mode and returns to default 2D orthographic mode
function ray.EndMode3D() end

---Begin drawing to render texture
---@param target Raylib.RenderTexture2D
function ray.BeginTextureMode(target) end

---Ends drawing to render texture
function ray.EndTextureMode() end

---End custom shader drawing (use default shader)
function ray.EndShaderMode() end

---Begin blending mode (alpha, additive, multiplied, subtract, custom)
---@param mode integer
function ray.BeginBlendMode(mode) end

---End blending mode (reset to default: alpha blending)
function ray.EndBlendMode() end

---Begin scissor mode (define screen area for following drawing)
---@param x integer
---@param y integer
---@param width integer
---@param height integer
function ray.BeginScissorMode(x, y, width, height) end

---End scissor mode
function ray.EndScissorMode() end

---End stereo rendering (requires VR simulator)
function ray.EndVrStereoMode() end

---Get a ray trace from screen position (i.e mouse)
---@param position Raylib.Vector2
---@param camera Raylib.Camera
---@return Raylib.Ray
function ray.GetScreenToWorldRay(position, camera) end

---Get a ray trace from screen position (i.e mouse) in a viewport
---@param position Raylib.Vector2
---@param camera Raylib.Camera
---@param width integer
---@param height integer
---@return Raylib.Ray
function ray.GetScreenToWorldRayEx(position, camera, width, height) end

---Get the screen space position for a 3d world space position
---@param position Raylib.Vector3
---@param camera Raylib.Camera
---@return Raylib.Vector2
function ray.GetWorldToScreen(position, camera) end

---Get size position for a 3d world space position
---@param position Raylib.Vector3
---@param camera Raylib.Camera
---@param width integer
---@param height integer
---@return Raylib.Vector2
function ray.GetWorldToScreenEx(position, camera, width, height) end

---Get the screen space position for a 2d camera world space position
---@param position Raylib.Vector2
---@param camera Raylib.Camera2D
---@return Raylib.Vector2
function ray.GetWorldToScreen2D(position, camera) end

---Get the world space position for a 2d camera screen space position
---@param position Raylib.Vector2
---@param camera Raylib.Camera2D
---@return Raylib.Vector2
function ray.GetScreenToWorld2D(position, camera) end

---Get camera transform matrix (view matrix)
---@param camera Raylib.Camera
---@return Raylib.Matrix
function ray.GetCameraMatrix(camera) end

---Get camera 2d transform matrix
---@param camera Raylib.Camera2D
---@return Raylib.Matrix
function ray.GetCameraMatrix2D(camera) end

---Set target FPS (maximum)
---@param fps integer
function ray.SetTargetFPS(fps) end

---Get time in seconds for last frame drawn (delta time)
---@return number
function ray.GetFrameTime() end

---Get elapsed time in seconds since InitWindow()
---@return number
function ray.GetTime() end

---Get current FPS
---@return integer
function ray.GetFPS() end

---Swap back buffer with front buffer (screen drawing)
function ray.SwapScreenBuffer() end

---Register all input events
function ray.PollInputEvents() end

---Wait for some time (halt program execution)
---@param seconds number
function ray.WaitTime(seconds) end

---Set the seed for the random number generator
---@param seed integer
function ray.SetRandomSeed(seed) end

---Get a random value between min and max (both included)
---@param min integer
---@param max integer
---@return integer
function ray.GetRandomValue(min, max) end

---Takes a screenshot of current screen (filename extension defines format)
---@param fileName string
function ray.TakeScreenshot(fileName) end

---Setup init configuration flags (view FLAGS)
---@param flags integer
function ray.SetConfigFlags(flags) end

---Open URL with default system browser (if available)
---@param url string
function ray.OpenURL(url) end

---Set the current threshold (minimum) log level
---@param logLevel integer
function ray.SetTraceLogLevel(logLevel) end

---Load text data from file (read), returns a '\0' terminated string
---@param fileName string
---@return string
function ray.LoadFileText(fileName) end

---Save text data to file (write), string must be '\0' terminated, returns true on success
---@param fileName string
---@param text string
---@return boolean
function ray.SaveFileText(fileName, text) end

---Check if file exists
---@param fileName string
---@return boolean
function ray.FileExists(fileName) end

---Check if a directory path exists
---@param dirPath string
---@return boolean
function ray.DirectoryExists(dirPath) end

---Check file extension (including point: .png, .wav)
---@param fileName string
---@param ext string
---@return boolean
function ray.IsFileExtension(fileName, ext) end

---Get file length in bytes (NOTE: GetFileSize() conflicts with windows.h)
---@param fileName string
---@return integer
function ray.GetFileLength(fileName) end

---Get pointer to extension for a filename string (includes dot: '.png')
---@param fileName string
---@return string
function ray.GetFileExtension(fileName) end

---Get pointer to filename for a path string
---@param filePath string
---@return string
function ray.GetFileName(filePath) end

---Get filename string without extension (uses static string)
---@param filePath string
---@return string
function ray.GetFileNameWithoutExt(filePath) end

---Get full path for a given fileName with path (uses static string)
---@param filePath string
---@return string
function ray.GetDirectoryPath(filePath) end

---Get previous directory path for a given path (uses static string)
---@param dirPath string
---@return string
function ray.GetPrevDirectoryPath(dirPath) end

---Get current working directory (uses static string)
---@return string
function ray.GetWorkingDirectory() end

---Get the directory of the running application (uses static string)
---@return string
function ray.GetApplicationDirectory() end

---Create directories (including full path requested), returns 0 on success
---@param dirPath string
---@return integer
function ray.MakeDirectory(dirPath) end

---Change working directory, return true on success
---@param dir string
---@return boolean
function ray.ChangeDirectory(dir) end

---Check if a given path is a file or a directory
---@param path string
---@return boolean
function ray.IsPathFile(path) end

---Check if fileName is valid for the platform/OS
---@param fileName string
---@return boolean
function ray.IsFileNameValid(fileName) end

---Load directory filepaths
---@param dirPath string
---@return Raylib.FilePathList
function ray.LoadDirectoryFiles(dirPath) end

---Load directory filepaths with extension filtering and recursive directory scan. Use 'DIR' in the filter string to include directories in the result
---@param basePath string
---@param filter string
---@param scanSubdirs boolean
---@return Raylib.FilePathList
function ray.LoadDirectoryFilesEx(basePath, filter, scanSubdirs) end

---Unload filepaths
---@param files Raylib.FilePathList
function ray.UnloadDirectoryFiles(files) end

---Check if a file has been dropped into window
---@return boolean
function ray.IsFileDropped() end

---Load dropped filepaths
---@return Raylib.FilePathList
function ray.LoadDroppedFiles() end

---Unload dropped filepaths
---@param files Raylib.FilePathList
function ray.UnloadDroppedFiles(files) end

---Get file modification time (last write time)
---@param fileName string
---@return integer
function ray.GetFileModTime(fileName) end

---Set automation event internal base frame to start recording
---@param frame integer
function ray.SetAutomationEventBaseFrame(frame) end

---Start recording automation events (AutomationEventList must be set)
function ray.StartAutomationEventRecording() end

---Stop recording automation events
function ray.StopAutomationEventRecording() end

---Check if a key has been pressed once
---@param key integer
---@return boolean
function ray.IsKeyPressed(key) end

---Check if a key has been pressed again
---@param key integer
---@return boolean
function ray.IsKeyPressedRepeat(key) end

---Check if a key is being pressed
---@param key integer
---@return boolean
function ray.IsKeyDown(key) end

---Check if a key has been released once
---@param key integer
---@return boolean
function ray.IsKeyReleased(key) end

---Check if a key is NOT being pressed
---@param key integer
---@return boolean
function ray.IsKeyUp(key) end

---Get key pressed (keycode), call it multiple times for keys queued, returns 0 when the queue is empty
---@return integer
function ray.GetKeyPressed() end

---Get char pressed (unicode), call it multiple times for chars queued, returns 0 when the queue is empty
---@return integer
function ray.GetCharPressed() end

---Set a custom key to exit program (default is ESC)
---@param key integer
function ray.SetExitKey(key) end

---Check if a gamepad is available
---@param gamepad integer
---@return boolean
function ray.IsGamepadAvailable(gamepad) end

---Get gamepad internal name id
---@param gamepad integer
---@return string
function ray.GetGamepadName(gamepad) end

---Check if a gamepad button has been pressed once
---@param gamepad integer
---@param button integer
---@return boolean
function ray.IsGamepadButtonPressed(gamepad, button) end

---Check if a gamepad button is being pressed
---@param gamepad integer
---@param button integer
---@return boolean
function ray.IsGamepadButtonDown(gamepad, button) end

---Check if a gamepad button has been released once
---@param gamepad integer
---@param button integer
---@return boolean
function ray.IsGamepadButtonReleased(gamepad, button) end

---Check if a gamepad button is NOT being pressed
---@param gamepad integer
---@param button integer
---@return boolean
function ray.IsGamepadButtonUp(gamepad, button) end

---Get the last gamepad button pressed
---@return integer
function ray.GetGamepadButtonPressed() end

---Get gamepad axis count for a gamepad
---@param gamepad integer
---@return integer
function ray.GetGamepadAxisCount(gamepad) end

---Get axis movement value for a gamepad axis
---@param gamepad integer
---@param axis integer
---@return number
function ray.GetGamepadAxisMovement(gamepad, axis) end

---Set internal gamepad mappings (SDL_GameControllerDB)
---@param mappings string
---@return integer
function ray.SetGamepadMappings(mappings) end

---Set gamepad vibration for both motors (duration in seconds)
---@param gamepad integer
---@param leftMotor number
---@param rightMotor number
---@param duration number
function ray.SetGamepadVibration(gamepad, leftMotor, rightMotor, duration) end

---Check if a mouse button has been pressed once
---@param button integer
---@return boolean
function ray.IsMouseButtonPressed(button) end

---Check if a mouse button is being pressed
---@param button integer
---@return boolean
function ray.IsMouseButtonDown(button) end

---Check if a mouse button has been released once
---@param button integer
---@return boolean
function ray.IsMouseButtonReleased(button) end

---Check if a mouse button is NOT being pressed
---@param button integer
---@return boolean
function ray.IsMouseButtonUp(button) end

---Get mouse position X
---@return integer
function ray.GetMouseX() end

---Get mouse position Y
---@return integer
function ray.GetMouseY() end

---Get mouse position XY
---@return Raylib.Vector2
function ray.GetMousePosition() end

---Get mouse delta between frames
---@return Raylib.Vector2
function ray.GetMouseDelta() end

---Set mouse position XY
---@param x integer
---@param y integer
function ray.SetMousePosition(x, y) end

---Set mouse offset
---@param offsetX integer
---@param offsetY integer
function ray.SetMouseOffset(offsetX, offsetY) end

---Set mouse scaling
---@param scaleX number
---@param scaleY number
function ray.SetMouseScale(scaleX, scaleY) end

---Get mouse wheel movement for X or Y, whichever is larger
---@return number
function ray.GetMouseWheelMove() end

---Get mouse wheel movement for both X and Y
---@return Raylib.Vector2
function ray.GetMouseWheelMoveV() end

---Set mouse cursor
---@param cursor integer
function ray.SetMouseCursor(cursor) end

---Get touch position X for touch point 0 (relative to screen size)
---@return integer
function ray.GetTouchX() end

---Get touch position Y for touch point 0 (relative to screen size)
---@return integer
function ray.GetTouchY() end

---Get touch position XY for a touch point index (relative to screen size)
---@param index integer
---@return Raylib.Vector2
function ray.GetTouchPosition(index) end

---Get touch point identifier for given index
---@param index integer
---@return integer
function ray.GetTouchPointId(index) end

---Get number of touch points
---@return integer
function ray.GetTouchPointCount() end

---Enable a set of gestures using flags
---@param flags integer
function ray.SetGesturesEnabled(flags) end

---Check if a gesture have been detected
---@param gesture integer
---@return boolean
function ray.IsGestureDetected(gesture) end

---Get gesture hold time in seconds
---@return number
function ray.GetGestureHoldDuration() end

---Get gesture drag vector
---@return Raylib.Vector2
function ray.GetGestureDragVector() end

---Get gesture drag angle
---@return number
function ray.GetGestureDragAngle() end

---Get gesture pinch delta
---@return Raylib.Vector2
function ray.GetGesturePinchVector() end

---Get gesture pinch angle
---@return number
function ray.GetGesturePinchAngle() end

---Set texture and rectangle to be used on shapes drawing
---@param texture Raylib.Texture2D
---@param source Raylib.Rectangle
function ray.SetShapesTexture(texture, source) end

---Get texture that is used for shapes drawing
---@return Raylib.Texture2D
function ray.GetShapesTexture() end

---Get texture source rectangle that is used for shapes drawing
---@return Raylib.Rectangle
function ray.GetShapesTextureRectangle() end

---Draw a pixel using geometry [Can be slow, use with care]
---@param posX integer
---@param posY integer
---@param color Raylib.Color
function ray.DrawPixel(posX, posY, color) end

---Draw a pixel using geometry (Vector version) [Can be slow, use with care]
---@param position Raylib.Vector2
---@param color Raylib.Color
function ray.DrawPixelV(position, color) end

---Draw a line
---@param startPosX integer
---@param startPosY integer
---@param endPosX integer
---@param endPosY integer
---@param color Raylib.Color
function ray.DrawLine(startPosX, startPosY, endPosX, endPosY, color) end

---Draw a line (using gl lines)
---@param startPos Raylib.Vector2
---@param endPos Raylib.Vector2
---@param color Raylib.Color
function ray.DrawLineV(startPos, endPos, color) end

---Draw a line (using triangles/quads)
---@param startPos Raylib.Vector2
---@param endPos Raylib.Vector2
---@param thick number
---@param color Raylib.Color
function ray.DrawLineEx(startPos, endPos, thick, color) end

---Draw lines sequence (using gl lines)
---@param points Raylib.Vector2[]
---@param color Raylib.Color
function ray.DrawLineStrip(points, color) end

---Draw line segment cubic-bezier in-out interpolation
---@param startPos Raylib.Vector2
---@param endPos Raylib.Vector2
---@param thick number
---@param color Raylib.Color
function ray.DrawLineBezier(startPos, endPos, thick, color) end

---Draw a color-filled circle
---@param centerX integer
---@param centerY integer
---@param radius number
---@param color Raylib.Color
function ray.DrawCircle(centerX, centerY, radius, color) end

---Draw a piece of a circle
---@param center Raylib.Vector2
---@param radius number
---@param startAngle number
---@param endAngle number
---@param segments integer
---@param color Raylib.Color
function ray.DrawCircleSector(center, radius, startAngle, endAngle, segments, color) end

---Draw circle sector outline
---@param center Raylib.Vector2
---@param radius number
---@param startAngle number
---@param endAngle number
---@param segments integer
---@param color Raylib.Color
function ray.DrawCircleSectorLines(center, radius, startAngle, endAngle, segments, color) end

---Draw a gradient-filled circle
---@param centerX integer
---@param centerY integer
---@param radius number
---@param inner Raylib.Color
---@param outer Raylib.Color
function ray.DrawCircleGradient(centerX, centerY, radius, inner, outer) end

---Draw a color-filled circle (Vector version)
---@param center Raylib.Vector2
---@param radius number
---@param color Raylib.Color
function ray.DrawCircleV(center, radius, color) end

---Draw circle outline
---@param centerX integer
---@param centerY integer
---@param radius number
---@param color Raylib.Color
function ray.DrawCircleLines(centerX, centerY, radius, color) end

---Draw circle outline (Vector version)
---@param center Raylib.Vector2
---@param radius number
---@param color Raylib.Color
function ray.DrawCircleLinesV(center, radius, color) end

---Draw ellipse
---@param centerX integer
---@param centerY integer
---@param radiusH number
---@param radiusV number
---@param color Raylib.Color
function ray.DrawEllipse(centerX, centerY, radiusH, radiusV, color) end

---Draw ellipse outline
---@param centerX integer
---@param centerY integer
---@param radiusH number
---@param radiusV number
---@param color Raylib.Color
function ray.DrawEllipseLines(centerX, centerY, radiusH, radiusV, color) end

---Draw ring
---@param center Raylib.Vector2
---@param innerRadius number
---@param outerRadius number
---@param startAngle number
---@param endAngle number
---@param segments integer
---@param color Raylib.Color
function ray.DrawRing(center, innerRadius, outerRadius, startAngle, endAngle, segments, color) end

---Draw ring outline
---@param center Raylib.Vector2
---@param innerRadius number
---@param outerRadius number
---@param startAngle number
---@param endAngle number
---@param segments integer
---@param color Raylib.Color
function ray.DrawRingLines(center, innerRadius, outerRadius, startAngle, endAngle, segments, color) end

---Draw a color-filled rectangle
---@param posX integer
---@param posY integer
---@param width integer
---@param height integer
---@param color Raylib.Color
function ray.DrawRectangle(posX, posY, width, height, color) end

---Draw a color-filled rectangle (Vector version)
---@param position Raylib.Vector2
---@param size Raylib.Vector2
---@param color Raylib.Color
function ray.DrawRectangleV(position, size, color) end

---Draw a color-filled rectangle
---@param rec Raylib.Rectangle
---@param color Raylib.Color
function ray.DrawRectangleRec(rec, color) end

---Draw a color-filled rectangle with pro parameters
---@param rec Raylib.Rectangle
---@param origin Raylib.Vector2
---@param rotation number
---@param color Raylib.Color
function ray.DrawRectanglePro(rec, origin, rotation, color) end

---Draw a vertical-gradient-filled rectangle
---@param posX integer
---@param posY integer
---@param width integer
---@param height integer
---@param top Raylib.Color
---@param bottom Raylib.Color
function ray.DrawRectangleGradientV(posX, posY, width, height, top, bottom) end

---Draw a horizontal-gradient-filled rectangle
---@param posX integer
---@param posY integer
---@param width integer
---@param height integer
---@param left Raylib.Color
---@param right Raylib.Color
function ray.DrawRectangleGradientH(posX, posY, width, height, left, right) end

---Draw a gradient-filled rectangle with custom vertex colors
---@param rec Raylib.Rectangle
---@param topLeft Raylib.Color
---@param bottomLeft Raylib.Color
---@param topRight Raylib.Color
---@param bottomRight Raylib.Color
function ray.DrawRectangleGradientEx(rec, topLeft, bottomLeft, topRight, bottomRight) end

---Draw rectangle outline
---@param posX integer
---@param posY integer
---@param width integer
---@param height integer
---@param color Raylib.Color
function ray.DrawRectangleLines(posX, posY, width, height, color) end

---Draw rectangle outline with extended parameters
---@param rec Raylib.Rectangle
---@param lineThick number
---@param color Raylib.Color
function ray.DrawRectangleLinesEx(rec, lineThick, color) end

---Draw rectangle with rounded edges
---@param rec Raylib.Rectangle
---@param roundness number
---@param segments integer
---@param color Raylib.Color
function ray.DrawRectangleRounded(rec, roundness, segments, color) end

---Draw rectangle lines with rounded edges
---@param rec Raylib.Rectangle
---@param roundness number
---@param segments integer
---@param color Raylib.Color
function ray.DrawRectangleRoundedLines(rec, roundness, segments, color) end

---Draw rectangle with rounded edges outline
---@param rec Raylib.Rectangle
---@param roundness number
---@param segments integer
---@param lineThick number
---@param color Raylib.Color
function ray.DrawRectangleRoundedLinesEx(rec, roundness, segments, lineThick, color) end

---Draw a color-filled triangle (vertex in counter-clockwise order!)
---@param v1 Raylib.Vector2
---@param v2 Raylib.Vector2
---@param v3 Raylib.Vector2
---@param color Raylib.Color
function ray.DrawTriangle(v1, v2, v3, color) end

---Draw triangle outline (vertex in counter-clockwise order!)
---@param v1 Raylib.Vector2
---@param v2 Raylib.Vector2
---@param v3 Raylib.Vector2
---@param color Raylib.Color
function ray.DrawTriangleLines(v1, v2, v3, color) end

---Draw a triangle fan defined by points (first vertex is the center)
---@param points Raylib.Vector2[]
---@param color Raylib.Color
function ray.DrawTriangleFan(points, color) end

---Draw a triangle strip defined by points
---@param points Raylib.Vector2[]
---@param color Raylib.Color
function ray.DrawTriangleStrip(points, color) end

---Draw a regular polygon (Vector version)
---@param center Raylib.Vector2
---@param sides integer
---@param radius number
---@param rotation number
---@param color Raylib.Color
function ray.DrawPoly(center, sides, radius, rotation, color) end

---Draw a polygon outline of n sides
---@param center Raylib.Vector2
---@param sides integer
---@param radius number
---@param rotation number
---@param color Raylib.Color
function ray.DrawPolyLines(center, sides, radius, rotation, color) end

---Draw a polygon outline of n sides with extended parameters
---@param center Raylib.Vector2
---@param sides integer
---@param radius number
---@param rotation number
---@param lineThick number
---@param color Raylib.Color
function ray.DrawPolyLinesEx(center, sides, radius, rotation, lineThick, color) end

---Draw spline: Linear, minimum 2 points
---@param points Raylib.Vector2[]
---@param thick number
---@param color Raylib.Color
function ray.DrawSplineLinear(points, thick, color) end

---Draw spline: B-Spline, minimum 4 points
---@param points Raylib.Vector2[]
---@param thick number
---@param color Raylib.Color
function ray.DrawSplineBasis(points, thick, color) end

---Draw spline: Catmull-Rom, minimum 4 points
---@param points Raylib.Vector2[]
---@param thick number
---@param color Raylib.Color
function ray.DrawSplineCatmullRom(points, thick, color) end

---Draw spline: Quadratic Bezier, minimum 3 points (1 control point): [p1, c2, p3, c4...]
---@param points Raylib.Vector2[]
---@param thick number
---@param color Raylib.Color
function ray.DrawSplineBezierQuadratic(points, thick, color) end

---Draw spline: Cubic Bezier, minimum 4 points (2 control points): [p1, c2, c3, p4, c5, c6...]
---@param points Raylib.Vector2[]
---@param thick number
---@param color Raylib.Color
function ray.DrawSplineBezierCubic(points, thick, color) end

---Draw spline segment: Linear, 2 points
---@param p1 Raylib.Vector2
---@param p2 Raylib.Vector2
---@param thick number
---@param color Raylib.Color
function ray.DrawSplineSegmentLinear(p1, p2, thick, color) end

---Draw spline segment: B-Spline, 4 points
---@param p1 Raylib.Vector2
---@param p2 Raylib.Vector2
---@param p3 Raylib.Vector2
---@param p4 Raylib.Vector2
---@param thick number
---@param color Raylib.Color
function ray.DrawSplineSegmentBasis(p1, p2, p3, p4, thick, color) end

---Draw spline segment: Catmull-Rom, 4 points
---@param p1 Raylib.Vector2
---@param p2 Raylib.Vector2
---@param p3 Raylib.Vector2
---@param p4 Raylib.Vector2
---@param thick number
---@param color Raylib.Color
function ray.DrawSplineSegmentCatmullRom(p1, p2, p3, p4, thick, color) end

---Draw spline segment: Quadratic Bezier, 2 points, 1 control point
---@param p1 Raylib.Vector2
---@param c2 Raylib.Vector2
---@param p3 Raylib.Vector2
---@param thick number
---@param color Raylib.Color
function ray.DrawSplineSegmentBezierQuadratic(p1, c2, p3, thick, color) end

---Draw spline segment: Cubic Bezier, 2 points, 2 control points
---@param p1 Raylib.Vector2
---@param c2 Raylib.Vector2
---@param c3 Raylib.Vector2
---@param p4 Raylib.Vector2
---@param thick number
---@param color Raylib.Color
function ray.DrawSplineSegmentBezierCubic(p1, c2, c3, p4, thick, color) end

---Get (evaluate) spline point: Linear
---@param startPos Raylib.Vector2
---@param endPos Raylib.Vector2
---@param t number
---@return Raylib.Vector2
function ray.GetSplinePointLinear(startPos, endPos, t) end

---Get (evaluate) spline point: B-Spline
---@param p1 Raylib.Vector2
---@param p2 Raylib.Vector2
---@param p3 Raylib.Vector2
---@param p4 Raylib.Vector2
---@param t number
---@return Raylib.Vector2
function ray.GetSplinePointBasis(p1, p2, p3, p4, t) end

---Get (evaluate) spline point: Catmull-Rom
---@param p1 Raylib.Vector2
---@param p2 Raylib.Vector2
---@param p3 Raylib.Vector2
---@param p4 Raylib.Vector2
---@param t number
---@return Raylib.Vector2
function ray.GetSplinePointCatmullRom(p1, p2, p3, p4, t) end

---Get (evaluate) spline point: Quadratic Bezier
---@param p1 Raylib.Vector2
---@param c2 Raylib.Vector2
---@param p3 Raylib.Vector2
---@param t number
---@return Raylib.Vector2
function ray.GetSplinePointBezierQuad(p1, c2, p3, t) end

---Get (evaluate) spline point: Cubic Bezier
---@param p1 Raylib.Vector2
---@param c2 Raylib.Vector2
---@param c3 Raylib.Vector2
---@param p4 Raylib.Vector2
---@param t number
---@return Raylib.Vector2
function ray.GetSplinePointBezierCubic(p1, c2, c3, p4, t) end

---Check collision between two rectangles
---@param rec1 Raylib.Rectangle
---@param rec2 Raylib.Rectangle
---@return boolean
function ray.CheckCollisionRecs(rec1, rec2) end

---Check collision between two circles
---@param center1 Raylib.Vector2
---@param radius1 number
---@param center2 Raylib.Vector2
---@param radius2 number
---@return boolean
function ray.CheckCollisionCircles(center1, radius1, center2, radius2) end

---Check collision between circle and rectangle
---@param center Raylib.Vector2
---@param radius number
---@param rec Raylib.Rectangle
---@return boolean
function ray.CheckCollisionCircleRec(center, radius, rec) end

---Check if circle collides with a line created betweeen two points [p1] and [p2]
---@param center Raylib.Vector2
---@param radius number
---@param p1 Raylib.Vector2
---@param p2 Raylib.Vector2
---@return boolean
function ray.CheckCollisionCircleLine(center, radius, p1, p2) end

---Check if point is inside rectangle
---@param point Raylib.Vector2
---@param rec Raylib.Rectangle
---@return boolean
function ray.CheckCollisionPointRec(point, rec) end

---Check if point is inside circle
---@param point Raylib.Vector2
---@param center Raylib.Vector2
---@param radius number
---@return boolean
function ray.CheckCollisionPointCircle(point, center, radius) end

---Check if point is inside a triangle
---@param point Raylib.Vector2
---@param p1 Raylib.Vector2
---@param p2 Raylib.Vector2
---@param p3 Raylib.Vector2
---@return boolean
function ray.CheckCollisionPointTriangle(point, p1, p2, p3) end

---Check if point belongs to line created between two points [p1] and [p2] with defined margin in pixels [threshold]
---@param point Raylib.Vector2
---@param p1 Raylib.Vector2
---@param p2 Raylib.Vector2
---@param threshold integer
---@return boolean
function ray.CheckCollisionPointLine(point, p1, p2, threshold) end

---Check if point is within a polygon described by array of vertices
---@param point Raylib.Vector2
---@param points Raylib.Vector2[]
---@return boolean
function ray.CheckCollisionPointPoly(point, points) end

---Check the collision between two lines defined by two points each, returns collision point by reference
---@param startPos1 Raylib.Vector2
---@param endPos1 Raylib.Vector2
---@param startPos2 Raylib.Vector2
---@param endPos2 Raylib.Vector2
---@param collisionPoint Raylib.Vector2
---@return boolean
function ray.CheckCollisionLines(startPos1, endPos1, startPos2, endPos2, collisionPoint) end

---Get collision rectangle for two rectangles collision
---@param rec1 Raylib.Rectangle
---@param rec2 Raylib.Rectangle
---@return Raylib.Rectangle
function ray.GetCollisionRec(rec1, rec2) end

---Load image from file into CPU memory (RAM)
---@param fileName string
---@return Raylib.Image
function ray.LoadImage(fileName) end

---Load image from GPU texture data
---@param texture Raylib.Texture2D
---@return Raylib.Image
function ray.LoadImageFromTexture(texture) end

---Load image from screen buffer and (screenshot)
---@return Raylib.Image
function ray.LoadImageFromScreen() end

---Check if an image is valid (data and parameters)
---@param image Raylib.Image
---@return boolean
function ray.IsImageValid(image) end

---Unload image from CPU memory (RAM)
---@param image Raylib.Image
function ray.UnloadImage(image) end

---Export image data to file, returns true on success
---@param image Raylib.Image
---@param fileName string
---@return boolean
function ray.ExportImage(image, fileName) end

---Export image as code file defining an array of bytes, returns true on success
---@param image Raylib.Image
---@param fileName string
---@return boolean
function ray.ExportImageAsCode(image, fileName) end

---Generate image: plain color
---@param width integer
---@param height integer
---@param color Raylib.Color
---@return Raylib.Image
function ray.GenImageColor(width, height, color) end

---Generate image: linear gradient, direction in degrees [0..360], 0=Vertical gradient
---@param width integer
---@param height integer
---@param direction integer
---@param start Raylib.Color
---@param finish Raylib.Color
---@return Raylib.Image
function ray.GenImageGradientLinear(width, height, direction, start, finish) end

---Generate image: radial gradient
---@param width integer
---@param height integer
---@param density number
---@param inner Raylib.Color
---@param outer Raylib.Color
---@return Raylib.Image
function ray.GenImageGradientRadial(width, height, density, inner, outer) end

---Generate image: square gradient
---@param width integer
---@param height integer
---@param density number
---@param inner Raylib.Color
---@param outer Raylib.Color
---@return Raylib.Image
function ray.GenImageGradientSquare(width, height, density, inner, outer) end

---Generate image: checked
---@param width integer
---@param height integer
---@param checksX integer
---@param checksY integer
---@param col1 Raylib.Color
---@param col2 Raylib.Color
---@return Raylib.Image
function ray.GenImageChecked(width, height, checksX, checksY, col1, col2) end

---Generate image: white noise
---@param width integer
---@param height integer
---@param factor number
---@return Raylib.Image
function ray.GenImageWhiteNoise(width, height, factor) end

---Generate image: perlin noise
---@param width integer
---@param height integer
---@param offsetX integer
---@param offsetY integer
---@param scale number
---@return Raylib.Image
function ray.GenImagePerlinNoise(width, height, offsetX, offsetY, scale) end

---Generate image: cellular algorithm, bigger tileSize means bigger cells
---@param width integer
---@param height integer
---@param tileSize integer
---@return Raylib.Image
function ray.GenImageCellular(width, height, tileSize) end

---Generate image: grayscale image from text data
---@param width integer
---@param height integer
---@param text string
---@return Raylib.Image
function ray.GenImageText(width, height, text) end

---Create an image duplicate (useful for transformations)
---@param image Raylib.Image
---@return Raylib.Image
function ray.ImageCopy(image) end

---Create an image from another image piece
---@param image Raylib.Image
---@param rec Raylib.Rectangle
---@return Raylib.Image
function ray.ImageFromImage(image, rec) end

---Create an image from a selected channel of another image (GRAYSCALE)
---@param image Raylib.Image
---@param selectedChannel integer
---@return Raylib.Image
function ray.ImageFromChannel(image, selectedChannel) end

---Create an image from text (default font)
---@param text string
---@param fontSize integer
---@param color Raylib.Color
---@return Raylib.Image
function ray.ImageText(text, fontSize, color) end

---Convert image data to desired format
---@param image Raylib.Image
---@param newFormat integer
function ray.ImageFormat(image, newFormat) end

---Convert image to POT (power-of-two)
---@param image Raylib.Image
---@param fill Raylib.Color
function ray.ImageToPOT(image, fill) end

---Crop an image to a defined rectangle
---@param image Raylib.Image
---@param crop Raylib.Rectangle
function ray.ImageCrop(image, crop) end

---Crop image depending on alpha value
---@param image Raylib.Image
---@param threshold number
function ray.ImageAlphaCrop(image, threshold) end

---Clear alpha channel to desired color
---@param image Raylib.Image
---@param color Raylib.Color
---@param threshold number
function ray.ImageAlphaClear(image, color, threshold) end

---Apply alpha mask to image
---@param image Raylib.Image
---@param alphaMask Raylib.Image
function ray.ImageAlphaMask(image, alphaMask) end

---Premultiply alpha channel
---@param image Raylib.Image
function ray.ImageAlphaPremultiply(image) end

---Apply Gaussian blur using a box blur approximation
---@param image Raylib.Image
---@param blurSize integer
function ray.ImageBlurGaussian(image, blurSize) end

---Resize image (Bicubic scaling algorithm)
---@param image Raylib.Image
---@param newWidth integer
---@param newHeight integer
function ray.ImageResize(image, newWidth, newHeight) end

---Resize image (Nearest-Neighbor scaling algorithm)
---@param image Raylib.Image
---@param newWidth integer
---@param newHeight integer
function ray.ImageResizeNN(image, newWidth, newHeight) end

---Resize canvas and fill with color
---@param image Raylib.Image
---@param newWidth integer
---@param newHeight integer
---@param offsetX integer
---@param offsetY integer
---@param fill Raylib.Color
function ray.ImageResizeCanvas(image, newWidth, newHeight, offsetX, offsetY, fill) end

---Compute all mipmap levels for a provided image
---@param image Raylib.Image
function ray.ImageMipmaps(image) end

---Dither image data to 16bpp or lower (Floyd-Steinberg dithering)
---@param image Raylib.Image
---@param rBpp integer
---@param gBpp integer
---@param bBpp integer
---@param aBpp integer
function ray.ImageDither(image, rBpp, gBpp, bBpp, aBpp) end

---Flip image vertically
---@param image Raylib.Image
function ray.ImageFlipVertical(image) end

---Flip image horizontally
---@param image Raylib.Image
function ray.ImageFlipHorizontal(image) end

---Rotate image by input angle in degrees (-359 to 359)
---@param image Raylib.Image
---@param degrees integer
function ray.ImageRotate(image, degrees) end

---Rotate image clockwise 90deg
---@param image Raylib.Image
function ray.ImageRotateCW(image) end

---Rotate image counter-clockwise 90deg
---@param image Raylib.Image
function ray.ImageRotateCCW(image) end

---Modify image color: tint
---@param image Raylib.Image
---@param color Raylib.Color
function ray.ImageColorTint(image, color) end

---Modify image color: invert
---@param image Raylib.Image
function ray.ImageColorInvert(image) end

---Modify image color: grayscale
---@param image Raylib.Image
function ray.ImageColorGrayscale(image) end

---Modify image color: contrast (-100 to 100)
---@param image Raylib.Image
---@param contrast number
function ray.ImageColorContrast(image, contrast) end

---Modify image color: brightness (-255 to 255)
---@param image Raylib.Image
---@param brightness integer
function ray.ImageColorBrightness(image, brightness) end

---Modify image color: replace color
---@param image Raylib.Image
---@param color Raylib.Color
---@param replace Raylib.Color
function ray.ImageColorReplace(image, color, replace) end

---Get image alpha border rectangle
---@param image Raylib.Image
---@param threshold number
---@return Raylib.Rectangle
function ray.GetImageAlphaBorder(image, threshold) end

---Get image pixel color at (x, y) position
---@param image Raylib.Image
---@param x integer
---@param y integer
---@return Raylib.Color
function ray.GetImageColor(image, x, y) end

---Clear image background with given color
---@param dst Raylib.Image
---@param color Raylib.Color
function ray.ImageClearBackground(dst, color) end

---Draw pixel within an image
---@param dst Raylib.Image
---@param posX integer
---@param posY integer
---@param color Raylib.Color
function ray.ImageDrawPixel(dst, posX, posY, color) end

---Draw pixel within an image (Vector version)
---@param dst Raylib.Image
---@param position Raylib.Vector2
---@param color Raylib.Color
function ray.ImageDrawPixelV(dst, position, color) end

---Draw line within an image
---@param dst Raylib.Image
---@param startPosX integer
---@param startPosY integer
---@param endPosX integer
---@param endPosY integer
---@param color Raylib.Color
function ray.ImageDrawLine(dst, startPosX, startPosY, endPosX, endPosY, color) end

---Draw line within an image (Vector version)
---@param dst Raylib.Image
---@param start Raylib.Vector2
---@param finish Raylib.Vector2
---@param color Raylib.Color
function ray.ImageDrawLineV(dst, start, finish, color) end

---Draw a line defining thickness within an image
---@param dst Raylib.Image
---@param start Raylib.Vector2
---@param finish Raylib.Vector2
---@param thick integer
---@param color Raylib.Color
function ray.ImageDrawLineEx(dst, start, finish, thick, color) end

---Draw a filled circle within an image
---@param dst Raylib.Image
---@param centerX integer
---@param centerY integer
---@param radius integer
---@param color Raylib.Color
function ray.ImageDrawCircle(dst, centerX, centerY, radius, color) end

---Draw a filled circle within an image (Vector version)
---@param dst Raylib.Image
---@param center Raylib.Vector2
---@param radius integer
---@param color Raylib.Color
function ray.ImageDrawCircleV(dst, center, radius, color) end

---Draw circle outline within an image
---@param dst Raylib.Image
---@param centerX integer
---@param centerY integer
---@param radius integer
---@param color Raylib.Color
function ray.ImageDrawCircleLines(dst, centerX, centerY, radius, color) end

---Draw circle outline within an image (Vector version)
---@param dst Raylib.Image
---@param center Raylib.Vector2
---@param radius integer
---@param color Raylib.Color
function ray.ImageDrawCircleLinesV(dst, center, radius, color) end

---Draw rectangle within an image
---@param dst Raylib.Image
---@param posX integer
---@param posY integer
---@param width integer
---@param height integer
---@param color Raylib.Color
function ray.ImageDrawRectangle(dst, posX, posY, width, height, color) end

---Draw rectangle within an image (Vector version)
---@param dst Raylib.Image
---@param position Raylib.Vector2
---@param size Raylib.Vector2
---@param color Raylib.Color
function ray.ImageDrawRectangleV(dst, position, size, color) end

---Draw rectangle within an image
---@param dst Raylib.Image
---@param rec Raylib.Rectangle
---@param color Raylib.Color
function ray.ImageDrawRectangleRec(dst, rec, color) end

---Draw rectangle lines within an image
---@param dst Raylib.Image
---@param rec Raylib.Rectangle
---@param thick integer
---@param color Raylib.Color
function ray.ImageDrawRectangleLines(dst, rec, thick, color) end

---Draw triangle within an image
---@param dst Raylib.Image
---@param v1 Raylib.Vector2
---@param v2 Raylib.Vector2
---@param v3 Raylib.Vector2
---@param color Raylib.Color
function ray.ImageDrawTriangle(dst, v1, v2, v3, color) end

---Draw triangle with interpolated colors within an image
---@param dst Raylib.Image
---@param v1 Raylib.Vector2
---@param v2 Raylib.Vector2
---@param v3 Raylib.Vector2
---@param c1 Raylib.Color
---@param c2 Raylib.Color
---@param c3 Raylib.Color
function ray.ImageDrawTriangleEx(dst, v1, v2, v3, c1, c2, c3) end

---Draw triangle outline within an image
---@param dst Raylib.Image
---@param v1 Raylib.Vector2
---@param v2 Raylib.Vector2
---@param v3 Raylib.Vector2
---@param color Raylib.Color
function ray.ImageDrawTriangleLines(dst, v1, v2, v3, color) end

---Draw a triangle fan defined by points within an image (first vertex is the center)
---@param dst Raylib.Image
---@param points Raylib.Vector2[]
---@param color Raylib.Color
function ray.ImageDrawTriangleFan(dst, points, color) end

---Draw a triangle strip defined by points within an image
---@param dst Raylib.Image
---@param points Raylib.Vector2[]
---@param color Raylib.Color
function ray.ImageDrawTriangleStrip(dst, points, color) end

---Draw a source image within a destination image (tint applied to source)
---@param dst Raylib.Image
---@param src Raylib.Image
---@param srcRec Raylib.Rectangle
---@param dstRec Raylib.Rectangle
---@param tint Raylib.Color
function ray.ImageDraw(dst, src, srcRec, dstRec, tint) end

---Draw text (using default font) within an image (destination)
---@param dst Raylib.Image
---@param text string
---@param posX integer
---@param posY integer
---@param fontSize integer
---@param color Raylib.Color
function ray.ImageDrawText(dst, text, posX, posY, fontSize, color) end

---Load texture from file into GPU memory (VRAM)
---@param fileName string
---@return Raylib.Texture2D
function ray.LoadTexture(fileName) end

---Load texture from image data
---@param image Raylib.Image
---@return Raylib.Texture2D
function ray.LoadTextureFromImage(image) end

---Load cubemap from image, multiple image cubemap layouts supported
---@param image Raylib.Image
---@param layout integer
---@return Raylib.TextureCubemap
function ray.LoadTextureCubemap(image, layout) end

---Load texture for rendering (framebuffer)
---@param width integer
---@param height integer
---@return Raylib.RenderTexture2D
function ray.LoadRenderTexture(width, height) end

---Check if a texture is valid (loaded in GPU)
---@param texture Raylib.Texture2D
---@return boolean
function ray.IsTextureValid(texture) end

---Unload texture from GPU memory (VRAM)
---@param texture Raylib.Texture2D
function ray.UnloadTexture(texture) end

---Check if a render texture is valid (loaded in GPU)
---@param target Raylib.RenderTexture2D
---@return boolean
function ray.IsRenderTextureValid(target) end

---Unload render texture from GPU memory (VRAM)
---@param target Raylib.RenderTexture2D
function ray.UnloadRenderTexture(target) end

---Set texture scaling filter mode
---@param texture Raylib.Texture2D
---@param filter integer
function ray.SetTextureFilter(texture, filter) end

---Set texture wrapping mode
---@param texture Raylib.Texture2D
---@param wrap integer
function ray.SetTextureWrap(texture, wrap) end

---Draw a Texture2D
---@param texture Raylib.Texture2D
---@param posX integer
---@param posY integer
---@param tint Raylib.Color
function ray.DrawTexture(texture, posX, posY, tint) end

---Draw a Texture2D with position defined as Vector2
---@param texture Raylib.Texture2D
---@param position Raylib.Vector2
---@param tint Raylib.Color
function ray.DrawTextureV(texture, position, tint) end

---Draw a Texture2D with extended parameters
---@param texture Raylib.Texture2D
---@param position Raylib.Vector2
---@param rotation number
---@param scale number
---@param tint Raylib.Color
function ray.DrawTextureEx(texture, position, rotation, scale, tint) end

---Draw a part of a texture defined by a rectangle
---@param texture Raylib.Texture2D
---@param source Raylib.Rectangle
---@param position Raylib.Vector2
---@param tint Raylib.Color
function ray.DrawTextureRec(texture, source, position, tint) end

---Draw a part of a texture defined by a rectangle with 'pro' parameters
---@param texture Raylib.Texture2D
---@param source Raylib.Rectangle
---@param dest Raylib.Rectangle
---@param origin Raylib.Vector2
---@param rotation number
---@param tint Raylib.Color
function ray.DrawTexturePro(texture, source, dest, origin, rotation, tint) end

---Draws a texture (or part of it) that stretches or shrinks nicely
---@param texture Raylib.Texture2D
---@param nPatchInfo Raylib.NPatchInfo
---@param dest Raylib.Rectangle
---@param origin Raylib.Vector2
---@param rotation number
---@param tint Raylib.Color
function ray.DrawTextureNPatch(texture, nPatchInfo, dest, origin, rotation, tint) end

---Get color with alpha applied, alpha goes from 0.0f to 1.0f
---@param color Raylib.Color
---@param alpha number
---@return Raylib.Color
function ray.Fade(color, alpha) end

---Get hexadecimal value for a Color (0xRRGGBBAA)
---@param color Raylib.Color
---@return integer
function ray.ColorToInt(color) end

---Get Color normalized as float [0..1]
---@param color Raylib.Color
---@return Raylib.Vector4
function ray.ColorNormalize(color) end

---Get Color from normalized values [0..1]
---@param normalized Raylib.Vector4
---@return Raylib.Color
function ray.ColorFromNormalized(normalized) end

---Get HSV values for a Color, hue [0..360], saturation/value [0..1]
---@param color Raylib.Color
---@return Raylib.Vector3
function ray.ColorToHSV(color) end

---Get a Color from HSV values, hue [0..360], saturation/value [0..1]
---@param hue number
---@param saturation number
---@param value number
---@return Raylib.Color
function ray.ColorFromHSV(hue, saturation, value) end

---Get color multiplied with another color
---@param color Raylib.Color
---@param tint Raylib.Color
---@return Raylib.Color
function ray.ColorTint(color, tint) end

---Get color with brightness correction, brightness factor goes from -1.0f to 1.0f
---@param color Raylib.Color
---@param factor number
---@return Raylib.Color
function ray.ColorBrightness(color, factor) end

---Get color with contrast correction, contrast values between -1.0f and 1.0f
---@param color Raylib.Color
---@param contrast number
---@return Raylib.Color
function ray.ColorContrast(color, contrast) end

---Get color with alpha applied, alpha goes from 0.0f to 1.0f
---@param color Raylib.Color
---@param alpha number
---@return Raylib.Color
function ray.ColorAlpha(color, alpha) end

---Get src alpha-blended into dst color with tint
---@param dst Raylib.Color
---@param src Raylib.Color
---@param tint Raylib.Color
---@return Raylib.Color
function ray.ColorAlphaBlend(dst, src, tint) end

---Get color lerp interpolation between two colors, factor [0.0f..1.0f]
---@param color1 Raylib.Color
---@param color2 Raylib.Color
---@param factor number
---@return Raylib.Color
function ray.ColorLerp(color1, color2, factor) end

---Get Color structure from hexadecimal value
---@param hexValue integer
---@return Raylib.Color
function ray.GetColor(hexValue) end

---Get pixel data size in bytes for certain format
---@param width integer
---@param height integer
---@param format integer
---@return integer
function ray.GetPixelDataSize(width, height, format) end

---Draw current FPS
---@param posX integer
---@param posY integer
function ray.DrawFPS(posX, posY) end

---Draw text (using default font)
---@param text string
---@param posX integer
---@param posY integer
---@param fontSize integer
---@param color Raylib.Color
function ray.DrawText(text, posX, posY, fontSize, color) end

---Set vertical line spacing when drawing with line-breaks
---@param spacing integer
function ray.SetTextLineSpacing(spacing) end

---Measure string width for default font
---@param text string
---@param fontSize integer
---@return integer
function ray.MeasureText(text, fontSize) end

---Get total number of codepoints in a UTF-8 encoded string
---@param text string
---@return integer
function ray.GetCodepointCount(text) end

---Check if two text string are equal
---@param text1 string
---@param text2 string
---@return boolean
function ray.TextIsEqual(text1, text2) end

---Get text length, checks for '\0' ending
---@param text string
---@return integer
function ray.TextLength(text) end

---Get a piece of a text string
---@param text string
---@param position integer
---@param length integer
---@return string
function ray.TextSubtext(text, position, length) end

---Find first text occurrence within a string
---@param text string
---@param find string
---@return integer
function ray.TextFindIndex(text, find) end

---Get upper case version of provided string
---@param text string
---@return string
function ray.TextToUpper(text) end

---Get lower case version of provided string
---@param text string
---@return string
function ray.TextToLower(text) end

---Get Pascal case notation version of provided string
---@param text string
---@return string
function ray.TextToPascal(text) end

---Get Snake case notation version of provided string
---@param text string
---@return string
function ray.TextToSnake(text) end

---Get Camel case notation version of provided string
---@param text string
---@return string
function ray.TextToCamel(text) end

---Get integer value from text (negative values not supported)
---@param text string
---@return integer
function ray.TextToInteger(text) end

---Get float value from text (negative values not supported)
---@param text string
---@return number
function ray.TextToFloat(text) end

---Draw a line in 3D world space
---@param startPos Raylib.Vector3
---@param endPos Raylib.Vector3
---@param color Raylib.Color
function ray.DrawLine3D(startPos, endPos, color) end

---Draw a point in 3D space, actually a small line
---@param position Raylib.Vector3
---@param color Raylib.Color
function ray.DrawPoint3D(position, color) end

---Draw a circle in 3D world space
---@param center Raylib.Vector3
---@param radius number
---@param rotationAxis Raylib.Vector3
---@param rotationAngle number
---@param color Raylib.Color
function ray.DrawCircle3D(center, radius, rotationAxis, rotationAngle, color) end

---Draw a color-filled triangle (vertex in counter-clockwise order!)
---@param v1 Raylib.Vector3
---@param v2 Raylib.Vector3
---@param v3 Raylib.Vector3
---@param color Raylib.Color
function ray.DrawTriangle3D(v1, v2, v3, color) end

---Draw cube
---@param position Raylib.Vector3
---@param width number
---@param height number
---@param length number
---@param color Raylib.Color
function ray.DrawCube(position, width, height, length, color) end

---Draw cube (Vector version)
---@param position Raylib.Vector3
---@param size Raylib.Vector3
---@param color Raylib.Color
function ray.DrawCubeV(position, size, color) end

---Draw cube wires
---@param position Raylib.Vector3
---@param width number
---@param height number
---@param length number
---@param color Raylib.Color
function ray.DrawCubeWires(position, width, height, length, color) end

---Draw cube wires (Vector version)
---@param position Raylib.Vector3
---@param size Raylib.Vector3
---@param color Raylib.Color
function ray.DrawCubeWiresV(position, size, color) end

---Draw sphere
---@param centerPos Raylib.Vector3
---@param radius number
---@param color Raylib.Color
function ray.DrawSphere(centerPos, radius, color) end

---Draw sphere with extended parameters
---@param centerPos Raylib.Vector3
---@param radius number
---@param rings integer
---@param slices integer
---@param color Raylib.Color
function ray.DrawSphereEx(centerPos, radius, rings, slices, color) end

---Draw sphere wires
---@param centerPos Raylib.Vector3
---@param radius number
---@param rings integer
---@param slices integer
---@param color Raylib.Color
function ray.DrawSphereWires(centerPos, radius, rings, slices, color) end

---Draw a cylinder/cone
---@param position Raylib.Vector3
---@param radiusTop number
---@param radiusBottom number
---@param height number
---@param slices integer
---@param color Raylib.Color
function ray.DrawCylinder(position, radiusTop, radiusBottom, height, slices, color) end

---Draw a cylinder with base at startPos and top at endPos
---@param startPos Raylib.Vector3
---@param endPos Raylib.Vector3
---@param startRadius number
---@param endRadius number
---@param sides integer
---@param color Raylib.Color
function ray.DrawCylinderEx(startPos, endPos, startRadius, endRadius, sides, color) end

---Draw a cylinder/cone wires
---@param position Raylib.Vector3
---@param radiusTop number
---@param radiusBottom number
---@param height number
---@param slices integer
---@param color Raylib.Color
function ray.DrawCylinderWires(position, radiusTop, radiusBottom, height, slices, color) end

---Draw a cylinder wires with base at startPos and top at endPos
---@param startPos Raylib.Vector3
---@param endPos Raylib.Vector3
---@param startRadius number
---@param endRadius number
---@param sides integer
---@param color Raylib.Color
function ray.DrawCylinderWiresEx(startPos, endPos, startRadius, endRadius, sides, color) end

---Draw a capsule with the center of its sphere caps at startPos and endPos
---@param startPos Raylib.Vector3
---@param endPos Raylib.Vector3
---@param radius number
---@param slices integer
---@param rings integer
---@param color Raylib.Color
function ray.DrawCapsule(startPos, endPos, radius, slices, rings, color) end

---Draw capsule wireframe with the center of its sphere caps at startPos and endPos
---@param startPos Raylib.Vector3
---@param endPos Raylib.Vector3
---@param radius number
---@param slices integer
---@param rings integer
---@param color Raylib.Color
function ray.DrawCapsuleWires(startPos, endPos, radius, slices, rings, color) end

---Draw a plane XZ
---@param centerPos Raylib.Vector3
---@param size Raylib.Vector2
---@param color Raylib.Color
function ray.DrawPlane(centerPos, size, color) end

---Draw a ray line
---@param ray Raylib.Ray
---@param color Raylib.Color
function ray.DrawRay(ray, color) end

---Draw a grid (centered at (0, 0, 0))
---@param slices integer
---@param spacing number
function ray.DrawGrid(slices, spacing) end

---Draw bounding box (wires)
---@param box Raylib.BoundingBox
---@param color Raylib.Color
function ray.DrawBoundingBox(box, color) end

---Draw a billboard texture
---@param camera Raylib.Camera
---@param texture Raylib.Texture2D
---@param position Raylib.Vector3
---@param scale number
---@param tint Raylib.Color
function ray.DrawBillboard(camera, texture, position, scale, tint) end

---Draw a billboard texture defined by source
---@param camera Raylib.Camera
---@param texture Raylib.Texture2D
---@param source Raylib.Rectangle
---@param position Raylib.Vector3
---@param size Raylib.Vector2
---@param tint Raylib.Color
function ray.DrawBillboardRec(camera, texture, source, position, size, tint) end

---Draw a billboard texture defined by source and rotation
---@param camera Raylib.Camera
---@param texture Raylib.Texture2D
---@param source Raylib.Rectangle
---@param position Raylib.Vector3
---@param up Raylib.Vector3
---@param size Raylib.Vector2
---@param origin Raylib.Vector2
---@param rotation number
---@param tint Raylib.Color
function ray.DrawBillboardPro(camera, texture, source, position, up, size, origin, rotation, tint) end

---Check collision between two spheres
---@param center1 Raylib.Vector3
---@param radius1 number
---@param center2 Raylib.Vector3
---@param radius2 number
---@return boolean
function ray.CheckCollisionSpheres(center1, radius1, center2, radius2) end

---Check collision between two bounding boxes
---@param box1 Raylib.BoundingBox
---@param box2 Raylib.BoundingBox
---@return boolean
function ray.CheckCollisionBoxes(box1, box2) end

---Check collision between box and sphere
---@param box Raylib.BoundingBox
---@param center Raylib.Vector3
---@param radius number
---@return boolean
function ray.CheckCollisionBoxSphere(box, center, radius) end

---Get collision info between ray and sphere
---@param ray Raylib.Ray
---@param center Raylib.Vector3
---@param radius number
---@return Raylib.RayCollision
function ray.GetRayCollisionSphere(ray, center, radius) end

---Get collision info between ray and box
---@param ray Raylib.Ray
---@param box Raylib.BoundingBox
---@return Raylib.RayCollision
function ray.GetRayCollisionBox(ray, box) end

---Get collision info between ray and triangle
---@param ray Raylib.Ray
---@param p1 Raylib.Vector3
---@param p2 Raylib.Vector3
---@param p3 Raylib.Vector3
---@return Raylib.RayCollision
function ray.GetRayCollisionTriangle(ray, p1, p2, p3) end

---Get collision info between ray and quad
---@param ray Raylib.Ray
---@param p1 Raylib.Vector3
---@param p2 Raylib.Vector3
---@param p3 Raylib.Vector3
---@param p4 Raylib.Vector3
---@return Raylib.RayCollision
function ray.GetRayCollisionQuad(ray, p1, p2, p3, p4) end

---Initialize audio device and context
function ray.InitAudioDevice() end

---Close the audio device and context
function ray.CloseAudioDevice() end

---Check if audio device has been initialized successfully
---@return boolean
function ray.IsAudioDeviceReady() end

---Set master volume (listener)
---@param volume number
function ray.SetMasterVolume(volume) end

---Get master volume (listener)
---@return number
function ray.GetMasterVolume() end

---Load wave data from file
---@param fileName string
---@return Raylib.Wave
function ray.LoadWave(fileName) end

---Checks if wave data is valid (data loaded and parameters)
---@param wave Raylib.Wave
---@return boolean
function ray.IsWaveValid(wave) end

---Unload wave data
---@param wave Raylib.Wave
function ray.UnloadWave(wave) end

---Export wave data to file, returns true on success
---@param wave Raylib.Wave
---@param fileName string
---@return boolean
function ray.ExportWave(wave, fileName) end

---Export wave sample data to code (.h), returns true on success
---@param wave Raylib.Wave
---@param fileName string
---@return boolean
function ray.ExportWaveAsCode(wave, fileName) end

---Copy a wave to a new wave
---@param wave Raylib.Wave
---@return Raylib.Wave
function ray.WaveCopy(wave) end

---Default size for new audio streams
---@param size integer
function ray.SetAudioStreamBufferSizeDefault(size) end

