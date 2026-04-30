fn main() {
    let target = std::env::var("TARGET").unwrap_or_default();

    let mut c_build = cc::Build::new();
    let mut cpp_build = cc::Build::new();

    // Configure C++ compilation
    cpp_build.cpp(true);
    cpp_build.std("c++23");

    if target.starts_with("wasm") {
        // C++ headers must come before C headers in the include path
        if let Some(libcxx) = std::env::var_os("DEP_WASM32_LIBCXX_INCLUDE") {
            cpp_build.include(&libcxx);
            println!("cargo::rustc-link-lib=wasm32-libcxx");
        }
        // musl libc headers
        if let Ok(libc) = std::env::var("DEP_WASM32_LIBC_INCLUDE") {
            for path in libc.split(':') {
                c_build.include(path);
                cpp_build.include(path);
            }
            println!("cargo::rustc-link-lib=wasm32-libc");
        }
        // Don't link system C++ stdlib on wasm
        cpp_build.cpp_link_stdlib(None);
    }

    // Compile the C parts (memory management, basic arithmetic)
    c_build.include("src");
    c_build.file("src/memory.c");
    c_build.compile("c_parts");

    // Compile the C++ calculator class
    cpp_build.include("src");
    cpp_build.file("src/calculator.cpp");
    cpp_build.compile("cpp_calculator");

    println!("cargo::rerun-if-changed=src");
}
