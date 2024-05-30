export RUSTFLAGS="--cfg=web_sys_unstable_apis --Z wasm_c_abi=spec"
cargo +nightly build --target=wasm32-unknown-unknown --release

cp target/wasm32-unknown-unknown/release/libmaths.rlib r_maths.a
