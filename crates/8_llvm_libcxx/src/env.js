// With musl libc + LLVM libc++, all C/C++ standard library functions
// are provided by the WASM binary itself. This env.js is a no-op shim.

let env = {};
export default env;
