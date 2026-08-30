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

use alloc::alloc::Layout;
use core::ptr;

/// Alignment of the largest scalar type, and the size of the block header.
const MAX_ALIGN: usize = 16;

/// `ENOMEM`, from musl's `arch/generic/bits/errno.h`.
#[cfg(wasm)]
const ENOMEM: i32 = 12;

#[cfg(wasm)]
unsafe extern "C" {
    fn __errno_location() -> *mut i32;
}

/// The layout of a block whose payload is `size` bytes.
///
/// `None` covers both ways a request can be impossible: `size + MAX_ALIGN`
/// past the end of the address space, and a total that `Layout` will not
/// represent. C answers either one with a failed allocation, so neither may
/// panic and neither may wrap into a smaller block that then reports success.
fn block_layout(size: usize) -> Option<Layout> {
    let total = size.checked_add(MAX_ALIGN)?;
    Layout::from_size_align(total, MAX_ALIGN).ok()
}

/// The failed-allocation answer: null, with `errno` set to `ENOMEM`.
fn out_of_memory() -> *mut u8 {
    #[cfg(wasm)]
    unsafe {
        *__errno_location() = ENOMEM;
    }
    ptr::null_mut()
}

/// Allocates `size` bytes, aligned to [`MAX_ALIGN`], or null on failure.
///
/// # Safety
///
/// The block must be released with [`free`] or resized with [`realloc`], and
/// with nothing else: it carries a header that only these functions know about.
#[cfg_attr(wasm, unsafe(no_mangle))]
pub unsafe extern "C" fn malloc(size: usize) -> *mut u8 {
    let Some(layout) = block_layout(size) else {
        return out_of_memory();
    };
    let ptr = unsafe { alloc::alloc::alloc(layout) };
    if ptr.is_null() {
        return out_of_memory();
    }
    unsafe {
        *(ptr as *mut usize) = size;
    }
    unsafe { ptr.add(MAX_ALIGN) }
}

/// Allocates `nmemb * size` zeroed bytes, or null on failure.
///
/// The product is checked. An overflowing request fails, rather than wrapping
/// into a small block that the caller then writes past the end of.
///
/// # Safety
///
/// As [`malloc`].
#[cfg_attr(wasm, unsafe(no_mangle))]
pub unsafe extern "C" fn calloc(nmemb: usize, size: usize) -> *mut u8 {
    let Some(total_size) = nmemb.checked_mul(size) else {
        return out_of_memory();
    };
    let Some(layout) = block_layout(total_size) else {
        return out_of_memory();
    };
    let ptr = unsafe { alloc::alloc::alloc_zeroed(layout) };
    if ptr.is_null() {
        return out_of_memory();
    }
    unsafe {
        *(ptr as *mut usize) = total_size;
    }
    unsafe { ptr.add(MAX_ALIGN) }
}

/// Resizes a block to `size` bytes, moving it if it has to.
///
/// A request that cannot be satisfied returns null and leaves the original
/// block untouched, so the caller can still read it or free it.
///
/// # Safety
///
/// `ptr` must be null, or a live block from [`malloc`], [`calloc`] or an
/// earlier [`realloc`]. On success the old pointer is dangling.
#[cfg_attr(wasm, unsafe(no_mangle))]
pub unsafe extern "C" fn realloc(ptr: *mut u8, size: usize) -> *mut u8 {
    if ptr.is_null() {
        return unsafe { malloc(size) };
    }

    let Some(new_layout) = block_layout(size) else {
        return out_of_memory();
    };

    unsafe {
        let block = ptr.sub(MAX_ALIGN);
        let old_size = *(block as *mut usize);
        // The header was written by one of these functions, so the old layout
        // was representable when the block was made and still is.
        let old_layout = Layout::from_size_align_unchecked(old_size + MAX_ALIGN, MAX_ALIGN);

        let new_block = alloc::alloc::realloc(block, old_layout, new_layout.size());
        if new_block.is_null() {
            return out_of_memory();
        }
        *(new_block as *mut usize) = size;
        new_block.add(MAX_ALIGN)
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
    unsafe {
        let block = ptr.sub(MAX_ALIGN);
        let old_size = *(block as *mut usize);
        // As in realloc: this header came from an allocation that succeeded.
        let layout = Layout::from_size_align_unchecked(old_size + MAX_ALIGN, MAX_ALIGN);
        alloc::alloc::dealloc(block, layout);
    }
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
    fn malloc_of_an_unrepresentable_size_returns_null() {
        // size + MAX_ALIGN runs past the end of the address space.
        assert!(unsafe { malloc(usize::MAX) }.is_null());
        // The sum fits, but Layout will not carry it.
        assert!(unsafe { malloc(isize::MAX as usize) }.is_null());
    }

    #[test]
    fn calloc_rejects_an_overflowing_product() {
        // The product wraps to 0. Answering with a 16-byte block would report
        // success and hand the caller something far smaller than it asked for.
        let nmemb = usize::MAX / 2 + 1;
        assert_eq!(nmemb.wrapping_mul(4), 0);
        assert!(unsafe { calloc(nmemb, 4) }.is_null());
        assert!(unsafe { calloc(usize::MAX, usize::MAX) }.is_null());
    }

    #[test]
    fn realloc_that_cannot_grow_keeps_the_old_block() {
        let ptr = unsafe { malloc(8) };
        assert!(!ptr.is_null());
        unsafe { core::ptr::write_bytes(ptr, 0xAB, 8) };

        assert!(unsafe { realloc(ptr, usize::MAX) }.is_null());

        // C leaves the original allocation alone when realloc fails, so it is
        // still readable and still ours to free.
        let block = unsafe { core::slice::from_raw_parts(ptr, 8) };
        assert!(block.iter().all(|&b| b == 0xAB));
        unsafe { free(ptr) };
    }

    #[test]
    fn calloc_of_zero_still_returns_a_block() {
        // A zero-size request is allowed to return a unique pointer, and this
        // allocator always has a header to point past.
        let ptr = unsafe { calloc(0, 16) };
        assert!(!ptr.is_null());
        unsafe { free(ptr) };
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
