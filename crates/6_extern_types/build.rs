fn main() {
    let mut build = cc::Build::new();

    if let Some(libc) = std::env::var_os("DEP_WASM32_UNKNOWN_UNKNOWN_OPENBSD_LIBC_INCLUDE") {
        build.include(libc);
        println!("cargo::rustc-link-lib=wasm32-unknown-unknown-openbsd-libc");
    }

    build.include("src");
    build.file("src/memory.c");
    build.file("src/calculator.c");
    build.compile("c_calculator");
}
