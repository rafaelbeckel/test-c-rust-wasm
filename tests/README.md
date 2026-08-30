# Smoke tests

`tests/smoke.mjs` loads the wasm binary each crate produces and drives it
through its real API, the way `crates/*/index.html` drives it in a browser.
It is the end to end check that the nine examples actually work, as opposed
to merely compiling.

## Running

Build first. `./setup.sh` fetches the submodules that crates 3 to 9 compile,
and `./build_all.sh` produces every binary the tests load.

```sh
./setup.sh
./build_all.sh
node tests/smoke.mjs
```

Node 18 or newer, run from the repository root. There is no test framework,
no dependency and nothing to install.

Each check prints one line. A crate whose build output is missing prints
`skipped: not built` and costs nothing, so a partially built tree still
reports on what it has. The exit code is non-zero only when a check that
actually ran did not hold.

## What it covers

Crates 1 to 3 are raw modules, so the tests instantiate them and call the
exports directly. Crates 4 to 9 are wasm-pack output, so the tests import
the generated JS wrapper and hand it the bytes. That is the one thing done
differently from a page: a page fetches the binary by URL, and there is no
server here to fetch it from.

- **Crate 1, linking manually.** `add` from C, `subtract` and `multiply`
  from Rust, `divide` looping back into Rust, and no host imports.
- **Crate 2, with cc.** The same arithmetic, through the Rust wrappers that
  re-export the C symbols.
- **Crate 3, libc and heap allocation.** The `calculator_*` exports, then
  the allocator (below).
- **Crate 4, wasm-bindgen.** The `Calculator` class over a C struct of
  function pointers.
- **Crate 5, rust-bindgen.** The same class, with the struct described by
  bindgen instead of by hand.
- **Crate 6, extern types.** The same class again, with the C type opaque.
- **Crate 7, musl libc.** Arithmetic, memory, `format_result` through
  snprintf and `log_result` through printf.
- **Crate 8, LLVM libc++.** The C++ `Calculator`, the `std::vector` history
  behind it, and `format_last` through `std::string` and snprintf.
- **Crate 9, capstone.** `zlibVersion`, and compress then decompress round
  trips over text, binary and empty input.

### The allocator

C's `malloc` and `free` are written in Rust and forward to Rust's global
allocator, so one heap serves both languages and a freed block comes back
for reuse. Crate 3 is where that is checked. The test runs five thousand
`store` / `retrieve` / `clear` rounds, each of which mallocs a slot and then
frees it, and holds two thousand 1 KiB blocks live at once, writing a marker
into both ends of every one and reading them all back to prove that no two
blocks overlap. It closes by asserting the module's exported memory stayed
inside a page budget, which an allocator that never reuses a byte could not
do.

### Standard output

Crates 7 and 8 are the two that print. `printf` and `fprintf` reach the host
through a single wasm import, `env.__wasm32_libc_write`, which `pkg/env.js`
supplies. The module exports its linear memory rather than importing one, so
the shim has to be handed that memory before the first write:

```js
const wasm = await init({ module_or_path: bytes });
env.setMemory(wasm.memory);
```

Skip that call and any print throws. The crate 7 test captures `console.log`
around `log_result(42)` and asserts that `Calculator result: 42` arrives,
which exercises the whole path from C's `printf` through musl's line
buffering to the host.
