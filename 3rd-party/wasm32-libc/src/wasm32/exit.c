/*
 * Process termination for wasm32.
 *
 * musl ends a process through the exit_group syscall and, failing that, by
 * raising SIGABRT. A wasm module has neither: it is a library inside a host,
 * with no process of its own and no signal delivery. Both paths therefore
 * trap, which unwinds to the host as a WebAssembly RuntimeError and leaves the
 * instance unusable, the closest thing to abnormal termination available here.
 *
 * musl's own abort() and _Exit() are excluded from the build in favour of
 * these; exit() and the atexit handlers above them are musl's.
 */

#include <stdlib.h>

_Noreturn void _Exit(int status)
{
    (void)status;
    __builtin_trap();
}

_Noreturn void abort(void)
{
    __builtin_trap();
}
