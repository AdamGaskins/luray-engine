package generate_bindings

import "core:fmt"
import "core:strings"

gencode_value_from_lua__idxint :: proc(
    type: string,
    idx: int,
    source: string = "",
    source_param: string,
) -> string {
    return gencode_value_from_lua__idxstr(type, fmt.tprintf("%v", idx), source, source_param)
}
gencode_value_from_lua__idxstr :: proc(
    type: string,
    idx: string,
    source: string = "",
    source_param: string = "",
) -> string {
    prefix := ""
    value := ""

    for override in param_type_overrides {
        if override.source == source && override.source_param == source_param {
            prefix = fmt.tprintf("%v(%v)", override.cast_type, override.type)
            break
        }
    }

    if type == "const unsigned char *" ||
       type == "const char *" ||
       type == "unsigned char *" ||
       type == "char *" {
        value = fmt.tprintf("lua.tostring(L, %v)", idx)
    } else if type == "long" {
        value = fmt.tprintf("c.long(lua.tonumber(L, %v))", idx)
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
    } else if type == "void *" || type == "char **" {
        value = fmt.tprintf("lua.touserdata(L, %v)", idx)
    } else {
        type := trim_c_type(type)
        value = fmt.tprintf("fromlua_%v(L, %v)", type, idx)
    }

    return fmt.tprintf("%v%v", prefix, value)
}
gencode_value_from_lua :: proc {
    gencode_value_from_lua__idxstr,
    gencode_value_from_lua__idxint,
}

gencode_push_value_to_lua__string :: proc(
    type: string,
    value: string = "result",
    source: string = "",
    source_param: string = "",
) -> string {
    value := value
    prefix := ""

    for override in param_type_overrides {
        if override.source == source && override.source_param == source_param {
            value = fmt.tprintf("%v(%v)%v", override.cast_type, override.type, value)
            break
        }
    }

    if type == "const unsigned char *" ||
       type == "const char *" ||
       type == "unsigned char *" ||
       type == "char *" ||
       type == "STRING" {
        value = fmt.tprintf("lua.pushstring(L, %v)", value)
    } else if type == "long" {
        value = fmt.tprintf("lua.pushinteger(L, lua.Integer(%v))", value)
    } else if type == "int" || type == "INT" {
        value = fmt.tprintf("lua.pushinteger(L, lua.Integer(%v))", value)
    } else if type == "unsigned int" {
        value = fmt.tprintf("lua.pushinteger(L, lua.Integer(%v))", value)
    } else if type == "float" || type == "FLOAT" {
        value = fmt.tprintf("lua.pushnumber(L, lua.Number(%v))", value)
    } else if type == "double" {
        value = fmt.tprintf("lua.pushnumber(L, lua.Number(%v))", value)
    } else if type == "bool" {
        value = fmt.tprintf("lua.pushboolean(L, b32(%v))", value)
    } else if type == "void *" || type == "char **" {
        value = fmt.tprintf("lua.pushlightuserdata(L, %v)", value)
    } else {
        type := trim_c_type(type)
        value = fmt.tprintf("tolua_%v(L, %v)", type, value)
    }

    return value
}
gencode_push_value_to_lua__float :: proc(
    type: string,
    value: f64,
    source: string = "",
    source_param: string = "",
) -> string {
    return gencode_push_value_to_lua__string(type, fmt.tprintf("%v", value), source, source_param)
}
gencode_push_value_to_lua__int :: proc(
    type: string,
    value: int,
    source: string = "",
    source_param: string = "",
) -> string {
    return gencode_push_value_to_lua__string(type, fmt.tprintf("%v", value), source, source_param)
}
gencode_push_value_to_lua :: proc {
    gencode_push_value_to_lua__string,
    gencode_push_value_to_lua__int,
    gencode_push_value_to_lua__float,
}

c_type_to_lua :: proc(type: string, source: string = "", source_param: string = "") -> string {
    if type == "const unsigned char *" ||
       type == "const char *" ||
       type == "unsigned char *" ||
       type == "char *" ||
       type == "STRING" {
        return "string"
    } else if type == "int" || type == "unsigned int" || type == "long" || type == "INT" {
        return "integer"
    } else if type == "float" || type == "double" || type == "FLOAT" {
        return "number"
    } else if type == "bool" {
        return "boolean"
    } else if type == "void *" || type == "char **" {
        return "any"
    } else {
        type := type
        if type == "COLOR" do type = "Color"
        type = trim_c_type(type)
        _, is_ptr_array := funcparam__is_ptr_array(source, source_param)
        if is_ptr_array do type = fmt.tprintf("%v[]", type)
        // struct or other type
        return fmt.tprintf("Raylib.%v", type)
    }
}

trim_c_type :: proc(type: string) -> string {
    type := type
    if strings.ends_with(type, " *") {
        cut, _ := strings.substring_to(type, len(type) - 2)
        type = cut
    }
    if strings.starts_with(type, "const ") {
        cut, _ := strings.substring_from(type, 6)
        type = cut
    }
    return type
}

