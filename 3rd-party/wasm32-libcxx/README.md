# wasm32-libcxx

LLVM's libc++ and libc++abi, compiled for `wasm32-unknown-unknown` on top of
[`wasm32-libc`](../wasm32-libc/README.md).

## Source

The sources come from the emscripten submodule at `3rd-party/emscripten`,
which vendors the LLVM Project's C++ library with the patches emscripten's
wasm target needs. `build.rs` reads three directories under it:

- `system/lib/libcxx`, the library and its headers
- `system/lib/libcxxabi`, the ABI runtime
- `system/lib/llvm-libc`, for one header, `shared/fp_bits.h`, which
  `charconv.cpp` includes

The source lists, the exclusions and the defines mirror emscripten's
`tools/system_libs.py`.

## Setup

From the workspace root:

```bash
./setup.sh
```

That is the single source of truth. Emscripten's repository is over a
gigabyte, so `setup.sh` does a partial clone with a sparse checkout of exactly
the paths the build reads: the three directories above, plus `system/lib/libc`,
which `wasm32-libc` needs for the pre-generated wasm32 `bits/` headers.
Leaving any of them out gives a checkout that compiles nothing.

## How it is built

C++23 (`-std=c++23`), single-threaded, no exceptions, and no system C++
library underneath (`cpp_link_stdlib(None)`). libc++abi is compiled with
`_LIBCXXABI_NO_EXCEPTIONS` and `cxa_noexception.cpp` in place of the unwinder,
so `__cxa_throw` does not exist in the archive. Compile your own C++ with
`-fno-exceptions`, which the `cc` crate already does for this target. libc++
then turns what would have been a throw into `__libcpp_verbose_abort`, which
writes the reason to stderr and traps. That path is why the crate needs a real
`stderr`, `vfprintf` and `fputc` from `wasm32-libc`.

## What works

Containers, strings, iterators and algorithms: `<vector>`, `<string>`,
`<map>`, `<algorithm>`, `<memory>`, `<optional>`, `<charconv>`, `<cmath>`.

Output goes through `<cstdio>`. `printf` and `snprintf` are musl's, and fd 1
and fd 2 reach the host through the one import `wasm32-libc` declares, so
`std::printf` lands in the browser console. `crates/8_llvm_libcxx` is built
this way: `std::vector` for the result history, `std::string` and `snprintf`
for formatting.

## What does not link

Each of these fails at link time, with the missing symbol named, rather than
misbehaving at runtime:

- **The iostreams.** `<iostream>` and `<sstream>` construct a `std::locale`,
  whose `time_put` facet calls `strftime_l`. musl's `src/time` is not
  compiled, so the link stops at `undefined symbol: strftime_l`. This covers
  `std::cout` and `std::ostringstream` alike. Use `<cstdio>` instead.
- **Threads and synchronisation.** `<thread>`, `<mutex>` and `<future>` want
  `pthread_create`, `pthread_mutex_lock` and the rest of `src/thread`.
- **Clocks.** `std::chrono::steady_clock::now()` wants `clock_gettime`.
- **The filesystem library.** `<filesystem>` wants `stat` and the other file
  syscalls.

## Usage

In `Cargo.toml`, alongside `wasm32-libc`:

```toml
[target.'cfg(target_arch = "wasm32")'.dependencies]
wasm32-libc = { path = "../../3rd-party/wasm32-libc" }
wasm32-libcxx = { path = "../../3rd-party/wasm32-libcxx" }
```

In `build.rs`, the C++ headers go on the include path before the C ones.
`DEP_WASM32_LIBCXX_INCLUDE` is a single path; `DEP_WASM32_LIBC_INCLUDE` holds
two joined by `:`, so split that one:

```rust
let mut build = cc::Build::new();
build.cpp(true).std("c++23").cpp_link_stdlib(None);

if let Some(libcxx) = std::env::var_os("DEP_WASM32_LIBCXX_INCLUDE") {
    build.include(&libcxx);
    println!("cargo::rustc-link-lib=wasm32-libcxx");
}
if let Ok(libc) = std::env::var("DEP_WASM32_LIBC_INCLUDE") {
    for path in libc.split(':') {
        build.include(path);
    }
    println!("cargo::rustc-link-lib=wasm32-libc");
}

build.file("src/calculator.cpp");
build.compile("calculator");
```

`crates/8_llvm_libcxx/build.rs` is that same shape in place, with a second
`cc::Build` for the C sources next to the C++ ones.

## License

LLVM libc++ and libc++abi are Apache-2.0 WITH LLVM-exception. See
[THIRD-PARTY.md](../../THIRD-PARTY.md).
