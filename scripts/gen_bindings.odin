package gen_bindings

import "core:encoding/json"
import "core:fmt"
import "core:io"
import "core:math"
import "core:os"
import "core:slice"
import "core:strings"

main :: proc() {
    api := read_api_json()

    sb_defs := strings.builder_make()
    w_defs := strings.to_writer(&sb_defs)
    defer strings.builder_destroy(&sb_defs)

    sb_binds := strings.builder_make()
    w_binds := strings.to_writer(&sb_binds)
    defer strings.builder_destroy(&sb_binds)

    sb_docs := strings.builder_make()
    w_docs := strings.to_writer(&sb_docs)
    defer strings.builder_destroy(&sb_docs)
    fmt.wprintln(
        w_docs,
        `---@meta
-- Raylib API stubs for lua-language-server.
-- Declarations only; this file is never executed by the runtime.

---@class Raylib.Raylib`,
    )
    write_constants(w_binds, w_docs, api["defines"].(json.Array))
    write_enums(w_binds, w_docs, api["enums"].(json.Array))
    fmt.wprintln(
        w_docs,
        `ray = {}

---@alias Raylib.Color integer

function _init() end

function _update() end
`,
    )


    write_struct_helpers(w_defs, w_binds, w_docs, api["structs"].(json.Array))
    write_struct_aliases(w_defs, w_binds, w_docs, api["aliases"].(json.Array))
    write_functions(w_defs, w_binds, w_docs, api["functions"].(json.Array))


    sb := strings.builder_make()
    w := strings.to_writer(&sb)
    defer strings.builder_destroy(&sb)

    fmt.wprintln(w, "package main")
    fmt.wprintln(w, "")
    fmt.wprintln(w, `import "core:c"`)
    fmt.wprintln(w, `import lua "vendor:lua/5.4"`)
    fmt.wprintln(w, `import rl "vendor:raylib"`)
    fmt.wprintln(w, "")
    fmt.wprintln(w, "bind_raylib :: proc(L: ^lua.State) {")
    fmt.wprintln(w, "    lua.newtable(L)")
    fmt.wprintln(w, "")
    fmt.wprintln(w, strings.to_string(sb_binds))
    fmt.wprintln(w, "    lua.setglobal(L, \"ray\")")
    fmt.wprintln(w, "}")
    fmt.wprintln(w, "")
    fmt.wprintln(w, strings.to_string(sb_defs))
    fmt.wprintln(w, "")

    write_builder_to_file(&sb, "bindings.odin")
    fmt.println("Wrote bindings to bindings.odin")

    write_builder_to_file(&sb_docs, "meta/raylib.lua")
    fmt.println("Wrote lua stubs to meta/raylib.lua")
}

read_api_json :: proc() -> json.Object {
    dir: string
    filename: string
    error: os.Error

    dir, error = os.get_executable_directory(context.allocator)
    filename, error = os.join_path([]string{dir, "scripts", "raylib_api.json"}, context.allocator)

    data: []u8
    data, error = os.read_entire_file(filename, context.allocator)
    if error != nil {
        fmt.printfln("Failed to read file: %v (%v)", error, filename)
        os.exit(1)
    }
    defer delete(data)

    api, error2 := json.parse(data)
    if error2 != nil {
        fmt.println("Failed to parse json.")
        os.exit(1)
    }

    return api.(json.Object)
}

write_builder_to_file :: proc(sb: ^strings.Builder, path: string) {
    content := strings.to_string(sb^)
    err := os.write_entire_file(path, transmute([]byte)content)
    if err != nil {
        fmt.eprintfln("Failed to write file %v: %v", path, err)
        os.exit(1)
    }
}

write_enums :: proc(w_binds: io.Writer, w_docs: io.Writer, enums: json.Array) {
    for v, i in enums {
        v := v.(json.Object)
        values := v["values"].(json.Array)

        write_constants(w_binds, w_docs, values)
    }
}

