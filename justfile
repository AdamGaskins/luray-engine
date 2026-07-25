VERSION := "0.1.0-alpha.2"
COMMIT := `git rev-parse --short HEAD`

run +ARGS:
    odin run ./src/main_desktop -out:luray -define:_VERSION="{{VERSION}}" -- {{ARGS}}

build: clean build-mac-arm build-web

release-gh:
    gh release create {{VERSION}} \
      ./build/*.tar.gz ./build/*.sha256 \
      --title "{{VERSION}}" \
      --notes "Release v{{VERSION}}"

clean:
    rm -rf build

generate-bindings:
    odin run scripts/generate_bindings && odinfmt src/engine_lua/bindings.odin -w

build-mac-arm:
    mkdir -p build/macos-arm
    odin build src/main_desktop -out:build/macos-arm/luray -target:darwin_arm64 \
        -o:speed \
        -define:LURAY_COMMIT="{{COMMIT}}" \
        -define:LURAY_VERSION="{{VERSION}}" \
        -extra-linker-flags:"-Wl,-force_load,./lib/darwin_arm64/liblua5.4.a -Wl,-dead_strip_dylibs"
    tar -czvf build/luray-{{VERSION}}-macos-arm.tar.gz -C build/macos-arm/ luray
    cd build && sha256sum luray-{{VERSION}}-macos-arm.tar.gz > luray-{{VERSION}}-macos-arm.tar.gz.sha256

build-web:
    mkdir -p build/web
    odin build src/main_web -target:js_wasm32 -build-mode:obj -o:speed \
        -define:LURAY_COMMIT="{{COMMIT}}" \
        -define:LURAY_VERSION="{{VERSION}}" \
        -define:RAYLIB_WASM_LIB=env.o \
        -out:build/web/game
    cp "$(odin root)/core/sys/wasm/js/odin.js" build/web/odin.js
    emcc -o build/web/index.html build/web/game.obj \
        "$(odin root)/vendor/raylib/wasm/libraylib.web.a" \
        lib/wasm/liblua5.4.a \
        --shell-file src/main_web/index_template.html \
        -s USE_GLFW=3 -s WARN_ON_UNDEFINED_SYMBOLS=0 -s ALLOW_MEMORY_GROWTH=1
    rm build/web/game.obj
    tar -czvf build/luray-{{VERSION}}-web.tar.gz -C build/web/ .
    cd build && sha256sum luray-{{VERSION}}-web.tar.gz > luray-{{VERSION}}-web.tar.gz.sha256

run-web: build-web
    simple-http-server --nocache --index build/web

compile-lua lua_path: (_compile-lua-web lua_path) (_compile-lua-darwin-arm64 lua_path)

_compile-lua-web lua_path:
    mkdir -p lib/wasm
    cd {{lua_path}} && make clean
    cd {{lua_path}}/src && emcc -O2 -DLUA_USE_POSIX -c lapi.c lauxlib.c lbaselib.c lcode.c lcorolib.c \
      lctype.c ldblib.c ldebug.c ldo.c ldump.c lfunc.c lgc.c linit.c liolib.c \
      llex.c lmathlib.c lmem.c loadlib.c lobject.c lopcodes.c loslib.c lparser.c \
      lstate.c lstring.c lstrlib.c ltable.c ltablib.c ltm.c lundump.c lutf8lib.c \
      lvm.c lzio.c
    emar rcs lib/wasm/liblua5.4.a {{lua_path}}/src/*.o

_compile-lua-darwin-arm64 lua_path:
    mkdir -p lib/darwin_arm64
    cd {{lua_path}} && make clean macosx test
    cp {{lua_path}}/src/liblua.a ./lib/darwin_arm64/liblua5.4.a

