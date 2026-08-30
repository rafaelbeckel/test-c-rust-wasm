#!/usr/bin/env node
/**
 * End to end smoke tests for the nine example crates.
 *
 * Each crate is loaded the way its page loads it, then driven through its real
 * API. Crates 1 to 3 are raw modules, instantiated and called directly. Crates
 * 4 to 9 are wasm-pack output, so the generated JS wrapper does the work and
 * this script only hands it the bytes.
 *
 * Run it from the repo root, after ./setup.sh and ./build_all.sh:
 *
 *     node tests/smoke.mjs
 *
 * A crate whose build output is missing is skipped rather than failed, so a
 * partial tree still reports on what it has. The exit code is non-zero only
 * when a check that actually ran did not hold.
 */

import { existsSync, readFileSync } from "node:fs";
import { dirname, join } from "node:path";
import { fileURLToPath, pathToFileURL } from "node:url";

const ROOT = join(dirname(fileURLToPath(import.meta.url)), "..");
const PAGE = 65536;

let passed = 0;
let failed = 0;
let skipped = 0;

function ok(label) {
  passed += 1;
  console.log(`  ok   ${label}`);
}

function bad(label, detail) {
  failed += 1;
  console.log(`  FAIL ${label}`);
  if (detail !== undefined && detail !== null) {
    for (const line of String(detail).split("\n")) {
      console.log(`       ${line}`);
    }
  }
}

function show(value) {
  if (typeof value === "string") return JSON.stringify(value);
  if (ArrayBuffer.isView(value)) return `${value.length} bytes`;
  return String(value);
}

function eq(label, actual, expected) {
  if (Object.is(actual, expected)) {
    ok(label);
  } else {
    bad(label, `expected ${show(expected)}, got ${show(actual)}`);
  }
}

function truthy(label, condition, detail) {
  if (condition) {
    ok(label);
  } else {
    bad(label, detail);
  }
}

function sameBytes(label, actual, expected) {
  if (actual.length !== expected.length) {
    bad(label, `got ${actual.length} bytes, expected ${expected.length}`);
    return;
  }
  for (let i = 0; i < expected.length; i += 1) {
    if (actual[i] !== expected[i]) {
      bad(label, `byte ${i} is ${actual[i]}, expected ${expected[i]}`);
      return;
    }
  }
  ok(label);
}

/**
 * Runs one crate's checks.
 *
 * `artifacts` are repo relative paths that must all exist; if any is missing
 * the whole crate is skipped. The body receives them as absolute paths.
 */
async function crate(title, artifacts, body) {
  console.log(`\n${title}`);
  const missing = artifacts.find((path) => !existsSync(join(ROOT, path)));
  if (missing) {
    skipped += 1;
    console.log(`  skipped: not built (${missing})`);
    return;
  }
  try {
    await body(artifacts.map((path) => join(ROOT, path)));
  } catch (error) {
    bad(`${title} threw`, error && error.stack ? error.stack : error);
  }
}

/** Instantiates a raw module, which is all crates 1 to 3 need. */
async function instantiate(path) {
  const { instance } = await WebAssembly.instantiate(readFileSync(path), {});
  return instance.exports;
}

/** The set of import modules a binary asks its host for. */
function importedModules(path) {
  const compiled = new WebAssembly.Module(readFileSync(path));
  return new Set(WebAssembly.Module.imports(compiled).map((entry) => entry.module));
}

/**
 * Loads wasm-pack output through its own generated wrapper.
 *
 * The wrapper resolves the binary from a URL next to itself, which needs a
 * server, so hand it the bytes instead. Crates that print pass `env: true`:
 * the module exports its memory rather than importing one, so the write shim
 * has to be given that memory before any C code writes a byte.
 */
