# Rust+C/C++ in the same WASM binary

A workspace of progressive examples showing how to produce a single WASM binary that combines Rust, C, and C++ code — from manual linking all the way to integrating real external libraries with a full C/C++ standard library.

## Context

As of [Rust v1.89](https://blog.rust-lang.org/2025/08/07/Rust-1.89.0/#standards-compliant-c-abi-on-the-wasm32-unknown-unknown-target) (August 2025), the `wasm32-unknown-unknown` target officially uses the standards-compliant C ABI by default. This means C and Rust code compiled to WASM can call each other without any special flags.

For historical context, see the [relevant tracking issue](https://github.com/rustwasm/wasm-bindgen/issues/3454) in wasm-bindgen and the [official Rust blog post](https://blog.rust-lang.org/2025/04/04/c-abi-changes-for-wasm32-unknown-unknown/) about this change.

## Build Strategies

The crates experiment with different build strategies, with increasing levels of complexity:

### Minimal Examples (no external dependencies)

1. **[Linking Manually](crates/1_linking_manually)** — A simple calculator with primitive data types and manual build using `wasm-ld`.

2. **[With CC Crate](crates/2_with_cc)** — The same calculator built with the [CC crate](https://docs.rs/cc/latest/cc/).

### With Musl Libc (require `./setup.sh`)

All crates from 3 onwards use [musl libc](https://musl.libc.org/) (v1.2.6) compiled for `wasm32-unknown-unknown`, providing a full C standard library (`malloc`/`free`, `printf`/`snprintf`, string operations, etc.).

3. **[Libc and Heap](crates/3_libc_and_heap_allocation)** — Adds heap allocation (`malloc`/`free`) via musl libc.

4. **[Wasm Bindgen](crates/4_wasm_bindgen/)** — We create a Calculator struct with member functions and export it with [wasm-bindgen](https://github.com/nicknisi/wasm-bindgen).

5. **[Rust Bindgen](crates/5_rust_bindgen/)** — Same as above, but we generate the Rust bindings from the C header with [Rust Bindgen](https://rust-lang.github.io/rust-bindgen/).

6. **[Extern Types](crates/6_extern_types/)** — Experiments with the nightly feature `extern types`.

7. **[Musl Libc (full demo)](crates/7_musl_libc/)** — A more complete calculator that exercises musl's `snprintf` for formatted output. Demonstrates the pattern used in production for integrating real-world C libraries.

8. **[LLVM Libc++](crates/8_llvm_libcxx/)** — Adds [LLVM's libc++](https://libcxx.llvm.org/) on top of musl libc, enabling C++ standard library features (`std::vector`, `std::string`, `<algorithm>`, etc.) in WASM. The C++ Calculator class demonstrates how to wrap C++ objects with a C API for Rust FFI. Build configuration mirrors [emscripten's system_libs.py](https://github.com/emscripten-core/emscripten/blob/main/tools/system_libs.py).

9. **[Capstone: zlib](crates/9_capstone/)** — Integrates a real, unmodified external C library ([zlib](https://zlib.net/)) compiled from source. Demonstrates the full production pattern: external C library + musl libc + safe Rust wrappers + wasm-bindgen export.

## Setup

### Crates 1–2 (minimal)

No setup required. Just build:

```bash
cd crates/1_linking_manually && ./build.sh
```

### Crates 3–9 (require submodules)

Initialize the git submodules first, then build:

```bash
# Initialize submodules (musl, emscripten libcxx, zlib)
./setup.sh

# Build everything
./build_all.sh

# Or build a specific crate
cd crates/4_wasm_bindgen && ./build.sh
```

### Dependencies

All examples require [LLVM](https://llvm.org/), [Clang](https://clang.llvm.org/), [Rust](https://www.rust-lang.org/) (stable), and [wasm-pack](https://rustwasm.github.io/wasm-pack/). Crate 6 (`extern_types`) additionally needs the nightly toolchain — its own `rust-toolchain.toml` selects it automatically when you `cd` into that crate.

For inspecting outputs: [Wasm Binary Toolkit](https://github.com/nicknisi/wabt) (`wasm2wat`).

## Running

To see the examples in action, use your favorite local server:

```bash
npx serve
```

Then visit `http://localhost:3000` and click the example you want to see.

## Architecture

### How the C/C++ standard libraries work

The `3rd-party/` directory contains two Rust crates that compile and link the C/C++ standard libraries for `wasm32-unknown-unknown`:

```
3rd-party/
├── wasm32-libc/         # Musl libc compiled for wasm32
│   ├── musl/            # ← git submodule (https://git.musl-libc.org/cgit/musl)
│   ├── src/ffi/         # Rust implementations of C stdlib functions
│   └── build.rs         # Compiles musl + generates Rust bindings
│
└── wasm32-libcxx/       # LLVM libc++ compiled for wasm32
    ├── emscripten/      # ← git submodule (https://github.com/emscripten-core/emscripten)
    └── build.rs         # Compiles libcxx + libcxxabi from emscripten sources
```

The wasm32-libcxx crate depends on wasm32-libc (C++ needs a C library underneath). Consumer crates declare these as Cargo dependencies, and header paths are propagated via Cargo's `DEP_*_INCLUDE` environment variables.

This is the same approach used in production for [photograph_v2](https://github.com/nicknisi/photograph_v2), which integrates 11 C/C++ libraries (freetype, harfbuzz, zlib, libpng, lunasvg, etc.) into a single WASM binary.

### Dependency chain for crate 9

```
zlib_compression (Rust crate)
├── zlib (external C library, compiled from source)
├── wasm32-libc (musl libc for wasm32)
└── wasm-bindgen (JS interop)
```

## Contributing

If you'd like to see any other scenario listed here, feel free to open an Issue or a PR.

If submitting a new example, create a numbered subfolder in the `crates` directory following the existing structure, and ensure your example builds correctly for both WASM and unit tests.

Finally, run `cargo clippy` and stick with the default rules. CI runs `cargo fmt --check`, `cargo clippy -D warnings`, `cargo test`, and `./build_all.sh` on every pull request — see [.github/workflows/ci.yml](.github/workflows/ci.yml).
