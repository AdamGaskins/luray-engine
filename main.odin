package main

import "core:c"
import "core:fmt"
import lua "vendor:lua/5.4"
import rl "vendor:raylib"

main :: proc() {
    state := lua.L_newstate()
    lua.open_base(state)
    bind_raylib(state)

    if lua.L_dofile(state, "main.lua") != 0 {
        err := lua.tostring(state, -1)
        fmt.eprintln("Lua error:", err)
        lua.pop(state, 1)
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

