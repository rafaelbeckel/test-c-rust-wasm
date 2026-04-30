#!/bin/bash
set -e

# Build with wasm-pack (requires both musl and libcxx submodules)
wasm-pack build --target web --release

# Replaces the import statement `from "env"` with `from "./env.js"`.
# `sed -i.bak` works on both BSD (macOS) and GNU sed; we then drop the backup.
sed -i.bak -E 's#from ["'\'']env["'\'']#from "./env.js"#g' pkg/libcxx_calculator.js
rm -f pkg/libcxx_calculator.js.bak

# Copy the env.js shim
cp src/env.js pkg/env.js

# Optional: inspect the WAT output
wasm2wat pkg/libcxx_calculator_bg.wasm >pkg/libcxx_calculator.wat
