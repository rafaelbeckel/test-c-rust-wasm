#import "subtract.h"

int add(int first, int second)
{
    return first + second;
}

// Call Rust from C
int divide(int dividend, int divisor)
{
    if (divisor == 0) { return 0; }

    unsigned int quotient = 0;
    while (dividend >= divisor) {
        dividend = subtract(dividend, divisor);
        quotient = add(quotient, 1);
    }

    return quotient;
}
