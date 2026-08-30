// The one host call that 3rd-party/wasm32-libc makes.
//
// musl empties a FILE's buffer through a write callback in the FILE itself,
// which on a real system lands on the writev syscall. On wasm32-unknown-unknown
// there is no kernel to land on, so it lands here instead: file descriptor 1 is
// stdout and 2 is stderr, and both end up in the browser console.
//
// The module owns its linear memory and exports it, so the page has to hand it
// back before the first write. Everything the module passes here is a pointer
// into that memory.

let memory = null;

const decoder = new TextDecoder();

// Text arrives in whatever chunks the C code flushed, so hold a partial line
// until its newline shows up rather than logging fragments.
const partial = { 1: "", 2: "" };

/**
 * Give the shim the module's exported memory. Call this once, right after
 * `init()` resolves and before anything in C writes to stdout or stderr.
 */
export function setMemory(exported) {
  memory = exported;
}

export function __wasm32_libc_write(fd, ptr, len) {
  if (memory === null) {
    throw new Error(
      "env.js: setMemory(wasm.memory) has not been called, so there is no " +
        "memory to read the output from",
    );
  }

  const bytes = new Uint8Array(memory.buffer, ptr, len);
  const text = partial[fd] + decoder.decode(bytes);
  const lines = text.split("\n");

  partial[fd] = lines.pop();
  for (const line of lines) {
    if (fd === 2) {
      console.error(line);
    } else {
      console.log(line);
    }
  }
}

export default { setMemory, __wasm32_libc_write };