async function loadPkg(dir, name, { env = false } = {}) {
  const api = await import(pathToFileURL(join(dir, `${name}.js`)).href);
  const wasm = await api.default({
    module_or_path: readFileSync(join(dir, `${name}_bg.wasm`)),
  });
  if (env) {
    const shim = await import(pathToFileURL(join(dir, "env.js")).href);
    shim.setMemory(wasm.memory);
  }
  return { api, wasm };
}

/** Collects what a call writes to console.log and console.error. */
function captureConsole(fn) {
  const lines = [];
  const log = console.log;
  const error = console.error;
  console.log = (...args) => lines.push(args.join(" "));
  console.error = (...args) => lines.push(args.join(" "));
  try {
    fn();
  } finally {
    console.log = log;
    console.error = error;
  }
  return lines;
}

/** Crates 4, 5 and 6 expose the same Calculator; only the plumbing differs. */
function checkCalculator(Calculator) {
  const calc = new Calculator();
  eq("add(3, 2) from C", calc.add(3, 2), 5);
  eq("subtract(3, 2) from Rust", calc.subtract(3, 2), 1);
  eq("subtract(2, 3) saturates at 0", calc.subtract(2, 3), 0);
  eq("multiply(3, 2) is Rust looping over C add", calc.multiply(3, 2), 6);
  eq("divide(6, 2) is C looping over Rust subtract", calc.divide(6, 2), 3);
  eq("divide(6, 0) returns 0", calc.divide(6, 0), 0);
  eq("retrieve() with nothing stored", calc.retrieve(), 0);
  calc.store(42);
  eq("retrieve() after store(42)", calc.retrieve(), 42);
  calc.clear();
  eq("retrieve() after clear()", calc.retrieve(), 0);
  calc.free();
}

console.log("smoke tests: nine crates, each driven through its real API");

// ── Crate 1: hand written wasm-ld link ────────────────────────────────
await crate(
  "crate 1  linking manually",
  ["crates/1_linking_manually/build/advanced_maths.wasm"],
  async ([wasmPath]) => {
    const ex = await instantiate(wasmPath);
    eq("add(3, 2) from C", ex.add(3, 2), 5);
    eq("subtract(3, 2) from Rust", ex.subtract(3, 2), 1);
    eq("subtract(2, 3) saturates at 0", ex.subtract(2, 3), 0);
    eq("multiply(3, 2) is Rust looping over C add", ex.multiply(3, 2), 6);
    eq("divide(6, 2) is C looping over Rust subtract", ex.divide(6, 2), 3);
    eq("divide(6, 0) returns 0", ex.divide(6, 0), 0);
    truthy(
      "runs with no host imports",
      importedModules(wasmPath).size === 0,
      `imports ${[...importedModules(wasmPath)].join(", ")}`,
    );
  },
);

// ── Crate 2: the cc crate does the linking ────────────────────────────
await crate(
  "crate 2  with cc",
  ["crates/2_with_cc/build/cc_calculator.wasm"],
  async ([wasmPath]) => {
    const ex = await instantiate(wasmPath);
    eq("add(3, 2) wraps C _add", ex.add(3, 2), 5);
    eq("subtract(3, 2) from Rust", ex.subtract(3, 2), 1);
    eq("subtract(2, 3) saturates at 0", ex.subtract(2, 3), 0);
    eq("multiply(3, 2) is Rust looping over C _add", ex.multiply(3, 2), 6);
    eq("divide(6, 2) wraps C _divide", ex.divide(6, 2), 3);
    eq("divide(6, 0) returns 0", ex.divide(6, 0), 0);
    truthy(
      "runs with no host imports",
      importedModules(wasmPath).size === 0,
      `imports ${[...importedModules(wasmPath)].join(", ")}`,
    );
  },
);

