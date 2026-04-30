#ifndef CALCULATOR_H
#define CALCULATOR_H

#include <stdio.h>

/**
 * Calculator with musl libc support.
 *
 * This is similar to crate 4, but uses musl libc instead of OpenBSD libc.
 * The key difference is that musl provides a full C standard library,
 * including printf/snprintf, proper malloc/free, and string operations.
 *
 * This makes it suitable for integrating real-world C libraries that
 * depend on a complete libc implementation.
 **/
struct Calculator {
    unsigned int (*add)(unsigned int, unsigned int);
    unsigned int (*subtract)(unsigned int, unsigned int);
    unsigned int (*multiply)(unsigned int, unsigned int);
    unsigned int (*divide)(unsigned int, unsigned int);
    void (*store)(unsigned int);
    unsigned int (*retrieve)();
    void (*clear)();
    // New: format a result as a string using snprintf (requires full libc)
    int (*format_result)(unsigned int value, char *buf, unsigned int buf_len);
};

// Defined in Rust
unsigned int subtract(unsigned int a, unsigned int b);
unsigned int multiply(unsigned int a, unsigned int b);

// Defined in C
unsigned int divide(unsigned int a, unsigned int b);
unsigned int add(unsigned int a, unsigned int b);

// Memory functions (use musl's malloc/free)
void store(unsigned int value);
unsigned int retrieve();
void clear();

// String formatting (uses musl's snprintf)
int format_result(unsigned int value, char *buf, unsigned int buf_len);

// Factory
struct Calculator *new_calculator();
void free_calculator(struct Calculator *calculator);

#endif // CALCULATOR_H
