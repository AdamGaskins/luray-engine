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

    call_lua_global(state, "_init")

    for !rl.WindowShouldClose() {
        call_lua_global(state, "_update")
    }

    call_lua_global(state, "_destroy")

}

call_lua_global :: proc(state: ^lua.State, name: cstring) {
    lua.getglobal(state, "debug")
    lua.getfield(state, -1, "traceback")
    lua.remove(state, -2)
    msgh_index := lua.gettop(state)

    lua.getglobal(state, name)
    if lua.pcall(state, 0, 0, msgh_index) != 0 {
        err := lua.tostring(state, -1)
        fmt.eprintfln("(%v): %v", name, err)
        lua.pop(state, 1)
    }
}

