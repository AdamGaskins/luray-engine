package main

import "core:fmt"
import "core:os"
import "core:path/filepath"
import "core:strings"
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

    state := lua.L_newstate()
    lua.L_openlibs(state)
    bind_raylib(state)

    if !os.exists(mainFileName) {
        fmt.eprintfln("Source file not found: %v", mainPath)
        fmt.eprintfln("")
        fmt.eprintfln("Usage: executable [path/to/main.lua]")
        return
    }

    mainFileName_c, err := strings.clone_to_cstring(filepath.base(mainFileName))
    defer delete(mainFileName_c)
    if lua.L_dofile(state, mainFileName_c) != 0 {
        err := lua.tostring(state, -1)
        fmt.eprintln("Lua error:", err)
        lua.pop(state, 1)
        return
    }

    defer lua.close(state)

    lua.getglobal(state, "_init")
    if lua.pcall(state, 0, 0, 0) != 0 {
        err := lua.tostring(state, -1)
        fmt.eprintln("Lua error:", err)
        lua.pop(state, 1)
    }


    for !rl.WindowShouldClose() {
        lua.getglobal(state, "_update")
        if lua.pcall(state, 0, 0, 0) != 0 {
            err := lua.tostring(state, -1)
            fmt.eprintln("Lua error:", err)
            lua.pop(state, 1)
        }
    }

    rl.CloseWindow()
}

