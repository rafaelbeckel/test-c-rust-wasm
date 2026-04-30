use cfg_aliases::cfg_aliases;
use std::path::{Path, PathBuf};
use std::{env, fs};

/// Emscripten's pre-generated wasm32 arch headers (relative to wasm32-libcxx)
const EMSCRIPTEN_ARCH: &str = "../wasm32-libcxx/emscripten/system/lib/libc/musl/arch/emscripten";

fn parse_dir<T: AsRef<Path>>(path: T, sources: &mut Vec<PathBuf>, ext: &str, recursive: bool) {
    let Ok(dirs) = fs::read_dir(path) else {
        return;
    };

    for dir in dirs {
        let dir = dir.unwrap();
        let path = dir.path();

        if path.is_dir() && recursive {
            parse_dir(path, sources, ext, true);
        } else if path.is_file()
            && let Some(extension) = path.extension()
            && extension == ext
        {
            sources.push(path);
        }
    }
}

/// Copy all .h files from `src_dir` into `dest_dir`.
fn copy_headers(src_dir: &str, dest_dir: &Path) {
    let Ok(entries) = fs::read_dir(src_dir) else {
        return;
    };
    for entry in entries.flatten() {
        let path = entry.path();
        if path.extension().is_some_and(|ext| ext == "h")
            && let Some(name) = path.file_name()
        {
            fs::copy(&path, dest_dir.join(name)).ok();
        }
    }
}

fn main() {
    cfg_aliases! {
        wasm: { target_arch = "wasm32" },
    }
    println!("cargo::rustc-check-cfg=cfg(wasm)");

    if !env::var("TARGET").is_ok_and(|t| t.starts_with("wasm")) {
        return;
    }

    // Stage arch-specific bits/ headers into OUT_DIR/include/bits/.
    // Uses emscripten's pre-generated wasm32 headers (matching how emscripten
    // builds musl), with generic fallbacks underneath.
    let out_dir = PathBuf::from(env::var("OUT_DIR").unwrap());
    let bits_dir = out_dir.join("include").join("bits");
    fs::create_dir_all(&bits_dir).expect("failed to create bits dir");

    // Layer bits/ headers: our musl generic as base, then emscripten's wasm32
    // arch headers on top. Only errno.h is skipped (references wasi/api.h).
    copy_headers("musl/arch/generic/bits", &bits_dir);
    let emsc_bits = format!("{EMSCRIPTEN_ARCH}/bits");
    if let Ok(entries) = fs::read_dir(&emsc_bits) {
        for entry in entries.flatten() {
            let path = entry.path();
            let name = path.file_name().unwrap().to_str().unwrap_or_default();
            // errno.h references wasi/api.h — keep our musl generic version
            if name == "errno.h" {
                continue;
            }
            if path.extension().is_some_and(|ext| ext == "h") {
                fs::copy(&path, bits_dir.join(name)).ok();
            }
        }
    }

    let generated_include = out_dir.join("include");

    // The actual libc implementations come from Rust (src/ffi/*.rs) — only
    // a handful of small C files (errno, version, nanoprintf) need to be
    // compiled here. musl headers are still used for the public API surface
    // and are exposed to bindgen below.
    let mut headers = vec![];
    // Only include top-level C standard headers (not Linux-specific sys/*, linux/*, etc.)
    parse_dir("./musl/include", &mut headers, "h", false);

    // Include order matches emscripten's MuslInternalLibrary:
    //   arch/emscripten → arch/generic → src/internal → src/include → include
    cc::Build::new()
        .include(&generated_include)
        .include("musl/include")
        .include("musl/src/include")
        .include("musl/src/internal")
        .include("src")
        .file("src/errno.c")
        .file("src/version.c")
        .file("src/nanoprintf.c")
        .std("c17")
        .compile("wasm32-libc");

    let manifest_dir = env::var("CARGO_MANIFEST_DIR").unwrap();
    // Export both include paths separated by ':' for downstream crates
    println!(
        "cargo::metadata=include={}:{}/musl/include",
        generated_include.display(),
        manifest_dir,
    );

    println!("cargo::rustc-link-search=native={}", out_dir.display());
    println!("cargo::rustc-link-lib=static=wasm32-libc");

    // Force-export C allocator symbols so wasm-lld --gc-sections doesn't
    // remove them (they're only referenced from C code, not Rust).
    for symbol in ["malloc", "free", "calloc", "realloc"] {
        println!("cargo::rustc-link-arg=--export={symbol}");
    }

    // Generate bindings
    let builder = headers
        .into_iter()
        .fold(bindgen::Builder::default(), |builder, header| {
            builder.header(format!("{}", header.display()))
        });

    let bindings = builder
        .clang_arg(format!("-I{}", generated_include.display()))
        .clang_arg("-Imusl/include")
        .clang_arg("-Imusl/src/include")
        .clang_arg("-Imusl/src/internal")
        .clang_arg("-Isrc")
        .parse_callbacks(Box::new(bindgen::CargoCallbacks::new()))
        .generate()
        .expect("Unable to generate bindings");

    bindings
        .write_to_file(out_dir.join("bindings.rs"))
        .expect("Couldn't write bindings!");
}
