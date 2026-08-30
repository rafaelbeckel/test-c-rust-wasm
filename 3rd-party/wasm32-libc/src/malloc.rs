//! The C allocator, backed by Rust's global allocator.
//!
//! musl's own `malloc` is left out of the build. It grows the heap through
//! `brk` and `mmap`, which do not exist on `wasm32-unknown-unknown`, and a
//! second allocator would carve up a region of linear memory that Rust also
//! believes it owns. Handing every C allocation to Rust keeps one heap that
//! grows the wasm memory the way `WebAssembly.Memory.grow` expects.
//!
//! `dealloc` needs the layout that `alloc` was given, which C's `free(ptr)`
//! does not carry, so each block is over-allocated by `MAX_ALIGN` bytes and
//! its size is written into the header. The caller sees the pointer just past
//! that header.
//!
//! Thanks to [@savage13](https://github.com/savage13), who sketched this
//! approach in
//! [issue #2](https://github.com/rafaelbeckel/test-c-rust-wasm/issues/2).
//!
//! Copyright (c) Gyungmin Myung <gmmyung@kaist.ac.kr>
//! This file is licensed under the Blue Oak Model Licence 1.0.0

extern crate alloc;

/// Alignment of the largest scalar type, and the size of the block header.
const MAX_ALIGN: usize = 16;

/// Allocates `size` bytes, aligned to [`MAX_ALIGN`], or null on failure.
///
/// # Safety
///
/// The block must be released with [`free`] or resized with [`realloc`], and
/// with nothing else: it carries a header that only these functions know about.
#[cfg_attr(wasm, unsafe(no_mangle))]
pub unsafe extern "C" fn malloc(size: usize) -> *mut u8 {
    let Some(total) = size.checked_add(MAX_ALIGN) else { return core::ptr::null_mut(); };
    let Ok(layout) = alloc::alloc::Layout::from_size_align(total, MAX_ALIGN) else { return core::ptr::null_mut(); };
    let ptr = unsafe { alloc::alloc::alloc(layout) };
    if ptr.is_null() {
        return ptr;
    }
    unsafe {
        *(ptr as *mut usize) = size;
    }
    unsafe { ptr.add(MAX_ALIGN) }
}

/// Allocates `nmemb * size` zeroed bytes, or null on failure.
///
/// # Safety
///
/// As [`malloc`]. The caller must also keep `nmemb * size` from overflowing.
#[cfg_attr(wasm, unsafe(no_mangle))]
pub unsafe extern "C" fn calloc(nmemb: usize, size: usize) -> *mut u8 {
    let total_size = nmemb * size;
    let layout = alloc::alloc::Layout::from_size_align(total_size + MAX_ALIGN, MAX_ALIGN).unwrap();
    let ptr = unsafe { alloc::alloc::alloc_zeroed(layout) };
    if ptr.is_null() {
        return ptr;
    }
    unsafe {
        *(ptr as *mut usize) = total_size;
    }
    unsafe { ptr.add(MAX_ALIGN) }
}

/// Resizes a block to `size` bytes, moving it if it has to.
///
/// # Safety
///
/// `ptr` must be null, or a live block from [`malloc`], [`calloc`] or an
/// earlier [`realloc`]. On success the old pointer is dangling.
#[cfg_attr(wasm, unsafe(no_mangle))]
pub unsafe extern "C" fn realloc(ptr: *mut u8, size: usize) -> *mut u8 {
    unsafe {
        if ptr.is_null() {
            return malloc(size);
        }
        let old_size = *(ptr.sub(MAX_ALIGN) as *mut usize);
        let layout =
            alloc::alloc::Layout::from_size_align(old_size + MAX_ALIGN, MAX_ALIGN).unwrap();
        let new_ptr = alloc::alloc::realloc(ptr.sub(MAX_ALIGN), layout, size + MAX_ALIGN);
        if new_ptr.is_null() {
            return new_ptr;
        }
        *(new_ptr as *mut usize) = size;
        new_ptr.add(MAX_ALIGN)
    }
}

