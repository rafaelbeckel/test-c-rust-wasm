set -e

rustup run wasm-pack build --target web --release

cp src/memory.js pkg/env.js

# Optional: Feel free to read the generated WAT file
wasm2wat pkg/libc_calculator_bg.wasm >pkg/libc_calculator.wat
