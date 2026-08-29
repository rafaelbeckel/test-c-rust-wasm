/*
 * Thread pointer for the single-threaded wasm32 main thread.
 *
 * musl reaches errno, the current locale and the stdio locks through
 * __pthread_self(), which is __get_tp() on this arch. A wasm module has one
 * thread, so one statically initialised control block is enough. musl would
 * normally fill these fields in __init_tp during process startup, which never
 * runs here, so they are initialised at compile time instead.
 */

#include "pthread_impl.h"

static struct pthread __main_thread = {
    .self = &__main_thread,
    .locale = &libc.global_locale,
    .tid = 1,
};

uintptr_t __get_tp(void)
{
    return (uintptr_t)&__main_thread;
}
