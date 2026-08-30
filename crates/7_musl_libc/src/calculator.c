#include "calculator.h"
#include <stdlib.h>
#include <stdio.h>

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

// Formats into the caller's buffer. Returns the length snprintf would have
// written, which can exceed buf_len when the text is truncated.
int format_result(unsigned int value, char *buf, unsigned int buf_len)
{
    return snprintf(buf, buf_len, "Result: %u", value);
}

// stdout is line buffered, so the newline is what pushes the text out to
// env.__wasm32_libc_write. See 3rd-party/wasm32-libc/src/wasm32/stdio.c.
void log_result(unsigned int value)
{
    printf("Calculator result: %u\n", value);
}

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
    calculator->format_result = format_result;
    calculator->log_result = log_result;

    return calculator;
}

void free_calculator(struct Calculator *calculator)
{
    free(calculator);
}
