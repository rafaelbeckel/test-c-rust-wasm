let env = {};

const u16_max = 65536;

env.memory = new WebAssembly.Memory({ initial: 1 });

env.malloc = (size) => {
  const ptr = env.memory.buffer.byteLength;
  env.memory.grow(Math.ceil(size / u16_max));
  return ptr;
};

env.realloc = function (ptr, size) {
  const mem = env.memory;
  const old = mem.buffer.byteLength;
  const old_pages = Math.ceil(old / u16_max);
  const new_pages = Math.max(old_pages, Math.ceil((ptr + size) / u16_max));
  if (new_pages > old_pages) {
    mem.grow(new_pages - old_pages);
  }
  return ptr;
};

env.free = function (ptr, size) {
  /* no-op */
};

const malloc = env.malloc;
const realloc = env.realloc;
const free = env.free;

export { malloc, realloc, free };
export default env;
