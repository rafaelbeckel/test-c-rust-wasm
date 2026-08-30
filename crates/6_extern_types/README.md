# Rust+C in the same WASM binary

## Project 6: Extern Types

This build uses the experimental compiler feature
[extern types](https://rust-lang.github.io/rfcs/1861-extern-types.html).

An extern type is a C type Rust never looks inside. `src/lib.rs` declares
`type Calculator;` inside its `extern "C"` block and only ever holds a
`*mut ffi::Calculator`, allocated by `new_calculator()` in C and released by
`free_calculator()`. Projects 4 and 5 mirror the field order of
`struct Calculator` in Rust to reach its function pointers. Here the struct
stays opaque and Rust calls the C functions directly.

This only works when you write the FFI layer by hand. Rust Bindgen emits a
`#[repr(C)]` struct instead.

## Building

`extern_types` is nightly only, so this is the one crate that does not build on
the workspace toolchain. The `rust-toolchain.toml` in this directory selects
nightly, and the root `Cargo.toml` leaves the crate out of `default-members`,
so a `cargo build` at the workspace root skips it. Build it from here, where
rustup reads the toolchain file:

```bash
cd crates/6_extern_types
./build.sh
```

`./build_all.sh` at the workspace root does that `cd` for you.

## References

- [Wasm Bindgen](https://github.com/rustwasm/wasm-bindgen) generates the
  Javascript `Calculator` class.
- The C standard library comes from the `wasm32-libc` crate in this repo,
  which compiles musl v1.2.6 for `wasm32-unknown-unknown`. Its `malloc` and
  `free` are Rust functions backed by Rust's global allocator, so C and Rust
  allocate from one shared heap.
