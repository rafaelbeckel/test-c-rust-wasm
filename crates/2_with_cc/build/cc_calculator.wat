(module $cc_calculator.wasm
  (type (;0;) (func (param i32 i32) (result i32)))
  (func $add (type 0) (param i32 i32) (result i32)
    local.get 0
    local.get 1
    call $_add)
  (func $divide (type 0) (param i32 i32) (result i32)
    local.get 0
    local.get 1
    call $_divide)
  (func $subtract (type 0) (param i32 i32) (result i32)
    i32.const 0
    local.get 0
    local.get 1
    i32.sub
    local.tee 1
    local.get 1
    local.get 0
    i32.gt_u
    select)
  (func $multiply (type 0) (param i32 i32) (result i32)
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
        call $_add
        local.set 2
        local.get 1
        i32.const -1
        i32.add
        local.tee 1
        br_if 0 (;@2;)
      end
    end
    local.get 2)
  (func $_add (type 0) (param i32 i32) (result i32)
    local.get 1
    local.get 0
    i32.add)
  (func $_divide (type 0) (param i32 i32) (result i32)
    (local i32)
    i32.const 0
    local.set 2
    block  ;; label = @1
      local.get 1
      i32.const -1
      i32.add
      local.get 0
      i32.ge_u
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
        i32.ge_u
        br_if 0 (;@2;)
      end
    end
    local.get 2)
  (table (;0;) 1 1 funcref)
  (memory (;0;) 16)
  (global $__stack_pointer (mut i32) (i32.const 1048576))
  (global (;1;) i32 (i32.const 1048576))
  (global (;2;) i32 (i32.const 1048576))
  (export "memory" (memory 0))
  (export "add" (func $add))
  (export "divide" (func $divide))
  (export "subtract" (func $subtract))
  (export "multiply" (func $multiply))
  (export "__data_end" (global 1))
  (export "__heap_base" (global 2)))
