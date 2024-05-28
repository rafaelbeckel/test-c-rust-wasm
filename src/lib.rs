extern "C" {
    fn add(left: usize, right: usize) -> usize;
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
        result = unsafe { add(result, left) };
    }

    result
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn happy_case() {
        let result = subtract(3, 2);
        assert_eq!(result, 1);
    }

    #[test]
    fn zero() {
        let result = subtract(2, 2);
        assert_eq!(result, 0);
    }

    #[test]
    fn negative_not_supported() {
        let result = subtract(2, 3);
        assert_eq!(result, 0); // no panic
    }
}
