#!/bin/bash
set -e

wasm-pack build --target web --release

# Optional: Feel free to read the generated WAT file
wasm2wat pkg/wbg_calculator_bg.wasm >pkg/wbg_calculator.wat
