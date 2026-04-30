// With musl libc, all C standard library functions needed by zlib
// (malloc, free, memcpy, etc.) are provided by the WASM binary itself.
// This env.js is a no-op shim.

let env = {};
export default env;
