#import "subtract.h"

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
