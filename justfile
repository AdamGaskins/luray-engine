run +ARGS:
    odin run ./src -out:raylua -- {{ARGS}}

build:
    odin build src -out:raylua

generate-bindings:
    odin run scripts/generate_bindings && odinfmt src/engine_lua/bindings.odin -w
