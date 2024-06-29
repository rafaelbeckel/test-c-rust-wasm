use std::{env, path::PathBuf};

fn main() {
    let mut build = cc::Build::new();

    if let Some(libc) = std::env::var_os("DEP_WASM32_UNKNOWN_UNKNOWN_OPENBSD_LIBC_INCLUDE") {
        build.include(libc);
        println!("cargo::rustc-link-lib=wasm32-unknown-unknown-openbsd-libc");
    }

    build.include("src");
    build.file("src/calculator.c");
    build.file("src/memory.c");
    build.compile("c_maths");

    let bindings = bindgen::Builder::default()
        .header("src/calculator.h")
        .parse_callbacks(Box::new(bindgen::CargoCallbacks::new()))
        .layout_tests(false)
        .ignore_functions()
        .generate()
        .expect("Unable to generate bindings");

    let out_dir = PathBuf::from(env::var("OUT_DIR").unwrap());

    bindings
        .write_to_file(out_dir.join("bindings.rs"))
        .expect("Couldn't write bindings!");
}