// ── Crate 3: C malloc/free on Rust's global allocator ─────────────────
//
// This is the allocator regression test. C's malloc forwards to Rust's global
// allocator, so one heap serves both languages and freed blocks come back.
await crate(
  "crate 3  libc and heap allocation",
  ["crates/3_libc_and_heap_allocation/build/libc_calculator.wasm"],
  async ([wasmPath]) => {
    const ex = await instantiate(wasmPath);

    eq("calculator_add(3, 2)", ex.calculator_add(3, 2), 5);
    eq("calculator_subtract(3, 2)", ex.calculator_subtract(3, 2), 1);
    eq("calculator_subtract(2, 3) saturates at 0", ex.calculator_subtract(2, 3), 0);
    eq("calculator_multiply(3, 2)", ex.calculator_multiply(3, 2), 6);
    eq("calculator_divide(6, 2)", ex.calculator_divide(6, 2), 3);

    ex.calculator_clear();
    eq("calculator_retrieve() with nothing stored", ex.calculator_retrieve(), 0);
    ex.calculator_store(42);
    eq("calculator_retrieve() after store(42)", ex.calculator_retrieve(), 42);
    ex.calculator_clear();
    eq("calculator_retrieve() after clear()", ex.calculator_retrieve(), 0);

    const startPages = ex.memory.buffer.byteLength / PAGE;

    // store() mallocs a slot, clear() frees it. Thousands of rounds go
    // through malloc and free thousands of times and must reuse the space.
    const rounds = 5000;
    let mismatch = null;
    for (let i = 1; i <= rounds; i += 1) {
      ex.calculator_store(i);
      const got = ex.calculator_retrieve();
      if (got !== i) {
        mismatch = `round ${i} stored ${i} and read back ${got}`;
        break;
      }
      ex.calculator_clear();
    }
    truthy(`${rounds} store/retrieve/clear rounds all read back`, mismatch === null, mismatch);

    // Now hold many blocks live at once, so the allocator has to place them
    // side by side instead of handing each one a fresh region.
    const blocks = 2000;
    const size = 1024;
    const pointers = new Array(blocks).fill(0);
    let view = new Uint8Array(ex.memory.buffer);
    const bytes = () => {
      // Growing linear memory detaches the old view, leaving byteLength 0.
      if (view.byteLength === 0) view = new Uint8Array(ex.memory.buffer);
      return view;
    };

    let trouble = null;
    for (let i = 0; i < blocks; i += 1) {
      const pointer = ex.malloc(size);
      if (pointer === 0) {
        trouble = `malloc(${size}) returned NULL on block ${i} of ${blocks}`;
        break;
      }
      pointers[i] = pointer;
      const memory = bytes();
      memory[pointer] = i & 0xff;
      memory[pointer + size - 1] = (i >> 8) & 0xff;
    }
    if (trouble === null) {
      for (let i = 0; i < blocks; i += 1) {
        const memory = bytes();
        const pointer = pointers[i];
        if (memory[pointer] !== (i & 0xff) || memory[pointer + size - 1] !== ((i >> 8) & 0xff)) {
          trouble = `block ${i} at ${pointer} came back changed, so two blocks overlap`;
          break;
        }
      }
    }
    truthy(`${blocks} live ${size} byte blocks stay distinct`, trouble === null, trouble);
    for (const pointer of pointers) {
      if (pointer !== 0) ex.free(pointer);
    }

    const pages = ex.memory.buffer.byteLength / PAGE;
    const budget = 256;
    const mib = ((pages * PAGE) / (1024 * 1024)).toFixed(1);
    truthy(
      `memory settled at ${pages} pages (${mib} MiB), from ${startPages}`,
      pages <= budget,
      `${pages} pages is past the ${budget} page budget for ${blocks} live ` +
        `blocks of ${size} bytes plus ${rounds} malloc/free rounds`,
    );
  },
);

// ── Crate 4: wasm-bindgen wrapping a C struct of function pointers ────
await crate(
  "crate 4  wasm-bindgen",
  [
    "crates/4_wasm_bindgen/pkg/wbg_calculator.js",
    "crates/4_wasm_bindgen/pkg/wbg_calculator_bg.wasm",
  ],
  async ([wrapper, wasmPath]) => {
    truthy(
      "binary needs nothing from the host beyond wasm-bindgen glue",
      !importedModules(wasmPath).has("env"),
      `imports ${[...importedModules(wasmPath)].join(", ")}`,
    );
    const { api } = await loadPkg(dirname(wrapper), "wbg_calculator");
    checkCalculator(api.Calculator);
  },
);

