fn main() {
    cc::Build::new().file("wasm/maths.c").compile("c_maths");
}
