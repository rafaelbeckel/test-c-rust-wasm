//! Capstone: Real external C library integration (zlib) for WASM.
//!
//! This crate demonstrates the full production pattern:
//!   1. External C library (zlib) compiled from source via `cc`
//!   2. Musl libc providing the C standard library for wasm32
//!   3. Rust FFI bindings to zlib's compress/uncompress API
//!   4. Safe Rust wrapper exported via wasm-bindgen
//!

use wasm_bindgen::prelude::*;

// Force-link wasm32-libc so malloc/free are available to C code (zlib).
#[cfg(target_arch = "wasm32")]
extern crate wasm32_libc;

mod ffi {
    use core::ffi::{c_int, c_ulong};

    pub const Z_OK: c_int = 0;

    unsafe extern "C" {
        /// Compresses source into dest. Returns Z_OK on success.
        pub fn compress(
            dest: *mut u8,
            dest_len: *mut c_ulong,
            source: *const u8,
            source_len: c_ulong,
        ) -> c_int;

        /// Decompresses source into dest. Returns Z_OK on success.
        pub fn uncompress(
            dest: *mut u8,
            dest_len: *mut c_ulong,
            source: *const u8,
            source_len: c_ulong,
        ) -> c_int;

        /// Returns the compressBound for a given source length.
        pub fn compressBound(source_len: c_ulong) -> c_ulong;

        /// Returns the zlib version string.
        pub fn zlibVersion() -> *const u8;
    }
}

/// WASM-exported compression utility backed by zlib.
#[wasm_bindgen]
pub struct Compressor;

#[wasm_bindgen]
impl Compressor {
    #[wasm_bindgen(constructor)]
    pub fn new() -> Compressor {
        Compressor
    }

    /// Returns the zlib version string.
    pub fn version(&self) -> String {
        unsafe {
            let ptr = ffi::zlibVersion();
            let mut len = 0;
            while *ptr.add(len) != 0 {
                len += 1;
            }
            let slice = core::slice::from_raw_parts(ptr, len);
            String::from_utf8_lossy(slice).into_owned()
        }
    }

    /// Compress a byte array using zlib. Returns the compressed bytes.
    pub fn compress(&self, data: &[u8]) -> Result<Vec<u8>, JsError> {
        compress_bytes(data).map_err(|e| JsError::new(&e))
    }

    /// Decompress zlib-compressed bytes. `original_size` is needed because
    /// zlib doesn't store the original size in the compressed stream.
    pub fn decompress(&self, data: &[u8], original_size: usize) -> Result<Vec<u8>, JsError> {
        decompress_bytes(data, original_size).map_err(|e| JsError::new(&e))
    }
}

impl Default for Compressor {
    fn default() -> Self {
        Self::new()
    }
}

/// Compress bytes using zlib.
pub fn compress_bytes(data: &[u8]) -> Result<Vec<u8>, String> {
    unsafe {
        let bound = ffi::compressBound(data.len() as _);
        let mut dest = vec![0u8; bound as usize];
        let mut dest_len = bound;

        let ret = ffi::compress(
            dest.as_mut_ptr(),
            &mut dest_len,
            data.as_ptr(),
            data.len() as _,
        );

        if ret != ffi::Z_OK {
            return Err(format!("zlib compress failed with error code {ret}"));
        }

        dest.truncate(dest_len as usize);
        Ok(dest)
    }
}

/// Decompress zlib-compressed bytes.
pub fn decompress_bytes(data: &[u8], original_size: usize) -> Result<Vec<u8>, String> {
    unsafe {
        let mut dest = vec![0u8; original_size];
        let mut dest_len = original_size as core::ffi::c_ulong;

        let ret = ffi::uncompress(
            dest.as_mut_ptr(),
            &mut dest_len,
            data.as_ptr(),
            data.len() as _,
        );

        if ret != ffi::Z_OK {
            return Err(format!("zlib uncompress failed with error code {ret}"));
        }

        dest.truncate(dest_len as usize);
        Ok(dest)
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_version() {
        let compressor = Compressor::new();
        let version = compressor.version();
        assert!(!version.is_empty());
        // zlib versions start with a digit
        assert!(version.starts_with(|c: char| c.is_ascii_digit()));
    }

    #[test]
    fn test_compress_decompress_roundtrip() {
        let original = b"Hello, zlib! This is a test of compression in WASM. \
                         Let's repeat some text to make it more compressible. \
                         Hello, zlib! Hello, zlib! Hello, zlib!";

        let compressed = compress_bytes(original).expect("compression failed");

        // Compressed should be smaller than original for repetitive data
        assert!(compressed.len() < original.len());

        let decompressed =
            decompress_bytes(&compressed, original.len()).expect("decompression failed");

        assert_eq!(decompressed, original);
    }

    #[test]
    fn test_compress_empty() {
        let compressed = compress_bytes(b"").expect("compression failed");
        let decompressed = decompress_bytes(&compressed, 0).expect("decompression failed");
        assert_eq!(decompressed, b"");
    }

    #[test]
    fn test_compress_small() {
        let original = b"Hi";
        let compressed = compress_bytes(original).expect("compression failed");
        let decompressed =
            decompress_bytes(&compressed, original.len()).expect("decompression failed");
        assert_eq!(decompressed, original);
    }
}
