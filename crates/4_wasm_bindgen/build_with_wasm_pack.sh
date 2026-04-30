set -e

wasm-pack build --target web --release

# Replaces the import statement `from "env"` with `from "./env.js"`.
# `sed -i.bak` works on both BSD (macOS) and GNU sed; we then drop the backup.
sed -i.bak -E 's#from ["'\'']env["'\'']#from "./env.js"#g' pkg/wbg_calculator.js
rm -f pkg/wbg_calculator.js.bak

# Copy the memory.js file to the pkg folder
cp src/memory.js pkg/env.js

# Optional: Feel free to read the generated WAT file
wasm2wat pkg/wbg_calculator_bg.wasm >pkg/wbg_calculator.wat
