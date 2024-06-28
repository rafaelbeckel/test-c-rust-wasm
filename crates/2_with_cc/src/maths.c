#import "subtract.h"

/*
When building with `cc` crate, the exported C symbols are visible from Rust
but are not reexported to WASM. This means we have to wrap the C functions
with Rust functions that will have the actual export name, and we need to
rename the C functions (with a _ prefix here) to avoid name clashes.

If you know a solution for this that does not require
renaming the C functions, feel free to submit a PR.
*/

unsigned int _add(unsigned int first, unsigned int second)
{
    return first + second;
}

// Call Rust from C
unsigned int _divide(unsigned int dividend, unsigned int divisor)
{
    if (divisor == 0) { return 0; }

    unsigned int quotient = 0;
    while (dividend >= divisor) {
        dividend = subtract(dividend, divisor);
        quotient = _add(quotient, 1);
    }

    return quotient;
}
