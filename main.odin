package main

import "core:fmt"
import "core:os"
import "core:path/filepath"
import "core:strings"
import lua "vendor:lua/5.4"
import rl "vendor:raylib"

main :: proc() {
    mainFile := "main.lua"
    if len(os.args) > 1 {
        mainFile = os.args[1]
    }
    mainDir := filepath.dir(mainFile)
    os.set_working_directory(mainDir)

    fmt.printfln("Running %v", mainFile)

    state := lua.L_newstate()
    lua.L_openlibs(state)
    bind_raylib(state)

    luaFileName, err := strings.clone_to_cstring(filepath.base(mainFile))
    defer delete(luaFileName)
    if lua.L_dofile(state, luaFileName) != 0 {
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

