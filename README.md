# Rust+C in the same WASM binary

I created this repository to test the current state of the Rust nightly compiler for producing a compatible C ABI for the `wasm32-unknown-unknown` target with `--Z wasm_c_abi=spec`.

For context, this is the [relevant tracking issue](https://github.com/rustwasm/wasm-bindgen/issues/3454) in `wasm-bindgen`.

This project contains a minimal example of producing a single WASM binary with both C and Rust code that can call each other.

It's a simple calculator where:

- `add()` is defined by C
- `subtract()` is defined by Rust
- `multiply()` is defined by Rust but calls `add()` in C multiple times
- `divide()` is defined by C but calls `subtract()` in Rust multiple times

All methods are exported from a single `.wasm` file and can be called from JS.

## Building

To build the project, just call `./build_both.sh`. You need llvm, clang, and Rust nightly.

To see it working in your browser, use your preferred local server:

```bash
npx serve
```

Then, visit <http://localhost:3000/wasm> and check the console.

## How it works

You can read the mini build scripts `build_c.sh`, `build_rust.sh`, and `build_both.sh` to check the commands needed to do it. You'll need LLVM and Rust nightly.

## Next steps

I plan to eventually introduce more complex examples with multiple files and import external C and Rust libraries.

## References

Originally, the main idea behind the build scripts were to:

- Transpile C to LLVM internal representation.
- Transpile Rust to LLVM internal representation.
- Compile all `.ll` files with LLVM compiler `llc`.
- Link the compiled files with `wasm-ld`.

This idea and the steps to do it for C came from [Compiling C to WebAssembly without Emscripten](https://dassur.ma/things/c-to-webassembly) by [@surma](https://github.com/surma).

These LLVM IR intermediate steps have been removed from this repository with a generous contribution from the original author. So, while we're not using this approach anymore, I'll leave the link to the article here for historical reasons.
