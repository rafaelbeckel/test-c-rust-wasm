#include <stdlib.h>

// Same C memory implementation as crate 7. malloc and free come from
// wasm32-libc, which routes them to Rust's allocator.
unsigned int *memory = NULL;

extern void store(unsigned int value)
{
    if (memory == NULL) {
        memory = (unsigned int *)malloc(sizeof(unsigned int));
    }
    if (memory != NULL) { *memory = value; }
}

extern unsigned int retrieve()
{
    if (memory != NULL) {
        return *memory;
    } else {
        return 0;
    }
}

extern void clear()
{
    if (memory != NULL) {
        free(memory);
        memory = NULL;
    }
}
