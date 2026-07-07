run +ARGS:
    odin run ./src -out:raylua -- {{ARGS}}

build: build-mac

generate-bindings:
    odin run scripts/generate_bindings && odinfmt src/engine_lua/bindings.odin -w

build-mac-arm:
    mkdir -p builds/macos-arm
    odin build src -out:builds/macos-arm/raylua -target:darwin_arm64 -extra-linker-flags:"-Wl,-force_load,./lib/liblua5.4.a -Wl,-dead_strip_dylibs"
    
build-mac-x86:
    mkdir -p builds/macos-x86
    odin build src -out:builds/macos-x86/raylua -target:darwin_amd64 -extra-linker-flags:"-Wl,-force_load,./lib/liblua5.4.a -Wl,-dead_strip_dylibs"

build-linux-arm:
    mkdir -p builds/linux-arm
    odin build src -out:builds/linux-arm/raylua -target:linux_arm64 -extra-linker-flags:"-Wl,-force_load,./lib/liblua5.4.a -Wl,-dead_strip_dylibs"

build-linux-x86:
    mkdir -p builds/linux-x86
    odin build src -out:builds/linux-x86/raylua -target:linux_amd64 -extra-linker-flags:"-Wl,-force_load,./lib/liblua5.4.a -Wl,-dead_strip_dylibs"

build-windows-x86:
    mkdir -p builds/windows-x86
    odin build src -out:builds/windows-x86/raylua -target:windows_amd64 -extra-linker-flags:"-Wl,-force_load,./lib/liblua5.4.a -Wl,-dead_strip_dylibs"

