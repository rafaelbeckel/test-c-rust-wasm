use std::path::PathBuf;
use std::{env, fs};

/// Source files excluded by emscripten's system_libs.py for libcxx.
const LIBCXX_EXCLUDE: &[&str] = &[
    "xlocale_zos.cpp",
    "mbsnrtowcs.cpp",
    "wcsnrtombs.cpp",
    "int128_builtins.cpp",
    "libdispatch.cpp",
    "locale_win32.cpp",
    "thread_win32.cpp",
    "support.cpp",
    "compiler_rt_shims.cpp",
    "time_zone.cpp",
    "tzdb.cpp",
    "tzdb_list.cpp",
];

fn glob_cpp(dir: &str, exclude: &[&str]) -> Vec<String> {
    let mut files = vec![];
    collect_cpp(dir, exclude, &mut files);
    files
}

fn collect_cpp(dir: &str, exclude: &[&str], out: &mut Vec<String>) {
    let Ok(entries) = fs::read_dir(dir) else {
        return;
    };
    for entry in entries.flatten() {
        let path = entry.path();
        if path.is_dir() {
            collect_cpp(&path.display().to_string(), exclude, out);
        } else if path.extension().is_some_and(|ext| ext == "cpp") {
            let name = path.file_name().unwrap().to_str().unwrap();
            if !exclude.contains(&name) {
                out.push(path.display().to_string());
            }
        }
    }
}

fn main() {
    if !env::var("TARGET").is_ok_and(|t| t.starts_with("wasm")) {
        return;
    }

    // The libcxx, libcxxabi, and llvm-libc sources come from the emscripten
    // LLVM fork (populated by git submodule). Build configuration mirrors
    // emscripten's system_libs.py (libcxx + libcxxabi classes).

    let libcxx = "emscripten/system/lib/libcxx";
    let libcxxabi = "emscripten/system/lib/libcxxabi";
    let llvm_libc = "emscripten/system/lib/llvm-libc";

    // ── libcxx sources (glob minus exclusions, matching emscripten) ───────
    let libcxx_sources = glob_cpp(&format!("{libcxx}/src"), LIBCXX_EXCLUDE);

    // ── libcxxabi sources (no-exceptions mode, matching emscripten) ───────
    let cxxabi_files: Vec<String> = [
        "abort_message.cpp",
        "cxa_aux_runtime.cpp",
        "cxa_default_handlers.cpp",
        "cxa_demangle.cpp",
        "cxa_guard.cpp",
        "cxa_handlers.cpp",
        "cxa_virtual.cpp",
        "cxa_thread_atexit.cpp",
        "fallback_malloc.cpp",
        "stdlib_new_delete.cpp",
        "stdlib_exception.cpp",
        "stdlib_stdexcept.cpp",
        "stdlib_typeinfo.cpp",
        "private_typeinfo.cpp",
        "cxa_exception_js_utils.cpp",
        // no-exceptions mode
        "cxa_noexception.cpp",
    ]
    .iter()
    .map(|f| format!("{libcxxabi}/src/{f}"))
    .collect();

    // ── Compile libcxx + libcxxabi together ──────────────────────────────
    let libc_includes: Vec<PathBuf> = env::var("DEP_WASM32_LIBC_INCLUDE")
        .unwrap()
        .split(':')
        .map(PathBuf::from)
        .collect();

    let mut build = cc::Build::new();
    build
        .cpp(true)
        .std("c++23")
        .cpp_link_stdlib(None)
        // libcxx includes
        .include(format!("{libcxx}/src"))
        .include(format!("{libcxx}/include"))
        .include(format!("{libcxx}/src/include"))
        .include(format!("{libcxx}/src/include/ryu"))
        // llvm-libc (provides shared/fp_bits.h needed by charconv.cpp)
        .include(llvm_libc)
        // libcxxabi includes
        .include(format!("{libcxxabi}/include"))
        .include(format!("{libcxxabi}/src"))
        .include(format!("{libcxxabi}/src/demangle"));

    // musl libc includes from wasm32-libc crate
    for path in &libc_includes {
        build.include(path);
    }

    build
        // Defines matching emscripten's system_libs.py
        .flag("-w")
        .flag("-DLIBCXX_BUILDING_LIBCXXABI=1")
        .flag("-D_LIBCPP_BUILDING_LIBRARY")
        .flag("-D_LIBCPP_DISABLE_VISIBILITY_ANNOTATIONS")
        .flag("-DLIBC_NAMESPACE=__llvm_libc")
        // libcxxabi defines
        .flag("-D_LIBCXXABI_BUILDING_LIBRARY")
        .flag("-DLIBCXXABI_NON_DEMANGLING_TERMINATE")
        // no-threads, no-exceptions (single-threaded wasm32)
        .flag("-D_LIBCXXABI_HAS_NO_THREADS")
        .flag("-D_LIBCXXABI_NO_EXCEPTIONS")
        // local project shim
        .file("src/cversion.cpp")
        .files(libcxx_sources)
        .files(cxxabi_files)
        .compile("wasm32-libcxx");

    println!(
        "cargo::metadata=include={}/{libcxx}/include",
        env::var("CARGO_MANIFEST_DIR").unwrap()
    );

    let out_dir = PathBuf::from(env::var("OUT_DIR").unwrap());
    println!("cargo::rustc-link-search=native={}", out_dir.display());
    println!("cargo::rustc-link-lib=static=wasm32-libcxx");
}
