#import "calculator.h"
#include <stdlib.h>

unsigned int add(unsigned int first, unsigned int second)
{
    return first + second;
}

// Call Rust from C
unsigned int divide(unsigned int dividend, unsigned int divisor)
{
    if (divisor == 0) { return 0; }

    unsigned int quotient = 0;
    while (dividend >= divisor) {
        dividend = subtract(dividend, divisor);
        quotient = add(quotient, 1);
    }

    return quotient;
}

/**
 * What if we have an object defined in C from an external library?
 * In this example, we will define the Calculator object in C which
 * will hold pounsigned inters to the functions defined in both C and Rust.
 **/
struct Calculator *new_calculator()
{
    struct Calculator *calculator = malloc(sizeof(struct Calculator));

    calculator->add = add;
    calculator->subtract = subtract;
    calculator->multiply = multiply;
    calculator->divide = divide;
    calculator->store = store;
    calculator->retrieve = retrieve;
    calculator->clear = clear;

    return calculator;
}

void free_calculator(struct Calculator *calculator)
{
    free(calculator);
}
