//! Tests for C library function `snprintf` (implemented in nanoprintf.c)
//!
//! Copyright (c) Jonathan 'theJPster' Pallant 2019
//! Licensed under the Blue Oak Model Licence 1.0.0

#[cfg(test)]
mod test {
    unsafe extern "C" {
        fn snprintf(buf: *mut CChar, len: usize, fmt: *const CChar, ...) -> i32;
    }

    use crate::{strcmp, CChar, CInt, CLong, CLongLong, CUInt, CULong, CULongLong};

    #[test]
    fn plain_string() {
        let mut buf = [b'\0'; 32];
        assert_eq!(unsafe { snprintf(buf.as_mut_ptr(), buf.len(), "Hi\0".as_ptr()) }, 2);
        assert_eq!(unsafe { strcmp(buf.as_ptr(), b"Hi\0" as *const u8) }, 0);
    }

    #[test]
    fn strings() {
        let mut buf = [b'\0'; 32];
        assert_eq!(
            unsafe { snprintf(buf.as_mut_ptr(), buf.len(), "%s, %s!\0".as_ptr(), "Hello\0".as_ptr(), "World\0".as_ptr()) },
            13,
        );
        assert_eq!(unsafe { strcmp(buf.as_ptr(), b"Hello, World!\0" as *const u8) }, 0);
    }
}
