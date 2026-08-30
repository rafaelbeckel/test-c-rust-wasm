#!/bin/bash
set -e

mkdir -p build

cargo build --target=wasm32-unknown-unknown --release

cp ../../target/wasm32-unknown-unknown/release/cc_calculator.wasm build/cc_calculator.wasm

# Optional: Feel free to read the generated WAT file
wasm2wat build/cc_calculator.wasm >build/cc_calculator.wat

# Note: wasm-pack is skipped here because this crate doesn't use #[wasm_bindgen].
# See crate 4+ for wasm-pack examples.
