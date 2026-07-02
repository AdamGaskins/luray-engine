package main

import "core:fmt"
import "core:os"
import "core:strings"
import lua "vendor:lua/5.4"

lua_create_state :: proc() -> ^lua.State {
    state := lua.L_newstate()
    lua.L_openlibs(state)
    bind_raylib(state)
    return state
}

lua_load_script :: proc(state: ^lua.State, luaFile: string) {
    mainFileName_c, err := strings.clone_to_cstring(luaFile)
    defer delete(mainFileName_c)
    if lua.L_dofile(state, mainFileName_c) != 0 {
        err := lua.tostring(state, -1)
        fmt.eprintln("Failed to load script: ", err)
        lua.pop(state, 1)
    }
}

lua_call :: proc(state: ^lua.State, name: cstring) {
    lua.getglobal(state, "debug")
    lua.getfield(state, -1, "traceback")
    lua.remove(state, -2)
    msgh_index := lua.gettop(state)

    lua.getglobal(state, name)
    if lua.pcall(state, 0, 0, msgh_index) != 0 {
        err := lua.tostring(state, -1)
        fmt.eprintfln("(%v): %v", name, err)
        lua.pop(state, 1)
        os.exit(1)
    }
}

