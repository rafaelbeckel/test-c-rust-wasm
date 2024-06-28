#ifndef CALCULATOR_H
#define CALCULATOR_H

struct Calculator {
    unsigned int (*add)(unsigned int, unsigned int);
    unsigned int (*subtract)(unsigned int, unsigned int);
    unsigned int (*multiply)(unsigned int, unsigned int);
    unsigned int (*divide)(unsigned int, unsigned int);
};

// Defined in Rust
unsigned int subtract(unsigned int a, unsigned int b);
unsigned int multiply(unsigned int a, unsigned int b);

// Defined in C
unsigned int divide(unsigned int a, unsigned int b);
unsigned int add(unsigned int a, unsigned int b);

#endif // CALCULATOR_H