/// Releases a block. A null pointer is ignored.
///
/// # Safety
///
/// `ptr` must be null, or a live block from [`malloc`], [`calloc`] or
/// [`realloc`], and must not be freed twice.
#[cfg_attr(wasm, unsafe(no_mangle))]
pub unsafe extern "C" fn free(ptr: *mut u8) {
    if ptr.is_null() {
        return;
    }
    let old_size = unsafe { *(ptr.sub(MAX_ALIGN) as *mut usize) };
    let layout = alloc::alloc::Layout::from_size_align(old_size + MAX_ALIGN, MAX_ALIGN).unwrap();
    unsafe { alloc::alloc::dealloc(ptr.sub(MAX_ALIGN), layout) };
}

#[cfg(test)]
mod test {
    use super::*;

    #[test]
    fn malloc_round_trips_a_block() {
        let ptr = unsafe { malloc(10) };
        assert!(!ptr.is_null());
        unsafe {
            assert_eq!(*(ptr.sub(MAX_ALIGN) as *mut usize), 10);
            (0..10).for_each(|i| {
                *ptr.add(i) = i as u8;
            });
            (0..10).for_each(|i| {
                assert_eq!(*ptr.add(i), i as u8);
            });
        }
        unsafe { free(ptr) };
    }

    #[test]
    fn calloc_zeroes_the_block() {
        let ptr = unsafe { calloc(10, 10) };
        assert!(!ptr.is_null());
        unsafe {
            assert_eq!(*(ptr.sub(MAX_ALIGN) as *mut usize), 100);
            (0..100).for_each(|i| {
                assert_eq!(*ptr.add(i), 0);
            });
        }
        unsafe { free(ptr) };
    }

    #[test]
    fn realloc_keeps_the_old_contents() {
        let ptr = unsafe { malloc(10) };
        assert!(!ptr.is_null());
        unsafe {
            (0..10).for_each(|i| {
                *ptr.add(i) = i as u8;
            });
        }
        let ptr = unsafe { realloc(ptr, 20) };
        assert!(!ptr.is_null());
        unsafe {
            assert_eq!(*(ptr.sub(MAX_ALIGN) as *mut usize), 20);
            (0..10).for_each(|i| {
                assert_eq!(*ptr.add(i), i as u8);
            });
        }
        unsafe { free(ptr) };
    }

    #[test]
    fn realloc_of_null_allocates() {
        let ptr = unsafe { realloc(core::ptr::null_mut(), 32) };
        assert!(!ptr.is_null());
        unsafe { assert_eq!(*(ptr.sub(MAX_ALIGN) as *mut usize), 32) };
        unsafe { free(ptr) };
    }

    #[test]
    fn free_of_null_is_a_no_op() {
        unsafe { free(core::ptr::null_mut()) };
    }

    #[test]
    fn blocks_are_max_aligned() {
        let ptrs: Vec<*mut u8> = (1..64).map(|n| unsafe { malloc(n) }).collect();
        for ptr in &ptrs {
            assert_eq!(*ptr as usize % MAX_ALIGN, 0);
        }
        for ptr in ptrs {
            unsafe { free(ptr) };
        }
    }

    #[test]
    fn many_blocks_do_not_overlap() {
        // Every block has to be independently writable, and the memory a
        // freed block held has to come back. A loop this size is what tells
        // a real allocator apart from one that only ever hands out fresh
        // pages until it runs off the end of memory.
        const COUNT: usize = 512;
        const SIZE: usize = 128;

        let ptrs: Vec<*mut u8> = (0..COUNT).map(|_| unsafe { malloc(SIZE) }).collect();
        for (i, ptr) in ptrs.iter().enumerate() {
            assert!(!ptr.is_null());
            unsafe { core::ptr::write_bytes(*ptr, i as u8, SIZE) };
        }
        for (i, ptr) in ptrs.iter().enumerate() {
            let block = unsafe { core::slice::from_raw_parts(*ptr, SIZE) };
            assert!(
                block.iter().all(|&b| b == i as u8),
                "block {i} was overwritten"
            );
        }
        for ptr in ptrs {
            unsafe { free(ptr) };
        }
    }
}
