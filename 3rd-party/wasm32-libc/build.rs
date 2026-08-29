use cfg_aliases::cfg_aliases;
use std::path::{Path, PathBuf};
use std::process::Command;
use std::{env, fs};

/// Upstream musl, pinned to v1.2.6 by the `3rd-party/musl` submodule.
const MUSL: &str = "../musl";

/// Emscripten's pre-generated wasm32 arch headers. musl derives `bits/` from
/// per-arch templates at build time, and has no wasm32 arch of its own, so the
/// generated headers are borrowed from the port that already maintains them.
const EMSCRIPTEN_ARCH: &str = "../emscripten/system/lib/libc/musl/arch/emscripten";

/// musl source directories that need no operating system underneath.
///
/// Everything here is arithmetic on memory the caller already owns: string
/// handling, character classification, number formatting and parsing, sorting,
/// searching, math. `stdio` is included because its formatting core is pure;
/// the few functions that would reach a kernel are replaced by `src/wasm32/`
/// (see [`replaced_sources`]).
const MODULES: &[&str] = &[
    "ctype",
    "errno",
    "exit",
    "locale",
    "math",
    "multibyte",
    "prng",
    "search",
    "stdio",
    "stdlib",
    "string",
];

/// Individually picked sources from directories we do not take wholesale.
const EXTRA_SOURCES: &[&str] = &[
    // Number scanning shared by strtol, scanf and the float parsers.
    "src/internal/floatscan.c",
    "src/internal/intscan.c",
    "src/internal/shgetc.c",
    // The global libc struct: locale, page size, exit handlers.
    "src/internal/libc.c",
    // Turns a negative syscall return into errno.
    "src/internal/syscall_ret.c",
    // __lseek, referenced by stdio's default seek callback.
    "src/unistd/lseek.c",
];

/// musl sources replaced by files in `src/wasm32/`, listed per module.
///
/// `stdio` writes through the host instead of the writev syscall, and `exit`
/// traps instead of ending a process that does not exist.
fn replaced_sources(module: &str) -> &'static [&'static str] {
    match module {
        "stdio" => &["__stdio_write.c", "__stdout_write.c"],
        "exit" => &["_Exit.c", "abort.c"],
        _ => &[],
    }
}

/// Our own sources: the wasm32 arch layer musl is missing.
const WASM32_SOURCES: &[&str] = &[
    "src/wasm32/tls.c",
    "src/wasm32/stdio.c",
    "src/wasm32/exit.c",
];

/// C allocator symbols. They are defined in Rust (`src/malloc.rs`) and called
/// only from C, so `--gc-sections` would drop them without an explicit export.
const ALLOCATOR_EXPORTS: &[&str] = &["malloc", "calloc", "realloc", "free"];

/// Copy every `.h` in `from` into `to`, skipping the named files.
fn copy_headers(from: &Path, to: &Path, skip: &[&str]) {
    let Ok(entries) = fs::read_dir(from) else {
        panic!(
            "missing headers in {}. Run ./setup.sh to initialize the submodules.",
            from.display()
        );
    };
    for entry in entries.flatten() {
        let path = entry.path();
        let name = path.file_name().unwrap().to_string_lossy().into_owned();
        if path.extension().is_some_and(|ext| ext == "h") && !skip.contains(&name.as_str()) {
            fs::copy(&path, to.join(name)).expect("failed to stage header");
        }
    }
}

/// Generate `bits/syscall.h` the way musl's own Makefile does: the arch table,
/// then the same list again with `__NR_` rewritten to `SYS_`.
///
/// The numbers are placeholders. Every syscall on this target fails with ENOSYS
/// (see `src/wasm32/syscall_arch.h`), so no value ever reaches a kernel. musl's
/// riscv32 table is the closest fit: 32-bit, and free of legacy entry points.
fn generate_syscall_table(bits: &Path) {
    let template = format!("{MUSL}/arch/riscv32/bits/syscall.h.in");
    let table = fs::read_to_string(&template).expect("missing musl syscall table");

    let mut header = table.clone();
    for line in table.lines() {
        if let Some(rest) = line.strip_prefix("#define __NR_") {
            header.push_str("#define SYS_");
            header.push_str(rest);
            header.push('\n');
        }
    }

    fs::write(bits.join("syscall.h"), header).expect("failed to write syscall.h");
}

