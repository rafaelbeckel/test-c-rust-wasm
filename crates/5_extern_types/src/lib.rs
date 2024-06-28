#![feature(extern_types)]
use wasm_bindgen::prelude::*;

mod ffi {
    extern "C" {
        pub(super) type Calculator;
        pub(super) fn new_calculator() -> *mut Calculator;
        pub(super) fn free_calculator(calculator: *mut Calculator);

        pub(super) fn add(left: usize, right: usize) -> usize;
        pub(super) fn divide(left: usize, right: usize) -> usize;

        pub(super) fn store(number: usize);
        pub(super) fn retrieve() -> usize;
        pub(super) fn clear();
    }
}

#[wasm_bindgen]

struct Calculator {
    instance: *mut ffi::Calculator,
}

impl Drop for Calculator {
    fn drop(&mut self) {
        unsafe {
            ffi::free_calculator(self.instance);
        }
    }
}

#[wasm_bindgen]
impl Calculator {
    #[wasm_bindgen(constructor)]
    pub fn new() -> Calculator {
        let instance = unsafe { ffi::new_calculator() };
        Calculator { instance }
    }

    pub fn add(&self, left: usize, right: usize) -> usize {
        unsafe { ffi::add(left, right) }
    }

    pub fn subtract(&self, left: usize, right: usize) -> usize {
        subtract(left, right)
    }

    pub fn multiply(&self, left: usize, right: usize) -> usize {
        multiply(left, right)
    }

    pub fn divide(&self, left: usize, right: usize) -> usize {
        unsafe { ffi::divide(left, right) }
    }

    pub fn store(&self, number: usize) {
        unsafe {
            ffi::store(number);
        }
    }

    pub fn retrieve(&self) -> usize {
        unsafe { ffi::retrieve() }
    }

    pub fn clear(&self) {
        unsafe {
            ffi::clear();
        }
    }

    // forces wasm_bindgen to generate memory management functions
    //
    // @TODO check if there is a canonical way to do that
    //       i.e. though an env variable or compiler argument
    pub fn print(some_string: &str) -> String {
        String::from(some_string)
    }
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
        result = unsafe { ffi::add(result, left) };
    }

    result
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_subtract_happy_case() {
        let calculator = Calculator::new();
        let result = calculator.subtract(3, 2);
        assert_eq!(result, 1);
    }

    #[test]
    fn test_subtract_zero() {
        let calculator = Calculator::new();
        let result = calculator.subtract(2, 2);
        assert_eq!(result, 0);
    }

    #[test]
    fn test_subtract_negative_not_supported() {
        let calculator = Calculator::new();
        let result = calculator.subtract(2, 3);
        assert_eq!(result, 0); // no panic
    }

    #[test]
    fn test_multiply() {
        let calculator = Calculator::new();
        let result = calculator.multiply(3, 2);
        assert_eq!(result, 6);
    }

    #[test]
    fn test_add() {
        let calculator = Calculator::new();
        let result = calculator.add(3, 2);
        assert_eq!(result, 5);
    }

    #[test]
    fn test_divide() {
        let calculator = Calculator::new();
        let result = calculator.divide(6, 2);
        assert_eq!(result, 3);
    }

    #[test]
    fn test_divide_by_zero() {
        let calculator = Calculator::new();
        let result = calculator.divide(6, 0);
        assert_eq!(result, 0);
    }

    #[test]
    fn test_print() {
        let result = Calculator::print("Hello, World!");
        assert_eq!(result, "Hello, World!");
    }

    #[test]
    fn test_memory() {
        let calculator = Calculator::new();
        let result = calculator.retrieve();
        assert_eq!(result, 0);
        calculator.store(42);
        let result = calculator.retrieve();
        assert_eq!(result, 42);
        calculator.clear();
        let result = calculator.retrieve();
        assert_eq!(result, 0);
    }
}
