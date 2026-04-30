set -e

wasm-pack build --target web --release

# Replaces the import statement from 'env' to './env.js'
sed -i '' "s/from 'env';/from '.\/env.js';/g" pkg/ext_t_calculator.js

# Copy the memory.js file to the pkg folder
cp src/memory.js pkg/env.js

# Optional: Feel free to read the generated WAT file
wasm2wat pkg/ext_t_calculator_bg.wasm >pkg/ext_t_calculator.wat
