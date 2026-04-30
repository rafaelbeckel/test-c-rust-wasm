#![cfg(not(test))]

//! Rust implementation of the C standard library's `signal` related functions.
//!
//! Copyright (c) Gyungmin Myung <gmmyung@kaist.ac.kr>
//! Licensed under the Blue Oak Model Licence 1.0.0

use portable_atomic::{AtomicUsize, Ordering};

#[allow(clippy::declare_interior_mutable_const)]
const SIG_DFL_ATOMIC: AtomicUsize = AtomicUsize::new(SIG_DFL);

static SIGNAL_HANDLERS: [AtomicUsize; 16] = [SIG_DFL_ATOMIC; 16];

pub type SignalHandler = usize;

const SIG_DFL: usize = 0;
const SIG_IGN: usize = 1;
const SIG_ERR: usize = usize::MAX;

const SIGTERM: i32 = 15;
const SIGSEGV: i32 = 11;
const SIGINT: i32 = 2;
const SIGILL: i32 = 4;
const SIGABRT: i32 = 6;
const SIGFPE: i32 = 8;

const SIGNALS: [i32; 6] = [SIGTERM, SIGSEGV, SIGINT, SIGILL, SIGABRT, SIGFPE];

fn ignore_handler(_sig: i32) {}

fn default_handler(_sig: i32) {
    panic!("Aborted");
}

#[unsafe(no_mangle)]
pub unsafe extern "C" fn signal(sig: i32, handler: SignalHandler) -> SignalHandler {
    if !SIGNALS.contains(&sig) { return SIG_ERR; }
    SIGNAL_HANDLERS[sig as usize].swap(handler, Ordering::Relaxed)
}

#[unsafe(no_mangle)]
pub extern "C" fn raise(sig: i32) -> i32 {
    if !SIGNALS.contains(&sig) { return -1; }
    let handler = SIGNAL_HANDLERS[sig as usize].load(Ordering::Relaxed);
    match handler {
        SIG_DFL => { default_handler(sig); }
        SIG_IGN => { ignore_handler(sig); }
        _ => unsafe {
            let handler_fn: unsafe extern "C" fn(core::ffi::c_int) = core::mem::transmute(handler);
            handler_fn(sig);
        },
    }
    0
}

#[unsafe(no_mangle)]
pub extern "C" fn abort() {
    raise(SIGABRT);
}
