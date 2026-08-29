#!/bin/bash
set -e

# Ensure wasm-ld is in PATH (Homebrew lld is keg-only)
if ! command -v wasm-ld &>/dev/null; then
    LLD_PREFIX="$(brew --prefix lld@19 2>/dev/null || brew --prefix lld 2>/dev/null)"
    if [ -n "$LLD_PREFIX" ] && [ -x "$LLD_PREFIX/bin/wasm-ld" ]; then
        export PATH="$LLD_PREFIX/bin:$PATH"
    fi
fi

mkdir -p build

# Build Rust
cargo build --target=wasm32-unknown-unknown --release

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