// ── Crate 5: the same struct, described by rust-bindgen ───────────────
await crate(
  "crate 5  rust-bindgen",
  [
    "crates/5_rust_bindgen/pkg/rbg_calculator.js",
    "crates/5_rust_bindgen/pkg/rbg_calculator_bg.wasm",
  ],
  async ([wrapper, wasmPath]) => {
    truthy(
      "binary needs nothing from the host beyond wasm-bindgen glue",
      !importedModules(wasmPath).has("env"),
      `imports ${[...importedModules(wasmPath)].join(", ")}`,
    );
    const { api } = await loadPkg(dirname(wrapper), "rbg_calculator");
    checkCalculator(api.Calculator);
  },
);

// ── Crate 6: the C type stays opaque behind extern type ───────────────
await crate(
  "crate 6  extern types",
  [
    "crates/6_extern_types/pkg/ext_t_calculator.js",
    "crates/6_extern_types/pkg/ext_t_calculator_bg.wasm",
  ],
  async ([wrapper, wasmPath]) => {
    truthy(
      "binary needs nothing from the host beyond wasm-bindgen glue",
      !importedModules(wasmPath).has("env"),
      `imports ${[...importedModules(wasmPath)].join(", ")}`,
    );
    const { api } = await loadPkg(dirname(wrapper), "ext_t_calculator");
    checkCalculator(api.Calculator);
  },
);

// ── Crate 7: musl libc, including stdout ──────────────────────────────
await crate(
  "crate 7  musl libc",
  [
    "crates/7_musl_libc/pkg/musl_calculator.js",
    "crates/7_musl_libc/pkg/musl_calculator_bg.wasm",
    "crates/7_musl_libc/pkg/env.js",
  ],
  async ([wrapper, wasmPath]) => {
    const { api } = await loadPkg(dirname(wrapper), "musl_calculator", { env: true });
    truthy(
      "binary asks the host for env.__wasm32_libc_write",
      importedModules(wasmPath).has("env"),
      `imports ${[...importedModules(wasmPath)].join(", ")}`,
    );

    const calc = new api.Calculator();
    eq("add(3, 2) from C", calc.add(3, 2), 5);
    eq("subtract(3, 2) from Rust", calc.subtract(3, 2), 1);
    eq("multiply(3, 2) is Rust looping over C add", calc.multiply(3, 2), 6);
    eq("divide(6, 2) is C looping over Rust subtract", calc.divide(6, 2), 3);
    eq("divide(6, 0) returns 0", calc.divide(6, 0), 0);

    eq("retrieve() with nothing stored", calc.retrieve(), 0);
    calc.store(42);
    eq("retrieve() after store(42)", calc.retrieve(), 42);
    calc.clear();
    eq("retrieve() after clear()", calc.retrieve(), 0);

    eq("format_result(42) through musl snprintf", calc.format_result(42), "Result: 42");
    eq(
      "format_result(4294967295) keeps the full width",
      calc.format_result(4294967295),
      "Result: 4294967295",
    );

    const lines = captureConsole(() => calc.log_result(42));
    truthy(
      "log_result(42) reaches the console through printf",
      lines.includes("Calculator result: 42"),
      `the console saw ${JSON.stringify(lines)}`,
    );

    calc.free();
  },
);

