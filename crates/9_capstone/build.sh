#!/bin/bash
set -e

# Build with wasm-pack (requires musl + zlib submodules)
wasm-pack build --target web --release

# Optional: inspect the WAT output
wasm2wat pkg/zlib_compression_bg.wasm >pkg/zlib_compression.wat
