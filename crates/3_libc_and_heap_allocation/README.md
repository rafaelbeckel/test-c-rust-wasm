# Rust+C in the same WASM binary

## Project 3: libc and heap allocation

While `wasm32-wasi` and `wasm32-unknown-emscripten` include an interface for system functions to be provided by the host, `wasm32-unknown-unknown` is limited by communicationg with primitive types only.

In this example, we use a subset of [OpenBSD libc](https://github.com/trevyn/wasm32-unknown-unknown-openbsd-libc) and link it statically to store a value in the heap from C with `malloc()` and `free()`.

## The calculator with memory

On top of the existing functions from the previous examples, this crate implements a simple Memory feature in the calculator, which can store and retrieve a number by using `store()`, `retrieve()`, and `clear()` functions defined in C.

As an alternative to renaming the C symbols like we did in the last example, this crate adds a common prefix to the exported symbols instead:

- `calculator_add()`
- `calculator_subtract()`
- `calculator_multiply()`
- `calculator_divide()`
- `calculator_store()`
- `calculator_retrieve()`
- `calculator_clear()`

Only `subtract()` and `multiply()` are defined in Rust.

One could write a JS wrapper manually to convert these functions to a more idiomatic JavaScript class. However, the recommended way of doing that is by using wasm-bindgen, which is demonstrated in the next example.

## References

The original `wasm32-unknown-unknown-openbsd-libc` was created by [@trevyn](https://github.com/trevyn).
