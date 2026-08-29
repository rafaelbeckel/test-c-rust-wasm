#!/bin/bash
set -e

wasm-pack build --target web --release

# Optional: Feel free to read the generated WAT file
wasm2wat pkg/rbg_calculator_bg.wasm >pkg/rbg_calculator.wat