write_constants :: proc(w_binds: io.Writer, w_docs: io.Writer, constants: json.Array) {
    funcloop: for v, i in constants {
        v := v.(json.Object)
        name := v["name"].(json.String)
        type := "type" in v ? v["type"].(json.String) : "INT"
        description := v["description"].(json.String)
        value := v["value"]

        if type == "GUARD" || type == "MACRO" || type == "UNKNOWN" || type == "FLOAT_MATH" {
            continue
        }

        bindStr := ""
        if type == "INT" {
            type = "int"
            bindStr = push_value("int", value.(json.Float))
        } else if type == "STRING" {
            type = "char *"
            bindStr = push_value("char *", fmt.tprintf(`"%v"`, value.(json.String)))
        } else if type == "FLOAT" {
            type = "float"
            bindStr = push_value("float", value.(json.Float))
        } else if type == "COLOR" {
            type = "Color"
            bindStr = push_value("Color", fmt.tprintf("rl.%v", name))
            value = ""
        }
        fmt.wprintfln(w_binds, "    %v", bindStr)
        fmt.wprintfln(w_binds, "    lua.setfield(L, -2, \"%v\")", name)
        fmt.wprintfln(w_binds, "")

        fmt.wprintfln(w_docs, "---@field %v %v %v", name, get_param_lua_type(type), value)
    }
}

implemented_types :: []string {
    "void",
    "const unsigned char *",
    "unsigned char *",
    "const char *",
    "char *",
    "int",
    "unsigned int",
    "float",
    "double",
    "bool",
    "Color",
    "Vector2",
    "Vector3",
    "Vector4",
    "Matrix",
    "Rectangle",
    "Camera",
    "Camera2D",
    "Camera3D",
    // "Image",
    "Texture",
    "Texture2D",
    "TextureCubemap",
    "Quaternion",
}
skip_functions :: []string {
    "ExportDataAsCode",
    "LoadFileText",
    "UnloadFileText",
    "UnloadFileData",
    "SaveFileText",
    "LoadImageRaw",
    "LoadImageFromMemory",
    "UnloadUTF8",
    "TextInsert",
    "TextCopy",
    "TextReplace",
    "LoadWaveFromMemory",
    "LoadMusicStreamFromMemory",
    "GetGestureDetected",
    "ComputeCRC32",
    "ColorIsEqual", // deprecated
}
write_functions :: proc(
    w: io.Writer,
    w_binds: io.Writer,
    w_docs: io.Writer,
    functions: json.Array,
) {
    errors := ""

    unimpGuys: map[string]int

    fmt.print("Writing functions: ")
    funcloop: for v, i in functions {
        v := v.(json.Object)

        name := v["name"].(json.String)
        description := v["description"].(json.String)
        returnType := v["returnType"].(json.String)
        params := parse_function_params(v)

        // TODO: implement all features
        // skip unimplemented guys
        _, unimp := slice.linear_search(skip_functions, name)
        skip := false
        if unimp {
            errors = fmt.tprintf("%v\nSkipping %v: marked unimplemented", errors, name)
            skip = true
        }
        _, impReturn := slice.linear_search(implemented_types, returnType)
        if !impReturn {
            errors = fmt.tprintf(
                "%v\nSkipping %v: return type %v unimplemented",
                errors,
                name,
                returnType,
            )
            if returnType in unimpGuys do unimpGuys[returnType] += 1
            else do unimpGuys[returnType] = 1
            skip = true
        }
        for param in params {
            _, found := slice.linear_search(implemented_types, param.type)
            if !found {
                errors = fmt.tprintf(
                    "%v\nSkipping %v: type %v unimplemented",
                    errors,
                    name,
                    param.type,
                )
                skip = true
                if param.type in unimpGuys do unimpGuys[param.type] += 1
                else do unimpGuys[param.type] = 1
            }
        }
        if skip {
            continue funcloop
        }
        if i > 0 do fmt.print(", ")
        fmt.print(name)

        // function binding
        fmt.wprintfln(w_binds, "    lua.pushcfunction(L, lua_%v)", name)
        fmt.wprintfln(w_binds, "    lua.setfield(L, -2, \"%v\")", name)
        fmt.wprintfln(w_binds, "", name)

        // function definition
        fmt.wprintfln(w, "@(private)")
        fmt.print("A")
        fmt.wprintfln(w, `lua_%v :: proc "c" (L: ^lua.State) -> c.int {{`, name)
        parameterNamesPrefixed := [dynamic]string{}
        pnames := [dynamic]string{}
        for param, i in params {
            append(&parameterNamesPrefixed, fmt.tprintf("p_%v", param.name))

            source := fmt.tprintf("%v.%v", name, param.name)
            fmt.wprintfln(
                w,
                "    p_%v := %v",
                param.name,
                generate_fromlua(param.type, i + 1, source),
            )
        }

        pnameprefixlist := strings.join(parameterNamesPrefixed[:], ", ")

        if len(params) > 0 {
            fmt.wprintfln(w, "")
        }

        if returnType == "void" {
            fmt.wprintfln(w, "    rl.%v(%v)", name, pnameprefixlist)
        } else {
            fmt.wprintfln(w, "    result := rl.%v(%v)", name, pnameprefixlist)
        }

        fmt.wprintfln(w, "")
        if returnType == "void" do fmt.wprintfln(w, "    return 0")
        else {
            fmt.wprintfln(w, "    %v", push_value(returnType, "result"))
            fmt.wprintfln(w, "    return 1")
        }
        fmt.wprintfln(w, "}")
        fmt.wprintfln(w, "")

        // docs
        fmt.wprintfln(w_docs, "---%v", description)
        luaPNames := [dynamic]string{}
        for param in params {
            name := param.name
            if name == "end" {
                // "end" is a keyword in lua
                name = "finish"
            }
            append(&luaPNames, fmt.tprintf("%v", name))
            fmt.wprintfln(w_docs, "---@param %v %v", name, get_param_lua_type(param.type))
        }
        luaPNamesStr := strings.join(luaPNames[:], ", ")
        if returnType != "void" {
            fmt.wprintfln(w_docs, "---@return %v", get_param_lua_type(returnType))
        }
        fmt.wprintfln(w_docs, "function ray.%v(%v) end", name, luaPNamesStr)
        fmt.wprintfln(w_docs, "")
    }
    fmt.println()
    // for type, count in unimpGuys {
    //     fmt.printfln("%v: %v", type, count)
    // }
    fmt.println(errors)
    fmt.println()
}

