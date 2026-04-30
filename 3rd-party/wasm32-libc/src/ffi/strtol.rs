//! Rust implementation of C library function `strtol`
//!
//! Original code from the `c-ward` project.
//! Licensed under the MIT license.

use crate::{CChar, CInt, CIntMax, CLong, CLongLong, CUIntMax, CULong, CULongLong};

#[unsafe(no_mangle)]
pub unsafe extern "C" fn atoi(s: *const CChar) -> CInt {
    strtol(s, core::ptr::null_mut(), 10) as CInt
}

#[unsafe(no_mangle)]
pub unsafe extern "C" fn strtol(s: *const CChar, endptr: *mut *const CChar, base: CInt) -> CLong {
    strtox(s, endptr, base, CLong::MIN as _, CLong::MAX as _) as CLong
}

#[unsafe(no_mangle)]
pub unsafe extern "C" fn strtoul(s: *const CChar, endptr: *mut *const CChar, base: CInt) -> CULong {
    strtox(s, endptr, base, 0, CULong::MAX as _) as CULong
}

#[unsafe(no_mangle)]
pub unsafe extern "C" fn strtoll(s: *const CChar, endptr: *mut *const CChar, base: CInt) -> CLongLong {
    strtox(s, endptr, base, CLongLong::MIN, CLongLong::MAX as _) as CLongLong
}

#[unsafe(no_mangle)]
pub unsafe extern "C" fn strtoull(s: *const CChar, endptr: *mut *const CChar, base: CInt) -> CULongLong {
    strtox(s, endptr, base, 0, CULongLong::MAX) as CULongLong
}

#[unsafe(no_mangle)]
pub unsafe extern "C" fn strtoimax(s: *const CChar, endptr: *mut *const CChar, base: CInt) -> CIntMax {
    strtox(s, endptr, base, CIntMax::MIN, CIntMax::MAX as _) as CIntMax
}

#[unsafe(no_mangle)]
pub unsafe extern "C" fn strtoumax(s: *const CChar, endptr: *mut *const CChar, base: CInt) -> CUIntMax {
    strtox(s, endptr, base, 0, CUIntMax::MAX) as CUIntMax
}

pub unsafe fn strtox(
    s: *const CChar, endptr: *mut *const CChar, base: CInt, min: CIntMax, max: CUIntMax,
) -> CUIntMax {
    if !(0..=36).contains(&base) { return 0; }
    let mut s = s;
    while isspace(CInt::from(*s)) != 0 { s = s.add(1); }
    let mut negate = false;
    if *s == b'+' as CChar { s = s.add(1); }
    else if *s == b'-' as CChar { negate = true; s = s.add(1); }
    let mut base: CUIntMax = base as CUIntMax;
    if base == 0 {
        if *s == b'0' as CChar {
            s = s.add(1);
            if (*s == b'x' as CChar || *s == b'X' as CChar) && (*s.add(1)).is_ascii_hexdigit() {
                s = s.add(1); base = 16;
            } else { base = 8; }
        } else { base = 10; }
    } else if base == 16 && *s == b'0' as CChar
        && (*s.add(1) == b'x' as CChar || *s.add(1) == b'X' as CChar)
        && (*s.add(2)).is_ascii_hexdigit()
    { s = s.add(2); }

    let mut overflow = false;
    let mut num: CUIntMax = 0;
    loop {
        let digit: CUIntMax = match *s {
            x @ b'0'..=b'9' => x - b'0',
            x @ b'a'..=b'z' => x - b'a' + 10,
            x @ b'A'..=b'Z' => x - b'A' + 10,
            _ => break,
        }.into();
        if digit >= base { break; }
        if negate && min != 0 {
            if (num as CIntMax) < min / base as CIntMax { overflow = true; }
        } else if num > max / base { overflow = true; }
        num = num.wrapping_mul(base);
        if negate && min != 0 {
            if (num as CIntMax) < min + digit as CIntMax { overflow = true; }
            num = num.wrapping_sub(digit);
        } else {
            if num > max - digit { overflow = true; }
            num = num.wrapping_add(digit);
        }
        s = s.add(1);
    }
    if !endptr.is_null() { *endptr = s.cast_mut(); }
    if overflow { return if negate && min != 0 { min as CUIntMax } else { max }; }
    if negate && min == 0 { num = num.wrapping_neg(); }
    num as CUIntMax
}

#[unsafe(no_mangle)]
pub extern "C" fn isspace(argument: CInt) -> CInt {
    match argument as CChar { b' ' | b'\t' | b'\n' | b'\r' | 0x0b | 0x0c => 1, _ => 0 }
}

#[unsafe(no_mangle)]
pub extern "C" fn isdigit(argument: CInt) -> CInt {
    (argument as CChar).is_ascii_digit() as CInt
}

#[unsafe(no_mangle)]
pub extern "C" fn isalpha(argument: CInt) -> CInt {
    (argument as CChar).is_ascii_alphabetic() as CInt
}

#[unsafe(no_mangle)]
pub extern "C" fn isupper(argument: CInt) -> CInt {
    (argument as CChar).is_ascii_uppercase() as CInt
}

#[cfg(test)]
mod tests {
    use core::ptr::null_mut;
    use super::*;

    #[test]
    fn parse_hex() {
        assert_eq!(unsafe { strtoul(b"0xAA123\0".as_ptr(), null_mut(), 0) }, 0xAA123);
    }
}
