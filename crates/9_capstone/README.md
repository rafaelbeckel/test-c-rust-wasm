# Rust+C in the same WASM binary

## Project 9: Capstone, zlib

The eight projects before this one build up a C standard library for
`wasm32-unknown-unknown`. This one spends it. [zlib](https://zlib.net/) is a
git submodule pointing at the upstream repository, and `build.rs` hands eleven
of its `.c` files to the `cc` crate with the musl headers on the include path.
Nothing is patched, stubbed, or forked. The library does not know it is in a
browser.

That is the test worth running. A C library written for desktops and servers
either compiles against this libc or it does not, and the answer says more
about the libc than any calculator can. zlib allocates with `malloc`, which
forwards to Rust's global allocator, so its compression buffers and the Rust
`Vec` that receives the bytes come from one heap.

`src/lib.rs` declares `compress`, `uncompress`, `compressBound` and
`zlibVersion`, wraps the first two in safe functions that own their buffers,
and exports a `Compressor` through wasm-bindgen. Bytes cross to JavaScript as
`Uint8Array`.

## The Compressor class

- `Compressor.version()`
- `Compressor.compress()`
- `Compressor.decompress()`

`compress(data)` returns the deflated bytes. `decompress(data, original_size)`
returns them inflated, and needs the original length because a raw zlib stream
does not record it. Both throw a JS `Error` when zlib returns anything other
than `Z_OK`.

## Setup

Run `./setup.sh` from the repository root first. This crate needs three
submodules: `3rd-party/musl` for the C standard library,
`3rd-party/emscripten` for the wasm32 `bits/` headers musl has no arch for,
and `crates/9_capstone/zlib` for the library itself.

Then `./build.sh` here, or `./build_all.sh` from the root. `index.html`
compresses a block of text, prints both byte counts, and checks the round trip
byte for byte.
