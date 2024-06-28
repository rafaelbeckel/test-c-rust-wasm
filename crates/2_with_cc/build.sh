# As of June 2024, it is necessary to use nightly with the wasm_c_abi=spec
# flag that was introduced in April.

# The `spec` ABI will be the default compiler behavior in the future.
# If the future has arrived and the flag is not necessary anymore,
# please open an Issue or submit PR to update this script.

export RUSTFLAGS="--Z wasm_c_abi=spec"
cargo +nightly build --target=wasm32-unknown-unknown --release

cp ../../target/wasm32-unknown-unknown/release/cc_calculator.wasm build

# Optional: Feel free to read the generated WAT file
wasm2wat build/cc_calculator.wasm >build/cc_calculator.wat

# Let's build with wasm-pack as well because why not
./build_with_wasm_pack.sh
