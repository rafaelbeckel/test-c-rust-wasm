//! Rust implementation of C library function `strcmp`
//!
//! Copyright (c) Jonathan 'theJPster' Pallant 2019
//! Licensed under the Blue Oak Model Licence 1.0.0

use crate::{CChar, CInt};

#[unsafe(no_mangle)]
pub unsafe extern "C" fn strcmp(s1: *const CChar, s2: *const CChar) -> CInt {
    for i in 0.. {
        let s1_i = s1.offset(i);
        let s2_i = s2.offset(i);
        let val = *s1_i as CInt - *s2_i as CInt;
        if val != 0 || *s1_i == 0 {
            return val;
        }
    }
    0
}

#[cfg(test)]
mod test {
    use super::*;

    #[test]
    fn equal() { assert!(unsafe { strcmp(b"Hello\0" as *const CChar, b"Hello\0" as *const CChar) } == 0); }

    #[test]
    fn less() { assert!(unsafe { strcmp(b"Hello\0" as *const CChar, b"Hello1\0" as *const CChar) } < 0); }

    #[test]
    fn greater() { assert!(unsafe { strcmp(b"Hello1\0" as *const CChar, b"Hello\0" as *const CChar) } > 0); }
}
