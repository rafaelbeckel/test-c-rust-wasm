# wasm32-libcxx

LLVM's libc++ compiled for `wasm32-unknown-unknown`.

This crate provides the C++ standard library (`<vector>`, `<string>`, `<algorithm>`, `<iostream>`, etc.) for WASM targets. It depends on `wasm32-libc` for the underlying C library.

## Source

The libcxx and libcxxabi sources come from the Emscripten LLVM fork at `emscripten/system/lib/libcxx/` and `emscripten/system/lib/libcxxabi/`. This fork includes WASM-specific patches for exception handling and ABI compatibility.

## Setup

```bash
# From the workspace root:
./setup.sh
# Or manually:
git submodule update --init --depth 1 --no-checkout 3rd-party/wasm32-libcxx/emscripten
cd 3rd-party/wasm32-libcxx/emscripten
git sparse-checkout init --cone
git sparse-checkout set system/lib/libcxx system/lib/libcxxabi system/lib/compiler-rt
git checkout
```

## Usage

Add as a dependency in your Cargo.toml (alongside wasm32-libc):

```toml
[target.'cfg(target_arch = "wasm32")'.dependencies]
wasm32-libc = { path = "../../3rd-party/wasm32-libc" }
wasm32-libcxx = { path = "../../3rd-party/wasm32-libcxx" }
```

In your build.rs, use both `DEP_WASM32_LIBC_INCLUDE` and `DEP_WASM32_LIBCXX_INCLUDE` for C++ compilation:

```rust
if let Some(libcxx) = std::env::var_os("DEP_WASM32_LIBCXX_INCLUDE") {
    build.include(&libcxx);
    println!("cargo::rustc-link-lib=wasm32-libcxx");
}
```

## C++ Standard

Compiled with C++23 (`-std=c++23`). The C++ stdlib is linked as a static library with no system C++ stdlib linkage (`cpp_link_stdlib(None)`).

## Provenance

Based on the production implementation from [photograph_v2](https://github.com/nicknisi/photograph_v2), adapted for educational use.
