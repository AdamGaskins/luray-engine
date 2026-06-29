package generate_bindings

import "core:encoding/json"
import "core:fmt"
import "core:os"
import "core:strings"

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

