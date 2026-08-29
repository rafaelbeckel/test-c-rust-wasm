#!/bin/bash
set -e

wasm-pack build --target web --release

# The C library writes stdout and stderr through an import from the "env"
# module. wasm-bindgen emits a bare `from "env"`, which no browser resolves,
# so point it at the shim next to it.
# `sed -i.bak` works on both BSD (macOS) and GNU sed; we then drop the backup.
sed -i.bak -E 's#from ["'\'']env["'\'']#from "./env.js"#g' pkg/musl_calculator.js
rm -f pkg/musl_calculator.js.bak

cp src/env.js pkg/env.js

# Optional: inspect the WAT output
wasm2wat pkg/musl_calculator_bg.wasm >pkg/musl_calculator.wat
