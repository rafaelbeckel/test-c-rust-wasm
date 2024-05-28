./build_subtract_with_llvm_ir.sh

cd wasm
./build_wasm_with_llvm_ir.sh

cd ..

# Link add.ll and subtract.ll to a single WebAssembly binary
llc \
    -march=wasm32 \
    -filetype=obj \
    add.ll

llc \
    -march=wasm32 \
    -filetype=obj \
    subtract.ll

wasm-ld \
    --no-entry \
    --export-all \
    -o advanced_maths.wasm \
    add.o \
    subtract.o
