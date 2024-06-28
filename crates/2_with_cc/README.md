# Linking Rust+C with the CC crate

Using the `cc` crate is the simplest and most reliable strategy for building Rust + C projects.

It has a couple of caveats for WASM, though. There is an [open issue](https://github.com/rust-lang/rfcs/issues/2771) in Rust about lack of reexports fro `extern C` symbols in Rust cdylibs.

Because wasmm in the web must be a cdylib, this issue applies here. The symbols from C are not exported, or are exported only if used, and are visible inside the crate but invisible outside it, and we can't have renames or duplicate symbols. This forced me to rename the symbols in C, which is OK for this demo but might be a blocker for projects that depend on external C libraries outside their control.

## The calculator

This project is the same calculator from the first crate, with a few tweaks to adapt it for building with the cc crate:

- `add()` and `divide()` are defined in C as `_add()` and `_divide()` to avoid name clashes and wrapped in Rust with their actual names.

The concept remains the same:

- `add()` is defined by C
- `subtract()` is defined by Rust
- `multiply()` is defined by Rust but calls `add()` in C multiple times
- `divide()` is defined by C but calls `subtract()` in Rust multiple times

All methods are exported from a single `.wasm` file and can be called from JS.

## Building

As always, to ensure both ABIs are compatible, you must use Rust nightly and the `--Z wasm_c_abi=spec"` flag. Check out `build.sh` for an example.

This crate explore two build strategies:

- Strategy 2: with cargo build
- Strategy 1: with wasm-pack

The `./build.sh` script will build both to the `/build` and `/pkg` directories, respectively.

To build this project yourself, you need llvm, clang, Rust nightly, and wasm-pack.

To see it working in your browser, use your preferred local server:

```bash
npx serve
```

Then, visit <http://localhost:3000> and check the console.

The example page uses both builds.

## Inspecting the output

It's especially interesting to compare the raw WAT output from cargo with the optimized one from wasm-bindgen.

To do that, just look at the `cc_calculator.wat` from both build directories, `/build` and `/pkg`.
