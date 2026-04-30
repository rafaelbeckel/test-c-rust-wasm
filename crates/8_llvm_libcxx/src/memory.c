#include <stdlib.h>

// Same C memory implementation as crate 7, using musl's malloc/free
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
