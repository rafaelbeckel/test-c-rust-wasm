fn main() {
    let mut build = cc::Build::new();

    if let Ok(libc) = std::env::var("DEP_WASM32_LIBC_INCLUDE") {
        for path in libc.split(':') {
            build.include(path);
        }
        println!("cargo::rustc-link-lib=wasm32-libc");
    }

    build.include("src");
    build.file("src/memory.c");
    build.file("src/calculator.c");
    build.compile("c_calculator");
    println!("cargo::rerun-if-changed=src/**");
}
