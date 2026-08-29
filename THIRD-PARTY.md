# Third-party components

The project itself is MIT licensed. See [LICENSE.md](LICENSE.md).

It also compiles and links code written by other people. Those sources arrive as
git submodules that `./setup.sh` fetches, and the compiled result ends up inside
the `.wasm` binaries the examples produce. Each component keeps its own license,
listed below.

| Component | Version | License | Where it lives |
| --- | --- | --- | --- |
| [musl](https://musl.libc.org/) | 1.2.6 | MIT | `3rd-party/musl` (submodule) |
| [LLVM libc++ and libc++abi](https://libcxx.llvm.org/) | as vendored by emscripten 5.0.7-git | Apache-2.0 WITH LLVM-exception | `3rd-party/emscripten/system/lib/{libcxx,libcxxabi,llvm-libc}` (submodule) |
| [Emscripten](https://emscripten.org/) | 5.0.7-git | MIT, or University of Illinois/NCSA Open Source License, at your choice | `3rd-party/emscripten` (submodule) |
| [zlib](https://zlib.net/) | 1.3.2.1 (`develop`) | zlib License | `crates/9_capstone/zlib` (submodule) |
| The C allocator | in tree | Blue Oak Model License 1.0.0 | `3rd-party/wasm32-libc/src/malloc.rs` |

## musl

Version 1.2.6, from https://git.musl-libc.org/git/musl. The full notice is in
`3rd-party/musl/COPYRIGHT`. musl as a whole is MIT:

> Copyright © 2005-2020 Rich Felker, et al.

That file also names the third-party works musl carries under compatible terms.
Two of them are inside what this build compiles: much of `src/math/*` is
copyright Sun Microsystems, David Schultz, Steven G. Kargl, Bruce D. Evans,
Stephen L. Moshier or Arm Limited, labelled per file; and the smoothsort
`src/stdlib/qsort.c` is copyright 2011 Lynn Ochs under MIT-style terms.

`3rd-party/wasm32-libc/build.rs` selects which musl sources to compile. The
crate's own code, the wasm32 arch layer in `src/wasm32/` and `src/lib.rs`, is
this project's MIT. `src/malloc.rs` is not, see below.

## LLVM libc++ and libc++abi

Taken from emscripten's LLVM fork, at
`3rd-party/emscripten/system/lib/libcxx` and `.../libcxxabi`, with one header
(`shared/fp_bits.h`) from `.../llvm-libc`. All three are the LLVM Project under
the Apache License v2.0 with LLVM Exceptions. The license text ships with the
sources:

- `3rd-party/emscripten/system/lib/libcxx/LICENSE.TXT`
- `3rd-party/emscripten/system/lib/libcxxabi/LICENSE.TXT`
- `3rd-party/emscripten/system/lib/llvm-libc/LICENSE.TXT`

`3rd-party/wasm32-libcxx/build.rs` compiles them, mirroring the source lists and
defines in emscripten's `tools/system_libs.py`.

## Emscripten

https://github.com/emscripten-core/emscripten, version 5.0.7-git. Emscripten is
offered under two licenses, MIT and the University of Illinois/NCSA Open Source
License, either of which may be used. Both texts are in
`3rd-party/emscripten/LICENSE`, and the contributors are listed in
`3rd-party/emscripten/AUTHORS`.

Beyond the libc++ sources above, this repo uses emscripten's pre-generated
wasm32 arch headers, at `system/lib/libc/musl/arch/emscripten`. musl derives
`bits/` from per-arch templates at build time and has no wasm32 arch of its own,
so those headers are borrowed from the port that already maintains them. They
are part of emscripten's musl fork and carry musl's MIT terms, repeated in
`3rd-party/emscripten/system/lib/libc/musl/COPYRIGHT`.

## zlib

https://github.com/madler/zlib, tracking the `develop` branch, currently
version 1.3.2.1. The notice is in `crates/9_capstone/zlib/LICENSE` and at the
top of `crates/9_capstone/zlib/zlib.h`:

> Copyright notice:
>
>  (C) 1995-2026 Jean-loup Gailly and Mark Adler
>
>   This software is provided 'as-is', without any express or implied
>   warranty.  In no event will the authors be held liable for any damages
>   arising from the use of this software.
>
>   Permission is granted to anyone to use this software for any purpose,
>   including commercial applications, and to alter it and redistribute it
>   freely, subject to the following restrictions:
>
>   1. The origin of this software must not be misrepresented; you must not
>      claim that you wrote the original software. If you use this software
>      in a product, an acknowledgment in the product documentation would be
>      appreciated but is not required.
>   2. Altered source versions must be plainly marked as such, and must not be
>      misrepresented as being the original software.
>   3. This notice may not be removed or altered from any source distribution.
>
>   Jean-loup Gailly        Mark Adler
>   jloup@gzip.org          madler@alumni.caltech.edu

Crate 9 compiles zlib unmodified, from the submodule.

## The C allocator

`3rd-party/wasm32-libc/src/malloc.rs`, copyright Gyungmin Myung
(gmmyung@kaist.ac.kr), licensed under the Blue Oak Model License 1.0.0. The
canonical text is at <https://blueoakcouncil.org/license/1.0.0>, and its Notices
clause asks that the text itself travel with the code, so here it is in full.

```
# Blue Oak Model License

Version 1.0.0

## Purpose

This license gives everyone as much permission to work with
this software as possible, while protecting contributors
from liability.

## Acceptance

In order to receive this license, you must agree to its
rules. The rules of this license are both obligations
under that agreement and conditions to your license.
You must not do anything with this software that triggers
a rule that you cannot or will not follow.

## Copyright

Each contributor licenses you to do everything with this
software that would otherwise infringe that contributor's
copyright in it.

## Notices

You must ensure that everyone who gets a copy of
any part of this software from you, with or without
changes, also gets the text of this license or a link to
<https://blueoakcouncil.org/license/1.0.0>.

## Excuse

If anyone notifies you in writing that you have not
complied with [Notices](#notices), you can keep your
license by taking all practical steps to comply within 30
days after the notice. If you do not do so, your license
ends immediately.

## Patent

Each contributor licenses you to do everything with this
software that would otherwise infringe any patent claims
they can license or become able to license.

## Reliability

No contributor can revoke this license.

## No Liability

***As far as the law allows, this software comes as is,
without any warranty or condition, and no contributor
will be liable to anyone for any damages related to this
software or this license, under any kind of legal claim.***
```
