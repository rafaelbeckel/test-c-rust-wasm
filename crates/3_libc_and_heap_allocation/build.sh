#!/bin/bash
set -e

mkdir -p build

cargo build --target=wasm32-unknown-unknown --release

cp ../../target/wasm32-unknown-unknown/release/libc_calculator.wasm build/libc_calculator.wasm

# Optional: Feel free to read the generated WAT file
wasm2wat build/libc_calculator.wasm >build/libc_calculator.wat

# Note: wasm-pack is skipped here because this crate doesn't use #[wasm_bindgen].
# See crate 4+ for wasm-pack examples.
