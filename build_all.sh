#!/bin/bash
set -e

# ─── Minimal examples (no external dependencies) ───────────────────
declare -a minimal=(
    "1_linking_manually"
    "2_with_cc"
)

for i in "${minimal[@]}"
do
    dir="crates/${i}"
    echo ""
    echo "## BUILDING ${dir}"
    (cd "${dir}" && ./build.sh)
done

# ─── All remaining examples (require ./setup.sh first) ─────────────
declare -a with_libc=(
    "3_libc_and_heap_allocation"
    "4_wasm_bindgen"
    "5_rust_bindgen"
    "6_extern_types"
    "7_musl_libc"
    "8_llvm_libcxx"
    "9_capstone"
)

for i in "${with_libc[@]}"
do
    dir="crates/${i}"
    echo ""
    echo "## BUILDING ${dir}"
    (cd "${dir}" && ./build.sh)
done
