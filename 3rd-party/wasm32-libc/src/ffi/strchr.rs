//! Rust implementation of C library function `strchr`
//!
//! Copyright (c) 42 Technology Ltd
//! Licensed under the Blue Oak Model Licence 1.0.0

use crate::{CChar, CInt};

#[unsafe(no_mangle)]
pub unsafe extern "C" fn strchr(haystack: *const CChar, needle: CInt) -> *const CChar {
    for idx in 0.. {
        let ptr = haystack.offset(idx);
        if needle == (*ptr) as CInt { return ptr; }
        if (*ptr) == 0 { break; }
    }
    core::ptr::null()
}

#[unsafe(no_mangle)]
pub unsafe extern "C" fn strrchr(haystack: *const CChar, needle: CInt) -> *const CChar {
    let mut last = core::ptr::null();
    for idx in 0.. {
        let ptr = haystack.offset(idx);
        if needle == (*ptr) as CInt { last = ptr; }
        if (*ptr) == 0 { break; }
    }
    last
}

#[cfg(test)]
mod test {
    use super::*;

    #[test]
    fn strchr_no_match() {
        let result = unsafe { strchr(b"hayyystack\0".as_ptr(), b'X' as CInt) };
        assert_eq!(result, core::ptr::null());
    }

    #[test]
    fn strchr_start() {
        let haystack = b"hayyystack\0".as_ptr();
        let result = unsafe { strchr(haystack, b'h' as CInt) };
        assert_eq!(result, haystack);
    }
}
