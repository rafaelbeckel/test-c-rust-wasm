./build_rust.sh
./build_c.sh

# Link add.ll and subtract.ll to a single WebAssembly binary
llc \
    -march=wasm32 \
    -filetype=obj \
    c_maths.ll

llc \
    -march=wasm32 \
    -filetype=obj \
    r_maths.ll

wasm-ld \
    --no-entry \
    --export-all \
    -o advanced_maths.wasm \
    c_maths.o \
    r_maths.o

# you can use wasm2wat to disassemble it and see exported symbols
# wasm2wat advanced_maths.wasm
