//! Rust implementation of C library function `itoa`
//!
//! Copyright (c) Jonathan 'theJPster' Pallant 2019
//! Licensed under the Blue Oak Model Licence 1.0.0

use crate::CChar;

#[unsafe(no_mangle)]
pub unsafe extern "C" fn itoa(i: i64, s: *mut CChar, s_len: usize, radix: u8) -> i32 {
    unsafe {
        let (is_negative, pos_i) = if i < 0 {
            (true, (-i) as u64)
        } else {
            (false, i as u64)
        };
        if is_negative && (s_len > 0) {
            core::ptr::write(s, b'-');
            utoa(pos_i, s.offset(1), s_len - 1, radix)
        } else {
            utoa(pos_i, s, s_len, radix)
        }
    }
}

#[unsafe(no_mangle)]
pub unsafe extern "C" fn utoa(mut u: u64, s: *mut CChar, s_len: usize, radix: u8) -> i32 {
    unsafe {
        let buffer_slice = core::slice::from_raw_parts_mut(s, s_len);
        let mut index = 0usize;
        for slot in buffer_slice.iter_mut() {
            let digit = (u % radix as u64) as u8;
            if digit <= 9 {
                *slot = digit + b'0';
            } else {
                *slot = digit - 10 + b'a';
            }
            index += 1;
            u /= radix as u64;
            if u == 0 {
                break;
            }
        }
        if u != 0 {
            return -1;
        }
        if index < buffer_slice.len() {
            buffer_slice[index] = b'\0';
        }
        buffer_slice[0..index].reverse();
        index as i32
    }
}

#[cfg(test)]
mod test {
    use super::*;
    use crate::strcmp;

    #[test]
    fn zero() {
        let mut buf = [b'\0'; 32];
        assert_eq!(unsafe { itoa(0, buf.as_mut_ptr(), buf.len(), 10) }, 1);
        assert_eq!(unsafe { strcmp(buf.as_ptr(), b"0\0" as *const u8) }, 0);
    }

    #[test]
    fn hex() {
        let mut buf = [b'\0'; 32];
        assert_eq!(
            unsafe { itoa(0xDEADBEEF, buf.as_mut_ptr(), buf.len(), 16) },
            8
        );
        assert_eq!(
            unsafe { strcmp(buf.as_ptr(), b"deadbeef\0" as *const u8) },
            0
        );
    }

    #[test]
    fn negative() {
        let mut buf = [b'\0'; 32];
        unsafe { itoa(-123, buf.as_mut_ptr(), buf.len(), 10) };
        assert_eq!(unsafe { strcmp(buf.as_ptr(), b"-123\0" as *const u8) }, 0);
    }
}
