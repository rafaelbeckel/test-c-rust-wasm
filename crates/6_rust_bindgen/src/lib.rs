use wasm_bindgen::prelude::*;

mod ffi {
    #[allow(dead_code)]
    extern "C" {
        pub fn add(left: usize, right: usize) -> usize;
        pub fn divide(left: usize, right: usize) -> usize;
        pub fn new_calculator() -> *mut Calculator;
        pub fn free_calculator(calculator: *mut Calculator);
    }

    // ATTENTION!
    //
    // The ORDER of the functions in this struct is important.
    // It has to match the struct declared in the C header file.
    // The implementation still comes from C, but we moirror it
    // here so that we can wrap and reexport it.
    //
    // Opaque pointers won't work in WASM.
    #[repr(C)]
    pub struct Calculator {
        pub add: unsafe extern "C" fn(left: usize, right: usize) -> usize,
        pub subtract: unsafe extern "C" fn(left: usize, right: usize) -> usize,
        pub multiply: unsafe extern "C" fn(left: usize, right: usize) -> usize,
        pub divide: unsafe extern "C" fn(left: usize, right: usize) -> usize,
        pub store: unsafe extern "C" fn(number: usize),
        pub retrieve: unsafe extern "C" fn() -> usize,
        pub clear: unsafe extern "C" fn(),
    }
}

#[wasm_bindgen]
pub struct Calculator {
    calculator: *mut ffi::Calculator,
}

impl Drop for Calculator {
    fn drop(&mut self) {
        unsafe {
            ffi::free_calculator(self.calculator);
        }
    }
}

impl Default for Calculator {
    fn default() -> Self {
        Self::new()
    }
}

#[wasm_bindgen]
impl Calculator {
    #[wasm_bindgen(constructor)]
    pub fn new() -> Calculator {
        let calculator = unsafe { ffi::new_calculator() };
        Calculator { calculator }
    }

    pub fn add(&self, left: usize, right: usize) -> usize {
        unsafe { ((*self.calculator).add)(left, right) }
    }

    pub fn subtract(&self, left: usize, right: usize) -> usize {
        unsafe { ((*self.calculator).subtract)(left, right) }
    }

    pub fn multiply(&self, left: usize, right: usize) -> usize {
        unsafe { ((*self.calculator).multiply)(left, right) }
    }

    pub fn divide(&self, left: usize, right: usize) -> usize {
        unsafe { ((*self.calculator).divide)(left, right) }
    }

    pub fn store(&self, number: usize) {
        unsafe { ((*self.calculator).store)(number) };
    }

    pub fn retrieve(&self) -> usize {
        unsafe { ((*self.calculator).retrieve)() }
    }

    pub fn clear(&self) {
        unsafe { ((*self.calculator).clear)() };
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
