# Rust+C in the same WASM binary

## Project 1: simple calculator with manual build

This crate implements a simple calculator where:

- `add()` is defined by C
- `subtract()` is defined by Rust
- `multiply()` is defined by Rust but calls `add()` in C multiple times
- `divide()` is defined by C but calls `subtract()` in Rust multiple times

All methods are exported from a single `.wasm` file and can be called from JS.

## Building manually

This crate demonstrates how to build and link Rust + C manually.

Check out the `build.sh` script for the specific steps. You need llvm, clang, and Rust nightly.

To see it working in your browser, use your preferred local server:

```bash
npx serve
```

Then, visit <http://localhost:3000>.

## Inspecting the Binary

Optionally, for inspecting the compiled binaries, it's a good idea to install [WebAssembly Binary Toolkit](https://github.com/WebAssembly/wabt). The build scripts assume you have it installed and call `wasm2wat`, but you can also comment these lines.

## References

Originally, my main idea behind the build scripts was to:

- Transpile C to LLVM internal representation.
- Transpile Rust to LLVM internal representation.
- Compile all `.ll` files with LLVM compiler `llc`.
- Link the compiled files with `wasm-ld`.

I've got this idea while reading the excellent article [Compiling C to WebAssembly without Emscripten](https://dassur.ma/things/c-to-webassembly) by [@surma](https://github.com/surma).

These LLVM IR intermediate steps have been removed from this repository with a generous contribution from the original author.

So, while we're not using this approach anymore, I'll leave the link to the article here for credit and historical reasons.
