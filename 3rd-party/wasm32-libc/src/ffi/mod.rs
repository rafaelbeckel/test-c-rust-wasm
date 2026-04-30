//! A tiny C library, written in Rust.
//!
//! See README.md for more details.
//!
//! This file is Copyright (c) Jonathan 'theJPster' Pallant 2019
//! Licensed under the Blue Oak Model Licence 1.0.0
//!
//! See each module for its respective license.

#![allow(clippy::missing_safety_doc)]
#![allow(unused_imports)]

mod malloc;
pub use self::malloc::{calloc, free, malloc, realloc};

mod itoa;
pub use self::itoa::itoa;
pub use self::itoa::utoa;

mod abs;
pub use self::abs::abs;

mod strcmp;
pub use self::strcmp::strcmp;

mod strncmp;
pub use self::strncmp::strncmp;

mod strncasecmp;
pub use self::strncasecmp::strncasecmp;

mod strcpy;
pub use self::strcpy::strcpy;

mod strncpy;
pub use self::strncpy::strncpy;

mod strlen;
pub use self::strlen::strlen;

mod strtol;
pub use self::strtol::atoi;
pub use self::strtol::isalpha;
pub use self::strtol::isdigit;
pub use self::strtol::isspace;
pub use self::strtol::isupper;
pub use self::strtol::strtoimax;
pub use self::strtol::strtol;
pub use self::strtol::strtoll;
pub use self::strtol::strtoul;
pub use self::strtol::strtoull;
pub use self::strtol::strtoumax;

mod strstr;
pub use self::strstr::strstr;

mod strchr;
pub use self::strchr::strchr;

mod qsort;
pub use self::qsort::qsort;

mod signal;
#[cfg(not(test))]
pub use self::signal::{abort, raise, signal};

mod memchr;
pub use self::memchr::memchr;

mod snprintf;

mod strcat;
pub use self::strcat::strcat;

mod ctype;
pub use self::ctype::*;
