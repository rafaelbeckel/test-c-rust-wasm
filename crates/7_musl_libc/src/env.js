// With musl libc, malloc/free/realloc are provided by the WASM binary itself.
// This env.js is a no-op shim — it only exists to satisfy the wasm-bindgen
// import pattern. All memory management happens inside the WASM module.

let env = {};
export default env;
