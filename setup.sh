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
# Huge repo (1+ GB), so a normal `git submodule update` is too expensive
# for CI. We do a manual partial clone (--filter=blob:none, no blobs
# until needed) + sparse-checkout, then fetch only the recorded SHA.
# The set of sparse paths matches what the build.rs scripts read:
#   system/include            – emscripten.h / wasm_simd128.h shims
#   system/lib/libcxx         – libc++ sources
#   system/lib/libcxxabi      – libc++abi sources
#   system/lib/compiler-rt    – __trunctfdf2 etc.
#   system/lib/libc           – arch/emscripten/bits/alltypes.h (used by wasm32-libc)
#   system/lib/llvm-libc      – shared/fp_bits.h (used by libcxx/charconv.cpp)
echo "→ Initializing emscripten submodule (partial clone + sparse checkout)..."

EMSCRIPTEN_DIR="$SCRIPT_DIR/3rd-party/wasm32-libcxx/emscripten"
EMSCRIPTEN_URL="$(git config --file .gitmodules submodule.3rd-party/wasm32-libcxx/emscripten.url)"
EMSCRIPTEN_SHA="$(git ls-tree HEAD 3rd-party/wasm32-libcxx/emscripten | awk '{print $3}')"

if [ ! -e "$EMSCRIPTEN_DIR/.git" ]; then
    # Register the submodule so the parent knows about it; clone and
    # checkout happen below (registration alone is cheap).
    git submodule init 3rd-party/wasm32-libcxx/emscripten

    # Partial clone: tree-only, no working tree yet.
    git clone --filter=blob:none --no-checkout "$EMSCRIPTEN_URL" "$EMSCRIPTEN_DIR"
fi

pushd "$EMSCRIPTEN_DIR" > /dev/null
git sparse-checkout init --cone
git sparse-checkout set \
    system/include \
    system/lib/libcxx \
    system/lib/libcxxabi \
    system/lib/compiler-rt \
    system/lib/libc \
    system/lib/llvm-libc

# Fetch exactly the recorded SHA (cheaper than a full history pull).
# `--depth 1` may fail if the SHA is older than the remote default-branch
# tip, in which case we fall back to a non-shallow fetch of that SHA.
git fetch --depth 1 origin "$EMSCRIPTEN_SHA" 2>/dev/null \
    || git fetch origin "$EMSCRIPTEN_SHA"

git checkout "$EMSCRIPTEN_SHA"
popd > /dev/null
echo "  ✓ emscripten libcxx ready (sparse checkout @ ${EMSCRIPTEN_SHA:0:8})"
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
