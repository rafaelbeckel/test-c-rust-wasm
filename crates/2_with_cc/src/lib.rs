// https://github.com/rust-lang/rfcs/issues/2771

mod ffi {
    extern "C" {
        pub(super) fn _add(left: usize, right: usize) -> usize;
        pub(super) fn _divide(left: usize, right: usize) -> usize;
    }
}

#[no_mangle]
pub extern "C" fn add(left: usize, right: usize) -> usize {
    unsafe { ffi::_add(left, right) }
}

#[no_mangle]
pub extern "C" fn divide(left: usize, right: usize) -> usize {
    unsafe { ffi::_divide(left, right) }
}

#[no_mangle]
pub extern "C" fn subtract(left: usize, right: usize) -> usize {
    if left < right {
        return 0;
    }

    left - right
}

#[no_mangle]
pub extern "C" fn multiply(left: usize, right: usize) -> usize {
    let mut result = 0;
    for _ in 0..right {
        result = unsafe { ffi::_add(result, left) };
    }

    result
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_add() {
        let result = unsafe { ffi::_add(3, 2) };
        assert_eq!(result, 5);
    }

    #[test]
    fn test_subtract_happy_case() {
        let result = subtract(3, 2);
        assert_eq!(result, 1);
    }

    #[test]
    fn test_subtract_zero() {
        let result = subtract(2, 2);
        assert_eq!(result, 0);
    }

    #[test]
    fn test_subtract_negative_not_supported() {
        let result = subtract(2, 3);
        assert_eq!(result, 0); // no panic
    }

    #[test]
    fn test_multiply() {
        let result = multiply(3, 2);
        assert_eq!(result, 6);
    }

    #[test]
    fn test_divide() {
        let result = unsafe { ffi::_divide(6, 2) };
        assert_eq!(result, 3);
    }

    #[test]
    fn test_divide_by_zero() {
        let result = unsafe { ffi::_divide(6, 0) };
        assert_eq!(result, 0);
    }
}
