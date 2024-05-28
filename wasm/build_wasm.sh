clang \
    --target=wasm32 \
    --no-standard-libraries \
    -Wl,--export-all \
    -Wl,--no-entry \
    -o ../c_maths.wasm \
    maths.c

# The options passed to clang are:
#
#    --target=wasm32 Set the build target to wasm.
#    --no-standard-libraries Do not use libc (more on this later).
#    -Wl,--export-all Export all symbols (i.e., add) from the compiled wasm file so that they can be used from JavaScript.
#    -Wl,--no-entry Don't check for a main function.
#    -o Set the output destination.
