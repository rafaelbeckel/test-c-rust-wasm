# As of June 2024, it is necessary to use nightly with the wasm_c_abi=spec
# flag that was introduced in April.

# The `spec` ABI will be the default compiler behavior in the future.
# If the future has arrived and the flag is not necessary anymore,
# please open an Issue or submit PR to update this script.

export RUSTFLAGS="--Z wasm_c_abi=spec"
wasm-pack build --target web --release

cp src/memory.js pkg/env.js

# Optional: Feel free to read the generated WAT file
wasm2wat pkg/libc_calculator_bg.wasm >pkg/libc_calculator.wat
