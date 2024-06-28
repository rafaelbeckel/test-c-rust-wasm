# Rust+C in the same WASM binary

## Project 6: Rust Bindgen (WIP)

This build uses the experimental compiler feature [extern types](https://rust-lang.github.io/rfcs/1861-extern-types.html).

TO-DO list:

- [ ] this is currently a copy of example 5
- [ ] use rust bindgen to generate the bindings from a header file
- [ ] figure out how to provide the C definitions in Rust extern C blocks inside WASM. Maybe have a second wasm compiled with libc and write a JS 'env' brigde manually?
