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

We still use OpenBSD libc by [@trevyn](https://github.com/trevyn) here.
