#include <stdlib.h>

// Pointer to store the memory address. malloc and free come from
// wasm32-libc, which routes them to Rust's allocator.
unsigned int *memory = NULL;

// Stores a value in memory
extern void store(unsigned int value)
{
    if (memory == NULL) {
        memory = (unsigned int *)malloc(sizeof(unsigned int));
    }
    if (memory != NULL) { *memory = value; }
}

// Retrieves the value from memory
extern unsigned int retrieve()
{
    if (memory != NULL) {
        return *memory;
    } else {
        return 0;
    }
}

// Clears the memory
extern void clear()
{
    if (memory != NULL) {
        free(memory);
        memory = NULL;
    }
}
