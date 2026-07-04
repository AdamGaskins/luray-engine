package generate_bindings

import "core:fmt"
import "core:strings"
import "core:unicode"
import "core:unicode/utf8"

gencode_value_from_lua__idxint :: proc(
	type: string,
	idx: int,
	source: string = "",
	source_param: string,
	ignore_count: bool = false,
) -> (
	string,
	bool,
) {
	return gencode_value_from_lua__idxstr(
		type,
		fmt.tprintf("%v", idx),
		source,
		source_param,
		ignore_count,
	)
}

// returns the code, and a boolean that's true when a second count parameter is returned.
// the parameters are named p_'source_param' and p_'source_param'_count
gencode_value_from_lua__idxstr :: proc(
	type: string,
	idx: string,
	source: string = "",
	source_param: string = "",
	ignore_count: bool = false,
) -> (
	string,
	bool,
) {
	type := type
	prefix := ""
	value := ""
	vars := fmt.tprintf("p_%v", source_param)

	for override in param_type_overrides {
		if override.source == source && override.source_param == source_param {
			prefix = fmt.tprintf("%v(%v)", override.cast_type, override.type)
			break
		}
	}

	multiple_return := false

	_, is_ptr_array := funcparam__is_ptr_array(source, source_param)
	_, is_flarray := is_fixed_length_array(source, source_param)
	if is_ptr_array || is_flarray {
		multiple_return = true
		t := trim_c_type(type)
		if ignore_count {
			vars = fmt.tprintf("%v, _", vars)
		} else {
			vars = fmt.tprintf("%v, p_%v_count", vars, source_param)
		}
		value = fmt.tprintf("fromlua_array(L, -1, %v, fromlua_%v)", prefix_c_type(t), t)
	} else if type == "const unsigned char *" ||
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
	} else if is_pointer_type(type, source, source_param) {
		value = fmt.tprintf("lua.touserdata(L, %v)", idx)
	} else {
		ttype := trim_c_type(type)
		value = fmt.tprintf("fromlua_%v(L, %v)", ttype, idx)
	}

	return fmt.tprintf("%v := %v%v", vars, prefix, value), true
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
	skip_cast: bool = false,
) -> string {
	value := value

	if !skip_cast {
		for override in param_type_overrides {
			if override.source == source && override.source_param == source_param {
				value = fmt.tprintf("%v(%v)%v", override.cast_type, override.type, value)
				break
			}
		}
	}

	ptr_array, is_ptr_array := funcparam__is_ptr_array(source, source_param)
	flarray, is_flarray := is_fixed_length_array(source, source_param)
	if is_ptr_array || is_flarray {
		countP := is_flarray ? flarray.length : fmt.tprintf("s.%v", ptr_array.countParam)
		tolua_code := fmt.tprintf("tolua_%v", trim_c_type(type))
		value = fmt.tprintf("    tolua_array(L, s.%v, %v, %v)", source_param, countP, tolua_code)
	} else if type == "const unsigned char *" ||
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
	} else if is_pointer_type(type, source, source_param) {
		value = fmt.tprintf("lua.pushlightuserdata(L, %v)", value)
	} else {
		ttype := trim_c_type(type)
		value = fmt.tprintf("tolua_%v(L, %v)", ttype, value)
	}

	return value
}
gencode_push_value_to_lua__float :: proc(
	type: string,
	value: f64,
	source: string = "",
	source_param: string = "",
	skip_cast: bool = false,
) -> string {
	return gencode_push_value_to_lua__string(
		type,
		fmt.tprintf("%v", value),
		source,
		source_param,
		skip_cast,
	)
}
gencode_push_value_to_lua__int :: proc(
	type: string,
	value: int,
	source: string = "",
	source_param: string = "",
	skip_cast: bool = false,
) -> string {
	return gencode_push_value_to_lua__string(
		type,
		fmt.tprintf("%v", value),
		source,
		source_param,
		skip_cast,
	)
}
gencode_push_value_to_lua :: proc {
	gencode_push_value_to_lua__string,
	gencode_push_value_to_lua__int,
	gencode_push_value_to_lua__float,
}

c_type_to_lua :: proc(type: string, source: string = "", source_param: string = "") -> string {
	type := type
	suffix := ""
	value := ""
	_, is_flarray := is_fixed_length_array(source, source_param)
	if is_flarray {
		suffix = "[]"
		type = trim_c_type(type)
	}

	if type == "const unsigned char *" ||
	   type == "const char *" ||
	   type == "unsigned char *" ||
	   type == "char *" ||
	   type == "STRING" {
		value = "string"
	} else if type == "int" || type == "unsigned int" || type == "long" || type == "INT" {
		value = "integer"
	} else if type == "float" || type == "double" || type == "FLOAT" {
		value = "number"
	} else if type == "bool" {
		value = "boolean"
	} else if is_pointer_type(type, source, source_param) {
		value = "any"
	} else {
		type := type
		if type == "COLOR" do type = "Color"
		type = trim_c_type(type)
		_, is_ptr_array := funcparam__is_ptr_array(source, source_param)
		if is_ptr_array do type = fmt.tprintf("%v[]", type)
		// struct or other type
		value = fmt.tprintf("Raylib.%v", type)
	}

	return fmt.tprintf("%v%v", value, suffix)
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

prefix_c_type :: proc(type: string) -> string {
	first_rune, _ := utf8.decode_rune_in_string(type)
	if unicode.is_upper(first_rune) {
		return fmt.tprintf("rl.%v", type)
	}
	return fmt.tprintf("c.%v", type)
}

is_fixed_length_array :: proc(source, source_param: string) -> (FixedLengthArray, bool) {
	for arry in fixed_length_arrays {
		if arry.source == source && arry.source_param == source_param {
			return arry, true
		}
	}
	return FixedLengthArray{}, false
}

funcparam__is_ptr_array_count :: proc(source: string, source_param: string) -> bool {
	for p in param_array_pointers {
		if p.source == source && p.countParam == source_param {
			return true
		}
	}
	return false
}
funcparam__is_ptr_array :: proc(
	source: string,
	source_param: string,
) -> (
	ParamArrayPointer,
	bool,
) {
	for p in param_array_pointers {
		if p.source == source && p.arrayParam == source_param {
			return p, true
		}
	}
	return ParamArrayPointer{}, false
}

func__auto_free_statement :: proc(funcName: string) -> (AutoFree, bool) {
	for p in auto_free_statements {
		if p.funcName == funcName {
			return p, true
		}
	}
	return AutoFree{}, false
}

is_pointer_type :: proc(c_type: string, source: string = "", source_param: string = "") -> bool {
	for type in pointer_types {
		if type == c_type {
			return true
		}
	}

	for p in pointer_parameters {
		if p.source == source && p.source_param == source_param {
			return true
		}
	}

	return false
}