Param :: struct {
    name: string,
    type: string,
}
parse_function_params :: proc(v: json.Object) -> []Param {
    ret := [dynamic]Param{}

    if "params" not_in v {
        return ret[:]
    }

    params := v["params"].(json.Array)
    for param, i in params {
        param := param.(json.Object)
        ptype := param["type"].(json.String)
        pname := param["name"].(json.String)
        append(&ret, Param{pname, ptype})
    }

    return ret[:]
}

ParamOverride :: struct {
    source:    string,
    cast_type: string,
    type:      string,
}
param_type_overrides :: []ParamOverride {
    // functions
    {"IsWindowState.flag", "transmute", "ConfigFlags"},
    {"SetWindowState.flags", "transmute", "ConfigFlags"},
    {"ClearWindowState.flags", "transmute", "ConfigFlags"},
    {"BeginBlendMode.mode", "cast", "BlendMode"},
    {"SetConfigFlags.flags", "transmute", "ConfigFlags"},
    {"SetTraceLogLevel.logLevel", "cast", "TraceLogLevel"},
    {"IsKeyPressed.key", "cast", "KeyboardKey"},
    {"IsKeyPressedRepeat.key", "cast", "KeyboardKey"},
    {"IsKeyDown.key", "cast", "KeyboardKey"},
    {"IsKeyReleased.key", "cast", "KeyboardKey"},
    {"IsKeyUp.key", "cast", "KeyboardKey"},
    {"SetExitKey.key", "cast", "KeyboardKey"},
    {"IsGamepadButtonPressed.button", "cast", "GamepadButton"},
    {"IsGamepadButtonDown.button", "cast", "GamepadButton"},
    {"IsGamepadButtonReleased.button", "cast", "GamepadButton"},
    {"IsGamepadButtonUp.button", "cast", "GamepadButton"},
    {"GetGamepadAxisMovement.axis", "cast", "GamepadAxis"},
    {"IsMouseButtonPressed.button", "cast", "MouseButton"},
    {"IsMouseButtonDown.button", "cast", "MouseButton"},
    {"IsMouseButtonReleased.button", "cast", "MouseButton"},
    {"IsMouseButtonUp.button", "cast", "MouseButton"},
    {"SetMouseCursor.cursor", "cast", "MouseCursor"},
    {"SetGesturesEnabled.flags", "transmute", "Gestures"},
    {"IsGestureDetected.gesture", "cast", "Gesture"},
    {"GetPixelDataSize.format", "cast", "PixelFormat"},
    {"SetTextureFilter.filter", "cast", "TextureFilter"},
    {"SetTextureWrap.wrap", "cast", "TextureWrap"},

    // structs
    {"Texture.format", "cast", "PixelFormat"},
    {"Camera3D.projection", "cast", "CameraProjection"},
}

