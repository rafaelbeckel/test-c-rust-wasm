#!/bin/bash
set -e

# Build with wasm-pack (requires musl + zlib submodules)
wasm-pack build --target web --release

# Replaces the import statement from 'env' to './env.js'
sed -i '' "s/from 'env';/from '.\/env.js';/g" pkg/zlib_compression.js

# Copy the env.js shim
cp src/env.js pkg/env.js

# Optional: inspect the WAT output
wasm2wat pkg/zlib_compression_bg.wasm >pkg/zlib_compression.wat
