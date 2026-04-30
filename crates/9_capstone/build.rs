fn main() {
    let mut build = cc::Build::new();

    // When building for wasm32, use musl libc headers
    if let Ok(libc) = std::env::var("DEP_WASM32_LIBC_INCLUDE") {
        for path in libc.split(':') {
            build.include(path);
        }
        println!("cargo::rustc-link-lib=wasm32-libc");
    }

    // Zlib sources from git submodule
    let zlib_dir = "zlib";

    build.include(zlib_dir);

    // Core zlib source files
    build.file(format!("{zlib_dir}/adler32.c"));
    build.file(format!("{zlib_dir}/compress.c"));
    build.file(format!("{zlib_dir}/crc32.c"));
    build.file(format!("{zlib_dir}/deflate.c"));
    build.file(format!("{zlib_dir}/infback.c"));
    build.file(format!("{zlib_dir}/inffast.c"));
    build.file(format!("{zlib_dir}/inflate.c"));
    build.file(format!("{zlib_dir}/inftrees.c"));
    build.file(format!("{zlib_dir}/trees.c"));
    build.file(format!("{zlib_dir}/uncompr.c"));
    build.file(format!("{zlib_dir}/zutil.c"));

    build.warnings(false);
    build.compile("zlib");

    println!(
        "cargo::metadata=include={}/{zlib_dir}",
        std::env::var("CARGO_MANIFEST_DIR").unwrap()
    );

    let out_dir = std::path::PathBuf::from(std::env::var("OUT_DIR").unwrap());
    println!("cargo::rustc-link-search=native={}", out_dir.display());
    println!("cargo::rustc-link-lib=static=zlib");
    println!("cargo::rerun-if-changed={zlib_dir}");
}
