set -e

cargo build --target=wasm32-unknown-unknown --release

cp ../../target/wasm32-unknown-unknown/release/libc_calculator.wasm build

# Optional: Feel free to read the generated WAT file
wasm2wat build/libc_calculator.wasm >build/libc_calculator.wat

# Let's build with wasm-pack as well because why not
./build_with_wasm_pack.sh
