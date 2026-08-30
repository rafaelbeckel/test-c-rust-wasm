# Rust+C in the same WASM binary

## Project 7: Musl Libc

The examples up to here ask the C standard library for one thing at most, a
heap. This one asks for the rest of it. The calculator formats a result with
`snprintf` and writes a line with `printf`, which means string handling, a
`FILE` with a buffer behind it, and the machinery that empties that buffer.

The code behind all that is musl v1.2.6, compiled for
`wasm32-unknown-unknown` by the `wasm32-libc` crate in `3rd-party/`. Two
pieces are not musl's. `malloc` and `free` are Rust functions backed by Rust's
global allocator, so C and Rust allocate from one heap that grows with the
WASM memory. And the callback that empties a `FILE` buffer, a `writev`
syscall on a system with a kernel, hands its bytes to the host instead.

## The Calculator class

The same object as the earlier examples, with two members that need a real
libc underneath:

- `Calculator.add()`
- `Calculator.subtract()`
- `Calculator.multiply()`
- `Calculator.divide()`
- `Calculator.store()`
- `Calculator.retrieve()`
- `Calculator.clear()`
- `Calculator.format_result()`
- `Calculator.log_result()`

`format_result(value)` calls `snprintf` into a buffer Rust owns and returns
the text as a JS string. `log_result(value)` calls `printf`, and the line goes
to the host rather than to a return value.

## Printed output

C writes to stdout and stderr through a single import,
`env.__wasm32_libc_write(fd, ptr, len)`. `src/env.js` implements it: file
descriptor 1 is `console.log`, 2 is `console.error`. `build.sh` copies that
file to `pkg/env.js` and rewrites wasm-bindgen's bare `from "env"` so the
browser can resolve it.

The module exports its memory instead of importing one, so the page has to
hand it back before the first write:

```js
import init, { Calculator } from "./pkg/musl_calculator.js";
import { setMemory } from "./pkg/env.js";

const wasm = await init();
setMemory(wasm.memory);
```

Open `index.html` through a local server and watch the developer console for
the line `log_result` prints.

## Setup

Run `./setup.sh` from the repository root first. This crate needs two of the
three submodules it initializes: `3rd-party/musl` for the C sources, and
`3rd-party/emscripten` for the pre-generated wasm32 `bits/` headers, since
upstream musl has no wasm32 arch of its own.

Then `./build.sh` here, or `./build_all.sh` from the root.