generate_fromlua :: proc {
    generate_fromlua_idxstr,
    generate_fromlua_idxint,
}
generate_fromlua_idxint :: proc(type: string, idx: int, source: string = "") -> string {
    return generate_fromlua_idxstr(type, fmt.tprintf("%v", idx), source)
}
generate_fromlua_idxstr :: proc(type: string, idx: string, source: string = "") -> string {
    prefix := ""
    value := ""

    for override in param_type_overrides {
        if override.source == source {
            prefix = fmt.tprintf("%v(rl.%v)", override.cast_type, override.type)
            break
        }
    }

    if type == "const unsigned char *" ||
       type == "const char *" ||
       type == "unsigned char *" ||
       type == "char *" {
        value = fmt.tprintf("lua.tostring(L, %v)", idx)
    } else if type == "int" {
        value = fmt.tprintf("c.int(lua.tonumber(L, %v))", idx)
    } else if type == "unsigned int" {
        value = fmt.tprintf("c.uint(lua.tonumber(L, %v))", idx)
    } else if type == "float" {
        value = fmt.tprintf("c.float(lua.tonumber(L, %v))", idx)
    } else if type == "double" {
        value = fmt.tprintf("c.double(lua.tonumber(L, %v))", idx)
    } else if type == "bool" {
        value = fmt.tprintf("c.bool(lua.toboolean(L, %v))", idx)
    } else {
        value = fmt.tprintf("fromlua_%v(L, %v)", type, idx)
    }

    return fmt.tprintf("%v%v", prefix, value)
}

push_value_string :: proc(type: string, value: string = "result") -> string {
    if type == "const unsigned char *" ||
       type == "const char *" ||
       type == "unsigned char *" ||
       type == "char *" {
        return fmt.tprintf("lua.pushstring(L, %v)", value)
    } else if type == "int" {
        return fmt.tprintf("lua.pushinteger(L, lua.Integer(%v))", value)
    } else if type == "unsigned int" {
        return fmt.tprintf("lua.pushinteger(L, lua.Integer(%v))", value)
    } else if type == "float" {
        return fmt.tprintf("lua.pushnumber(L, lua.Number(%v))", value)
    } else if type == "double" {
        return fmt.tprintf("lua.pushnumber(L, lua.Number(%v))", value)
    } else if type == "bool" {
        return fmt.tprintf("lua.pushboolean(L, b32(%v))", value)
    } else {
        return fmt.tprintf("tolua_%v(L, %v)", type, value)
    }
}
push_value_float :: proc(type: string, value: f64) -> string {
    return push_value_string(type, fmt.tprintf("%v", value))
}
push_value_int :: proc(type: string, value: int) -> string {
    return push_value_string(type, fmt.tprintf("%v", value))
}
push_value :: proc {
    push_value_string,
    push_value_int,
    push_value_float,
}

get_param_lua_type :: proc(type: string, source: string = "") -> string {
    if type == "const unsigned char *" ||
       type == "const char *" ||
       type == "unsigned char *" ||
       type == "char *" {
        return "string"
    } else if type == "int" || type == "unsigned int" {
        return "integer"
    } else if type == "float" || type == "double" {
        return "number"
    } else if type == "bool" {
        return "boolean"
    } else {
        // struct or other type
        return fmt.tprintf("Raylib.%v", type)
    }
}

