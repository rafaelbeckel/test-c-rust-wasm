use wasm_bindgen::prelude::*;

// Force-link wasm32-libc so malloc/free are available to C/C++ code.
#[cfg(target_arch = "wasm32")]
extern crate wasm32_libc;

mod ffi {
    // Opaque type — we only ever hold a pointer to it
    #[repr(C)]
    pub struct CxxCalculator {
        _private: [u8; 0],
    }

    unsafe extern "C" {
        pub fn cpp_calc_new() -> *mut CxxCalculator;
        pub fn cpp_calc_free(calc: *mut CxxCalculator);

        pub fn cpp_calc_add(calc: *mut CxxCalculator, a: u32, b: u32) -> u32;
        pub fn cpp_calc_subtract(calc: *mut CxxCalculator, a: u32, b: u32) -> u32;
        pub fn cpp_calc_multiply(calc: *mut CxxCalculator, a: u32, b: u32) -> u32;
        pub fn cpp_calc_divide(calc: *mut CxxCalculator, a: u32, b: u32) -> u32;

        pub fn cpp_calc_store(calc: *mut CxxCalculator, value: u32);
        pub fn cpp_calc_retrieve(calc: *mut CxxCalculator) -> u32;
        pub fn cpp_calc_clear(calc: *mut CxxCalculator);

        pub fn cpp_calc_history_count(calc: *mut CxxCalculator) -> u32;
        pub fn cpp_calc_history_get(calc: *mut CxxCalculator, index: u32) -> u32;
        pub fn cpp_calc_history_clear(calc: *mut CxxCalculator);

        pub fn cpp_calc_format_last(calc: *mut CxxCalculator, buf: *mut u8, buf_len: u32) -> i32;
    }
}

/// Calculator backed by a C++ class that uses std::vector and std::string.
///
/// This demonstrates integrating C++ code that depends on LLVM libc++
/// (which in turn depends on musl libc) into a wasm-bindgen-exported
/// Rust struct.
#[wasm_bindgen]
pub struct Calculator {
    inner: *mut ffi::CxxCalculator,
}

impl Drop for Calculator {
    fn drop(&mut self) {
        unsafe { ffi::cpp_calc_free(self.inner) };
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
        Calculator {
            inner: unsafe { ffi::cpp_calc_new() },
        }
    }

    pub fn add(&self, a: u32, b: u32) -> u32 {
        unsafe { ffi::cpp_calc_add(self.inner, a, b) }
    }

    pub fn subtract(&self, a: u32, b: u32) -> u32 {
        unsafe { ffi::cpp_calc_subtract(self.inner, a, b) }
    }

    pub fn multiply(&self, a: u32, b: u32) -> u32 {
        unsafe { ffi::cpp_calc_multiply(self.inner, a, b) }
    }

    pub fn divide(&self, a: u32, b: u32) -> u32 {
        unsafe { ffi::cpp_calc_divide(self.inner, a, b) }
    }

    pub fn store(&self, value: u32) {
        unsafe { ffi::cpp_calc_store(self.inner, value) };
    }

    pub fn retrieve(&self) -> u32 {
        unsafe { ffi::cpp_calc_retrieve(self.inner) }
    }

    pub fn clear(&self) {
        unsafe { ffi::cpp_calc_clear(self.inner) };
    }

    /// Returns the number of operations recorded in the C++ std::vector history.
    pub fn history_count(&self) -> u32 {
        unsafe { ffi::cpp_calc_history_count(self.inner) }
    }

    /// Get the result of a specific past operation from the C++ std::vector.
    pub fn history_get(&self, index: u32) -> u32 {
        unsafe { ffi::cpp_calc_history_get(self.inner, index) }
    }

    /// Clear the C++ operation history (std::vector::clear).
    pub fn history_clear(&self) {
        unsafe { ffi::cpp_calc_history_clear(self.inner) };
    }

    /// Format the last result using C++ std::string + snprintf.
    pub fn format_last(&self) -> String {
        let mut buf = vec![0u8; 128];
        let len =
            unsafe { ffi::cpp_calc_format_last(self.inner, buf.as_mut_ptr(), buf.len() as u32) };
        if len > 0 {
            // snprintf returns the would-have-written length, which can
            // exceed the buffer on truncation — clamp before slicing.
            let written = (len as usize).min(buf.len());
            buf.truncate(written);
            String::from_utf8_lossy(&buf).into_owned()
        } else {
            String::new()
        }
    }
}

// Rust functions callable from C/C++

#[unsafe(no_mangle)]
pub extern "C" fn rust_subtract(left: u32, right: u32) -> u32 {
    left.saturating_sub(right)
}

#[unsafe(no_mangle)]
pub extern "C" fn rust_multiply(left: u32, right: u32) -> u32 {
    left.wrapping_mul(right)
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_arithmetic() {
        let calc = Calculator::new();
        assert_eq!(calc.add(3, 2), 5);
        assert_eq!(calc.subtract(5, 3), 2);
        assert_eq!(calc.multiply(4, 3), 12);
        assert_eq!(calc.divide(10, 3), 3);
        assert_eq!(calc.divide(6, 0), 0);
    }

    #[test]
    fn test_memory() {
        let calc = Calculator::new();
        assert_eq!(calc.retrieve(), 0);
        calc.store(99);
        assert_eq!(calc.retrieve(), 99);
        calc.clear();
        assert_eq!(calc.retrieve(), 0);
    }

    #[test]
    fn test_history() {
        let calc = Calculator::new();
        calc.add(1, 2);
        calc.multiply(3, 4);
        assert_eq!(calc.history_count(), 2);
        assert_eq!(calc.history_get(0), 3); // 1+2
        assert_eq!(calc.history_get(1), 12); // 3*4
        calc.history_clear();
        assert_eq!(calc.history_count(), 0);
    }

    #[test]
    fn test_format_last() {
        let calc = Calculator::new();
        let empty = calc.format_last();
        assert_eq!(empty, "(no results)");
        calc.add(10, 20);
        let formatted = calc.format_last();
        assert!(formatted.contains("30"));
        assert!(formatted.contains("1 operations"));
    }
}
