# ---------------------------------------------------------
# STEP 1: Build LLVM IR and object file from C source code
clang \
    --target=wasm32 \
    -emit-llvm \
    -c \
    -S \
    add.c

# --target=wasm32 # Target WebAssembly
# -emit-llvm      # Emit LLVM IR - instead of host machine code
# -c              # Only compile, no linking just yet
# -S              # Emit human-readable assembly rather than binary

# @TODO do the same with Rust here (i.e. subtract.rs)


# ---------------------------------------------------------
# STEP 2: Compile the LLVM IR to a WebAssembly object file
llc \
    -march=wasm32 \
    -filetype=obj \
    add.ll

# -march=wasm32 # Target WebAssembly
# -filetype=obj # Output an object file

