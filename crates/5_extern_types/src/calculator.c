#import "calculator.h"
#include <stdlib.h>

extern unsigned int add(unsigned int first, unsigned int second)
{
    return first + second;
}

// Call Rust from C
extern unsigned int divide(unsigned int dividend, unsigned int divisor)
{
    if (divisor == 0) { return 0; }

    unsigned int quotient = 0;
    while (dividend >= divisor) {
        dividend = subtract(dividend, divisor);
        quotient = add(quotient, 1);
    }

    return quotient;
}

extern struct Calculator *new_calculator()
{
    struct Calculator *calculator = malloc(sizeof(struct Calculator));

    calculator->add = add;
    calculator->subtract = subtract;
    calculator->multiply = multiply;
    calculator->divide = divide;

    return calculator;
}

extern void free_calculator(struct Calculator *calculator)
{
    free(calculator);
}