array_structs :: []string{"Vector2", "Vector3", "Vector4", "Matrix"}
supported_structs :: []string {
    "Color",
    "Vector2",
    "Vector3",
    "Vector4",
    "Camera3D",
    "Camera2D",
    "Matrix",
    "Rectangle",
    // "Image",
    "Texture",
    "Texture2D",
    "TextureCubemap",
    "Quaternion",
}
write_struct_helpers :: proc(
    w: io.Writer,
    w_binds: io.Writer,
    w_docs: io.Writer,
    structs: json.Array,
) {
    fmt.print("Writing structs: ")
    for v, i in structs {
        v := v.(json.Object)

        name := v["name"].(json.String)
        fieldsJson := v["fields"].(json.Array)

        _, found := slice.linear_search(supported_structs, name)
        if !found {
            continue
        }

        if name == "Color" {
            // See bindings_static.odin
            continue
        }

        if i > 0 do fmt.print(", ")
        fmt.print(name)

        StructField :: struct {
            type: string,
            name: string,
            desc: string,
        }
        fields: [dynamic]StructField
        // write docs
        fmt.wprintfln(w_docs, "---@class Raylib.%v", name)
        for fieldJson in fieldsJson {
            fieldJson := fieldJson.(json.Object)
            field := StructField {
                fieldJson["type"].(json.String),
                fieldJson["name"].(json.String),
                fieldJson["description"].(json.String),
            }
            append(&fields, field)

            type := get_param_lua_type(field.type)
            fmt.wprintfln(w_docs, "---@field %v %v %v", field.name, type, field.desc)
        }
        fmt.wprintfln(w_docs, "")


        // write conversion funcs
        fmt.wprintfln(w, `tolua_%v :: proc "c" (L: ^lua.State, s: rl.%v) {{`, name, name)
        fmt.wprintfln(w, "    lua.newtable(L)")
        for field, i in fields {
            v := fmt.tprintf("s.%v", field.name)
            if name == "Matrix" {
                v = fmt.tprintf("s[%v][%v]", i % 4, math.floor(f32(i) / 4))
            }
            fmt.wprintfln(w, "    %v", push_value(field.type, v))
            fmt.wprintfln(w, `    lua.setfield(L, -2, "%v")`, field.name)
        }
        fmt.wprintfln(w, "}")
        fmt.wprintfln(w, "")


        fmt.wprintfln(
            w,
            `fromlua_%v :: proc "c" (L: ^lua.State, idx: c.int) -> rl.%v {{`,
            name,
            name,
        )
        for field in fields {
            source := fmt.tprintf("%v.%v", name, field.name)
            fmt.wprintfln(w, `    lua.getfield(L, idx, "%v")`, field.name)
            fmt.wprintfln(w, "    %v := %v", field.name, generate_fromlua(field.type, -1, source))
            fmt.wprintfln(w, "    lua.pop(L, 1)")
        }
        fmt.wprintfln(w, "    return rl.%v {{", name)
        _, isArrayStruct := slice.linear_search(array_structs, name)
        for field in fields {
            if isArrayStruct {
                fmt.wprintfln(w, "        %v,", field.name)
            } else {
                fmt.wprintfln(w, "        %v = %v,", field.name, field.name)
            }
        }
        fmt.wprintfln(w, "    }")
        fmt.wprintfln(w, "}")
        fmt.wprintfln(w, "")

    }
    fmt.println()
    fmt.println()
}

write_struct_aliases :: proc(
    w: io.Writer,
    w_binds: io.Writer,
    w_docs: io.Writer,
    aliases: json.Array,
) {
    for v, i in aliases {
        v := v.(json.Object)

        name := v["name"].(json.String)
        type := v["type"].(json.String)

        _, found := slice.linear_search(supported_structs, type)
        if !found {
            continue
        }

        fmt.wprintfln(w_docs, "---@alias Raylib.%v Raylib.%v", name, type)
        fmt.wprintfln(w_docs, "")


        // write conversion funcs
        fmt.wprintfln(w, `tolua_%v :: proc "c" (L: ^lua.State, s: rl.%v) {{`, name, name)
        if name == "Quaternion" {
            fmt.wprintfln(w, "    tolua_%v(L, transmute(rl.Vector4)s)", type)
        } else {
            fmt.wprintfln(w, "    tolua_%v(L, s)", type)
        }
        fmt.wprintfln(w, "}")
        fmt.wprintfln(w, "")


        fmt.wprintfln(
            w,
            `fromlua_%v :: proc "c" (L: ^lua.State, idx: c.int) -> rl.%v {{`,
            name,
            name,
        )
        if name == "Quaternion" {
            fmt.wprintfln(w, "    return transmute(rl.Quaternion)fromlua_%v(L, idx)", type)
        } else {
            fmt.wprintfln(w, "    return fromlua_%v(L, idx)", type)
        }
        fmt.wprintfln(w, "}")
        fmt.wprintfln(w, "")

    }
}

