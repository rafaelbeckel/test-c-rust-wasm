fn main() {
    let mut build = cc::Build::new();
    build.include("src");
    build.file("src/maths.c");
    build.compile("c_maths");

    let out_dir = std::env::var("OUT_DIR").unwrap();
    println!("cargo::rustc-link-search=native={}", out_dir);
}