/// Stage the arch layer musl expects into `OUT_DIR/arch`.
fn stage_arch(out_dir: &Path) -> PathBuf {
    let arch = out_dir.join("arch");
    let bits = arch.join("bits");
    fs::create_dir_all(&bits).expect("failed to create arch dir");

    // musl's generic bits/ first, then emscripten's wasm32 ones over the top.
    // Emscripten's errno.h is skipped: it forwards to the WASI headers, which
    // this target does not have.
    copy_headers(Path::new(&format!("{MUSL}/arch/generic/bits")), &bits, &[]);
    copy_headers(
        Path::new(&format!("{EMSCRIPTEN_ARCH}/bits")),
        &bits,
        &["errno.h"],
    );
    generate_syscall_table(&bits);

    // Emscripten's arch headers, minus the syscall layer, which we define.
    copy_headers(Path::new(EMSCRIPTEN_ARCH), &arch, &["syscall_arch.h"]);
    fs::copy("src/wasm32/syscall_arch.h", arch.join("syscall_arch.h"))
        .expect("failed to stage syscall_arch.h");

    arch
}

/// Every `.c` under `dir`, sorted so the build is reproducible.
fn sources_in(dir: &str, skip: &[&str]) -> Vec<PathBuf> {
    let Ok(entries) = fs::read_dir(dir) else {
        panic!("missing musl sources in {dir}. Run ./setup.sh to initialize the submodules.");
    };
    let mut files: Vec<PathBuf> = entries
        .flatten()
        .map(|e| e.path())
        .filter(|p| p.extension().is_some_and(|ext| ext == "c"))
        .filter(|p| !skip.contains(&p.file_name().unwrap().to_string_lossy().as_ref()))
        .collect();
    files.sort();
    files
}

/// Directory holding clang's own `stddef.h` and `stdarg.h`.
///
/// musl compiles with `-nostdinc` so that its headers cannot be shadowed by the
/// host's, which also hides the compiler's freestanding headers. musl's Makefile
/// adds them back the same way.
fn compiler_include(compiler: &Path) -> PathBuf {
    let out = Command::new(compiler)
        .arg("-print-resource-dir")
        .output()
        .expect("failed to run the C compiler");
    let dir = String::from_utf8(out.stdout).expect("non-UTF-8 resource dir");
    PathBuf::from(dir.trim()).join("include")
}

fn main() {
    cfg_aliases! {
        wasm: { target_arch = "wasm32" },
    }
    println!("cargo::rustc-check-cfg=cfg(wasm)");
    println!("cargo::rerun-if-changed=src/wasm32");
    println!("cargo::rerun-if-changed=build.rs");

    if !env::var("TARGET").is_ok_and(|t| t.starts_with("wasm")) {
        return;
    }

    let out_dir = PathBuf::from(env::var("OUT_DIR").unwrap());
    let arch = stage_arch(&out_dir);

    let mut build = cc::Build::new();
    let resource_include = compiler_include(build.get_compiler().path());

    // Include order matches musl's Makefile: arch, then generic arch, then the
    // internal headers, then the public ones.
    build
        .flag("-nostdinc")
        .include(&arch)
        .include(format!("{MUSL}/arch/generic"))
        .include(format!("{MUSL}/src/include"))
        .include(format!("{MUSL}/src/internal"))
        .include(format!("{MUSL}/include"))
        .include(&resource_include);

    build
        .std("c99")
        .flag("-ffreestanding")
        // musl provides the real functions; let no call be folded into a
        // builtin that assumes a different implementation.
        .flag("-fno-builtin")
        .flag("-D_XOPEN_SOURCE=700")
        .warnings(false);

    for module in MODULES {
        build.files(sources_in(
            &format!("{MUSL}/src/{module}"),
            replaced_sources(module),
        ));
    }
    for source in EXTRA_SOURCES {
        build.file(format!("{MUSL}/{source}"));
    }
    for source in WASM32_SOURCES {
        build.file(source);
    }

    build.compile("wasm32-libc");

    // Downstream crates get the public headers plus the generated arch bits.
    let manifest_dir = env::var("CARGO_MANIFEST_DIR").unwrap();
    println!(
        "cargo::metadata=include={}:{manifest_dir}/{MUSL}/include",
        arch.display(),
    );

    println!("cargo::rustc-link-search=native={}", out_dir.display());
    println!("cargo::rustc-link-lib=static=wasm32-libc");

    for symbol in ALLOCATOR_EXPORTS {
        println!("cargo::rustc-link-arg=--export={symbol}");
    }
}
