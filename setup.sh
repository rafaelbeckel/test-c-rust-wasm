#!/bin/bash
set -euo pipefail

# Setup script for test-c-rust-wasm
#
# This script initializes git submodules required for crates 7-9
# (musl libc and LLVM libcxx for wasm32-unknown-unknown).
#
# Crates 1-6 have no external dependencies and work out of the box.

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "=== Setting up test-c-rust-wasm ==="
echo ""

# ─── 1. Musl libc (v1.2.6) ───────────────────────────────────────────
# Small repo (~5MB), full clone is fine.
echo "→ Initializing musl libc submodule..."
git submodule update --init --depth 1 3rd-party/wasm32-libc/musl
echo "  ✓ musl libc ready"
echo ""

# ─── 2. Emscripten (for LLVM libcxx) ─────────────────────────────────
# Large repo. We use sparse checkout to only fetch what the build.rs
# scripts actually reference:
#   system/include            – emscripten/wasm_simd128.h shims
#   system/lib/libcxx         – libc++ sources
#   system/lib/libcxxabi      – libc++abi sources
#   system/lib/compiler-rt    – __trunctfdf2 etc.
#   system/lib/libc           – arch/emscripten/bits/alltypes.h (used by wasm32-libc)
#   system/lib/llvm-libc      – shared/fp_bits.h (used by libcxx/charconv.cpp)
echo "→ Initializing emscripten submodule (sparse checkout)..."

# Init without checkout
git submodule update --init --depth 1 --no-checkout 3rd-party/wasm32-libcxx/emscripten 2>/dev/null || true

EMSCRIPTEN_DIR="$SCRIPT_DIR/3rd-party/wasm32-libcxx/emscripten"

if [ -d "$EMSCRIPTEN_DIR/.git" ] || [ -f "$EMSCRIPTEN_DIR/.git" ]; then
    pushd "$EMSCRIPTEN_DIR" > /dev/null
    git sparse-checkout init --cone 2>/dev/null || true
    git sparse-checkout set \
        system/include \
        system/lib/libcxx \
        system/lib/libcxxabi \
        system/lib/compiler-rt \
        system/lib/libc \
        system/lib/llvm-libc
    git checkout 2>/dev/null || git checkout HEAD -- . 2>/dev/null || true
    popd > /dev/null
    echo "  ✓ emscripten libcxx ready (sparse checkout)"
else
    echo "  ⚠ Submodule not initialized. You may need to run:"
    echo "    git submodule add --depth 1 https://github.com/emscripten-core/emscripten.git 3rd-party/wasm32-libcxx/emscripten"
    echo "    Then re-run this script."
fi
echo ""

# ─── 3. Zlib (for capstone crate 9) ──────────────────────────────────
echo "→ Initializing zlib submodule..."
git submodule update --init --depth 1 crates/9_capstone/zlib 2>/dev/null || true
echo "  ✓ zlib ready"
echo ""

echo "=== Setup complete ==="
echo ""
echo "To build all crates:"
echo "  ./build_all.sh"
echo ""
echo "To build individual crates:"
echo "  cd crates/<crate_name> && ./build.sh"
