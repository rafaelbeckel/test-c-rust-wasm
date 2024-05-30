export RUSTFLAGS="--cfg=web_sys_unstable_apis --Z wasm_c_abi=spec" 
rustc +nightly \
  --target=wasm32-unknown-unknown \
  -C opt-level=3 \
  --crate-type=cdylib \
  --emit=obj \
  -o r_maths.o \
  src/lib.rs

# cp target/wasm32-unknown-unknown/release/maths.wasm r_maths.wasm

# built in build_both.sh
# cp target/wasm32-unknown-unknown/release/maths.wasm r_maths.wasm

# you can use wasm2wat to disassemble it and see exported symbols
# wasm2wat subtract.wasm
