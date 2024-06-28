#include <stdlib.h>

// Pointer to store the memory address
unsigned int *memory = NULL;

// Function to store a value in memory
extern void store(unsigned int value)
{
    if (memory == NULL) {
        memory = (unsigned int *)malloc(sizeof(unsigned int));
    }
    if (memory != NULL) { *memory = value; }
}

// Function to retrieve the value from memory
extern unsigned int retrieve()
{
    if (memory != NULL) {
        return *memory;
    } else {
        // Handle the case where memory is not allocated
        // Returning 0 as a default value, you may choose to handle it
        // differently
        return 0;
    }
}

// Function to clear the memory
extern void clear()
{
    if (memory != NULL) {
        free(memory);
        memory = NULL;
    }
}
