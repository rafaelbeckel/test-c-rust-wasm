extern "C" {
    pub fn add(left: usize, right: usize) -> usize;
    pub fn divide(left: usize, right: usize) -> usize;
    pub fn store(value: usize);
    pub fn retrieve() -> usize;
    pub fn clear();
}

#[no_mangle]
extern "C" fn subtract(left: usize, right: usize) -> usize {
    if left < right {
        return 0;
    }

    left - right
}

#[no_mangle]
extern "C" fn multiply(left: usize, right: usize) -> usize {
    let mut result = 0;
    for _ in 0..right {
        result = unsafe { add(result, left) };
    }

    result
}

#[no_mangle]
pub fn calculator_add(left: usize, right: usize) -> usize {
    unsafe { add(left, right) }
}

#[no_mangle]
pub fn calculator_subtract(left: usize, right: usize) -> usize {
    subtract(left, right)
}

#[no_mangle]
pub fn calculator_multiply(left: usize, right: usize) -> usize {
    multiply(left, right)
}

#[no_mangle]
pub fn calculator_divide(left: usize, right: usize) -> usize {
    unsafe { divide(left, right) }
}

#[no_mangle]
pub fn calculator_store(value: usize) {
    unsafe { store(value) }
}

#[no_mangle]
pub fn calculator_retrieve() -> usize {
    unsafe { retrieve() }
}

#[no_mangle]
pub fn calculator_clear() {
    unsafe { clear() }
}

pub struct Calculator;

impl Drop for Calculator {
    fn drop(&mut self) {
        unsafe {
            let _ = Box::from_raw(self as *mut Calculator);
        }
    }
}

impl Calculator {
    pub fn add(left: usize, right: usize) -> usize {
        calculator_add(left, right)
    }

    pub fn subtract(left: usize, right: usize) -> usize {
        calculator_subtract(left, right)
    }

    pub fn multiply(left: usize, right: usize) -> usize {
        calculator_multiply(left, right)
    }

    pub fn divide(left: usize, right: usize) -> usize {
        calculator_divide(left, right)
    }

    pub fn store(value: usize) {
        calculator_store(value)
    }

    pub fn retrieve() -> usize {
        calculator_retrieve()
    }

    pub fn clear() {
        calculator_clear()
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_add() {
        let result = Calculator::add(3, 2);
        assert_eq!(result, 5);
    }

    #[test]
    fn test_subtract_happy_case() {
        let result = Calculator::subtract(3, 2);
        assert_eq!(result, 1);
    }

    #[test]
    fn test_subtract_zero() {
        let result = Calculator::subtract(2, 2);
        assert_eq!(result, 0);
    }

    #[test]
    fn test_subtract_negative_not_supported() {
        let result = Calculator::subtract(2, 3);
        assert_eq!(result, 0); // no panic
    }

    #[test]
    fn test_multiply() {
        let result = multiply(3, 2);
        assert_eq!(result, 6);
    }

    #[test]
    fn test_divide() {
        let result = Calculator::divide(6, 2);
        assert_eq!(result, 3);
    }

    #[test]
    fn test_calculator_memory() {
        // Warning: this is stored in a single memory address in C
        //          and is NOT associated with the Calculator instance.
        Calculator::store(42);
        let result = Calculator::retrieve();
        assert_eq!(result, 42);
        Calculator::clear();
        let result = Calculator::retrieve();
        assert_eq!(result, 0);
    }
}
