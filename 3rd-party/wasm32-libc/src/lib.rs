mod ffi;
pub use ffi::*;

// `__errno_location` is defined in C (src/errno.c) with the correct
// `int *` signature. `puts` and `getenv` are not provided here — if
// any linked C/C++ code references them, the link will fail loudly
// rather than silently call a wrong-ABI shim.

#[cfg(wasm)]
#[unsafe(no_mangle)]
pub unsafe extern "C" fn __assert_fail(
    assertion: *const CChar,
    file: *const CChar,
    line: CInt,
    function: *const CChar,
) {
    let assertion = std::ffi::CStr::from_ptr(assertion as *const i8);
    let assertion = assertion.to_str().unwrap();

    let file = std::ffi::CStr::from_ptr(file as *const i8);
    let file = file.to_str().unwrap();

    let function = std::ffi::CStr::from_ptr(function as *const i8);
    let function = function.to_str().unwrap();

    eprintln!(
        "Assertion failed: {} ({}, {}:{})",
        assertion, file, function, line
    );
    std::process::abort();
}

#[cfg(test)]
mod test {
    use super::*;

    #[test]
    fn strncpy_short() {
        let src = b"hi\0";
        let mut dest = *b"abcdef";
        let result = unsafe { ffi::strncpy(dest.as_mut_ptr(), src.as_ptr(), 5) };
        assert_eq!(
            unsafe { core::slice::from_raw_parts(result, 6) },
            *b"hi\0\0\0f"
        );
    }

    #[test]
    fn strncpy_two() {
        let src = b"hello\0";
        let mut dest = [0u8; 2];
        let result = unsafe { ffi::strncpy(dest.as_mut_ptr(), src.as_ptr(), dest.len()) };
        assert_eq!(unsafe { core::slice::from_raw_parts(result, 2) }, b"he");
    }
}
