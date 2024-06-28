(module $libc_calculator.wasm
  (type (;0;) (func (param i32) (result i32)))
  (type (;1;) (func (param i32)))
  (type (;2;) (func (param i32 i32) (result i32)))
  (type (;3;) (func (result i32)))
  (type (;4;) (func))
  (import "env" "malloc" (func $malloc (type 0)))
  (import "env" "free" (func $free (type 1)))
  (func $subtract (type 2) (param i32 i32) (result i32)
    i32.const 0
    local.get 0
    local.get 1
    i32.sub
    local.tee 1
    local.get 1
    local.get 0
    i32.gt_u
    select)
  (func $_ZN15libc_calculator10Calculator3add17h3d5389ffc7b30a16E (type 2) (param i32 i32) (result i32)
    local.get 0
    local.get 1
    call $add)
  (func $_ZN15libc_calculator10Calculator8subtract17hb47de50d1107b9a4E (type 2) (param i32 i32) (result i32)
    i32.const 0
    local.get 0
    local.get 1
    i32.sub
    local.tee 1
    local.get 1
    local.get 0
    i32.gt_u
    select)
  (func $_ZN15libc_calculator10Calculator8multiply17h1656dd1f23afaed8E (type 2) (param i32 i32) (result i32)
    (local i32)
    i32.const 0
    local.set 2
    block  ;; label = @1
      local.get 1
      i32.eqz
      br_if 0 (;@1;)
      loop  ;; label = @2
        local.get 2
        local.get 0
        call $add
        local.set 2
        local.get 1
        i32.const -1
        i32.add
        local.tee 1
        br_if 0 (;@2;)
      end
    end
    local.get 2)
  (func $_ZN15libc_calculator10Calculator6divide17hfd4925809e7884b1E (type 2) (param i32 i32) (result i32)
    local.get 0
    local.get 1
    call $divide)
  (func $_ZN15libc_calculator10Calculator5store17h00da3a3a6888e22cE (type 1) (param i32)
    local.get 0
    call $store)
  (func $_ZN15libc_calculator10Calculator8retrieve17h5f1b1a35e2048471E (type 3) (result i32)
    call $retrieve)
  (func $_ZN15libc_calculator10Calculator5clear17hed4141ad976d47f8E (type 4)
    call $clear)
  (func $add (type 2) (param i32 i32) (result i32)
    local.get 1
    local.get 0
    i32.add)
  (func $divide (type 2) (param i32 i32) (result i32)
    (local i32)
    i32.const 0
    local.set 2
    block  ;; label = @1
      local.get 0
      local.get 1
      i32.lt_s
      br_if 0 (;@1;)
      i32.const 0
      local.set 2
      loop  ;; label = @2
        local.get 2
        i32.const 1
        i32.add
        local.set 2
        local.get 0
        local.get 1
        call $subtract
        local.tee 0
        local.get 1
        i32.ge_s
        br_if 0 (;@2;)
      end
    end
    local.get 2)
  (func $store (type 1) (param i32)
    (local i32)
    block  ;; label = @1
      block  ;; label = @2
        global.get $GOT.data.internal.__memory_base
        i32.const 1048576
        i32.add
        i32.load
        local.tee 1
        br_if 0 (;@2;)
        global.get $GOT.data.internal.__memory_base
        i32.const 1048576
        i32.add
        i32.const 4
        call $malloc
        local.tee 1
        i32.store
        local.get 1
        i32.eqz
        br_if 1 (;@1;)
      end
      local.get 1
      local.get 0
      i32.store
    end)
  (func $retrieve (type 3) (result i32)
    (local i32)
    block  ;; label = @1
      global.get $GOT.data.internal.__memory_base
      i32.const 1048576
      i32.add
      i32.load
      local.tee 0
      br_if 0 (;@1;)
      i32.const 0
      return
    end
    local.get 0
    i32.load)
  (func $clear (type 4)
    (local i32)
    block  ;; label = @1
      global.get $GOT.data.internal.__memory_base
      i32.const 1048576
      i32.add
      i32.load
      local.tee 0
      i32.eqz
      br_if 0 (;@1;)
      local.get 0
      call $free
      global.get $GOT.data.internal.__memory_base
      i32.const 1048576
      i32.add
      i32.const 0
      i32.store
    end)
  (table (;0;) 1 1 funcref)
  (memory (;0;) 17)
  (global $__stack_pointer (mut i32) (i32.const 1048576))
  (global $GOT.data.internal.__memory_base i32 (i32.const 0))
  (global (;2;) i32 (i32.const 1048580))
  (global (;3;) i32 (i32.const 1048592))
  (export "memory" (memory 0))
  (export "subtract" (func $subtract))
  (export "calculator_retrieve" (func $_ZN15libc_calculator10Calculator8retrieve17h5f1b1a35e2048471E))
  (export "calculator_clear" (func $_ZN15libc_calculator10Calculator5clear17hed4141ad976d47f8E))
  (export "calculator_store" (func $_ZN15libc_calculator10Calculator5store17h00da3a3a6888e22cE))
  (export "multiply" (func $_ZN15libc_calculator10Calculator8multiply17h1656dd1f23afaed8E))
  (export "calculator_multiply" (func $_ZN15libc_calculator10Calculator8multiply17h1656dd1f23afaed8E))
  (export "calculator_add" (func $_ZN15libc_calculator10Calculator3add17h3d5389ffc7b30a16E))
  (export "calculator_subtract" (func $_ZN15libc_calculator10Calculator8subtract17hb47de50d1107b9a4E))
  (export "calculator_divide" (func $_ZN15libc_calculator10Calculator6divide17hfd4925809e7884b1E))
  (export "__data_end" (global 2))
  (export "__heap_base" (global 3)))
