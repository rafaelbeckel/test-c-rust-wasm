//! Rust implementation of C library function `strncmp`
//!
//! Copyright (c) Jonathan 'theJPster' Pallant 2019
//! Licensed under the Blue Oak Model Licence 1.0.0

use crate::{CChar, CInt};

#[unsafe(no_mangle)]
pub unsafe extern "C" fn strncmp(s1: *const CChar, s2: *const CChar, n: usize) -> crate::CInt {
    for i in 0..n as isize {
        let s1_i = s1.offset(i);
        let s2_i = s2.offset(i);
        let val = *s1_i as CInt - *s2_i as CInt;
        if val != 0 || *s1_i == 0 { return val; }
    }
    0
}

#[cfg(test)]
mod test {
    use super::*;

    #[test]
    fn matches() {
        let a = b"123\0";
        let b = b"1234\0";
        assert_eq!(unsafe { strncmp(a.as_ptr(), b.as_ptr(), 3) }, 0);
    }

    #[test]
    fn no_match() {
        let a = b"123\0";
        let b = b"x1234\0";
        assert!(unsafe { strncmp(a.as_ptr(), b.as_ptr(), 3) } < 0);
    }
}
