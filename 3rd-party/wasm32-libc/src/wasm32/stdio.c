/*
 * Standard output and standard error for wasm32.
 *
 * musl writes a FILE's buffer through the write callback in the FILE itself,
 * which normally lands on the writev syscall. There is no kernel here, so the
 * callback hands the bytes to the host instead: env.__wasm32_libc_write, which
 * the page supplies (see the env.js next to each example).
 *
 * Only stdout and stderr have a host to write to. A write aimed anywhere
 * else sets errno to ENOSYS and marks the stream in error.
 */

#include "stdio_impl.h"

__attribute__((import_module("env"), import_name("__wasm32_libc_write"))) extern void
__wasm32_libc_write(int fd, const unsigned char *buf, size_t len);

size_t __stdio_write(FILE *f, const unsigned char *buf, size_t len)
{
    size_t pending = f->wpos - f->wbase;

    if (f->fd != 1 && f->fd != 2) {
        f->wpos = f->wbase = f->wend = 0;
        f->flags |= F_ERR;
        errno = ENOSYS;
        return 0;
    }

    if (pending) { __wasm32_libc_write(f->fd, f->wbase, pending); }
    if (len) { __wasm32_libc_write(f->fd, buf, len); }

    f->wend = f->buf + f->buf_size;
    f->wpos = f->wbase = f->buf;
    return len;
}

/*
 * musl points stdout at this until the first write, so that it can ask the
 * kernel whether stdout is a terminal and switch to line buffering if it is.
 * A host console is always line-oriented, so line buffering is the answer.
 */
size_t __stdout_write(FILE *f, const unsigned char *buf, size_t len)
{
    f->write = __stdio_write;
    if (!(f->flags & F_SVB)) { f->lbf = '\n'; }
    return __stdio_write(f, buf, len);
}
