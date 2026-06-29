package generate_bindings

import "core:fmt"
import "core:strings"

gencode_value_from_lua__idxint :: proc(type: string, idx: int, source: string = "") -> string {
    return gencode_value_from_lua__idxstr(type, fmt.tprintf("%v", idx), source)
}
gencode_value_from_lua__idxstr :: proc(type: string, idx: string, source: string = "") -> string {
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
    } else if type == "void *" {
        value = fmt.tprintf("lua.touserdata(L, %v)", idx)
    } else if strings.ends_with(type, " *") {
        // pointer to struct
        cuttype, _ := strings.substring_to(type, len(type) - 2)
        value = fmt.tprintf("fromlua_%v(L, %v)", cuttype, idx)
    } else {
        value = fmt.tprintf("fromlua_%v(L, %v)", type, idx)
    }

    return fmt.tprintf("%v%v", prefix, value)
}
gencode_value_from_lua :: proc {
    gencode_value_from_lua__idxstr,
    gencode_value_from_lua__idxint,
}

gencode_push_value_to_lua__string :: proc(type: string, value: string = "result") -> string {
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
    } else if type == "void *" {
        return fmt.tprintf("lua.pushlightuserdata(L, %v)", value)
    } else if strings.ends_with(type, " *") {
        // pointer to struct
        cuttype, _ := strings.substring_to(type, len(type) - 2)
        return fmt.tprintf("tolua_%v(L, %v)", cuttype, value)
    } else {
        return fmt.tprintf("tolua_%v(L, %v)", type, value)
    }
}
gencode_push_value_to_lua__float :: proc(type: string, value: f64) -> string {
    return gencode_push_value_to_lua__string(type, fmt.tprintf("%v", value))
}
gencode_push_value_to_lua__int :: proc(type: string, value: int) -> string {
    return gencode_push_value_to_lua__string(type, fmt.tprintf("%v", value))
}
gencode_push_value_to_lua :: proc {
    gencode_push_value_to_lua__string,
    gencode_push_value_to_lua__int,
    gencode_push_value_to_lua__float,
}

c_type_to_lua :: proc(type: string, source: string = "") -> string {
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
    } else if type == "void *" {
        return "any"
    } else {
        // struct or other type
        return fmt.tprintf("Raylib.%v", type)
    }
}

