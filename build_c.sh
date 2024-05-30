cd wasm

# ---------------------------------------------------------
# STEP 1: Build LLVM IR and object file from C source code
clang \
    --target=wasm32 \
    -c \
    -o ../c_maths.o \
    ./maths.c

# --target=wasm32 # Target WebAssembly
# -emit-llvm      # Emit LLVM IR - instead of host machine code
# -c              # Only compile, no linking just yet
# -S              # Emit human-readable assembly rather than binary

# ---------------------------------------------------------
# STEP 2: (done in compile_both.sh) Compile the LLVM IR to a WebAssembly object file
# llc \
#     -march=wasm32 \
#     -filetype=obj \
#     maths.ll

# -march=wasm32 # Target WebAssembly
# -filetype=obj # Output an object file

# ---------------------------------------------------------
# STEP 2.1 (optional: print human-readable object file)
# Needs WABT: `brew install wabt`
#
# uncomment next line:
# wasm-objdump -x add.o

# ---------------------------------------------------------
# STEP 3: (done in compile_both.sh) Link the object file to a WebAssembly binary
# wasm-ld \
#     --no-entry \
#     --export-all \
#     -o ../c_maths.wasm \
#     add.o

# --no-entry   # Don't include a main function
# --export-all # Export all functions
