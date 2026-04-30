use wasm_bindgen::prelude::*;

// Force-link the wasm32-libc Rust library so its malloc/free/etc.
// symbols are available to C code at link time.
#[cfg(target_arch = "wasm32")]
extern crate wasm32_libc;

mod ffi {
    #[allow(dead_code)]
    unsafe extern "C" {
        pub fn add(left: usize, right: usize) -> usize;
        pub fn divide(left: usize, right: usize) -> usize;
        pub fn new_calculator() -> *mut Calculator;
        pub fn free_calculator(calculator: *mut Calculator);
    }

    // The order of fields must match the C struct definition in calculator.h.
    #[repr(C)]
    pub struct Calculator {
        pub add: unsafe extern "C" fn(left: usize, right: usize) -> usize,
        pub subtract: unsafe extern "C" fn(left: usize, right: usize) -> usize,
        pub multiply: unsafe extern "C" fn(left: usize, right: usize) -> usize,
        pub divide: unsafe extern "C" fn(left: usize, right: usize) -> usize,
        pub store: unsafe extern "C" fn(number: usize),
        pub retrieve: unsafe extern "C" fn() -> usize,
        pub clear: unsafe extern "C" fn(),
        pub format_result:
            unsafe extern "C" fn(value: usize, buf: *mut u8, buf_len: usize) -> i32,
    }
}

#[wasm_bindgen]
pub struct Calculator {
    calculator: *mut ffi::Calculator,
}

impl Drop for Calculator {
    fn drop(&mut self) {
        unsafe { ffi::free_calculator(self.calculator) };
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

    /// Format a result as a string using musl's snprintf.
    /// This demonstrates using a full C standard library function
    /// that was not available with the OpenBSD libc shim.
    pub fn format_result(&self, value: usize) -> String {
        let mut buf = vec![0u8; 64];
        let len = unsafe {
            ((*self.calculator).format_result)(value, buf.as_mut_ptr(), buf.len())
        };
        if len > 0 {
            buf.truncate(len as usize);
            String::from_utf8_lossy(&buf).into_owned()
        } else {
            String::new()
        }
    }
}

#[unsafe(no_mangle)]
pub extern "C" fn subtract(left: usize, right: usize) -> usize {
    if left < right {
        return 0;
    }
    left - right
}

#[unsafe(no_mangle)]
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
    fn test_add() {
        let calc = Calculator::new();
        assert_eq!(calc.add(3, 2), 5);
    }

    #[test]
    fn test_subtract() {
        let calc = Calculator::new();
        assert_eq!(calc.subtract(3, 2), 1);
    }

    #[test]
    fn test_multiply() {
        let calc = Calculator::new();
        assert_eq!(calc.multiply(3, 2), 6);
    }

    #[test]
    fn test_divide() {
        let calc = Calculator::new();
        assert_eq!(calc.divide(6, 2), 3);
    }

    #[test]
    fn test_divide_by_zero() {
        let calc = Calculator::new();
        assert_eq!(calc.divide(6, 0), 0);
    }

    #[test]
    fn test_memory() {
        let calc = Calculator::new();
        assert_eq!(calc.retrieve(), 0);
        calc.store(42);
        assert_eq!(calc.retrieve(), 42);
        calc.clear();
        assert_eq!(calc.retrieve(), 0);
    }

    #[test]
    fn test_format_result() {
        let calc = Calculator::new();
        let result = calc.format_result(42);
        assert_eq!(result, "Result: 42");
    }
}
