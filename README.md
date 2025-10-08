# Rust+C in the same WASM binary

This repository was originally created to test the state of Rust nightly for producing a compatible C ABI for the `wasm32-unknown-unknown` target with the flag `--Z wasm_c_abi=spec`.

Now [Rust v1.89](https://blog.rust-lang.org/2025/08/07/Rust-1.89.0/#standards-compliant-c-abi-on-the-wasm32-unknown-unknown-target) officially uses the "C" ABI by default.

For context, this is the [relevant tracking issue](https://github.com/rustwasm/wasm-bindgen/issues/3454) in Wasm Bingen, and the [official Rust blog post](https://blog.rust-lang.org/2025/04/04/c-abi-changes-for-wasm32-unknown-unknown/) talking about this.

## Description

The workspace contains a series of small examples of how to produce a single WASM binary with both C and Rust code that can call each other.

To see how to do it, check out the `build.sh` file in each of the crates in this workspace.

## Build Strategies

The crates experiment with different build strategies, with increasing levels of complexity:

1. [Linking Manually](crates/1_linking_manually)

   - A simple calculator with primitive data types and manual build

2. [With CC Crate](crates/2_with_cc)

   - The same calculator built with the [CC crate](https://docs.rs/cc/1.0.101/cc/)

3. [Libc and Heap](crates/3_libc_and_heap_allocation)

   - We use [OpenBSD libc](https://github.com/trevyn/wasm32-unknown-unknown-openbsd-libc) to implement the Mem function in the calculator and store/free a value in the heap from C with `malloc` and `free`

4. [Wasm Bindgen](crates/4_wasm_bindgen/)

   - We create a Calculator struct with member functions and export it with [Wasm Bindgen](https://github.com/rustwasm/wasm-bindgen)

5. [Rust Bindgen](crates/5_rust_bindgen/)

   - This is the same as the previous project, but instead of writing the Calculator struct manually, we generate the Rust bindings from the C header with [Rust Bindgen](https://rust-lang.github.io/rust-bindgen/), which is the recommended way to interact with C code from Rust.

6. [Extern Types](crates/6_extern_types/)

   - This project experiments with the nightly feature `extern types`.

## Running

To see the examples in action, use your favorite local server:

```bash
npx serve
```

Then, visit `http://localhost:3000` and click the example you want to see.

## Building

Either visit the specific crate and run its `build.sh` script or use the `build_all.sh` script in the root of the workspace to build all crates at once.

### Dependencies

- [LLVM](https://llvm.org/)
- [Clang](https://clang.llvm.org/)
- [Rust](https://www.rust-lang.org/) (1.89 or later)
- [Wasm Binary Toolkit](https://github.com/WebAssembly/wabt)

## Future plans

1. Uniffi

   - I plan to add an example with Uniffi in the future.

2. Wgpu

   - I have used these strategies in my work to build a `wgpu` project that depends on C libraries. I plan to bring a minimal example of it here.

3. Combine different crates in a build script

   - C code coming from a crate and Rust code from another, link them by using linker flags in build.rs.

4. External C libs

   - Finally, let's bring an external C lib and combine all of the above.

## Contributing

If you'd like to see any other scenario listed here, feel free to open an Issue or a PR.

If submitting a new example, create a numbered subfolder in the `crates` directory following the existing structure, and ensure your example builds correctly for both WASM and unit tests.

Finally, run `cargo clippy` and stick with the default rules.
