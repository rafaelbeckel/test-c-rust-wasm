# Rust+C in the same WASM binary

## Project 8: LLVM Libc++

Project 7 gives the C side a complete C standard library. C++ needs one more
layer on top, and this is it. LLVM's libc++ and libc++abi are compiled for
`wasm32-unknown-unknown` by the `wasm32-libcxx` crate in `3rd-party/`, from
the sources emscripten carries, and they sit on the musl from project 7.

`src/calculator.cpp` is a C++ class, not a struct of function pointers. It
keeps its results in a `std::vector` and builds its label with a
`std::string`, so the standard library is doing real work rather than being
linked in and ignored. The rest of the libc++ headers, `<algorithm>` among
them, sit on the include path next to those two.

Rust cannot call a C++ method, so the class is wrapped in a handful of
`extern "C"` functions over an opaque handle. That C API is what `src/lib.rs`
declares in its FFI block, and wasm-bindgen exports a Rust struct around it.
Traffic runs the other way too: `subtract` and `multiply` inside the C++ class
call Rust.

## The Calculator class

- `Calculator.add()`
- `Calculator.subtract()`
- `Calculator.multiply()`
- `Calculator.divide()`
- `Calculator.store()`
- `Calculator.retrieve()`
- `Calculator.clear()`
- `Calculator.history_count()`
- `Calculator.history_get()`
- `Calculator.history_clear()`
- `Calculator.format_last()`

Every arithmetic call appends its result to the C++ vector, and the three
`history_` members read and empty it. `format_last()` returns the text
`snprintf` builds from the last entry. `store`, `retrieve` and `clear` are
still the plain C slot in `src/memory.c`.

## Printed output

The module imports `env.__wasm32_libc_write(fd, ptr, len)`, and `src/env.js`
sends file descriptor 1 to `console.log` and 2 to `console.error`. Nothing
here writes through it. It is there because libc++ reports a failed assertion
or a call to `std::terminate` on stderr before it aborts, and that report
needs somewhere to go.

The page still has to hand the module's memory to the shim, so the message has
something to be read out of:

```js
import init, { Calculator } from "./pkg/libcxx_calculator.js";
import { setMemory } from "./pkg/env.js";

const wasm = await init();
setMemory(wasm.memory);
```

## Setup

Run `./setup.sh` from the repository root first. This crate needs two of the
three submodules it initializes: `3rd-party/musl` for the C standard library,
and `3rd-party/emscripten` for the libc++ and libc++abi sources plus the
wasm32 `bits/` headers musl has no arch for. The emscripten checkout is
sparse, and the four paths it keeps are exactly the ones the build scripts
in `3rd-party/` read.

Then `./build.sh` here, or `./build_all.sh` from the root.
