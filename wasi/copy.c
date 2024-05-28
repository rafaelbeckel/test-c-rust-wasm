#include <string.h> // this is not possible in pure WASM, only with WASI and wasi-libc

int copy(char *input, char *output)
{
    const int length = strlen(input);

    strncpy(output, input, length);

    return length;
}
