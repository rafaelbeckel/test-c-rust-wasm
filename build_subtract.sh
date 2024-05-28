cargo build --target=wasm32-unknown-unknown --release

cp target/wasm32-unknown-unknown/release/subtract.wasm subtract.wasm

# you can use wasm2wat to disassemble it and see exported symbols
wasm2wat subtract.wasm
