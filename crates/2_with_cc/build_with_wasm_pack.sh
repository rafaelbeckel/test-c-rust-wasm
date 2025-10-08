set -e

rustup run wasm-pack build --target web --release

# Optional: Feel free to read the generated WAT file
wasm2wat pkg/cc_calculator_bg.wasm >pkg/cc_calculator.wat
