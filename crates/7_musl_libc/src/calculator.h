#ifndef CALCULATOR_H
#define CALCULATOR_H

#include <stdio.h>

/**
 * Calculator built on the C standard library.
 *
 * Crate 4 builds the same object out of arithmetic alone. This one reaches for
 * the parts of libc that a real C library expects to find: snprintf to format
 * a result into a caller's buffer, and printf to write a line to the host
 * console. Both come from musl, compiled for wasm32 by 3rd-party/wasm32-libc.
 **/
struct Calculator {
    unsigned int (*add)(unsigned int, unsigned int);
    unsigned int (*subtract)(unsigned int, unsigned int);
    unsigned int (*multiply)(unsigned int, unsigned int);
    unsigned int (*divide)(unsigned int, unsigned int);
    void (*store)(unsigned int);
    unsigned int (*retrieve)();
    void (*clear)();
    int (*format_result)(unsigned int value, char *buf, unsigned int buf_len);
    void (*log_result)(unsigned int value);
};

// Defined in Rust
unsigned int subtract(unsigned int a, unsigned int b);
unsigned int multiply(unsigned int a, unsigned int b);

// Defined in C
unsigned int divide(unsigned int a, unsigned int b);
unsigned int add(unsigned int a, unsigned int b);

// Memory functions (malloc/free)
void store(unsigned int value);
unsigned int retrieve();
void clear();

// String formatting, through snprintf
int format_result(unsigned int value, char *buf, unsigned int buf_len);

// Writes a line to the host console, through printf
void log_result(unsigned int value);

// Factory
struct Calculator *new_calculator();
void free_calculator(struct Calculator *calculator);

#endif // CALCULATOR_H
