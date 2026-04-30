#!/bin/bash
set -e

# Build with wasm-pack (requires both musl and libcxx submodules)
wasm-pack build --target web --release

# Replaces the import statement from 'env' to './env.js'
sed -i '' "s/from 'env';/from '.\/env.js';/g" pkg/libcxx_calculator.js

# Copy the env.js shim
cp src/env.js pkg/env.js

# Optional: inspect the WAT output
wasm2wat pkg/libcxx_calculator_bg.wasm >pkg/libcxx_calculator.wat
