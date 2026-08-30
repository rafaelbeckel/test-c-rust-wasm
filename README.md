# Rust+C/C++ in the same WASM binary

A workspace of progressive examples showing how to produce a single WASM binary
that combines Rust, C, and C++ code, from manual linking all the way to
integrating real external libraries with a full C/C++ standard library.

## Context

As of [Rust v1.89](https://blog.rust-lang.org/2025/08/07/Rust-1.89.0/#standards-compliant-c-abi-on-the-wasm32-unknown-unknown-target)
(August 2025), the `wasm32-unknown-unknown` target officially uses the
standards-compliant C ABI by default. This means C and Rust code compiled to
WASM can call each other without any special flags.

For historical context, see the
[relevant tracking issue](https://github.com/rustwasm/wasm-bindgen/issues/3454)
in wasm-bindgen and the
[official Rust blog post](https://blog.rust-lang.org/2025/04/04/c-abi-changes-for-wasm32-unknown-unknown/)
about this change.

## Build Strategies

The crates experiment with different build strategies, with increasing levels of
complexity:

### Minimal Examples (no external dependencies)

1. **[Linking Manually](crates/1_linking_manually)**. A simple calculator with
   primitive data types, built by hand with `wasm-ld`.

2. **[With CC Crate](crates/2_with_cc)**. The same calculator built with the
   [CC crate](https://docs.rs/cc/latest/cc/).

### With Musl Libc (require `./setup.sh`)

Every crate from 3 onwards links against [musl](https://musl.libc.org/) v1.2.6,
compiled from source for `wasm32-unknown-unknown` by
[`3rd-party/wasm32-libc`](3rd-party/wasm32-libc).

3. **[Libc and Heap](crates/3_libc_and_heap_allocation)**. Stores a value on the
   heap from C with `malloc` and `free`, on the same heap Rust allocates from.

4. **[Wasm Bindgen](crates/4_wasm_bindgen/)**. We create a Calculator struct
   with member functions and export it with
   [wasm-bindgen](https://github.com/rustwasm/wasm-bindgen).

5. **[Rust Bindgen](crates/5_rust_bindgen/)**. Same as above, but we generate
   the Rust bindings from the C header with
   [Rust Bindgen](https://rust-lang.github.io/rust-bindgen/).

6. **[Extern Types](crates/6_extern_types/)**. Experiments with the nightly
   feature `extern types`.

7. **[Musl Libc (full demo)](crates/7_musl_libc/)**. A more complete calculator.
   `format_result` builds a string with musl's `snprintf`, and `log_result`
   calls `printf`, which reaches the browser console through the host import
   described below.

8. **[LLVM Libc++](crates/8_llvm_libcxx/)**. Adds
   [LLVM's libc++](https://libcxx.llvm.org/) on top of musl libc, enabling C++
   standard library features (`std::vector`, `std::string`, `<algorithm>`, etc.)
   in WASM. The C++ Calculator class demonstrates how to wrap C++ objects with a
   C API for Rust FFI. Build configuration mirrors
   [emscripten's system_libs.py](https://github.com/emscripten-core/emscripten/blob/main/tools/system_libs.py).

9. **[Capstone: zlib](crates/9_capstone/)**. Integrates a real, unmodified
   external C library ([zlib](https://zlib.net/)) compiled from source.
   Demonstrates the full production pattern: external C library, musl libc,
   safe Rust wrappers, and a wasm-bindgen export.

## Setup

### Crates 1–2 (minimal)

No setup required. Just build:

```bash
cd crates/1_linking_manually && ./build.sh
```

### Crates 3–9 (require submodules)

`./setup.sh` initializes the three submodules these crates build against: musl
at `3rd-party/musl`, emscripten at `3rd-party/emscripten` (a partial, sparse
checkout of `system/lib/{libc,libcxx,libcxxabi,llvm-libc}`), and zlib at
`crates/9_capstone/zlib`.

```bash
# Initialize the submodules
./setup.sh

# Build everything
./build_all.sh

# Or build a specific crate
cd crates/4_wasm_bindgen && ./build.sh
```

### Dependencies

All examples need [LLVM](https://llvm.org/), [Clang](https://clang.llvm.org/)
and [Rust](https://www.rust-lang.org/) (stable). Crate 1 links by hand, so it
also needs `wasm-ld` from LLVM's lld on the `PATH`. Crate 6 (`extern_types`)
needs the nightly toolchain; its own `rust-toolchain.toml` selects it
automatically when you `cd` into that crate.

[wasm-pack](https://rustwasm.github.io/wasm-pack/) builds crates 4 to 9. Crates
1 to 3 export no `#[wasm_bindgen]` symbols and do not use it.

[wabt](https://github.com/WebAssembly/wabt) is required rather than merely
useful. Every crate runs `wasm2wat` over its own output under `set -e`, so a
missing `wasm2wat` fails the build. Crates 1, 2, 3, 7, 8 and 9 run it from
`build.sh`, and crates 4, 5 and 6 from the `build_with_wasm_pack.sh` that
their `build.sh` calls.

## Running

To see the examples in action, use your favorite local server:

```bash
npx serve
```

Then visit `http://localhost:3000` and click the example you want to see.

## Architecture

### How the C/C++ standard libraries work

`3rd-party/` holds the two upstream sources and the two Cargo crates that
compile them for `wasm32-unknown-unknown`:

```
3rd-party/
├── musl/            <- git submodule, https://git.musl-libc.org/git/musl
├── emscripten/      <- git submodule, libc++ sources and the wasm32
│                       bits/ headers musl has no arch for
├── wasm32-libc/     <- compiles musl for wasm32
└── wasm32-libcxx/   <- compiles LLVM libc++ on top of it
```

`wasm32-libc/build.rs` stages the headers musl expects, compiles the musl
modules described above, and adds the wasm32 arch layer musl has none of, in
`src/wasm32/`: `syscall_arch.h`, where every syscall returns `-ENOSYS`; `tls.c`,
which answers `__get_tp` for the single wasm thread; `stdio.c`, which empties
stdout and stderr through the host; and `exit.c`, where `abort` and `_Exit`
trap. The pre-generated `bits/` headers come from emscripten's musl fork, and
`bits/syscall.h` is generated from musl's own riscv32 table.

`wasm32-libcxx` depends on `wasm32-libc`, since C++ needs a C library
underneath. Consumer crates declare these as Cargo dependencies, and header
paths are propagated via Cargo's `DEP_*_INCLUDE` environment variables.

### Standard output

`printf`, `fprintf`, `puts` and `fputs` reach the page through a single wasm
import, `env.__wasm32_libc_write(fd, ptr, len)`. File descriptor 1 is stdout and
2 is stderr, and both end up in the browser console. Crates 7 and 8 are the ones
that import it; `src/env.js` in each is the JavaScript side, and their
`build.sh` copies it next to the wasm-pack output. The module exports its linear
memory rather than importing one, so the page hands that memory back with
`setMemory(wasm.memory)` once `init()` resolves.

### Dependency chain for crate 9

```
zlib_compression (Rust crate)
├── zlib (external C library, compiled from source)
├── wasm32-libc (musl libc for wasm32)
└── wasm-bindgen (JS interop)
```

## Credits

Thanks to [@savage13](https://github.com/savage13), who reported the allocator
problem in
[issue #2](https://github.com/rafaelbeckel/test-c-rust-wasm/issues/2) and
sketched the approach that `3rd-party/wasm32-libc/src/malloc.rs` uses.

## License

This project is MIT licensed. See [LICENSE.md](LICENSE.md).

It also compiles and links code it did not write: musl, LLVM's libc++ and
libc++abi, headers from emscripten, zlib, and the allocator. Each keeps its own
license, and [THIRD-PARTY.md](THIRD-PARTY.md) lists them.

## Contributing

If you'd like to see any other scenario listed here, feel free to open an Issue
or a PR.

If submitting a new example, create a numbered subfolder in the `crates`
directory following the existing structure, and ensure your example builds
correctly for both WASM and unit tests.

Finally, run `cargo clippy` and stick with the default rules. CI runs
`cargo fmt --all --check`, `cargo clippy -D warnings`, `cargo test`,
`./build_all.sh` and `node tests/smoke.mjs` on every pull request. See
[.github/workflows/ci.yml](.github/workflows/ci.yml).
