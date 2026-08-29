//! musl libc for `wasm32-unknown-unknown`.
//!
//! The C side of this crate is musl v1.2.6, compiled from the `3rd-party/musl`
//! submodule by `build.rs`. The Rust side is the allocator: C's `malloc` and
//! friends hand their work to Rust's global allocator so that C and Rust share
//! one heap. See [`malloc`] for why.
//!
//! Only the part of musl that needs no operating system is built: string
//! handling, character classification, formatting and parsing, sorting,
//! searching, math, and the stdio layer above them. Files, sockets, processes,
//! signals and threads are left out, so a call to `open` or `fork` fails to
//! link rather than returning a plausible-looking error at runtime. The wasm32
//! arch layer musl is missing lives in `src/wasm32/`.
//!
//! Add it to a crate that compiles C for wasm:
//!
//! ```toml
//! [target.'cfg(target_arch = "wasm32")'.dependencies]
//! wasm32-libc = { path = "../../3rd-party/wasm32-libc" }
//! ```
//!
//! and point the C compiler at the headers from `build.rs`:
//!
//! ```text
//! if let Ok(libc) = std::env::var("DEP_WASM32_LIBC_INCLUDE") {
//!     let mut build = cc::Build::new();
//!     for path in libc.split(':') {
//!         build.include(path);
//!     }
//! }
//! ```

mod malloc;
pub use malloc::{calloc, free, malloc, realloc};
