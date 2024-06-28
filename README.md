# Rust+C in the same WASM binary

I created this repository to test the current state of the Rust nightly compiler for producing a compatible C ABI for the `wasm32-unknown-unknown` target with `--Z wasm_c_abi=spec`.

For context, this is the [relevant tracking issue](https://github.com/rustwasm/wasm-bindgen/issues/3454) in `wasm-bindgen`.

This workspace contains a series of small examples of how to produce a single WASM binary with both C and Rust code that can call each other.

## Build Strategies

The crates in this workspace experiment with different build strategies, with increasing levels of complexity:

1. [Linking Manually](crates/1_linking_manually)

   - A simple calculator with primitive data types and manual build

2. [With CC Crate](crates/2_with_cc)

   - The same calculator built with the [CC crate](https://docs.rs/cc/1.0.101/cc/)

3. [Libc and Heap (WIP)](crates/3_libc_and_heap_allocation)

   - We use [OpenBSD libc](https://github.com/trevyn/wasm32-unknown-unknown-openbsd-libc) to implement the Mem function in the calculator and store/free a value in the heap from C with `malloc` and `free`

4. [Wasm Bindgen (WIP)](crates/4_wasm_bindgen/)

   - We create a Calculator struct with member functions and export it with [Wasm Bindgen](https://github.com/rustwasm/wasm-bindgen)

5. [Extern Types](crates/5_extern_types/)

   - This is the same example as the previous `wasm-bindgen` one, but using the nightly feature `extern types`. This produces a clean binary which only requires you to provide `malloc` and `free` from env.

6. [Rust Bindgen (WIP)](crates/6_rust_bindgen/)

   - For projects that already use [Rust Bindgen](https://rust-lang.github.io/rust-bindgen/), which is the recommended way to interact with C code from Rus

## Other things to try

1. Uniffi

   - I plan to add an example with Uniffi in the future.

2. Combine different crates in a build script

   - C code coming from a crate and Rust code from another, link them by using linker flags in build.rs. This could be used to overcome the limitation of WASM expecting "extern C" blocks from env.

## Contributing

If you you'd like to see any other scenario listed here, feel free to open an Issue or a PR.

If submitting a new example, create a numbered subfolder in the `crates` directory following the existing structure, and ensure your example builds correctly for both WASM and unit tests.

Finally, run `cargo clippy` and stick with the default rules.
