# As of June 2024, it is necessary to use nightly with the wasm_c_abi=spec
# flag that was introduced in April.

# The `spec` ABI will be the default compiler behavior in the future.
# If the future has arrived and the flag is not necessary anymore,
# please open an Issue or submit PR to update this script.

export RUSTFLAGS="--Z wasm_c_abi=spec"
wasm-pack build --target web --release

# Optional: Feel free to read the generated WAT file
wasm2wat pkg/ext_t_calculator_bg.wasm >pkg/ext_t_calculator.wat

target_file="pkg/ext_t_calculator.js"
memory_file="src/memory.js"

# Remove the lines:
# `import * as __wbg_star0 from 'env';`
# and `imports['env'] = __wbg_star0;`
sed -i '' "/import \* as __wbg_star0 from 'env';/d" $target_file
sed -i '' "/imports\['env'\] = __wbg_star0;/d" $target_file

# Read the contents of memory.js
memory_content=$(<"$memory_file")

# Escape special characters in the memory content for sed
memory_content=$(echo $memory_content | sed -e 's/[\/&]/\\&/g')

# Use sed to replace the empty function with the contents of memory.js
# Step 1: Replace the empty function body with a __PLACEHOLDER__
sed -i '' '/function __wbg_init_memory(imports, maybe_memory) {/{
N
N
s/function __wbg_init_memory(imports, maybe_memory) {\n\n}/__PLACEHOLDER__ /
}' "$target_file"

# Step 2: Replace the __PLACEHOLDER__ with the contents of memory.js
sed -i '' "s/__PLACEHOLDER__/$memory_content/g" "$target_file"
