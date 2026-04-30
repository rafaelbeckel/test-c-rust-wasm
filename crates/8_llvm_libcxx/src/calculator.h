#ifndef CALCULATOR_H
#define CALCULATOR_H

#ifdef __cplusplus
extern "C" {
#endif

/**
 * C-compatible interface for the C++ Calculator class.
 *
 * This demonstrates how to wrap a C++ class with a C API so that
 * Rust can consume it via FFI. The C++ implementation uses:
 *   - std::vector for operation history
 *   - std::string for formatted output
 *   - std::optional for error handling
 *
 * All of these require LLVM libc++ (wasm32-libcxx).
 */

// Opaque handle to the C++ Calculator object
typedef struct CxxCalculator CxxCalculator;

// Factory
CxxCalculator *cpp_calc_new();
void cpp_calc_free(CxxCalculator *calc);

// Arithmetic
unsigned int cpp_calc_add(CxxCalculator *calc, unsigned int a, unsigned int b);
unsigned int cpp_calc_subtract(CxxCalculator *calc, unsigned int a, unsigned int b);
unsigned int cpp_calc_multiply(CxxCalculator *calc, unsigned int a, unsigned int b);
unsigned int cpp_calc_divide(CxxCalculator *calc, unsigned int a, unsigned int b);

// Memory
void cpp_calc_store(CxxCalculator *calc, unsigned int value);
unsigned int cpp_calc_retrieve(CxxCalculator *calc);
void cpp_calc_clear(CxxCalculator *calc);

// History (requires std::vector from libc++)
unsigned int cpp_calc_history_count(CxxCalculator *calc);
unsigned int cpp_calc_history_get(CxxCalculator *calc, unsigned int index);
void cpp_calc_history_clear(CxxCalculator *calc);

// Formatting (requires std::string from libc++)
int cpp_calc_format_last(CxxCalculator *calc, char *buf, unsigned int buf_len);

// Defined in Rust
unsigned int rust_subtract(unsigned int a, unsigned int b);
unsigned int rust_multiply(unsigned int a, unsigned int b);

// Defined in C (memory.c)
void store(unsigned int value);
unsigned int retrieve();
void clear();

#ifdef __cplusplus
}
#endif

#endif // CALCULATOR_H
