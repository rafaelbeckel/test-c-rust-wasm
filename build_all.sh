set -e

declare -a arr=(
    "1_linking_manually"
    "2_with_cc"
    "3_libc_and_heap_allocation"
    "4_wasm_bindgen"
    "5_rust_bindgen"
    "6_extern_types"
)

for i in "${arr[@]}"
do
    dir="crates/${i}"
    echo "\n## BUILDING ${dir}"
    (cd "${dir}" && ./build.sh)
done
