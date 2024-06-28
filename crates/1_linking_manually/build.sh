# Build Rust
export RUSTFLAGS="--Z wasm_c_abi=spec"
cargo +nightly build --target=wasm32-unknown-unknown --release

# Create a static library from the Rust build
cp ../../target/wasm32-unknown-unknown/release/libwasm_ld_calculator.rlib build/r_maths.a

# Build C
clang \
    --target=wasm32 \
    -c \
    -o ./build/c_maths.o \
    ./src/maths.c

# Link c_maths.o and r_maths.a to a single WebAssembly binary
wasm-ld \
    --no-entry \
    --export-all \
    -o ./build/advanced_maths.wasm \
    ./build/c_maths.o \
    ./build/r_maths.a

# you can use wasm2wat to disassemble it and see exported symbols
wasm2wat build/advanced_maths.wasm >build/advanced_maths.wat
