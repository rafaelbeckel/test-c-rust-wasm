# wasm32-libc

musl v1.2.6, compiled for `wasm32-unknown-unknown`.

`build.rs` compiles the C sources of the `3rd-party/musl` submodule, so the
string handling, character classification, formatting, parsing, sorting and
math that C code expects are musl's own implementations. The allocator is the
exception: `malloc` and friends are written in Rust, and hand every C
allocation to Rust's global allocator so that C and Rust share one heap.

## What is compiled

Whole directories of `musl/src`:

| Module | What it brings |
| --- | --- |
| `ctype` | `isalpha`, `tolower`, the character classes |
| `errno` | `errno` and `strerror` |
| `exit` | `exit` and `assert` |
| `locale` | `localeconv`, `strcoll`, `nl_langinfo`, the `_l` variants |
| `math` | the whole of `<math.h>`, 232 files |
| `multibyte` | `mbrtowc`, `wcrtomb`, the UTF-8 conversions |
| `prng` | `rand`, `srand`, `drand48` |
| `search` | `hsearch`, `lsearch`, `tsearch` |
| `stdio` | `printf`, `fprintf`, `snprintf`, `fwrite`, `fgets`, `sscanf` |
| `stdlib` | `strtol`, `strtod`, `qsort`, `bsearch`, `abs`, `div` |
| `string` | `strlen`, `memcpy`, `strcmp`, the whole family |

That is 552 of the 556 sources in those directories. The four left out are
replaced by `src/wasm32/`, below. Six more files are named individually:
`src/internal/{floatscan,intscan,shgetc}.c` for number scanning,
`src/internal/libc.c` for the global libc struct, `src/internal/syscall_ret.c`
to turn a negative syscall return into `errno`, and `src/unistd/lseek.c`,
which stdio's default seek callback references.

## What is left out, and why it fails loudly

Files, sockets, processes, signals, threads, time and `mmap` are not compiled
at all. A wasm module has no kernel under it, and there is no honest thing for
those functions to do.

So a reference to one of them fails at **link** time. `open`, `fork`,
`clock_gettime` and `pthread_mutex_lock` are simply absent, and `wasm-ld`
stops with `undefined symbol`. That is the point. Nobody ships a binary that
quietly returns a plausible wrong answer, and the missing piece is named in
the error rather than found by debugging at runtime.

A few functions inside the compiled modules lean on a part of musl
that is not here, and fail the same way. `atexit` and `__cxa_atexit`
want `__lock` and musl's internal `calloc`. `setlocale` and `newlocale`
want `getenv` and a mapped locale file. `random` wants `__lock`. The
symbol is in the archive, the one it calls is not, and `wasm-ld` names it.

Inside the code that *is* compiled, musl still reaches for a kernel here and
there. `src/wasm32/syscall_arch.h` answers every one of those with `-ENOSYS`,
which musl is written to cope with. Reading `stdin` fails with an error rather
than reporting a silent end of file.

## The allocator

musl's own `malloc` is not compiled. It grows the heap through `brk` and
`mmap`, neither of which exists on this target, and a second allocator would
carve up a region of linear memory that Rust also believes it owns.

`src/malloc.rs` defines `malloc`, `calloc`, `realloc` and `free` in Rust
instead, forwarding to Rust's global allocator. C and Rust then share one
heap, and it grows the way `WebAssembly.Memory.grow` expects rather than
running into a ceiling somebody picked in advance.

`free(ptr)` does not carry the layout that Rust's `dealloc` needs, so each
block is over-allocated by 16 bytes and its size is written into that header.
The caller sees the pointer just past it. Sixteen is the alignment of the
largest scalar type, so every payload stays max-aligned.

Thanks to [@savage13](https://github.com/savage13), who reported that the
allocator this replaces ran out of memory and sketched this approach in
[issue #2](https://github.com/rafaelbeckel/test-c-rust-wasm/issues/2).

## The wasm32 arch layer

musl expects an arch directory per target and has none for wasm32.
`src/wasm32/` is that directory:

- `syscall_arch.h` holds the syscall entry points. All seven arities return
  `-ENOSYS`, and `__SYSCALL_LL_E`/`_O` pass a 64-bit value as one argument.
- `tls.c` defines `__get_tp`. musl reaches `errno`, the current locale and
  the stdio locks through the thread pointer. One thread means one
  statically initialised `struct pthread`, filled in at compile time because
  the startup code that would normally fill it never runs.
- `stdio.c` defines `__stdio_write` and `__stdout_write`, in place of musl's
  writev-based versions.
- `exit.c` defines `abort` and `_Exit`. Both `__builtin_trap()`, which
  reaches the host as a WebAssembly `RuntimeError` and leaves the instance
  unusable, the closest thing to abnormal termination available here.

## Where the headers come from

musl generates `bits/` from per-arch templates at build time and has no wasm32
arch to generate them from. `build.rs` stages an arch directory into
`OUT_DIR`: musl's own `arch/generic/bits` first, then emscripten's
pre-generated wasm32 headers over the top, from the `3rd-party/emscripten`
submodule. That is the port which already maintains them. Emscripten's
`errno.h` is skipped, because it forwards to the WASI headers, which this
target does not have.

`bits/syscall.h` is generated the way musl's own Makefile does it, from musl's
riscv32 table: 32-bit, and free of legacy entry points. The numbers in it are
placeholders. Every syscall on this target fails with `ENOSYS`, so no value
ever reaches a kernel.

## Standard output and standard error

`printf`, `fprintf`, `puts` and `fputs` reach the host through a single wasm
import:

```js
env.__wasm32_libc_write(fd, ptr, len)
```

fd 1 is stdout and fd 2 is stderr. A write to any other
descriptor sets `errno` to `ENOSYS` and marks the stream in error.

The page has to supply that import. `crates/7_musl_libc/src/env.js` is the
worked example: it decodes the bytes, holds a partial line until its newline
arrives, and sends stdout to `console.log` and stderr to `console.error`. The
module exports its linear memory rather than importing one, so the page must
call `setMemory(wasm.memory)` once, after `init()` resolves and before
anything in C writes.

## Setup

From the workspace root:

```bash
./setup.sh
```

That is the single source of truth. It initialises `3rd-party/musl` and does
the partial clone and sparse checkout of `3rd-party/emscripten`, whose
repository is over a gigabyte. Both are needed: musl on its own leaves the
wasm32 `bits/` headers missing, and `build.rs` panics before it compiles a
line.

## Usage

In `Cargo.toml`:

```toml
[target.'cfg(target_arch = "wasm32")'.dependencies]
wasm32-libc = { path = "../../3rd-party/wasm32-libc" }
```

In `build.rs`, point the C compiler at the headers. `DEP_WASM32_LIBC_INCLUDE`
holds two paths joined by `:`, the staged arch directory and musl's public
headers, so split it:

```rust
let mut build = cc::Build::new();

if let Ok(libc) = std::env::var("DEP_WASM32_LIBC_INCLUDE") {
    for path in libc.split(':') {
        build.include(path);
    }
    println!("cargo::rustc-link-lib=wasm32-libc");
}

build.file("src/calculator.c");
build.compile("calculator");
```

`crates/7_musl_libc/build.rs` is that same shape in place.

## License

musl is MIT. `src/malloc.rs` is the Blue Oak Model License 1.0.0. The crate's
own code is this project's MIT. See [THIRD-PARTY.md](../../THIRD-PARTY.md).
