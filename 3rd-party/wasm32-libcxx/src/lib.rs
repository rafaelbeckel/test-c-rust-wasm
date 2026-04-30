// All compilation work happens in build.rs (libcxx + libcxxabi from emscripten
// sources). The `__trunctfdf2` builtin (long double -> double truncation) is
// supplied as a weak symbol by Rust's `compiler_builtins`, so no shim is needed.
