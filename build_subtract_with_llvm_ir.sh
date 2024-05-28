RUSTFLAGS="--cfg=web_sys_unstable_apis --Z wasm_c_abi=spec" cargo rustc --target=wasm32-unknown-unknown --release -- --emit=llvm-ir

cp target/wasm32-unknown-unknown/release/deps/subtract.ll subtract.ll
cp target/wasm32-unknown-unknown/release/subtract.wasm subtract.wasm

# you can use wasm2wat to disassemble it and see exported symbols
# wasm2wat subtract.wasm
