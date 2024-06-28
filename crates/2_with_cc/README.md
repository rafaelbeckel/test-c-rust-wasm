# Linking Rust+C with the CC crate

Using the `cc` crate is the simplest and most reliable strategy for building Rust + C projects.

It has a couple of caveats for WASM, though. There is an [open issue](https://github.com/rust-lang/rfcs/issues/2771) in Rust about the lack of `extern C` reexports in cdylibs. Because WASM in the web must be a cdylib, this issue applies here.

The definitions of the symbols from C are compiled to WASM **only if explicitly used by a Rust function**, and regardless of usage **they are never exported to the WASM public interface**.

They cannot be renamed (or at least I didn't find a reliable way to do so). If we try to wrap it in Rust, i.e. by scoping it in a `mod {}` and reexporting its name, we'll either get a compile error in native platforms or an empty definition in WASM.

The only solution I found while using the `cc` crate was to **rename the symbols in C** to avoid name clashes, and the wrappers in Rust have the actual exported name.

This is OK for this demo, **but might be a blocker for projects that depend on external C libraries** outside their control.

## The calculator

This is the same calculator from the first crate, with a few tweaks:

- `add()` and `divide()` were renamed in C as `_add()` and `_divide()` to avoid name clashes, then wrapped in Rust with their actual names.

The concept remains the same:

- `_add()` is defined by C, and wrapped as `add()` by Rust
- `subtract()` is defined by Rust
- `multiply()` is defined by Rust but calls `_add()` in C multiple times
- `_divide()` is defined by C, wrapped as `divide()` by Rust, and calls `subtract()` in Rust multiple times

All methods are exported to a single `.wasm` file and can be called from JS.

## Building

As always, to ensure both ABIs are compatible, you must use Rust nightly and the `--Z wasm_c_abi=spec"` flag. Check out `build.sh` for an example.

This crate explores two build strategies:

- **Strategy 1:** with cargo build
- **Strategy 2:** with wasm-pack

The `./build.sh` script will compile with **cargo** and output the results to the `/build` directory, then it will also call **wasm-pack** and output the results to the `/pkg` directory.

To build this project yourself, you need **llvm**, **clang**, **Rust nightly**, and **wasm-pack**.

To see it working in your browser, use your preferred local server:

```bash
npx serve
```

Then, visit <http://localhost:3000> and check the console.

The example uses both builds in the same page.

## Inspecting the output

It's especially interesting to compare the raw WAT output from cargo with the optimized one from wasm-bindgen.

To do that, look at the `cc_calculator.wat` from both build directories, `/build` and `/pkg`.
