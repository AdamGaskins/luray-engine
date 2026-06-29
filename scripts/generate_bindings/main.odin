package generate_bindings

import "core:encoding/json"
import "core:fmt"
import "core:io"
import "core:math"
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

        strValue := ""
        if type == "INT" {
            strValue = gencode_push_value_to_lua(type, value.(json.Float))
        } else if type == "STRING" {
            strValue = gencode_push_value_to_lua(type, add_quotes(value.(json.String)))
        } else if type == "FLOAT" {
            strValue = gencode_push_value_to_lua(type, value.(json.Float))
        } else if type == "COLOR" {
            type = "Color"
            strValue = gencode_push_value_to_lua(type, fmt.tprintf("rl.%v", name))
            value = ""
        } else {
            strValue = gencode_push_value_to_lua(type, fmt.tprintf("%v", value))
        }

        fmt.wprintfln(w_binds, "    %v", strValue)
        fmt.wprintfln(w_binds, "    lua.setfield(L, -2, \"%v\")", name)
        fmt.wprintfln(w_binds, "")

        if type == "COLOR" do value = ""
        fmt.wprintfln(w_docs, "---@field %v %v %v", name, c_type_to_lua(type), value)
    }
}

write_functions :: proc(
    w: io.Writer,
    w_binds: io.Writer,
    w_docs: io.Writer,
    functions: json.Array,
) {
    errors := ""

    totalCount := 0
    implementedCount := 0

    unimpGuys: map[string]int

    funcloop: for v, i in functions {
        v := v.(json.Object)

        name := v["name"].(json.String)
        description := v["description"].(json.String)
        returnType := v["returnType"].(json.String)
        params := parse_function_params(v)

        totalCount += 1

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

        implementedCount += 1

        // function binding
        fmt.wprintfln(w_binds, "    lua.pushcfunction(L, lua_%v)", name)
        fmt.wprintfln(w_binds, "    lua.setfield(L, -2, \"%v\")", name)
        fmt.wprintfln(w_binds, "", name)

        // function definition
        fmt.wprintfln(w, "@(private)")
        fmt.wprintfln(w, `lua_%v :: proc "c" (L: ^lua.State) -> c.int {{`, name)
        parameterNamesPrefixed := [dynamic]string{}
        pnames := [dynamic]string{}
        for param, i in params {
            ptrstr := ""

            _, isptr := slice.linear_search(
                params_modified_in_place,
                fmt.tprintf("%v.%v", name, param.name),
            )
            if isptr do ptrstr = "&"

            append(&parameterNamesPrefixed, fmt.tprintf("%vp_%v", ptrstr, param.name))

            source := fmt.tprintf("%v.%v", name, param.name)
            fmt.wprintfln(
                w,
                "    p_%v := %v",
                param.name,
                gencode_value_from_lua(param.type, i + 1, source),
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

        // pushback modified in place values
        for param, i in params {
            _, modified_in_place := slice.linear_search(
                params_modified_in_place,
                fmt.tprintf("%v.%v", name, param.name),
            )
            if !modified_in_place {
                continue
            }

            // source := fmt.tprintf("%v.%v", name, param.name)
            cuttype, _ := strings.substring_to(param.type, len(param.type) - 2)
            fmt.wprintfln(w, "    tolua_%v(L, p_%v, %v)", cuttype, param.name, i + 1)
            // fmt.wprintfln(w, "    %v", push_value(param.type, i + 1))
        }

        if returnType == "void" do fmt.wprintfln(w, "    return 0")
        else {
            fmt.wprintfln(w, "    %v", gencode_push_value_to_lua(returnType, "result"))
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
            fmt.wprintfln(w_docs, "---@param %v %v", name, c_type_to_lua(param.type))
        }
        luaPNamesStr := strings.join(luaPNames[:], ", ")
        if returnType != "void" {
            fmt.wprintfln(w_docs, "---@return %v", c_type_to_lua(returnType))
        }
        fmt.wprintfln(w_docs, "function ray.%v(%v) end", name, luaPNamesStr)
        fmt.wprintfln(w_docs, "")
    }
    fmt.printfln(
        "Functions: %v/%v (%v%%)",
        implementedCount,
        totalCount,
        math.floor(f64(implementedCount) / f64(totalCount) * 100),
    )
    // for type, count in unimpGuys {
    //     fmt.printfln("%v: %v", type, count)
    // }
    // fmt.println(errors)
}

write_struct_helpers :: proc(
    w: io.Writer,
    w_binds: io.Writer,
    w_docs: io.Writer,
    structs: json.Array,
) {
    total := 0
    impl := 0

    for v, i in structs {
        v := v.(json.Object)

        name := v["name"].(json.String)
        fieldsJson := v["fields"].(json.Array)

        total += 1

        _, found := slice.linear_search(implemented_types, name)
        if !found {
            continue
        }

        impl += 1

        if name == "Color" {
            // See bindings_static.odin
            continue
        }

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

            type := c_type_to_lua(field.type)
            fmt.wprintfln(w_docs, "---@field %v %v %v", field.name, type, field.desc)
        }
        fmt.wprintfln(w_docs, "")


        // write conversion funcs
        fmt.wprintfln(
            w,
            `tolua_%v :: proc "c" (L: ^lua.State, s: rl.%v, idx: c.int = -99) {{`,
            name,
            name,
        )
        // -99 is the default value. if IDX isn't specified, create a new table.
        fmt.wprintfln(w, "    idx := idx")
        fmt.wprintfln(w, "    if idx == -99 {{")
        fmt.wprintfln(w, "        lua.newtable(L)")
        fmt.wprintfln(w, "        idx = -2")
        fmt.wprintfln(w, "    }}")
        for field, i in fields {
            v := fmt.tprintf("s.%v", field.name)
            if name == "Matrix" {
                v = fmt.tprintf("s[%v][%v]", i % 4, math.floor(f32(i) / 4))
            }
            fmt.wprintfln(w, "    %v", gencode_push_value_to_lua(field.type, v))
            fmt.wprintfln(w, `    lua.setfield(L, idx, "%v")`, field.name)
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
            fmt.wprintfln(
                w,
                "    %v := %v",
                field.name,
                gencode_value_from_lua(field.type, -1, source),
            )
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
    fmt.printfln("Structs: %v/%v (%v%%)", impl, total, math.floor(f64(impl) / f64(total) * 100))
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

        _, found := slice.linear_search(implemented_types, type)
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