// ── Crate 8: LLVM libc++ on top of musl ───────────────────────────────
await crate(
  "crate 8  llvm libc++",
  [
    "crates/8_llvm_libcxx/pkg/libcxx_calculator.js",
    "crates/8_llvm_libcxx/pkg/libcxx_calculator_bg.wasm",
    "crates/8_llvm_libcxx/pkg/env.js",
  ],
  async ([wrapper, wasmPath]) => {
    const { api } = await loadPkg(dirname(wrapper), "libcxx_calculator", { env: true });
    truthy(
      "binary asks the host for env.__wasm32_libc_write",
      importedModules(wasmPath).has("env"),
      `imports ${[...importedModules(wasmPath)].join(", ")}`,
    );

    const calc = new api.Calculator();
    eq("format_last() before any operation", calc.format_last(), "(no results)");
    eq("add(3, 2) in C++", calc.add(3, 2), 5);
    eq("subtract(5, 3) calls back into Rust", calc.subtract(5, 3), 2);
    eq("multiply(4, 3) calls back into Rust", calc.multiply(4, 3), 12);
    eq("divide(10, 3) truncates", calc.divide(10, 3), 3);
    eq("divide(6, 0) returns 0 and records nothing", calc.divide(6, 0), 0);

    eq("std::vector history holds one entry per operation", calc.history_count(), 4);
    eq("history_get(0) is add(3, 2)", calc.history_get(0), 5);
    eq("history_get(1) is subtract(5, 3)", calc.history_get(1), 2);
    eq("history_get(2) is multiply(4, 3)", calc.history_get(2), 12);
    eq("history_get(3) is divide(10, 3)", calc.history_get(3), 3);
    eq("history_get() past the end is 0", calc.history_get(99), 0);

    eq(
      "format_last() through std::string and snprintf",
      calc.format_last(),
      "Last result: 3 (of 4 operations)",
    );

    calc.history_clear();
    eq("history_count() after history_clear()", calc.history_count(), 0);

    eq("retrieve() with nothing stored", calc.retrieve(), 0);
    calc.store(99);
    eq("retrieve() after store(99)", calc.retrieve(), 99);
    calc.clear();
    eq("retrieve() after clear()", calc.retrieve(), 0);

    calc.free();
  },
);

// ── Crate 9: zlib, a real external C library ──────────────────────────
await crate(
  "crate 9  capstone, zlib",
  [
    "crates/9_capstone/pkg/zlib_compression.js",
    "crates/9_capstone/pkg/zlib_compression_bg.wasm",
  ],
  async ([wrapper, wasmPath]) => {
    truthy(
      "zlib needs nothing from the host beyond wasm-bindgen glue",
      !importedModules(wasmPath).has("env"),
      `imports ${[...importedModules(wasmPath)].join(", ")}`,
    );
    const { api } = await loadPkg(dirname(wrapper), "zlib_compression");
    const compressor = new api.Compressor();

    const version = compressor.version();
    truthy(
      `zlibVersion() reads back as ${JSON.stringify(version)}`,
      /^\d/.test(version),
      "a zlib version string starts with a digit",
    );

    const text = new TextEncoder().encode(
      "Hello, zlib! ".repeat(80) +
        "The quick brown fox jumps over the lazy dog. ".repeat(40),
    );
    const compressed = compressor.compress(text);
    truthy(
      `compress() took ${text.length} bytes down to ${compressed.length}`,
      compressed.length < text.length,
      `${compressed.length} bytes is not smaller than ${text.length}`,
    );
    sameBytes(
      "decompress() round trips the text byte for byte",
      compressor.decompress(compressed, text.length),
      text,
    );

    const binary = new Uint8Array(4096);
    for (let i = 0; i < binary.length; i += 1) binary[i] = (i * 7) & 0xff;
    sameBytes(
      "a binary payload round trips byte for byte",
      compressor.decompress(compressor.compress(binary), binary.length),
      binary,
    );

    const empty = new Uint8Array(0);
    sameBytes(
      "empty input round trips",
      compressor.decompress(compressor.compress(empty), 0),
      empty,
    );

    compressor.free();
  },
);

console.log(
  `\n${passed} passed, ${failed} failed, ${skipped} crate${skipped === 1 ? "" : "s"} skipped`,
);
process.exit(failed === 0 ? 0 : 1);
