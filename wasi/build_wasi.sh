# Needs wasi-libc:
# git clone https://github.com/CraneStation/wasi-libc.git
# cd wasi-libc
# make install INSTALL_DIR=/tmp/wasi-libc

# Also needs:
# /opt/homebrew/Cellar/llvm/18.1.5/lib/clang/18/lib/wasi/libclang_rt.builtins-wasm32.a
# Which can be downloaded from: https://github.com/jedisct1/libclang_rt.builtins-wasm32.a
# This page says we can also use Zig as a C compiler to make it work without downloading anything.

# @TODO investigate why this is not importing memory from the host correctly.
#       do that AFTER you link Rust+C together in WASM without std
# Links:
# - https://depth-first.com/articles/2019/10/16/compiling-c-to-webassembly-and-running-it-without-emscripten/

clang \
    --target=wasm32-wasi \
    --sysroot /tmp/wasi-libc \
    -nostartfiles \
    -Wl,--import-memory \
    -Wl,--no-entry \
    -Wl,--export-all \
    -o ../copy.wasm \
    copy.c

# --target=wasm32-unknown-wasi # Target WebAssembly with WASI
# --sysroot /tmp/wasi-libc     # Set top-level directory for libc
# -nostartfiles                # Don't include the standard system startup files
# -Wl,--import-memory          # Import memory from the host (JavaScript)
# -Wl,--no-entry               # Don't include a main function
# -Wl,--export-all             # Export all functions
