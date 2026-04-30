#![feature(f128)]

/// Truncate a 128-bit float to 64-bit.
///
/// This is needed because LLVM's libcxx uses `long double` which may map to
/// f128 on some targets. In WASM, we provide this symbol to satisfy the linker.
#[unsafe(no_mangle)]
pub unsafe extern "C" fn __trunctfdf2(x: f128) -> f64 {
    x as f64
}
