# wasm32-libc

Musl libc compiled for `wasm32-unknown-unknown`.

This crate provides a complete C standard library for WASM, including `malloc`/`free`, `printf`/`snprintf`, string operations, and more. It replaces the minimal OpenBSD libc shim used in crates 3–6.

## Source

The musl sources are provided via git submodule at `musl/` from https://git.musl-libc.org/cgit/musl (v1.2.6).

The `src/ffi/` directory contains Rust implementations of some C stdlib functions that are either not available in musl's WASM build or need special handling for the `wasm32-unknown-unknown` target.

## Setup

```bash
# From the workspace root:
./setup.sh
# Or manually:
git submodule update --init --depth 1 3rd-party/wasm32-libc/musl
```

## Usage

Add as a dependency in your Cargo.toml:

```toml
[target.'cfg(target_arch = "wasm32")'.dependencies]
wasm32-libc = { path = "../../3rd-party/wasm32-libc" }
```

In your build.rs, use the `DEP_WASM32_LIBC_INCLUDE` environment variable to access the musl headers:

```rust
if let Some(libc) = std::env::var_os("DEP_WASM32_LIBC_INCLUDE") {
    build.include(libc);
    println!("cargo::rustc-link-lib=wasm32-libc");
}
```

## Provenance

Based on the production implementation from [photograph_v2](https://github.com/nicknisi/photograph_v2), adapted for educational use.
