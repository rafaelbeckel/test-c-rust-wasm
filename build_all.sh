#!/bin/bash
set -euo pipefail

cd "$(dirname "${BASH_SOURCE[0]}")"

# ─── Crates 1 and 2: nothing outside this repository ───────────────
# Rust plus a couple of C files, linked by hand and then by the cc crate.
declare -a standalone=(
    "1_linking_manually"
    "2_with_cc"
)

# ─── Crates 3 to 9: the C standard library and zlib ────────────────
# Everything from crate 3 on links against 3rd-party/wasm32-libc, which
# compiles musl from the 3rd-party/musl submodule. Crate 8 adds LLVM libc++
# from 3rd-party/emscripten and crate 9 adds zlib. ./setup.sh fetches all
# three.
declare -a with_libc=(
    "3_libc_and_heap_allocation"
    "4_wasm_bindgen"
    "5_rust_bindgen"
    "6_extern_types"
    "7_musl_libc"
    "8_llvm_libcxx"
    "9_capstone"
)

# ─── Crates 3 to 9 need the submodules ─────────────────────────────
# One file per submodule, picked from what the build scripts actually read.
# Without these a build.rs panics several minutes in, which is a poor way to
# learn that a clone step was skipped. Crates 1 and 2 need none of it, so they
# still build here even when the rest cannot.
declare -a required=(
    "3rd-party/musl/include/stdio.h"
    "3rd-party/emscripten/system/lib/libc/musl/arch/emscripten/bits/alltypes.h"
    "3rd-party/emscripten/system/lib/libcxx/src/string.cpp"
    "3rd-party/emscripten/system/lib/llvm-libc/shared/fp_bits.h"
    "crates/9_capstone/zlib/zlib.h"
)

declare -a absent=()
for path in "${required[@]}"; do
    [ -e "$path" ] || absent+=("$path")
done

declare -a build_list=("${standalone[@]}")
if [ ${#absent[@]} -eq 0 ]; then
    build_list+=("${with_libc[@]}")
fi

for i in "${build_list[@]}"; do
    dir="crates/${i}"
    echo ""
    echo "## BUILDING ${dir}"
    (cd "${dir}" && ./build.sh)
done

if [ ${#absent[@]} -gt 0 ]; then
    echo "" >&2
    echo "Stopped after crate 2. These submodule sources are missing:" >&2
    for path in "${absent[@]}"; do
        echo "  $path" >&2
    done
    echo "" >&2
    echo "Crates 3 to 9 build musl, LLVM libc++ and zlib from source." >&2
    echo "Run ./setup.sh, then try again." >&2
    exit 1
fi
