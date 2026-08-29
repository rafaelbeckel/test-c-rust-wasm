#!/bin/bash
set -euo pipefail

# Setup script for test-c-rust-wasm
#
# Initializes the git submodules that crates 3-9 build against:
#
#   3rd-party/musl        musl libc, compiled by 3rd-party/wasm32-libc
#   3rd-party/emscripten  LLVM libc++ sources, compiled by 3rd-party/wasm32-libcxx,
#                         and the pre-generated wasm32 arch headers musl needs
#   crates/9_capstone/zlib  the external C library crate 9 integrates
#
# Crates 1-2 have no external dependencies and build without this.

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

echo "=== Setting up test-c-rust-wasm ==="
echo ""

# Fetching from git.musl-libc.org occasionally resets the connection.
retry() {
    local attempt
    for attempt in 1 2 3; do
        if "$@"; then
            return 0
        fi
        echo "  … attempt ${attempt} failed, retrying"
        sleep 5
    done
    echo "  ✗ giving up on: $*" >&2
    return 1
}

# ─── 1. Musl libc (v1.2.6) ───────────────────────────────────────────
# Small repo (~5MB), a shallow clone is plenty.
echo "→ Initializing musl libc submodule..."
retry git submodule update --init --depth 1 3rd-party/musl
echo "  ✓ musl libc ready"
echo ""

# ─── 2. Emscripten (LLVM libc++ and the wasm32 arch headers) ─────────
# Huge repo (1+ GB), so a normal `git submodule update` is too expensive
# for CI. We do a manual partial clone (--filter=blob:none, no blobs
# until needed) + sparse-checkout, then fetch only the recorded SHA.
# The set of sparse paths matches what the build.rs scripts read:
#   system/lib/libcxx      – libc++ sources
#   system/lib/libcxxabi   – libc++abi sources
#   system/lib/llvm-libc   – shared/fp_bits.h, used by libcxx/charconv.cpp
#   system/lib/libc        – musl/arch/emscripten, the pre-generated wasm32
#                            bits/ headers that upstream musl has no arch for
echo "→ Initializing emscripten submodule (partial clone + sparse checkout)..."

EMSCRIPTEN_DIR="$SCRIPT_DIR/3rd-party/emscripten"
EMSCRIPTEN_URL="$(git config --file .gitmodules submodule.3rd-party/emscripten.url)"
# Read the pinned commit from the index rather than HEAD, so this still works
# in a tree where the submodule has been staged but not yet committed.
EMSCRIPTEN_SHA="$(git ls-files --stage 3rd-party/emscripten | awk '$1 == "160000" {print $2}')"

if [ -z "$EMSCRIPTEN_SHA" ]; then
    echo "  ✗ no commit recorded for 3rd-party/emscripten" >&2
    echo "    Check .gitmodules and 'git ls-files --stage 3rd-party/emscripten'." >&2
    exit 1
fi

if [ ! -e "$EMSCRIPTEN_DIR/.git" ]; then
    # Register the submodule so the parent knows about it; clone and
    # checkout happen below (registration alone is cheap).
    git submodule init 3rd-party/emscripten

    # Partial clone: tree-only, no working tree yet.
    retry git clone --filter=blob:none --no-checkout "$EMSCRIPTEN_URL" "$EMSCRIPTEN_DIR"
fi

pushd "$EMSCRIPTEN_DIR" > /dev/null
git sparse-checkout init --cone
git sparse-checkout set \
    system/lib/libc \
    system/lib/libcxx \
    system/lib/libcxxabi \
    system/lib/llvm-libc

# Fetch exactly the recorded SHA (cheaper than a full history pull).
# `--depth 1` may fail if the SHA is older than the remote default-branch
# tip, in which case we fall back to a non-shallow fetch of that SHA.
retry sh -c "git fetch --depth 1 origin '$EMSCRIPTEN_SHA' 2>/dev/null || git fetch origin '$EMSCRIPTEN_SHA'"

git checkout "$EMSCRIPTEN_SHA"
popd > /dev/null
echo "  ✓ emscripten sources ready (sparse checkout @ ${EMSCRIPTEN_SHA:0:8})"
echo ""

# ─── 3. Zlib (for capstone crate 9) ──────────────────────────────────
echo "→ Initializing zlib submodule..."
retry git submodule update --init --depth 1 crates/9_capstone/zlib
echo "  ✓ zlib ready"
echo ""

echo "=== Setup complete ==="
echo ""
echo "To build all crates:"
echo "  ./build_all.sh"
echo ""
echo "To build individual crates:"
echo "  cd crates/<crate_name> && ./build.sh"
