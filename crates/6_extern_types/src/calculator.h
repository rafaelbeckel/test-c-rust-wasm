#ifndef CALCULATOR_H
#define CALCULATOR_H

/**
 * What if we have an object defined in C from an external library?
 * In this example, we will define the Calculator object in C which
 * will hold pounsigned inters to the functions defined in both C and Rust.
 **/
struct Calculator {
    unsigned int (*add)(unsigned int, unsigned int);
    unsigned int (*subtract)(unsigned int, unsigned int);
    unsigned int (*multiply)(unsigned int, unsigned int);
    unsigned int (*divide)(unsigned int, unsigned int);
    void (*store)(unsigned int);
    unsigned int (*retrieve)();
    void (*clear)();
};

// Defined in Rust
unsigned int subtract(unsigned int a, unsigned int b);
unsigned int multiply(unsigned int a, unsigned int b);

// Defined in C
unsigned int divide(unsigned int a, unsigned int b);
unsigned int add(unsigned int a, unsigned int b);

// Memory functions
void store(unsigned int value);
unsigned int retrieve();
void clear();

#endif // CALCULATOR_H
