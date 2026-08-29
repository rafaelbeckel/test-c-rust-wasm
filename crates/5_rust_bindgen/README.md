# Rust+C in the same WASM binary

## Project 5: Rust Bindgen

This is the same as the previous project, but instead of writing the Calculator struct manually, we generate the Rust bindings from the C header with [Rust Bindgen](https://rust-lang.github.io/rust-bindgen/), which is the recommended way to interact with C code from Rust.

## The Calculator class

We generate the same Javascript class as before:

- `Calculator.add()`
- `Calculator.subtract()`
- `Calculator.multiply()`
- `Calculator.divide()`
- `Calculator.store()`
- `Calculator.retrieve()`
- `Calculator.clear()`

## References

The C standard library comes from the `wasm32-libc` crate in this repo, which
compiles musl v1.2.6 for `wasm32-unknown-unknown`. Its `malloc` and `free` are
Rust functions backed by Rust's global allocator, so the C in `src/memory.c`
and the Rust around it allocate from one shared heap.
