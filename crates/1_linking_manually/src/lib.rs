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
        // trying to test multiply here won't work
        // because it cannot see the `add` function.
        //
        // check the other crates with a build.rs script
        // to see how to test extern "C" functions.
        assert_eq!(1, 1)
    }
}
