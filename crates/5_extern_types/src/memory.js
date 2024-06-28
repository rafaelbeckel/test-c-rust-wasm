function __wbg_init_memory(imports, maybe_memory) {
  if (!imports.env) {
    imports.env = {};
  }

  const u16_max = 65536;

  imports.env.memory = maybe_memory || new WebAssembly.Memory({ initial: 1 });

  imports.env.malloc = (size) => {
    if (typeof wasm.__wbindgen_malloc === "function") {
      return wasm.__wbindgen_malloc(size, 1);
    } else {
      const ptr = imports.env.memory.buffer.byteLength;
      imports.env.memory.grow(Math.ceil(size / u16_max));
      return ptr;
    }
  };

  imports.env.realloc = function (ptr, size) {
    if (typeof wasm.__wbindgen_realloc === "function") {
      return wasm.__wbindgen_realloc(ptr, size, 1);
    } else {
      const mem = imports.env.memory;
      const old = mem.buffer.byteLength;
      const old_pages = Math.ceil(old / u16_max);
      const new_pages = Math.max(old_pages, Math.ceil((ptr + size) / u16_max));
      if (new_pages > old_pages) {
        mem.grow(new_pages - old_pages);
      }
      return ptr;
    }
  };

  imports.env.free = function (ptr, size) {
    if (typeof wasm.__wbindgen_free === "function") {
      wasm.__wbindgen_free(ptr, size, 1);
    }
  };
}
