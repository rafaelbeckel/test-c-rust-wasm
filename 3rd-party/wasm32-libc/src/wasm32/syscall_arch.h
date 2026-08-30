/*
 * Linux syscall layer for the wasm32-unknown-unknown target.
 *
 * There is no operating system under a bare wasm module, so every syscall
 * fails with ENOSYS. musl is written to cope with that: the code paths that
 * need a kernel return an error, and the ones that do not (string handling,
 * formatting, character classification, math) work unchanged.
 *
 * The syscall numbers themselves come from musl's own riscv32 table, which is
 * generated into bits/syscall.h at build time. Their values never reach a
 * kernel, so any consistent 32-bit table would do.
 */

#ifndef _WASM32_SYSCALL_ARCH_H
#define _WASM32_SYSCALL_ARCH_H

#include <errno.h>

/* wasm32 passes 64-bit values as a single argument. */
#define __SYSCALL_LL_E(x) (x)
#define __SYSCALL_LL_O(x) (x)

static inline long __syscall0(long n)
{
    return -ENOSYS;
}

static inline long __syscall1(long n, long a)
{
    return -ENOSYS;
}

static inline long __syscall2(long n, long a, long b)
{
    return -ENOSYS;
}

static inline long __syscall3(long n, long a, long b, long c)
{
    return -ENOSYS;
}

static inline long __syscall4(long n, long a, long b, long c, long d)
{
    return -ENOSYS;
}

static inline long __syscall5(long n, long a, long b, long c, long d, long e)
{
    return -ENOSYS;
}

static inline long __syscall6(long n, long a, long b, long c, long d, long e, long f)
{
    return -ENOSYS;
}

#endif
