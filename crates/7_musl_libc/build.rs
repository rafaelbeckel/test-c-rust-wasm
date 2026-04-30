fn main() {
    let mut build = cc::Build::new();

    // When building for wasm32, use musl libc headers
    if let Ok(libc) = std::env::var("DEP_WASM32_LIBC_INCLUDE") {
        for path in libc.split(':') {
            build.include(path);
        }
        println!("cargo::rustc-link-lib=wasm32-libc");
    }

    build.include("src");
    build.file("src/calculator.c");
    build.file("src/memory.c");
    build.compile("c_maths");
    println!("cargo::rerun-if-changed=src");
}
