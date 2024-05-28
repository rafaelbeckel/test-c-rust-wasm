# Rust+C WASM compilation test (WIP)

I created this repository to test the current state of the Rust nightly compiler for producing a compatible C ABI with `--Z wasm_c_abi=spec`.

The goal is to produce a single WASM binary containing both C and Rust code that can call each other.

Look the `build_*.sh` files for a minimal build script that can do it.

For context, this is the [relevant tracking issue](https://github.com/rustwasm/wasm-bindgen/issues/3454) in `wasm-bindgen`.
