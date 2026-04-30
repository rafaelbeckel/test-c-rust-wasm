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
CxxCalculator *calculator_new();
void calculator_free(CxxCalculator *calc);

// Arithmetic
unsigned int calculator_add(CxxCalculator *calc, unsigned int a, unsigned int b);
unsigned int calculator_subtract(CxxCalculator *calc, unsigned int a, unsigned int b);
unsigned int calculator_multiply(CxxCalculator *calc, unsigned int a, unsigned int b);
unsigned int calculator_divide(CxxCalculator *calc, unsigned int a, unsigned int b);

// Memory
void calculator_store(CxxCalculator *calc, unsigned int value);
unsigned int calculator_retrieve(CxxCalculator *calc);
void calculator_clear(CxxCalculator *calc);

// History (requires std::vector from libc++)
unsigned int calculator_history_count(CxxCalculator *calc);
unsigned int calculator_history_get(CxxCalculator *calc, unsigned int index);
void calculator_history_clear(CxxCalculator *calc);

// Formatting (requires std::string from libc++)
int calculator_format_last(CxxCalculator *calc, char *buf, unsigned int buf_len);

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
