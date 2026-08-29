# Linking Rust+C with the CC crate

## Project 2: simple calculator built with CC

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

Check out `build.sh` for an example.

The `./build.sh` script compiles with **cargo** and writes the results to the `/build` directory. It does not call wasm-pack, because nothing here is annotated with `#[wasm_bindgen]`. Crate 4 is where wasm-pack enters.

To build this project yourself, you need **llvm**, **clang**, **Rust**, and **wabt** for `wasm2wat`.

To see it working in your browser, use your preferred local server:

```bash
npx serve
```

Then, visit <http://localhost:3000>. The page fetches `build/cc_calculator.wasm` directly and writes the results into the document.

## Inspecting the output

`build.sh` also runs `wasm2wat`, so `build/cc_calculator.wat` holds the text form of the module.

It is short enough to read end to end, and it is the quickest way to see which symbols reach the WASM public interface: `add`, `subtract`, `multiply`, and `divide`, but neither `_add` nor `_divide`.
