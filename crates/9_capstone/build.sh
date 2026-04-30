#!/bin/bash
set -e

# Build with wasm-pack (requires musl + zlib submodules)
wasm-pack build --target web --release

# Replaces the import statement `from "env"` with `from "./env.js"`.
# `sed -i.bak` works on both BSD (macOS) and GNU sed; we then drop the backup.
sed -i.bak -E 's#from ["'\'']env["'\'']#from "./env.js"#g' pkg/zlib_compression.js
rm -f pkg/zlib_compression.js.bak

# Copy the env.js shim
cp src/env.js pkg/env.js

# Optional: inspect the WAT output
wasm2wat pkg/zlib_compression_bg.wasm >pkg/zlib_compression.wat
