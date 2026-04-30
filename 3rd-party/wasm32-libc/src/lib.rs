mod ffi;
pub use ffi::*;

#[cfg(wasm)]
#[unsafe(no_mangle)]
pub unsafe extern "C" fn getenv(s: *const CChar) -> CInt {
    let s = std::ffi::CStr::from_ptr(s as *const i8);
    let s = s.to_str().unwrap();
    match std::env::var(s) {
        Ok(_) => 1,
        Err(_) => 0,
    }
}

static __ERRNO_STORAGE: CInt = 0;

#[cfg(wasm)]
#[unsafe(no_mangle)]
pub unsafe extern "C" fn __errno_location() -> *const CInt {
    &__ERRNO_STORAGE
}

#[cfg(wasm)]
#[unsafe(no_mangle)]
pub unsafe extern "C" fn puts(s: *const u8) -> *const CInt {
    let mut string = String::new();

    let mut i = 0;
    loop {
        let c = *s.add(i);
        if c == 0 {
            break;
        }
        string.push(c as char);
        i += 1;
    }
    string.push('\n');

    println!("{}", string);

    0 as *const CInt
}

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
