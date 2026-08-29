#!/bin/bash
set -e

wasm-pack build --target web --release

# Optional: Feel free to read the generated WAT file
wasm2wat pkg/ext_t_calculator_bg.wasm >pkg/ext_t_calculator.wat
