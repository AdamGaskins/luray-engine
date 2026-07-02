package main

import "core:fmt"
import "core:os"
import "core:path/filepath"
import "core:strings"
import "core:time"
import lua "vendor:lua/5.4"
import rl "vendor:raylib"

main :: proc() {
    mainPath := "main.lua"
    if len(os.args) > 1 {
        mainPath = os.args[1]
    }
    mainFileName := filepath.base(mainPath)
    mainDir := filepath.dir(mainPath)
    os.set_working_directory(mainDir)

    if !os.exists(mainFileName) {
        fmt.eprintfln("Source file not found: %v", mainPath)
        fmt.eprintfln("")
        fmt.eprintfln("Usage: executable [path/to/main.lua]")
        return
    }

    state := lua_create_state()
    defer lua.close(state)

    lua_load_script(state, mainFileName)

    lua_call(state, "_init")

    lastModified: time.Time
    {
        info, err := os.stat(mainFileName, context.allocator)
        defer os.file_info_delete(info, context.allocator)
        if err != nil {
            fmt.eprintfln("Error: %v", err)
            os.exit(1)
        }

        lastModified = info.modification_time
    }

    for !rl.WindowShouldClose() {
        lua_call(state, "_update")

        info, err := os.stat(mainFileName, context.allocator)
        if err == nil {
            if time.diff(info.modification_time, lastModified) < 0 {
                lua_load_script(state, mainFileName)
                lastModified = info.modification_time
            }
        }

        if is_reload_button_pressed() {
            lua_call(state, "_destroy")
            lua_call(state, "_init")
        }
    }

    lua_call(state, "_destroy")
}

is_reload_button_pressed :: proc() -> bool {
    if ODIN_OS == .Darwin {
        return(
            rl.IsKeyPressed(rl.KeyboardKey.R) &&
            (rl.IsKeyDown(rl.KeyboardKey.LEFT_SUPER) || rl.IsKeyDown(rl.KeyboardKey.RIGHT_SUPER)) \
        )
    }

    return(
        rl.IsKeyPressed(rl.KeyboardKey.R) &&
        (rl.IsKeyDown(rl.KeyboardKey.LEFT_CONTROL) || rl.IsKeyDown(rl.KeyboardKey.RIGHT_CONTROL)) \
    )
}

