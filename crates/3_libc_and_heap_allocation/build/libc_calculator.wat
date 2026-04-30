(module $libc_calculator.wasm
  (type (;0;) (func (param i32 i32) (result i32)))
  (type (;1;) (func (param i32)))
  (type (;2;) (func (param i32 i32)))
  (type (;3;) (func (param i32 i32 i32) (result i32)))
  (type (;4;) (func))
  (type (;5;) (func (result i32)))
  (type (;6;) (func (param i32 i32 i32)))
  (type (;7;) (func (param i32 i32 i32 i32) (result i32)))
  (type (;8;) (func (param i32 i32 i32 i32 i32)))
  (type (;9;) (func (param i32 i32 i32 i32 i32 i32)))
  (type (;10;) (func (param i32 i32 i32 i32)))
  (type (;11;) (func (param i32) (result i32)))
  (type (;12;) (func (param i32 i32 i32 i64 i64) (result i64)))
  (type (;13;) (func (param i64 i32 i32 i32) (result i32)))
  (type (;14;) (func (param i32 i32 i32) (result i64)))
  (type (;15;) (func (param i32 i32 i32 i32 i32 i32 i32 i32)))
  (type (;16;) (func (param i32 i32 i32 i32 i32) (result i32)))
  (type (;17;) (func (param i32 i32 i32 i32 i32 i32) (result i32)))
  (type (;18;) (func (param i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32) (result i32)))
  (func $_RNvMs_Csjl1iKzzrMk6_15libc_calculatorNtB4_10Calculator3add (type 0) (param i32 i32) (result i32)
    local.get 0
    local.get 1
    call $add)
  (func $_RNvMs_Csjl1iKzzrMk6_15libc_calculatorNtB4_10Calculator5clear (type 4)
    call $clear)
  (func $_RNvMs_Csjl1iKzzrMk6_15libc_calculatorNtB4_10Calculator5store (type 1) (param i32)
    local.get 0
    call $store)
  (func $_RNvMs_Csjl1iKzzrMk6_15libc_calculatorNtB4_10Calculator6divide (type 0) (param i32 i32) (result i32)
    local.get 0
    local.get 1
    call $divide)
  (func $_RNvMs_Csjl1iKzzrMk6_15libc_calculatorNtB4_10Calculator8multiply (type 0) (param i32 i32) (result i32)
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
  (func $_RNvMs_Csjl1iKzzrMk6_15libc_calculatorNtB4_10Calculator8retrieve (type 5) (result i32)
    call $retrieve)
  (func $_RNvMs_Csjl1iKzzrMk6_15libc_calculatorNtB4_10Calculator8subtract (type 0) (param i32 i32) (result i32)
    i32.const 0
    local.get 0
    local.get 1
    i32.sub
    local.tee 1
    local.get 1
    local.get 0
    i32.gt_u
    select)
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
  (func $_RNvCsfFJ77F7ERra_7___rustc12___rust_alloc (type 0) (param i32 i32) (result i32)
    local.get 0
    local.get 1
    call $_RNvCsfFJ77F7ERra_7___rustc11___rdl_alloc
    return)
  (func $_RNvCsfFJ77F7ERra_7___rustc14___rust_dealloc (type 6) (param i32 i32 i32)
    local.get 0
    local.get 1
    local.get 2
    call $_RNvCsfFJ77F7ERra_7___rustc13___rdl_dealloc
    return)
  (func $_RNvCsfFJ77F7ERra_7___rustc14___rust_realloc (type 7) (param i32 i32 i32 i32) (result i32)
    local.get 0
    local.get 1
    local.get 2
    local.get 3
    call $_RNvCsfFJ77F7ERra_7___rustc13___rdl_realloc
    return)
  (func $_RNvCsfFJ77F7ERra_7___rustc19___rust_alloc_zeroed (type 0) (param i32 i32) (result i32)
    local.get 0
    local.get 1
    call $_RNvCsfFJ77F7ERra_7___rustc18___rdl_alloc_zeroed
    return)
  (func $_RNvCsfFJ77F7ERra_7___rustc35___rust_no_alloc_shim_is_unstable_v2 (type 4)
    return)
  (func $add (type 0) (param i32 i32) (result i32)
    local.get 1
    local.get 0
    i32.add)
  (func $divide (type 0) (param i32 i32) (result i32)
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
        i32.const 0
        i32.load offset=1053104
        local.tee 1
        br_if 0 (;@2;)
        i32.const 0
        i32.const 4
        call $malloc
        local.tee 1
        i32.store offset=1053104
        local.get 1
        i32.eqz
        br_if 1 (;@1;)
      end
      local.get 1
      local.get 0
      i32.store
    end)
  (func $retrieve (type 5) (result i32)
    (local i32 i32)
    i32.const 0
    local.set 0
    block  ;; label = @1
      i32.const 0
      i32.load offset=1053104
      local.tee 1
      i32.eqz
      br_if 0 (;@1;)
      local.get 1
      i32.load
      local.set 0
    end
    local.get 0)
  (func $clear (type 4)
    (local i32)
    block  ;; label = @1
      i32.const 0
      i32.load offset=1053104
      local.tee 0
      i32.eqz
      br_if 0 (;@1;)
      local.get 0
      call $free
      i32.const 0
      i32.const 0
      i32.store offset=1053104
    end)
  (func $_RINvNvMs2_NtCslUrat6hAxmK_5alloc7raw_vecINtB8_11RawVecInnerpE7reserve21do_reserve_and_handleNtNtBa_5alloc6GlobalECsaJZI1b1iR8F_11wasm32_libc (type 8) (param i32 i32 i32 i32 i32)
    (local i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 5
    global.set $__stack_pointer
    block  ;; label = @1
      local.get 4
      br_if 0 (;@1;)
      i32.const 0
      i32.const 0
      call $_RNvNtCslUrat6hAxmK_5alloc7raw_vec12handle_error
      unreachable
    end
    block  ;; label = @1
      local.get 2
      local.get 1
      i32.add
      local.tee 1
      local.get 2
      i32.ge_u
      br_if 0 (;@1;)
      i32.const 0
      i32.const 0
      call $_RNvNtCslUrat6hAxmK_5alloc7raw_vec12handle_error
      unreachable
    end
    local.get 5
    i32.const 4
    i32.add
    local.get 0
    i32.load
    local.tee 2
    local.get 0
    i32.load offset=4
    local.get 1
    local.get 2
    i32.const 1
    i32.shl
    local.tee 2
    local.get 1
    local.get 2
    i32.gt_u
    select
    local.tee 2
    i32.const 8
    i32.const 4
    i32.const 1
    local.get 4
    i32.const 1025
    i32.lt_u
    select
    local.get 4
    i32.const 1
    i32.eq
    select
    local.tee 1
    local.get 2
    local.get 1
    i32.gt_u
    select
    local.tee 2
    local.get 3
    local.get 4
    call $_RNvMs4_NtCslUrat6hAxmK_5alloc7raw_vecNtB5_11RawVecInner11finish_growCsaJZI1b1iR8F_11wasm32_libc.llvm.302566278654680376
    block  ;; label = @1
      local.get 5
      i32.load offset=4
      i32.const 1
      i32.ne
      br_if 0 (;@1;)
      local.get 5
      i32.load offset=8
      local.get 5
      i32.load offset=12
      call $_RNvNtCslUrat6hAxmK_5alloc7raw_vec12handle_error
      unreachable
    end
    local.get 5
    i32.load offset=8
    local.set 4
    local.get 0
    local.get 2
    i32.store
    local.get 0
    local.get 4
    i32.store offset=4
    local.get 5
    i32.const 16
    i32.add
    global.set $__stack_pointer)
  (func $_RNvMs4_NtCslUrat6hAxmK_5alloc7raw_vecNtB5_11RawVecInner11finish_growCsaJZI1b1iR8F_11wasm32_libc.llvm.302566278654680376 (type 9) (param i32 i32 i32 i32 i32 i32)
    (local i32 i32 i64)
    i32.const 1
    local.set 6
    i32.const 4
    local.set 7
    block  ;; label = @1
      block  ;; label = @2
        local.get 5
        i64.extend_i32_u
        local.get 3
        i64.extend_i32_u
        i64.mul
        local.tee 8
        i64.const 32
        i64.shr_u
        i32.wrap_i64
        i32.eqz
        br_if 0 (;@2;)
        i32.const 0
        local.set 3
        br 1 (;@1;)
      end
      block  ;; label = @2
        local.get 8
        i32.wrap_i64
        local.tee 3
        i32.const -2147483648
        local.get 4
        i32.sub
        i32.le_u
        br_if 0 (;@2;)
        i32.const 0
        local.set 3
        br 1 (;@1;)
      end
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              local.get 1
              i32.eqz
              br_if 0 (;@5;)
              local.get 2
              local.get 5
              local.get 1
              i32.mul
              local.get 4
              local.get 3
              call $_RNvCsfFJ77F7ERra_7___rustc14___rust_realloc
              local.set 7
              br 1 (;@4;)
            end
            block  ;; label = @5
              local.get 3
              br_if 0 (;@5;)
              local.get 4
              local.set 7
              br 2 (;@3;)
            end
            call $_RNvCsfFJ77F7ERra_7___rustc35___rust_no_alloc_shim_is_unstable_v2
            local.get 3
            local.get 4
            call $_RNvCsfFJ77F7ERra_7___rustc12___rust_alloc
            local.set 7
          end
          local.get 7
          br_if 0 (;@3;)
          local.get 0
          local.get 4
          i32.store offset=4
          br 1 (;@2;)
        end
        local.get 0
        local.get 7
        i32.store offset=4
        i32.const 0
        local.set 6
      end
      i32.const 8
      local.set 7
    end
    local.get 0
    local.get 7
    i32.add
    local.get 3
    i32.store
    local.get 0
    local.get 6
    i32.store)
  (func $_RNvNtNtCsaJZI1b1iR8F_11wasm32_libc3ffi5qsort14heap_sift_down (type 8) (param i32 i32 i32 i32 i32)
    (local i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 128
    i32.sub
    local.tee 5
    global.set $__stack_pointer
    block  ;; label = @1
      local.get 1
      i32.const 1
      i32.shl
      local.tee 6
      local.get 2
      i32.ge_u
      br_if 0 (;@1;)
      block  ;; label = @2
        local.get 3
        i32.eqz
        br_if 0 (;@2;)
        loop  ;; label = @3
          local.get 6
          i32.const 1
          i32.or
          local.set 7
          local.get 7
          local.get 1
          local.get 0
          local.get 1
          local.get 3
          i32.mul
          i32.add
          local.tee 8
          local.get 0
          local.get 7
          local.get 3
          i32.mul
          i32.add
          local.tee 9
          local.get 4
          call_indirect (type 0)
          i32.const 0
          i32.lt_s
          local.tee 10
          select
          local.set 11
          local.get 9
          local.get 8
          local.get 10
          select
          local.set 9
          block  ;; label = @4
            local.get 7
            local.get 2
            i32.ge_u
            br_if 0 (;@4;)
            local.get 6
            i32.const 2
            i32.add
            local.set 7
            local.get 7
            local.get 11
            local.get 9
            local.get 0
            local.get 7
            local.get 3
            i32.mul
            i32.add
            local.tee 6
            local.get 4
            call_indirect (type 0)
            i32.const 0
            i32.lt_s
            local.tee 10
            select
            local.set 11
            local.get 6
            local.get 9
            local.get 10
            select
            local.set 9
          end
          local.get 11
          local.get 1
          i32.eq
          br_if 2 (;@1;)
          block  ;; label = @4
            local.get 8
            local.get 9
            i32.eq
            br_if 0 (;@4;)
            local.get 3
            local.set 7
            loop  ;; label = @5
              block  ;; label = @6
                local.get 7
                i32.const 128
                local.get 7
                i32.const 128
                i32.lt_u
                select
                local.tee 1
                i32.eqz
                local.tee 6
                br_if 0 (;@6;)
                local.get 5
                local.get 8
                local.get 1
                memory.copy
              end
              block  ;; label = @6
                local.get 6
                br_if 0 (;@6;)
                local.get 8
                local.get 9
                local.get 1
                memory.copy
              end
              block  ;; label = @6
                local.get 6
                br_if 0 (;@6;)
                local.get 9
                local.get 5
                local.get 1
                memory.copy
              end
              local.get 9
              local.get 1
              i32.add
              local.set 9
              local.get 8
              local.get 1
              i32.add
              local.set 8
              local.get 7
              local.get 1
              i32.sub
              local.tee 7
              br_if 0 (;@5;)
            end
          end
          local.get 11
          local.set 1
          local.get 11
          i32.const 1
          i32.shl
          local.tee 6
          local.get 2
          i32.lt_u
          br_if 0 (;@3;)
          br 2 (;@1;)
        end
      end
      loop  ;; label = @2
        local.get 6
        i32.const 1
        i32.or
        local.tee 9
        local.get 1
        local.get 0
        local.get 0
        local.get 4
        call_indirect (type 0)
        i32.const 0
        i32.lt_s
        select
        local.set 7
        block  ;; label = @3
          local.get 9
          local.get 2
          i32.ge_u
          br_if 0 (;@3;)
          local.get 6
          i32.const 2
          i32.add
          local.get 7
          local.get 0
          local.get 0
          local.get 4
          call_indirect (type 0)
          i32.const 0
          i32.lt_s
          select
          local.set 7
        end
        local.get 7
        local.get 1
        i32.eq
        br_if 1 (;@1;)
        local.get 7
        local.set 1
        local.get 7
        i32.const 1
        i32.shl
        local.tee 6
        local.get 2
        i32.lt_u
        br_if 0 (;@2;)
      end
    end
    local.get 5
    i32.const 128
    i32.add
    global.set $__stack_pointer)
  (func $_RNvNtNtCsaJZI1b1iR8F_11wasm32_libc3ffi5qsort16introsort_helper (type 8) (param i32 i32 i32 i32 i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 128
    i32.sub
    local.tee 5
    global.set $__stack_pointer
    block  ;; label = @1
      block  ;; label = @2
        local.get 1
        i32.const 16
        i32.lt_u
        br_if 0 (;@2;)
        block  ;; label = @3
          loop  ;; label = @4
            block  ;; label = @5
              local.get 3
              br_if 0 (;@5;)
              local.get 1
              i32.const -1
              i32.add
              local.set 6
              local.get 1
              i32.const -2
              i32.add
              local.tee 7
              i32.const 1
              i32.shr_u
              local.set 8
              loop  ;; label = @6
                local.get 0
                local.get 8
                local.get 6
                local.get 2
                local.get 4
                call $_RNvNtNtCsaJZI1b1iR8F_11wasm32_libc3ffi5qsort14heap_sift_down
                local.get 8
                i32.const -1
                i32.add
                local.tee 8
                i32.const -1
                i32.ne
                br_if 0 (;@6;)
              end
              local.get 2
              br_if 2 (;@3;)
              loop  ;; label = @6
                i32.const 0
                local.set 9
                i32.const 0
                local.set 10
                loop  ;; label = @7
                  local.get 9
                  i32.const 1
                  i32.or
                  local.tee 11
                  local.get 10
                  local.get 0
                  local.get 0
                  local.get 4
                  call_indirect (type 0)
                  i32.const 0
                  i32.lt_s
                  select
                  local.set 8
                  block  ;; label = @8
                    local.get 11
                    local.get 7
                    i32.ge_u
                    br_if 0 (;@8;)
                    local.get 9
                    i32.const 2
                    i32.add
                    local.get 8
                    local.get 0
                    local.get 0
                    local.get 4
                    call_indirect (type 0)
                    i32.const 0
                    i32.lt_s
                    select
                    local.set 8
                  end
                  block  ;; label = @8
                    local.get 8
                    local.get 10
                    i32.eq
                    br_if 0 (;@8;)
                    local.get 8
                    local.set 10
                    local.get 8
                    i32.const 1
                    i32.shl
                    local.tee 9
                    local.get 7
                    i32.lt_u
                    br_if 1 (;@7;)
                  end
                end
                local.get 7
                i32.const -1
                i32.add
                local.tee 7
                i32.eqz
                br_if 5 (;@1;)
                br 0 (;@6;)
              end
            end
            local.get 0
            local.get 1
            i32.const -1
            i32.add
            local.get 2
            i32.mul
            local.tee 12
            i32.add
            local.set 13
            local.get 0
            local.get 1
            i32.const 1
            i32.shr_u
            local.tee 14
            local.get 2
            i32.mul
            local.tee 15
            i32.add
            local.tee 6
            local.get 0
            local.get 4
            call_indirect (type 0)
            local.set 8
            block  ;; label = @5
              local.get 15
              i32.eqz
              br_if 0 (;@5;)
              local.get 8
              i32.const -1
              i32.gt_s
              br_if 0 (;@5;)
              local.get 2
              local.set 10
              local.get 6
              local.set 9
              local.get 0
              local.set 7
              local.get 2
              i32.eqz
              br_if 0 (;@5;)
              loop  ;; label = @6
                block  ;; label = @7
                  local.get 10
                  i32.const 128
                  local.get 10
                  i32.const 128
                  i32.lt_u
                  select
                  local.tee 8
                  i32.eqz
                  local.tee 11
                  br_if 0 (;@7;)
                  local.get 5
                  local.get 9
                  local.get 8
                  memory.copy
                end
                block  ;; label = @7
                  local.get 11
                  br_if 0 (;@7;)
                  local.get 9
                  local.get 7
                  local.get 8
                  memory.copy
                end
                block  ;; label = @7
                  local.get 11
                  br_if 0 (;@7;)
                  local.get 7
                  local.get 5
                  local.get 8
                  memory.copy
                end
                local.get 7
                local.get 8
                i32.add
                local.set 7
                local.get 9
                local.get 8
                i32.add
                local.set 9
                local.get 10
                local.get 8
                i32.sub
                local.tee 10
                br_if 0 (;@6;)
              end
            end
            block  ;; label = @5
              local.get 13
              local.get 6
              local.get 4
              call_indirect (type 0)
              i32.const -1
              i32.gt_s
              br_if 0 (;@5;)
              block  ;; label = @6
                local.get 15
                local.get 12
                i32.eq
                br_if 0 (;@6;)
                local.get 2
                local.set 10
                local.get 6
                local.set 9
                local.get 2
                i32.eqz
                br_if 0 (;@6;)
                loop  ;; label = @7
                  block  ;; label = @8
                    local.get 10
                    i32.const 128
                    local.get 10
                    i32.const 128
                    i32.lt_u
                    select
                    local.tee 8
                    i32.eqz
                    local.tee 7
                    br_if 0 (;@8;)
                    local.get 5
                    local.get 9
                    local.get 8
                    memory.copy
                  end
                  block  ;; label = @8
                    local.get 7
                    br_if 0 (;@8;)
                    local.get 9
                    local.get 13
                    local.get 8
                    memory.copy
                  end
                  block  ;; label = @8
                    local.get 7
                    br_if 0 (;@8;)
                    local.get 13
                    local.get 5
                    local.get 8
                    memory.copy
                  end
                  local.get 13
                  local.get 8
                  i32.add
                  local.set 13
                  local.get 9
                  local.get 8
                  i32.add
                  local.set 9
                  local.get 10
                  local.get 8
                  i32.sub
                  local.tee 10
                  br_if 0 (;@7;)
                end
              end
              local.get 6
              local.get 0
              local.get 4
              call_indirect (type 0)
              local.set 8
              local.get 15
              i32.eqz
              br_if 0 (;@5;)
              local.get 8
              i32.const -1
              i32.gt_s
              br_if 0 (;@5;)
              local.get 2
              local.set 10
              local.get 0
              local.set 9
              local.get 2
              i32.eqz
              br_if 0 (;@5;)
              loop  ;; label = @6
                block  ;; label = @7
                  local.get 10
                  i32.const 128
                  local.get 10
                  i32.const 128
                  i32.lt_u
                  select
                  local.tee 8
                  i32.eqz
                  local.tee 7
                  br_if 0 (;@7;)
                  local.get 5
                  local.get 6
                  local.get 8
                  memory.copy
                end
                block  ;; label = @7
                  local.get 7
                  br_if 0 (;@7;)
                  local.get 6
                  local.get 9
                  local.get 8
                  memory.copy
                end
                block  ;; label = @7
                  local.get 7
                  br_if 0 (;@7;)
                  local.get 9
                  local.get 5
                  local.get 8
                  memory.copy
                end
                local.get 9
                local.get 8
                i32.add
                local.set 9
                local.get 6
                local.get 8
                i32.add
                local.set 6
                local.get 10
                local.get 8
                i32.sub
                local.tee 10
                br_if 0 (;@6;)
              end
            end
            local.get 1
            i32.const -2
            i32.add
            local.set 13
            i32.const 1
            local.set 15
            i32.const 1
            local.set 6
            loop  ;; label = @5
              block  ;; label = @6
                block  ;; label = @7
                  block  ;; label = @8
                    block  ;; label = @9
                      local.get 0
                      local.get 6
                      local.get 2
                      i32.mul
                      local.tee 9
                      i32.add
                      local.tee 10
                      local.get 0
                      local.get 14
                      local.get 2
                      i32.mul
                      i32.add
                      local.get 4
                      call_indirect (type 0)
                      local.tee 8
                      i32.const 0
                      i32.gt_s
                      local.get 8
                      i32.const 0
                      i32.lt_s
                      i32.sub
                      i32.const 255
                      i32.and
                      br_table 1 (;@8;) 2 (;@7;) 0 (;@9;)
                    end
                    block  ;; label = @9
                      local.get 15
                      local.get 2
                      i32.mul
                      local.tee 8
                      local.get 9
                      i32.eq
                      br_if 0 (;@9;)
                      local.get 2
                      i32.eqz
                      br_if 0 (;@9;)
                      local.get 0
                      local.get 8
                      i32.add
                      local.set 7
                      local.get 2
                      local.set 9
                      loop  ;; label = @10
                        block  ;; label = @11
                          local.get 9
                          i32.const 128
                          local.get 9
                          i32.const 128
                          i32.lt_u
                          select
                          local.tee 8
                          i32.eqz
                          local.tee 11
                          br_if 0 (;@11;)
                          local.get 5
                          local.get 7
                          local.get 8
                          memory.copy
                        end
                        block  ;; label = @11
                          local.get 11
                          br_if 0 (;@11;)
                          local.get 7
                          local.get 10
                          local.get 8
                          memory.copy
                        end
                        block  ;; label = @11
                          local.get 11
                          br_if 0 (;@11;)
                          local.get 10
                          local.get 5
                          local.get 8
                          memory.copy
                        end
                        local.get 10
                        local.get 8
                        i32.add
                        local.set 10
                        local.get 7
                        local.get 8
                        i32.add
                        local.set 7
                        local.get 9
                        local.get 8
                        i32.sub
                        local.tee 9
                        br_if 0 (;@10;)
                      end
                    end
                    local.get 6
                    local.get 14
                    local.get 15
                    local.get 14
                    i32.eq
                    select
                    local.set 14
                    local.get 6
                    i32.const 1
                    i32.add
                    local.set 6
                    local.get 15
                    i32.const 1
                    i32.add
                    local.set 15
                    br 2 (;@6;)
                  end
                  local.get 6
                  i32.const 1
                  i32.add
                  local.set 6
                  br 1 (;@6;)
                end
                block  ;; label = @7
                  local.get 9
                  local.get 13
                  local.get 2
                  i32.mul
                  local.tee 8
                  i32.eq
                  br_if 0 (;@7;)
                  local.get 2
                  i32.eqz
                  br_if 0 (;@7;)
                  local.get 0
                  local.get 8
                  i32.add
                  local.set 7
                  local.get 2
                  local.set 9
                  loop  ;; label = @8
                    block  ;; label = @9
                      local.get 9
                      i32.const 128
                      local.get 9
                      i32.const 128
                      i32.lt_u
                      select
                      local.tee 8
                      i32.eqz
                      local.tee 11
                      br_if 0 (;@9;)
                      local.get 5
                      local.get 10
                      local.get 8
                      memory.copy
                    end
                    block  ;; label = @9
                      local.get 11
                      br_if 0 (;@9;)
                      local.get 10
                      local.get 7
                      local.get 8
                      memory.copy
                    end
                    block  ;; label = @9
                      local.get 11
                      br_if 0 (;@9;)
                      local.get 7
                      local.get 5
                      local.get 8
                      memory.copy
                    end
                    local.get 7
                    local.get 8
                    i32.add
                    local.set 7
                    local.get 10
                    local.get 8
                    i32.add
                    local.set 10
                    local.get 9
                    local.get 8
                    i32.sub
                    local.tee 9
                    br_if 0 (;@8;)
                  end
                end
                local.get 6
                local.get 14
                local.get 13
                local.get 14
                i32.eq
                select
                local.set 14
                local.get 13
                i32.const -1
                i32.add
                local.set 13
              end
              local.get 6
              local.get 13
              i32.le_u
              br_if 0 (;@5;)
            end
            local.get 3
            i32.const -1
            i32.add
            local.set 3
            local.get 1
            local.get 13
            i32.const 1
            i32.add
            local.tee 8
            i32.sub
            local.set 10
            local.get 0
            local.get 8
            local.get 2
            i32.mul
            i32.add
            local.set 8
            block  ;; label = @5
              block  ;; label = @6
                local.get 15
                local.get 1
                local.get 13
                i32.sub
                i32.ge_u
                br_if 0 (;@6;)
                local.get 0
                local.get 15
                local.get 2
                local.get 3
                local.get 4
                call $_RNvNtNtCsaJZI1b1iR8F_11wasm32_libc3ffi5qsort16introsort_helper
                local.get 10
                local.set 1
                local.get 8
                local.set 0
                br 1 (;@5;)
              end
              local.get 8
              local.get 10
              local.get 2
              local.get 3
              local.get 4
              call $_RNvNtNtCsaJZI1b1iR8F_11wasm32_libc3ffi5qsort16introsort_helper
              local.get 15
              local.set 1
            end
            local.get 1
            i32.const 16
            i32.lt_u
            br_if 2 (;@2;)
            br 0 (;@4;)
          end
        end
        loop  ;; label = @3
          block  ;; label = @4
            local.get 6
            local.get 2
            i32.mul
            local.tee 8
            i32.eqz
            br_if 0 (;@4;)
            local.get 0
            local.get 8
            i32.add
            local.set 9
            local.get 2
            local.set 10
            local.get 0
            local.set 7
            loop  ;; label = @5
              block  ;; label = @6
                local.get 10
                i32.const 128
                local.get 10
                i32.const 128
                i32.lt_u
                select
                local.tee 8
                i32.eqz
                local.tee 11
                br_if 0 (;@6;)
                local.get 5
                local.get 9
                local.get 8
                memory.copy
              end
              block  ;; label = @6
                local.get 11
                br_if 0 (;@6;)
                local.get 9
                local.get 7
                local.get 8
                memory.copy
              end
              block  ;; label = @6
                local.get 11
                br_if 0 (;@6;)
                local.get 7
                local.get 5
                local.get 8
                memory.copy
              end
              local.get 7
              local.get 8
              i32.add
              local.set 7
              local.get 9
              local.get 8
              i32.add
              local.set 9
              local.get 10
              local.get 8
              i32.sub
              local.tee 10
              br_if 0 (;@5;)
            end
          end
          local.get 0
          i32.const 0
          local.get 6
          i32.const -1
          i32.add
          local.tee 6
          local.get 2
          local.get 4
          call $_RNvNtNtCsaJZI1b1iR8F_11wasm32_libc3ffi5qsort14heap_sift_down
          local.get 6
          br_if 0 (;@3;)
          br 2 (;@1;)
        end
      end
      local.get 1
      i32.eqz
      br_if 0 (;@1;)
      block  ;; label = @2
        local.get 2
        i32.eqz
        br_if 0 (;@2;)
        i32.const 0
        local.set 14
        loop  ;; label = @3
          block  ;; label = @4
            local.get 14
            i32.eqz
            br_if 0 (;@4;)
            local.get 14
            local.set 6
            loop  ;; label = @5
              local.get 6
              local.get 2
              i32.mul
              local.set 8
              local.get 0
              local.get 6
              i32.const -1
              i32.add
              local.tee 6
              local.get 2
              i32.mul
              local.tee 10
              i32.add
              local.tee 9
              local.get 0
              local.get 8
              i32.add
              local.tee 7
              local.get 4
              call_indirect (type 0)
              i32.const 0
              i32.le_s
              br_if 1 (;@4;)
              block  ;; label = @6
                local.get 10
                local.get 8
                i32.eq
                br_if 0 (;@6;)
                local.get 2
                local.set 10
                loop  ;; label = @7
                  block  ;; label = @8
                    local.get 10
                    i32.const 128
                    local.get 10
                    i32.const 128
                    i32.lt_u
                    select
                    local.tee 8
                    i32.eqz
                    local.tee 11
                    br_if 0 (;@8;)
                    local.get 5
                    local.get 9
                    local.get 8
                    memory.copy
                  end
                  block  ;; label = @8
                    local.get 11
                    br_if 0 (;@8;)
                    local.get 9
                    local.get 7
                    local.get 8
                    memory.copy
                  end
                  block  ;; label = @8
                    local.get 11
                    br_if 0 (;@8;)
                    local.get 7
                    local.get 5
                    local.get 8
                    memory.copy
                  end
                  local.get 7
                  local.get 8
                  i32.add
                  local.set 7
                  local.get 9
                  local.get 8
                  i32.add
                  local.set 9
                  local.get 10
                  local.get 8
                  i32.sub
                  local.tee 10
                  br_if 0 (;@7;)
                end
              end
              local.get 6
              br_if 0 (;@5;)
            end
          end
          local.get 14
          i32.const 1
          i32.add
          local.tee 14
          local.get 1
          i32.ne
          br_if 0 (;@3;)
          br 2 (;@1;)
        end
      end
      i32.const 0
      local.set 9
      block  ;; label = @2
        local.get 1
        i32.const 1
        i32.eq
        br_if 0 (;@2;)
        local.get 1
        i32.const 1
        i32.and
        local.set 6
        local.get 1
        i32.const -2
        i32.and
        local.set 2
        i32.const 0
        local.set 7
        i32.const 1
        local.set 11
        i32.const 0
        local.set 9
        loop  ;; label = @3
          local.get 11
          local.set 10
          block  ;; label = @4
            local.get 9
            i32.eqz
            br_if 0 (;@4;)
            loop  ;; label = @5
              local.get 10
              local.set 8
              local.get 0
              local.get 0
              local.get 4
              call_indirect (type 0)
              i32.const 1
              i32.lt_s
              br_if 1 (;@4;)
              local.get 8
              i32.const 1
              i32.add
              local.set 10
              local.get 8
              br_if 0 (;@5;)
            end
          end
          local.get 9
          i32.const 2
          i32.add
          local.set 9
          local.get 7
          local.set 10
          block  ;; label = @4
            loop  ;; label = @5
              local.get 10
              local.set 8
              local.get 0
              local.get 0
              local.get 4
              call_indirect (type 0)
              i32.const 1
              i32.lt_s
              br_if 1 (;@4;)
              local.get 8
              i32.const 1
              i32.add
              local.set 10
              local.get 8
              br_if 0 (;@5;)
            end
          end
          local.get 7
          i32.const -2
          i32.add
          local.set 7
          local.get 11
          i32.const -2
          i32.add
          local.set 11
          local.get 9
          local.get 2
          i32.ne
          br_if 0 (;@3;)
        end
        local.get 6
        i32.eqz
        br_if 1 (;@1;)
      end
      local.get 9
      i32.eqz
      br_if 0 (;@1;)
      local.get 9
      i32.const -1
      i32.add
      local.set 10
      loop  ;; label = @2
        local.get 10
        local.set 8
        local.get 0
        local.get 0
        local.get 4
        call_indirect (type 0)
        i32.const 1
        i32.lt_s
        br_if 1 (;@1;)
        local.get 8
        i32.const -1
        i32.add
        local.set 10
        local.get 8
        br_if 0 (;@2;)
      end
    end
    local.get 5
    i32.const 128
    i32.add
    global.set $__stack_pointer)
  (func $_RNvXs9_NtNtCs7RAXWwMZhcx_4core3str5errorNtB5_9Utf8ErrorNtNtB9_3fmt5Debug3fmt (type 0) (param i32 i32) (result i32)
    (local i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    local.get 2
    local.get 0
    i32.const 4
    i32.add
    i32.store offset=12
    local.get 1
    i32.const 1050012
    i32.const 9
    i32.const 1050021
    i32.const 11
    local.get 0
    i32.const 1049980
    i32.const 1050032
    i32.const 9
    local.get 2
    i32.const 12
    i32.add
    i32.const 1049996
    call $_RNvMsa_NtCs7RAXWwMZhcx_4core3fmtNtB5_9Formatter26debug_struct_field2_finish
    local.set 0
    local.get 2
    i32.const 16
    i32.add
    global.set $__stack_pointer
    local.get 0)
  (func $_RNvXsZ_NtNtCs7RAXWwMZhcx_4core3fmt3numjNtB7_5Debug3fmt (type 0) (param i32 i32) (result i32)
    (local i32)
    block  ;; label = @1
      local.get 1
      i32.load offset=8
      local.tee 2
      i32.const 33554432
      i32.and
      br_if 0 (;@1;)
      block  ;; label = @2
        local.get 2
        i32.const 67108864
        i32.and
        br_if 0 (;@2;)
        local.get 0
        local.get 1
        call $_RNvXs8_NtNtNtCs7RAXWwMZhcx_4core3fmt3num3impmNtB9_7Display3fmt
        return
      end
      local.get 0
      local.get 1
      call $_RNvXs8_NtNtCs7RAXWwMZhcx_4core3fmt3numjNtB7_8UpperHex3fmt
      return
    end
    local.get 0
    local.get 1
    call $_RNvXs6_NtNtCs7RAXWwMZhcx_4core3fmt3numjNtB7_8LowerHex3fmt)
  (func $_RNvXsq_NtCslUrat6hAxmK_5alloc6stringNtB5_6StringNtNtCs7RAXWwMZhcx_4core3fmt7Display3fmt (type 0) (param i32 i32) (result i32)
    local.get 0
    i32.load offset=4
    local.get 0
    i32.load offset=8
    local.get 1
    call $_RNvXsi_NtCs7RAXWwMZhcx_4core3fmteNtB5_7Display3fmt)
  (func $__assert_fail (type 10) (param i32 i32 i32 i32)
    (local i32 i64)
    global.get $__stack_pointer
    i32.const 64
    i32.sub
    local.tee 4
    global.set $__stack_pointer
    local.get 4
    local.get 2
    i32.store offset=4
    i32.const 1
    local.set 2
    block  ;; label = @1
      local.get 0
      i32.load8_u
      i32.eqz
      br_if 0 (;@1;)
      local.get 0
      i32.const 1
      i32.add
      call $strlen
      i32.const 2
      i32.add
      local.set 2
    end
    local.get 4
    i32.const 24
    i32.add
    local.get 0
    local.get 2
    call $_RNvMs3_NtNtCs7RAXWwMZhcx_4core3ffi5c_strNtB5_4CStr6to_str
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          local.get 4
          i32.load offset=24
          i32.const 1
          i32.eq
          br_if 0 (;@3;)
          local.get 4
          local.get 4
          i64.load offset=28 align=4
          i64.store offset=8 align=4
          i32.const 1
          local.set 0
          block  ;; label = @4
            local.get 1
            i32.load8_u
            i32.eqz
            br_if 0 (;@4;)
            local.get 1
            i32.const 1
            i32.add
            call $strlen
            i32.const 2
            i32.add
            local.set 0
          end
          local.get 4
          i32.const 24
          i32.add
          local.get 1
          local.get 0
          call $_RNvMs3_NtNtCs7RAXWwMZhcx_4core3ffi5c_strNtB5_4CStr6to_str
          local.get 4
          i32.load offset=24
          i32.const 1
          i32.eq
          br_if 1 (;@2;)
          local.get 4
          local.get 4
          i64.load offset=28 align=4
          i64.store offset=16 align=4
          i32.const 1
          local.set 0
          block  ;; label = @4
            local.get 3
            i32.load8_u
            i32.eqz
            br_if 0 (;@4;)
            local.get 3
            i32.const 1
            i32.add
            call $strlen
            i32.const 2
            i32.add
            local.set 0
          end
          local.get 4
          i32.const 24
          i32.add
          local.get 3
          local.get 0
          call $_RNvMs3_NtNtCs7RAXWwMZhcx_4core3ffi5c_strNtB5_4CStr6to_str
          local.get 4
          i32.load offset=24
          i32.const 1
          i32.eq
          br_if 2 (;@1;)
          local.get 4
          local.get 4
          i64.load offset=28 align=4
          i64.store offset=56 align=4
          local.get 4
          i32.const 1
          i64.extend_i32_u
          i64.const 32
          i64.shl
          local.get 4
          i32.const 4
          i32.add
          i64.extend_i32_u
          i64.or
          i64.store offset=48
          local.get 4
          i32.const 2
          i64.extend_i32_u
          i64.const 32
          i64.shl
          local.tee 5
          local.get 4
          i32.const 56
          i32.add
          i64.extend_i32_u
          i64.or
          i64.store offset=40
          local.get 4
          local.get 5
          local.get 4
          i32.const 16
          i32.add
          i64.extend_i32_u
          i64.or
          i64.store offset=32
          local.get 4
          local.get 5
          local.get 4
          i32.const 8
          i32.add
          i64.extend_i32_u
          i64.or
          i64.store offset=24
          i32.const 1049924
          local.get 4
          i32.const 24
          i32.add
          call $_RNvNtNtCseKMvW2SdwUu_3std2io5stdio7__eprint
          unreachable
        end
        local.get 4
        local.get 4
        i64.load offset=28 align=4
        i64.store offset=56
        i32.const 1050060
        i32.const 43
        local.get 4
        i32.const 56
        i32.add
        i32.const 1050044
        i32.const 1050136
        call $_RNvNtCs7RAXWwMZhcx_4core6result13unwrap_failed
        unreachable
      end
      local.get 4
      local.get 4
      i64.load offset=28 align=4
      i64.store offset=56
      i32.const 1050060
      i32.const 43
      local.get 4
      i32.const 56
      i32.add
      i32.const 1050044
      i32.const 1050120
      call $_RNvNtCs7RAXWwMZhcx_4core6result13unwrap_failed
      unreachable
    end
    local.get 4
    local.get 4
    i64.load offset=28 align=4
    i64.store offset=56
    i32.const 1050060
    i32.const 43
    local.get 4
    i32.const 56
    i32.add
    i32.const 1050044
    i32.const 1050104
    call $_RNvNtCs7RAXWwMZhcx_4core6result13unwrap_failed
    unreachable)
  (func $__errno_location (type 5) (result i32)
    i32.const 1048576)
  (func $abort (type 4)
    (local i32)
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          i32.const 0
          i32.load offset=1053132
          local.tee 0
          br_table 0 (;@3;) 2 (;@1;) 1 (;@2;)
        end
        i32.const 1048580
        i32.const 15
        i32.const 1049964
        call $_RNvNtCs7RAXWwMZhcx_4core9panicking9panic_fmt
        unreachable
      end
      i32.const 6
      local.get 0
      call_indirect (type 1)
    end)
  (func $getenv (type 11) (param i32) (result i32)
    (local i32 i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 1
    global.set $__stack_pointer
    i32.const 1
    local.set 2
    block  ;; label = @1
      local.get 0
      i32.load8_u
      i32.eqz
      br_if 0 (;@1;)
      local.get 0
      i32.const 1
      i32.add
      call $strlen
      i32.const 2
      i32.add
      local.set 2
    end
    local.get 1
    i32.const 12
    i32.add
    local.get 0
    local.get 2
    call $_RNvMs3_NtNtCs7RAXWwMZhcx_4core3ffi5c_strNtB5_4CStr6to_str
    block  ;; label = @1
      local.get 1
      i32.load offset=12
      i32.const 1
      i32.ne
      br_if 0 (;@1;)
      local.get 1
      local.get 1
      i64.load offset=16 align=4
      i64.store offset=24
      i32.const 1050060
      i32.const 43
      local.get 1
      i32.const 24
      i32.add
      i32.const 1050044
      i32.const 1050152
      call $_RNvNtCs7RAXWwMZhcx_4core6result13unwrap_failed
      unreachable
    end
    local.get 1
    i32.const 32
    i32.add
    global.set $__stack_pointer
    i32.const 0)
  (func $puts (type 11) (param i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 1
    global.set $__stack_pointer
    i32.const 0
    local.set 2
    local.get 1
    i32.const 0
    i32.store offset=20
    local.get 1
    i64.const 4294967296
    i64.store offset=12 align=4
    i32.const 0
    local.set 3
    block  ;; label = @1
      block  ;; label = @2
        local.get 0
        i32.load8_u
        local.tee 4
        i32.eqz
        br_if 0 (;@2;)
        local.get 0
        i32.const 1
        i32.add
        local.set 0
        i32.const 0
        local.set 2
        i32.const 1
        local.set 5
        loop  ;; label = @3
          local.get 2
          local.set 3
          block  ;; label = @4
            i32.const 1
            i32.const 2
            local.get 4
            i32.extend8_s
            i32.const -1
            i32.gt_s
            local.tee 6
            select
            local.tee 7
            local.get 1
            i32.load offset=12
            local.get 2
            i32.sub
            i32.le_u
            br_if 0 (;@4;)
            local.get 1
            i32.const 12
            i32.add
            local.get 2
            local.get 7
            i32.const 1
            i32.const 1
            call $_RINvNvMs2_NtCslUrat6hAxmK_5alloc7raw_vecINtB8_11RawVecInnerpE7reserve21do_reserve_and_handleNtNtBa_5alloc6GlobalECsaJZI1b1iR8F_11wasm32_libc
            local.get 1
            i32.load offset=20
            local.set 3
            local.get 1
            i32.load offset=16
            local.set 5
          end
          local.get 5
          local.get 3
          i32.add
          local.set 3
          block  ;; label = @4
            local.get 6
            br_if 0 (;@4;)
            local.get 3
            local.get 4
            i32.const 191
            i32.and
            i32.store8 offset=1
            local.get 4
            i32.const 192
            i32.and
            i32.const 6
            i32.shr_u
            i32.const -64
            i32.or
            local.set 4
          end
          local.get 3
          local.get 4
          i32.store8
          local.get 1
          local.get 7
          local.get 2
          i32.add
          local.tee 2
          i32.store offset=20
          local.get 0
          i32.load8_u
          local.set 4
          local.get 0
          i32.const 1
          i32.add
          local.set 0
          local.get 4
          br_if 0 (;@3;)
        end
        local.get 2
        local.set 4
        local.get 1
        i32.load offset=12
        local.tee 3
        local.get 2
        i32.ne
        br_if 1 (;@1;)
      end
      local.get 1
      i32.const 12
      i32.add
      local.get 3
      i32.const 1
      i32.const 1
      i32.const 1
      call $_RINvNvMs2_NtCslUrat6hAxmK_5alloc7raw_vecINtB8_11RawVecInnerpE7reserve21do_reserve_and_handleNtNtBa_5alloc6GlobalECsaJZI1b1iR8F_11wasm32_libc
      local.get 1
      i32.load offset=20
      local.set 4
    end
    local.get 1
    i32.load offset=16
    local.get 4
    i32.add
    i32.const 10
    i32.store8
    local.get 1
    local.get 2
    i32.const 1
    i32.add
    i32.store offset=20
    local.get 1
    i32.const 3
    i64.extend_i32_u
    i64.const 32
    i64.shl
    local.get 1
    i32.const 12
    i32.add
    i64.extend_i32_u
    i64.or
    i64.store offset=24
    i32.const 1049959
    local.get 1
    i32.const 24
    i32.add
    call $_RNvNtNtCseKMvW2SdwUu_3std2io5stdio6__print
    block  ;; label = @1
      local.get 1
      i32.load offset=12
      local.tee 4
      i32.eqz
      br_if 0 (;@1;)
      local.get 1
      i32.load offset=16
      local.get 4
      i32.const 1
      call $_RNvCsfFJ77F7ERra_7___rustc14___rust_dealloc
    end
    local.get 1
    i32.const 32
    i32.add
    global.set $__stack_pointer
    i32.const 0)
  (func $qsort (type 10) (param i32 i32 i32 i32)
    block  ;; label = @1
      local.get 1
      i32.eqz
      br_if 0 (;@1;)
      local.get 3
      i32.eqz
      br_if 0 (;@1;)
      local.get 0
      local.get 1
      local.get 2
      local.get 1
      i32.clz
      i32.const 1
      i32.shl
      i32.const 62
      i32.xor
      local.get 3
      call $_RNvNtNtCsaJZI1b1iR8F_11wasm32_libc3ffi5qsort16introsort_helper
    end)
  (func $raise (type 11) (param i32) (result i32)
    (local i32 i32)
    i32.const -1
    local.set 1
    block  ;; label = @1
      local.get 0
      i32.const 15
      i32.gt_u
      br_if 0 (;@1;)
      i32.const 1
      local.get 0
      i32.shl
      i32.const 35156
      i32.and
      i32.eqz
      br_if 0 (;@1;)
      i32.const 0
      local.set 1
      block  ;; label = @2
        block  ;; label = @3
          local.get 0
          i32.const 2
          i32.shl
          i32.load offset=1053108
          local.tee 2
          br_table 0 (;@3;) 2 (;@1;) 1 (;@2;)
        end
        i32.const 1048580
        i32.const 15
        i32.const 1049964
        call $_RNvNtCs7RAXWwMZhcx_4core9panicking9panic_fmt
        unreachable
      end
      local.get 0
      local.get 2
      call_indirect (type 1)
    end
    local.get 1)
  (func $signal (type 0) (param i32 i32) (result i32)
    (local i32)
    i32.const -1
    local.set 2
    block  ;; label = @1
      local.get 0
      i32.const 15
      i32.gt_u
      br_if 0 (;@1;)
      i32.const 1
      local.get 0
      i32.shl
      i32.const 35156
      i32.and
      i32.eqz
      br_if 0 (;@1;)
      local.get 0
      i32.const 2
      i32.shl
      local.tee 0
      i32.load offset=1053108
      local.set 2
      local.get 0
      local.get 1
      i32.store offset=1053108
    end
    local.get 2)
  (func $_RNvNtNtCsaJZI1b1iR8F_11wasm32_libc3ffi6strtol6strtox (type 12) (param i32 i32 i32 i64 i64) (result i64)
    (local i64 i32 i32 i64 i32 i32 i64 i64)
    i64.const 0
    local.set 5
    block  ;; label = @1
      block  ;; label = @2
        local.get 2
        i32.const 36
        i32.gt_u
        br_if 0 (;@2;)
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              block  ;; label = @6
                block  ;; label = @7
                  block  ;; label = @8
                    loop  ;; label = @9
                      block  ;; label = @10
                        local.get 0
                        i32.load8_u
                        local.tee 6
                        i32.const -9
                        i32.add
                        i32.const 5
                        i32.lt_u
                        br_if 0 (;@10;)
                        local.get 6
                        i32.const -32
                        i32.add
                        br_table 0 (;@10;) 3 (;@7;) 3 (;@7;) 3 (;@7;) 3 (;@7;) 3 (;@7;) 3 (;@7;) 3 (;@7;) 3 (;@7;) 3 (;@7;) 3 (;@7;) 2 (;@8;) 3 (;@7;) 4 (;@6;) 3 (;@7;)
                      end
                      local.get 0
                      i32.const 1
                      i32.add
                      local.set 0
                      br 0 (;@9;)
                    end
                  end
                  local.get 0
                  i32.const 1
                  i32.add
                  local.set 0
                end
                i32.const 0
                local.set 7
                local.get 2
                i32.eqz
                br_if 1 (;@5;)
                br 2 (;@4;)
              end
              i32.const 1
              local.set 7
              local.get 0
              i32.const 1
              i32.add
              local.set 0
              local.get 2
              br_if 1 (;@4;)
            end
            block  ;; label = @5
              local.get 0
              i32.load8_u
              i32.const 48
              i32.eq
              br_if 0 (;@5;)
              i64.const 10
              local.set 8
              br 2 (;@3;)
            end
            local.get 0
            i32.const 1
            i32.add
            local.set 6
            block  ;; label = @5
              local.get 0
              i32.load8_u offset=1
              i32.const 32
              i32.or
              i32.const 120
              i32.eq
              br_if 0 (;@5;)
              i64.const 8
              local.set 8
              local.get 6
              local.set 0
              br 2 (;@3;)
            end
            local.get 0
            i32.const 2
            i32.add
            local.get 6
            local.get 0
            i32.load8_u offset=2
            local.tee 0
            i32.const -48
            i32.add
            i32.const 255
            i32.and
            i32.const 10
            i32.lt_u
            local.get 0
            i32.const 223
            i32.and
            i32.const -65
            i32.add
            i32.const 255
            i32.and
            i32.const 6
            i32.lt_u
            i32.or
            local.tee 2
            select
            local.set 0
            i64.const 16
            i64.const 8
            local.get 2
            select
            local.set 8
            br 1 (;@3;)
          end
          block  ;; label = @4
            local.get 2
            i32.const 16
            i32.eq
            br_if 0 (;@4;)
            local.get 2
            i64.extend_i32_u
            local.set 8
            br 1 (;@3;)
          end
          i64.const 16
          local.set 8
          local.get 0
          i32.load8_u
          i32.const 48
          i32.ne
          br_if 0 (;@3;)
          local.get 0
          i32.load8_u offset=1
          i32.const 32
          i32.or
          i32.const 120
          i32.ne
          br_if 0 (;@3;)
          local.get 0
          i32.const 2
          i32.add
          local.tee 6
          local.get 6
          local.get 0
          local.get 0
          i32.load8_u offset=2
          local.tee 2
          i32.const 223
          i32.and
          i32.const -65
          i32.add
          i32.const 255
          i32.and
          i32.const 6
          i32.lt_u
          select
          local.get 2
          i32.const -48
          i32.add
          i32.const 255
          i32.and
          i32.const 10
          i32.lt_u
          select
          local.set 0
        end
        i64.const 0
        local.set 5
        block  ;; label = @3
          block  ;; label = @4
            local.get 3
            i64.const 0
            i64.ne
            local.get 7
            i32.and
            local.tee 9
            br_if 0 (;@4;)
            i32.const 0
            local.set 6
            loop  ;; label = @5
              block  ;; label = @6
                local.get 0
                i32.load8_u
                local.tee 10
                i32.const -48
                i32.add
                local.tee 2
                i32.const 255
                i32.and
                i32.const 10
                i32.lt_u
                br_if 0 (;@6;)
                block  ;; label = @7
                  local.get 10
                  i32.const -97
                  i32.add
                  i32.const 255
                  i32.and
                  i32.const 26
                  i32.lt_u
                  br_if 0 (;@7;)
                  local.get 10
                  i32.const -65
                  i32.add
                  i32.const 255
                  i32.and
                  i32.const 26
                  i32.ge_u
                  br_if 4 (;@3;)
                  local.get 10
                  i32.const -55
                  i32.add
                  local.set 2
                  br 1 (;@6;)
                end
                local.get 10
                i32.const -87
                i32.add
                local.set 2
              end
              local.get 8
              local.get 2
              i64.extend_i32_u
              i64.const 255
              i64.and
              local.tee 11
              i64.le_u
              br_if 2 (;@3;)
              local.get 5
              local.get 8
              i64.mul
              local.tee 12
              local.get 4
              local.get 11
              i64.sub
              i64.gt_u
              local.get 5
              local.get 4
              local.get 8
              i64.div_u
              i64.gt_u
              i32.or
              local.get 6
              i32.or
              local.set 6
              local.get 0
              i32.const 1
              i32.add
              local.set 0
              local.get 12
              local.get 11
              i64.add
              local.set 5
              br 0 (;@5;)
            end
          end
          i64.const 0
          local.set 5
          i32.const 0
          local.set 6
          loop  ;; label = @4
            block  ;; label = @5
              local.get 0
              i32.load8_u
              local.tee 10
              i32.const -48
              i32.add
              local.tee 2
              i32.const 255
              i32.and
              i32.const 10
              i32.lt_u
              br_if 0 (;@5;)
              block  ;; label = @6
                local.get 10
                i32.const -97
                i32.add
                i32.const 255
                i32.and
                i32.const 26
                i32.lt_u
                br_if 0 (;@6;)
                local.get 10
                i32.const -65
                i32.add
                i32.const 255
                i32.and
                i32.const 25
                i32.gt_u
                br_if 3 (;@3;)
                local.get 10
                i32.const -55
                i32.add
                local.set 2
                br 1 (;@5;)
              end
              local.get 10
              i32.const -87
              i32.add
              local.set 2
            end
            local.get 8
            local.get 2
            i64.extend_i32_u
            i64.const 255
            i64.and
            local.tee 11
            i64.le_u
            br_if 1 (;@3;)
            local.get 5
            local.get 8
            i64.mul
            local.tee 12
            local.get 3
            local.get 11
            i64.add
            i64.lt_s
            local.get 5
            local.get 3
            local.get 8
            i64.div_s
            i64.lt_s
            i32.or
            local.get 6
            i32.or
            local.set 6
            local.get 0
            i32.const 1
            i32.add
            local.set 0
            local.get 12
            local.get 11
            i64.sub
            local.set 5
            br 0 (;@4;)
          end
        end
        block  ;; label = @3
          local.get 1
          i32.eqz
          br_if 0 (;@3;)
          local.get 1
          local.get 0
          i32.store
        end
        local.get 6
        i32.const 1
        i32.and
        br_if 1 (;@1;)
        i64.const 0
        local.get 5
        i64.sub
        local.get 5
        local.get 7
        select
        local.get 5
        local.get 3
        i64.eqz
        select
        local.set 5
      end
      local.get 5
      return
    end
    local.get 3
    local.get 4
    local.get 9
    select)
  (func $_RNvXs1g_NtCs7RAXWwMZhcx_4core3fmtRINtNtB8_6option6OptionhENtB6_5Debug3fmtCsaJZI1b1iR8F_11wasm32_libc (type 0) (param i32 i32) (result i32)
    (local i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    block  ;; label = @1
      block  ;; label = @2
        local.get 0
        i32.load
        local.tee 0
        i32.load8_u
        i32.const 1
        i32.ne
        br_if 0 (;@2;)
        local.get 2
        local.get 0
        i32.const 1
        i32.add
        i32.store offset=12
        local.get 1
        i32.const 1050188
        i32.const 4
        local.get 2
        i32.const 12
        i32.add
        i32.const 1050172
        call $_RNvMsa_NtCs7RAXWwMZhcx_4core3fmtNtB5_9Formatter25debug_tuple_field1_finish
        local.set 0
        br 1 (;@1;)
      end
      local.get 1
      i32.const 1050168
      i32.const 4
      call $_RNvMsa_NtCs7RAXWwMZhcx_4core3fmtNtB5_9Formatter9write_str
      local.set 0
    end
    local.get 2
    i32.const 16
    i32.add
    global.set $__stack_pointer
    local.get 0)
  (func $_RNvXs1g_NtCs7RAXWwMZhcx_4core3fmtRhNtB6_5Debug3fmtCsaJZI1b1iR8F_11wasm32_libc (type 0) (param i32 i32) (result i32)
    (local i32)
    local.get 0
    i32.load
    local.set 0
    block  ;; label = @1
      local.get 1
      i32.load offset=8
      local.tee 2
      i32.const 33554432
      i32.and
      br_if 0 (;@1;)
      block  ;; label = @2
        local.get 2
        i32.const 67108864
        i32.and
        br_if 0 (;@2;)
        local.get 0
        local.get 1
        call $_RNvXNtNtNtCs7RAXWwMZhcx_4core3fmt3num3imphNtB6_7Display3fmt
        return
      end
      local.get 0
      local.get 1
      call $_RNvXsg_NtNtCs7RAXWwMZhcx_4core3fmt3numhNtB7_8UpperHex3fmt
      return
    end
    local.get 0
    local.get 1
    call $_RNvXse_NtNtCs7RAXWwMZhcx_4core3fmt3numhNtB7_8LowerHex3fmt)
  (func $_RNvXs1i_NtCs7RAXWwMZhcx_4core3fmtReNtB6_7Display3fmtCsaJZI1b1iR8F_11wasm32_libc (type 0) (param i32 i32) (result i32)
    local.get 0
    i32.load
    local.get 0
    i32.load offset=4
    local.get 1
    call $_RNvXsi_NtCs7RAXWwMZhcx_4core3fmteNtB5_7Display3fmt)
  (func $_RNvXsd_NtNtCs7RAXWwMZhcx_4core5alloc6layoutNtB5_11LayoutErrorNtNtB9_3fmt5Debug3fmt (type 0) (param i32 i32) (result i32)
    local.get 1
    i32.const 1050192
    i32.const 11
    call $_RNvMsa_NtCs7RAXWwMZhcx_4core3fmtNtB5_9Formatter9write_str)
  (func $abs (type 11) (param i32) (result i32)
    (local i32)
    local.get 0
    local.get 0
    i32.const 31
    i32.shr_s
    local.tee 1
    i32.xor
    local.get 1
    i32.sub)
  (func $atoi (type 11) (param i32) (result i32)
    local.get 0
    i32.const 0
    i32.const 10
    i64.const -2147483648
    i64.const 2147483647
    call $_RNvNtNtCsaJZI1b1iR8F_11wasm32_libc3ffi6strtol6strtox
    i32.wrap_i64)
  (func $calloc (type 0) (param i32 i32) (result i32)
    (local i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    block  ;; label = @1
      local.get 1
      local.get 0
      i32.mul
      local.tee 1
      i32.const 16
      i32.add
      local.tee 0
      i32.const 2147483633
      i32.ge_u
      br_if 0 (;@1;)
      call $_RNvCsfFJ77F7ERra_7___rustc35___rust_no_alloc_shim_is_unstable_v2
      block  ;; label = @2
        block  ;; label = @3
          local.get 0
          i32.const 16
          call $_RNvCsfFJ77F7ERra_7___rustc19___rust_alloc_zeroed
          local.tee 0
          br_if 0 (;@3;)
          i32.const 0
          local.set 0
          br 1 (;@2;)
        end
        local.get 0
        local.get 1
        i32.store
        local.get 0
        i32.const 16
        i32.add
        local.set 0
      end
      local.get 2
      i32.const 16
      i32.add
      global.set $__stack_pointer
      local.get 0
      return
    end
    i32.const 1050220
    i32.const 43
    local.get 2
    i32.const 15
    i32.add
    i32.const 1050204
    i32.const 1050264
    call $_RNvNtCs7RAXWwMZhcx_4core6result13unwrap_failed
    unreachable)
  (func $free (type 1) (param i32)
    (local i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 1
    global.set $__stack_pointer
    block  ;; label = @1
      block  ;; label = @2
        local.get 0
        i32.eqz
        br_if 0 (;@2;)
        local.get 0
        i32.const -16
        i32.add
        local.tee 0
        i32.load
        i32.const 16
        i32.add
        local.tee 2
        i32.const 2147483633
        i32.ge_u
        br_if 1 (;@1;)
        local.get 0
        local.get 2
        i32.const 16
        call $_RNvCsfFJ77F7ERra_7___rustc14___rust_dealloc
      end
      local.get 1
      i32.const 16
      i32.add
      global.set $__stack_pointer
      return
    end
    i32.const 1050220
    i32.const 43
    local.get 1
    i32.const 15
    i32.add
    i32.const 1050204
    i32.const 1050280
    call $_RNvNtCs7RAXWwMZhcx_4core6result13unwrap_failed
    unreachable)
  (func $isalpha (type 11) (param i32) (result i32)
    block  ;; label = @1
      local.get 0
      i32.const -65
      i32.add
      i32.const 255
      i32.and
      i32.const 26
      i32.ge_u
      br_if 0 (;@1;)
      i32.const 1
      return
    end
    block  ;; label = @1
      local.get 0
      i32.const 255
      i32.and
      i32.const 97
      i32.ge_u
      br_if 0 (;@1;)
      i32.const 0
      return
    end
    local.get 0
    i32.const 255
    i32.and
    i32.const 123
    i32.lt_u)
  (func $isdigit (type 11) (param i32) (result i32)
    local.get 0
    i32.const -48
    i32.add
    i32.const 255
    i32.and
    i32.const 10
    i32.lt_u)
  (func $isspace (type 11) (param i32) (result i32)
    (local i32)
    block  ;; label = @1
      block  ;; label = @2
        local.get 0
        i32.const 255
        i32.and
        local.tee 1
        i32.const -9
        i32.add
        i32.const 5
        i32.lt_u
        br_if 0 (;@2;)
        i32.const 0
        local.set 0
        local.get 1
        i32.const 32
        i32.ne
        br_if 1 (;@1;)
      end
      i32.const 1
      local.set 0
    end
    local.get 0)
  (func $isupper (type 11) (param i32) (result i32)
    local.get 0
    i32.const -65
    i32.add
    i32.const 255
    i32.and
    i32.const 26
    i32.lt_u)
  (func $itoa (type 13) (param i64 i32 i32 i32) (result i32)
    (local i64 i64 i32 i64 i32 i32 i32 i32 i32 i32 i32 i32)
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              block  ;; label = @6
                block  ;; label = @7
                  block  ;; label = @8
                    block  ;; label = @9
                      local.get 0
                      i64.const -1
                      i64.gt_s
                      br_if 0 (;@9;)
                      local.get 2
                      br_if 1 (;@8;)
                      i32.const -1
                      return
                    end
                    block  ;; label = @9
                      block  ;; label = @10
                        block  ;; label = @11
                          local.get 2
                          br_if 0 (;@11;)
                          local.get 0
                          local.set 4
                          br 1 (;@10;)
                        end
                        local.get 3
                        i32.eqz
                        br_if 3 (;@7;)
                        local.get 3
                        i64.extend_i32_u
                        local.set 5
                        i32.const 0
                        local.set 3
                        loop  ;; label = @11
                          local.get 1
                          local.get 3
                          i32.add
                          local.tee 6
                          local.get 0
                          local.get 0
                          local.get 5
                          i64.div_u
                          local.tee 4
                          local.get 5
                          i64.mul
                          i64.sub
                          local.tee 7
                          i32.wrap_i64
                          local.tee 8
                          i32.const 48
                          i32.or
                          local.get 8
                          i32.const 87
                          i32.add
                          local.get 7
                          i64.const 10
                          i64.lt_u
                          select
                          i32.store8
                          local.get 0
                          local.get 5
                          i64.lt_u
                          br_if 2 (;@9;)
                          local.get 4
                          local.set 0
                          local.get 2
                          local.get 3
                          i32.const 1
                          i32.add
                          local.tee 3
                          i32.ne
                          br_if 0 (;@11;)
                        end
                      end
                      local.get 4
                      i64.eqz
                      br_if 7 (;@2;)
                      i32.const -1
                      return
                    end
                    local.get 3
                    i32.const 1
                    i32.add
                    local.tee 8
                    local.get 2
                    i32.ge_u
                    br_if 5 (;@3;)
                    local.get 6
                    i32.const 1
                    i32.add
                    i32.const 0
                    i32.store8
                    br 5 (;@3;)
                  end
                  local.get 1
                  i32.const 45
                  i32.store8
                  block  ;; label = @8
                    local.get 2
                    i32.const -1
                    i32.add
                    local.tee 9
                    br_if 0 (;@8;)
                    i32.const -1
                    return
                  end
                  local.get 3
                  i32.eqz
                  br_if 1 (;@6;)
                  i64.const 0
                  local.get 0
                  i64.sub
                  local.set 0
                  local.get 1
                  i32.const 1
                  i32.add
                  local.set 10
                  local.get 3
                  i64.extend_i32_u
                  local.set 5
                  i32.const 1
                  local.set 3
                  block  ;; label = @8
                    loop  ;; label = @9
                      local.get 1
                      local.get 3
                      i32.add
                      local.tee 6
                      local.get 0
                      local.get 0
                      local.get 5
                      i64.div_u
                      local.tee 7
                      local.get 5
                      i64.mul
                      i64.sub
                      local.tee 4
                      i32.wrap_i64
                      local.tee 8
                      i32.const 48
                      i32.or
                      local.get 8
                      i32.const 87
                      i32.add
                      local.get 4
                      i64.const 10
                      i64.lt_u
                      select
                      i32.store8
                      local.get 0
                      local.get 5
                      i64.lt_u
                      br_if 1 (;@8;)
                      local.get 7
                      local.set 0
                      local.get 2
                      local.get 3
                      i32.const 1
                      i32.add
                      local.tee 3
                      i32.ne
                      br_if 0 (;@9;)
                    end
                    i32.const -1
                    return
                  end
                  local.get 3
                  i32.const -1
                  i32.add
                  local.set 8
                  local.get 3
                  local.get 9
                  i32.lt_u
                  br_if 2 (;@5;)
                  br 3 (;@4;)
                end
                i32.const 1050328
                call $_RNvNtNtCs7RAXWwMZhcx_4core9panicking11panic_const23panic_const_rem_by_zero
                unreachable
              end
              i32.const 1050328
              call $_RNvNtNtCs7RAXWwMZhcx_4core9panicking11panic_const23panic_const_rem_by_zero
              unreachable
            end
            local.get 6
            i32.const 1
            i32.add
            i32.const 0
            i32.store8
          end
          block  ;; label = @4
            local.get 8
            local.get 9
            i32.ge_u
            br_if 0 (;@4;)
            block  ;; label = @5
              local.get 3
              i32.const 1
              i32.shr_u
              local.tee 2
              i32.eqz
              br_if 0 (;@5;)
              i32.const 0
              local.set 8
              block  ;; label = @6
                local.get 2
                i32.const 1
                i32.eq
                br_if 0 (;@6;)
                local.get 2
                i32.const 1
                i32.and
                local.set 11
                local.get 3
                i32.const 1
                i32.shr_u
                i32.const 2147483646
                i32.and
                local.set 12
                i32.const 0
                local.set 8
                local.get 3
                local.set 2
                loop  ;; label = @7
                  local.get 1
                  local.get 2
                  i32.add
                  local.tee 9
                  i32.load8_u
                  local.set 13
                  local.get 9
                  local.get 1
                  local.get 8
                  i32.add
                  local.tee 14
                  i32.const 1
                  i32.add
                  local.tee 15
                  i32.load8_u
                  i32.store8
                  local.get 15
                  local.get 13
                  i32.store8
                  local.get 6
                  local.get 8
                  i32.const -2
                  i32.xor
                  i32.add
                  i32.const 1
                  i32.add
                  local.tee 9
                  i32.load8_u
                  local.set 13
                  local.get 9
                  local.get 14
                  i32.const 2
                  i32.add
                  local.tee 14
                  i32.load8_u
                  i32.store8
                  local.get 14
                  local.get 13
                  i32.store8
                  local.get 2
                  i32.const -2
                  i32.add
                  local.set 2
                  local.get 12
                  local.get 8
                  i32.const 2
                  i32.add
                  local.tee 8
                  i32.ne
                  br_if 0 (;@7;)
                end
                local.get 11
                i32.eqz
                br_if 1 (;@5;)
              end
              local.get 10
              local.get 8
              i32.add
              local.tee 2
              i32.load8_u
              local.set 6
              local.get 2
              local.get 1
              local.get 8
              i32.sub
              local.get 3
              i32.add
              local.tee 1
              i32.load8_u
              i32.store8
              local.get 1
              local.get 6
              i32.store8
            end
            local.get 3
            return
          end
          i32.const 0
          local.get 3
          local.get 9
          i32.const 1050344
          call $_RNvNtNtCs7RAXWwMZhcx_4core5slice5index16slice_index_fail
          unreachable
        end
        local.get 3
        local.get 2
        i32.ge_u
        br_if 1 (;@1;)
        local.get 8
        local.set 2
      end
      block  ;; label = @2
        local.get 2
        i32.const 1
        i32.shr_u
        local.tee 6
        i32.eqz
        br_if 0 (;@2;)
        local.get 1
        local.get 2
        i32.add
        local.set 14
        i32.const 0
        local.set 3
        block  ;; label = @3
          local.get 6
          i32.const 1
          i32.eq
          br_if 0 (;@3;)
          local.get 6
          i32.const 1
          i32.and
          local.set 12
          local.get 2
          i32.const -1
          i32.add
          local.set 8
          local.get 6
          i32.const 2147483646
          i32.and
          local.set 15
          i32.const 0
          local.set 3
          loop  ;; label = @4
            local.get 1
            local.get 8
            i32.add
            local.tee 9
            i32.load8_u
            local.set 13
            local.get 9
            local.get 1
            local.get 3
            i32.add
            local.tee 6
            i32.load8_u
            i32.store8
            local.get 6
            local.get 13
            i32.store8
            local.get 14
            local.get 3
            i32.const -2
            i32.xor
            i32.add
            local.tee 9
            i32.load8_u
            local.set 13
            local.get 9
            local.get 6
            i32.const 1
            i32.add
            local.tee 6
            i32.load8_u
            i32.store8
            local.get 6
            local.get 13
            i32.store8
            local.get 8
            i32.const -2
            i32.add
            local.set 8
            local.get 15
            local.get 3
            i32.const 2
            i32.add
            local.tee 3
            i32.ne
            br_if 0 (;@4;)
          end
          local.get 12
          i32.eqz
          br_if 1 (;@2;)
        end
        local.get 1
        local.get 3
        i32.add
        local.tee 1
        i32.load8_u
        local.set 8
        local.get 1
        local.get 14
        local.get 3
        i32.const -1
        i32.xor
        i32.add
        local.tee 3
        i32.load8_u
        i32.store8
        local.get 3
        local.get 8
        i32.store8
      end
      local.get 2
      return
    end
    i32.const 0
    local.get 8
    local.get 2
    i32.const 1050344
    call $_RNvNtNtCs7RAXWwMZhcx_4core5slice5index16slice_index_fail
    unreachable)
  (func $malloc (type 11) (param i32) (result i32)
    (local i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 1
    global.set $__stack_pointer
    block  ;; label = @1
      local.get 0
      i32.const 16
      i32.add
      local.tee 2
      i32.const 2147483633
      i32.ge_u
      br_if 0 (;@1;)
      call $_RNvCsfFJ77F7ERra_7___rustc35___rust_no_alloc_shim_is_unstable_v2
      block  ;; label = @2
        block  ;; label = @3
          local.get 2
          i32.const 16
          call $_RNvCsfFJ77F7ERra_7___rustc12___rust_alloc
          local.tee 2
          br_if 0 (;@3;)
          i32.const 0
          local.set 0
          br 1 (;@2;)
        end
        local.get 2
        local.get 0
        i32.store
        local.get 2
        i32.const 16
        i32.add
        local.set 0
      end
      local.get 1
      i32.const 16
      i32.add
      global.set $__stack_pointer
      local.get 0
      return
    end
    i32.const 1050220
    i32.const 43
    local.get 1
    i32.const 15
    i32.add
    i32.const 1050204
    i32.const 1050296
    call $_RNvNtCs7RAXWwMZhcx_4core6result13unwrap_failed
    unreachable)
  (func $memchr (type 3) (param i32 i32 i32) (result i32)
    (local i32)
    i32.const 0
    local.set 3
    block  ;; label = @1
      local.get 2
      i32.eqz
      br_if 0 (;@1;)
      block  ;; label = @2
        loop  ;; label = @3
          local.get 1
          local.get 0
          i32.load8_u
          i32.eq
          br_if 1 (;@2;)
          local.get 0
          i32.const 1
          i32.add
          local.set 0
          local.get 2
          i32.const -1
          i32.add
          local.tee 2
          i32.eqz
          br_if 2 (;@1;)
          br 0 (;@3;)
        end
      end
      local.get 0
      local.set 3
    end
    local.get 3)
  (func $realloc (type 0) (param i32 i32) (result i32)
    (local i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              local.get 0
              br_if 0 (;@5;)
              local.get 1
              i32.const 16
              i32.add
              local.tee 0
              i32.const 2147483633
              i32.ge_u
              br_if 1 (;@4;)
              call $_RNvCsfFJ77F7ERra_7___rustc35___rust_no_alloc_shim_is_unstable_v2
              local.get 0
              i32.const 16
              call $_RNvCsfFJ77F7ERra_7___rustc12___rust_alloc
              local.tee 0
              br_if 3 (;@2;)
              i32.const 0
              local.set 0
              br 4 (;@1;)
            end
            local.get 0
            i32.const -16
            i32.add
            local.tee 0
            i32.load
            i32.const 16
            i32.add
            local.tee 3
            i32.const 2147483633
            i32.ge_u
            br_if 1 (;@3;)
            local.get 0
            local.get 3
            i32.const 16
            local.get 1
            i32.const 16
            i32.add
            call $_RNvCsfFJ77F7ERra_7___rustc14___rust_realloc
            local.tee 0
            br_if 2 (;@2;)
            i32.const 0
            local.set 0
            br 3 (;@1;)
          end
          i32.const 1050220
          i32.const 43
          local.get 2
          i32.const 15
          i32.add
          i32.const 1050204
          i32.const 1050296
          call $_RNvNtCs7RAXWwMZhcx_4core6result13unwrap_failed
          unreachable
        end
        i32.const 1050220
        i32.const 43
        local.get 2
        i32.const 15
        i32.add
        i32.const 1050204
        i32.const 1050312
        call $_RNvNtCs7RAXWwMZhcx_4core6result13unwrap_failed
        unreachable
      end
      local.get 0
      local.get 1
      i32.store
      local.get 0
      i32.const 16
      i32.add
      local.set 0
    end
    local.get 2
    i32.const 16
    i32.add
    global.set $__stack_pointer
    local.get 0)
  (func $strcat (type 0) (param i32 i32) (result i32)
    (local i32 i32)
    block  ;; label = @1
      block  ;; label = @2
        local.get 0
        i32.load8_u
        br_if 0 (;@2;)
        i32.const 0
        local.set 2
        br 1 (;@1;)
      end
      i32.const 1
      local.set 2
      local.get 0
      i32.const 1
      i32.add
      i32.load8_u
      i32.eqz
      br_if 0 (;@1;)
      local.get 0
      i32.const 2
      i32.add
      call $strlen
      i32.const 2
      i32.add
      local.set 2
    end
    local.get 0
    local.get 2
    i32.add
    local.set 2
    loop  ;; label = @1
      local.get 2
      local.get 1
      i32.load8_u
      local.tee 3
      i32.store8
      local.get 1
      i32.const 1
      i32.add
      local.set 1
      local.get 2
      i32.const 1
      i32.add
      local.set 2
      local.get 3
      br_if 0 (;@1;)
    end
    local.get 0)
  (func $strlen (type 11) (param i32) (result i32)
    (local i32 i32)
    block  ;; label = @1
      block  ;; label = @2
        local.get 0
        i32.load8_u
        br_if 0 (;@2;)
        i32.const 0
        local.set 0
        br 1 (;@1;)
      end
      local.get 0
      i32.const 1
      i32.add
      local.set 1
      i32.const 0
      local.set 0
      loop  ;; label = @2
        local.get 0
        local.tee 2
        i32.const 1
        i32.add
        local.set 0
        local.get 1
        local.get 2
        i32.add
        i32.load8_u
        br_if 0 (;@2;)
      end
    end
    local.get 0)
  (func $strchr (type 0) (param i32 i32) (result i32)
    (local i32)
    block  ;; label = @1
      loop  ;; label = @2
        local.get 1
        local.get 0
        i32.load8_u
        local.tee 2
        i32.eq
        br_if 1 (;@1;)
        local.get 0
        i32.const 1
        i32.add
        local.set 0
        local.get 2
        br_if 0 (;@2;)
      end
      i32.const 0
      local.set 0
    end
    local.get 0)
  (func $strcmp (type 0) (param i32 i32) (result i32)
    (local i32 i32)
    block  ;; label = @1
      loop  ;; label = @2
        local.get 1
        i32.load8_u
        local.set 2
        local.get 0
        i32.load8_u
        local.tee 3
        i32.eqz
        br_if 1 (;@1;)
        local.get 0
        i32.const 1
        i32.add
        local.set 0
        local.get 1
        i32.const 1
        i32.add
        local.set 1
        local.get 3
        local.get 2
        i32.eq
        br_if 0 (;@2;)
      end
    end
    local.get 3
    local.get 2
    i32.sub)
  (func $strcpy (type 0) (param i32 i32) (result i32)
    (local i32 i32)
    i32.const 0
    local.set 2
    loop  ;; label = @1
      local.get 0
      local.get 2
      i32.add
      local.get 1
      local.get 2
      i32.add
      i32.load8_u
      local.tee 3
      i32.store8
      local.get 2
      i32.const 1
      i32.add
      local.set 2
      local.get 3
      br_if 0 (;@1;)
    end
    local.get 0)
  (func $strncasecmp (type 3) (param i32 i32 i32) (result i32)
    (local i32 i32)
    block  ;; label = @1
      block  ;; label = @2
        loop  ;; label = @3
          local.get 2
          i32.eqz
          br_if 1 (;@2;)
          i32.const 32
          i32.const 0
          local.get 0
          i32.load8_u
          local.tee 3
          i32.const -65
          i32.add
          i32.const 255
          i32.and
          i32.const 26
          i32.lt_u
          select
          local.get 3
          i32.or
          i32.const 255
          i32.and
          i32.const 32
          i32.const 0
          local.get 1
          i32.load8_u
          local.tee 4
          i32.const -65
          i32.add
          i32.const 255
          i32.and
          i32.const 26
          i32.lt_u
          select
          local.get 4
          i32.or
          i32.const 255
          i32.and
          i32.sub
          local.tee 4
          br_if 2 (;@1;)
          local.get 2
          i32.const -1
          i32.add
          local.set 2
          local.get 1
          i32.const 1
          i32.add
          local.set 1
          local.get 0
          i32.const 1
          i32.add
          local.set 0
          local.get 3
          i32.const 255
          i32.and
          br_if 0 (;@3;)
        end
      end
      i32.const 0
      local.set 4
    end
    local.get 4)
  (func $strncmp (type 3) (param i32 i32 i32) (result i32)
    (local i32 i32)
    local.get 2
    i32.const 0
    local.get 2
    i32.const 0
    i32.gt_s
    select
    local.set 2
    loop  ;; label = @1
      block  ;; label = @2
        local.get 2
        br_if 0 (;@2;)
        i32.const 0
        return
      end
      local.get 0
      i32.load8_u
      local.tee 3
      local.get 1
      i32.load8_u
      i32.sub
      local.set 4
      block  ;; label = @2
        local.get 3
        i32.eqz
        br_if 0 (;@2;)
        local.get 2
        i32.const -1
        i32.add
        local.set 2
        local.get 1
        i32.const 1
        i32.add
        local.set 1
        local.get 0
        i32.const 1
        i32.add
        local.set 0
        local.get 4
        i32.eqz
        br_if 1 (;@1;)
      end
    end
    local.get 4)
  (func $strncpy (type 3) (param i32 i32 i32) (result i32)
    (local i32 i32)
    i32.const 0
    local.set 3
    block  ;; label = @1
      local.get 2
      i32.eqz
      br_if 0 (;@1;)
      loop  ;; label = @2
        local.get 0
        local.get 3
        i32.add
        local.get 1
        local.get 3
        i32.add
        i32.load8_u
        local.tee 4
        i32.store8
        local.get 3
        i32.const 1
        i32.add
        local.set 3
        local.get 4
        i32.eqz
        br_if 1 (;@1;)
        local.get 3
        local.get 2
        i32.lt_u
        br_if 0 (;@2;)
      end
    end
    block  ;; label = @1
      local.get 2
      local.get 3
      i32.le_u
      br_if 0 (;@1;)
      local.get 2
      local.get 3
      i32.sub
      local.tee 4
      i32.eqz
      br_if 0 (;@1;)
      local.get 0
      local.get 3
      i32.add
      i32.const 0
      local.get 4
      memory.fill
    end
    local.get 0)
  (func $strrchr (type 0) (param i32 i32) (result i32)
    (local i32 i32)
    i32.const 0
    local.set 2
    loop  ;; label = @1
      local.get 0
      local.get 2
      local.get 1
      local.get 0
      i32.load8_u
      local.tee 3
      i32.eq
      select
      local.set 2
      local.get 0
      i32.const 1
      i32.add
      local.set 0
      local.get 3
      br_if 0 (;@1;)
    end
    local.get 2)
  (func $strstr (type 0) (param i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32)
    block  ;; label = @1
      block  ;; label = @2
        local.get 1
        i32.load8_u
        local.tee 2
        br_if 0 (;@2;)
        local.get 0
        local.set 3
        br 1 (;@1;)
      end
      local.get 0
      local.set 4
      i32.const 0
      local.set 5
      loop  ;; label = @2
        block  ;; label = @3
          local.get 0
          local.get 5
          i32.add
          local.tee 3
          i32.load8_u
          br_if 0 (;@3;)
          i32.const 0
          return
        end
        local.get 5
        i32.const 1
        i32.add
        local.set 5
        local.get 4
        local.set 6
        local.get 1
        local.set 7
        local.get 2
        local.set 8
        loop  ;; label = @3
          block  ;; label = @4
            local.get 6
            i32.load8_u
            local.get 8
            i32.const 255
            i32.and
            i32.eq
            br_if 0 (;@4;)
            local.get 4
            i32.const 1
            i32.add
            local.set 4
            local.get 7
            i32.load8_u
            i32.eqz
            br_if 3 (;@1;)
            br 2 (;@2;)
          end
          local.get 6
          i32.const 1
          i32.add
          local.set 6
          local.get 7
          i32.const 1
          i32.add
          local.tee 7
          i32.load8_u
          local.tee 8
          br_if 0 (;@3;)
        end
      end
    end
    local.get 3)
  (func $strtoimax (type 14) (param i32 i32 i32) (result i64)
    local.get 0
    local.get 1
    local.get 2
    i64.const -9223372036854775808
    i64.const 9223372036854775807
    call $_RNvNtNtCsaJZI1b1iR8F_11wasm32_libc3ffi6strtol6strtox)
  (func $strtol (type 3) (param i32 i32 i32) (result i32)
    local.get 0
    local.get 1
    local.get 2
    i64.const -2147483648
    i64.const 2147483647
    call $_RNvNtNtCsaJZI1b1iR8F_11wasm32_libc3ffi6strtol6strtox
    i32.wrap_i64)
  (func $strtoul (type 3) (param i32 i32 i32) (result i32)
    local.get 0
    local.get 1
    local.get 2
    i64.const 0
    i64.const 4294967295
    call $_RNvNtNtCsaJZI1b1iR8F_11wasm32_libc3ffi6strtol6strtox
    i32.wrap_i64)
  (func $strtoull (type 14) (param i32 i32 i32) (result i64)
    local.get 0
    local.get 1
    local.get 2
    i64.const 0
    i64.const -1
    call $_RNvNtNtCsaJZI1b1iR8F_11wasm32_libc3ffi6strtol6strtox)
  (func $utoa (type 13) (param i64 i32 i32 i32) (result i32)
    (local i64 i64 i32 i64 i32 i32 i32 i32 i32 i32)
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              block  ;; label = @6
                block  ;; label = @7
                  local.get 2
                  br_if 0 (;@7;)
                  local.get 0
                  local.set 4
                  br 1 (;@6;)
                end
                local.get 3
                i32.eqz
                br_if 2 (;@4;)
                local.get 3
                i64.extend_i32_u
                local.set 5
                i32.const 0
                local.set 3
                loop  ;; label = @7
                  local.get 1
                  local.get 3
                  i32.add
                  local.tee 6
                  local.get 0
                  local.get 0
                  local.get 5
                  i64.div_u
                  local.tee 4
                  local.get 5
                  i64.mul
                  i64.sub
                  local.tee 7
                  i32.wrap_i64
                  local.tee 8
                  i32.const 48
                  i32.or
                  local.get 8
                  i32.const 87
                  i32.add
                  local.get 7
                  i64.const 10
                  i64.lt_u
                  select
                  i32.store8
                  local.get 0
                  local.get 5
                  i64.lt_u
                  br_if 2 (;@5;)
                  local.get 4
                  local.set 0
                  local.get 2
                  local.get 3
                  i32.const 1
                  i32.add
                  local.tee 3
                  i32.ne
                  br_if 0 (;@7;)
                end
              end
              i32.const -1
              local.set 3
              local.get 4
              i64.eqz
              i32.eqz
              br_if 4 (;@1;)
              br 3 (;@2;)
            end
            local.get 3
            i32.const 1
            i32.add
            local.tee 8
            local.get 2
            i32.ge_u
            br_if 1 (;@3;)
            local.get 6
            i32.const 1
            i32.add
            i32.const 0
            i32.store8
            br 1 (;@3;)
          end
          i32.const 1050328
          call $_RNvNtNtCs7RAXWwMZhcx_4core9panicking11panic_const23panic_const_rem_by_zero
          unreachable
        end
        block  ;; label = @3
          local.get 3
          local.get 2
          i32.ge_u
          br_if 0 (;@3;)
          local.get 8
          local.set 2
          br 1 (;@2;)
        end
        i32.const 0
        local.get 8
        local.get 2
        i32.const 1050344
        call $_RNvNtNtCs7RAXWwMZhcx_4core5slice5index16slice_index_fail
        unreachable
      end
      block  ;; label = @2
        local.get 2
        i32.const 1
        i32.shr_u
        local.tee 6
        i32.eqz
        br_if 0 (;@2;)
        local.get 1
        local.get 2
        i32.add
        local.set 9
        i32.const 0
        local.set 3
        block  ;; label = @3
          local.get 6
          i32.const 1
          i32.eq
          br_if 0 (;@3;)
          local.get 6
          i32.const 1
          i32.and
          local.set 10
          local.get 2
          i32.const -1
          i32.add
          local.set 8
          local.get 6
          i32.const 2147483646
          i32.and
          local.set 11
          i32.const 0
          local.set 3
          loop  ;; label = @4
            local.get 1
            local.get 8
            i32.add
            local.tee 12
            i32.load8_u
            local.set 13
            local.get 12
            local.get 1
            local.get 3
            i32.add
            local.tee 6
            i32.load8_u
            i32.store8
            local.get 6
            local.get 13
            i32.store8
            local.get 9
            local.get 3
            i32.const -2
            i32.xor
            i32.add
            local.tee 12
            i32.load8_u
            local.set 13
            local.get 12
            local.get 6
            i32.const 1
            i32.add
            local.tee 6
            i32.load8_u
            i32.store8
            local.get 6
            local.get 13
            i32.store8
            local.get 8
            i32.const -2
            i32.add
            local.set 8
            local.get 11
            local.get 3
            i32.const 2
            i32.add
            local.tee 3
            i32.ne
            br_if 0 (;@4;)
          end
          local.get 10
          i32.eqz
          br_if 1 (;@2;)
        end
        local.get 1
        local.get 3
        i32.add
        local.tee 1
        i32.load8_u
        local.set 8
        local.get 1
        local.get 9
        local.get 3
        i32.const -1
        i32.xor
        i32.add
        local.tee 3
        i32.load8_u
        i32.store8
        local.get 3
        local.get 8
        i32.store8
      end
      local.get 2
      local.set 3
    end
    local.get 3)
  (func $_RNvCsfFJ77F7ERra_7___rustc18___rust_start_panic (type 0) (param i32 i32) (result i32)
    call $_RNvCsfFJ77F7ERra_7___rustc12___rust_abort
    unreachable)
  (func $_RINvMNtNtCseKMvW2SdwUu_3std4sync9once_lockINtB3_8OnceLockINtNtB5_14reentrant_lock13ReentrantLockINtNtCs7RAXWwMZhcx_4core4cell7RefCellINtNtNtNtB7_2io8buffered10linewriter10LineWriterNtNtB2e_5stdio9StdoutRawEEEE10initializeNCINvB2_11get_or_initNCNvB2V_6stdout0E0zEB7_ (type 4)
    (local i32)
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            i32.const 0
            i32.load8_u offset=1053248
            br_table 0 (;@4;) 0 (;@4;) 3 (;@1;) 1 (;@3;) 0 (;@4;)
          end
          i32.const 0
          i32.const 2
          i32.store8 offset=1053248
          call $_RNvCsfFJ77F7ERra_7___rustc35___rust_no_alloc_shim_is_unstable_v2
          i32.const 1024
          i32.const 1
          call $_RNvCsfFJ77F7ERra_7___rustc12___rust_alloc
          local.tee 0
          i32.eqz
          br_if 1 (;@2;)
          i32.const 0
          i32.const 3
          i32.store8 offset=1053248
          i32.const 0
          local.get 0
          i32.store offset=1053232
          i32.const 0
          i64.const 4398046511104
          i64.store offset=1053224
          i32.const 0
          i64.const 0
          i64.store offset=1053208
          i32.const 0
          i32.const 0
          i32.store8 offset=1053240
          i32.const 0
          i32.const 0
          i32.store offset=1053236
          i32.const 0
          i32.const 0
          i32.store8 offset=1053220
          i32.const 0
          i32.const 0
          i32.store offset=1053216
        end
        return
      end
      i32.const 1
      i32.const 1024
      call $_RNvNtCslUrat6hAxmK_5alloc7raw_vec12handle_error
      unreachable
    end
    i32.const 1050376
    i32.const 113
    i32.const 1050360
    call $_RNvNtCs7RAXWwMZhcx_4core9panicking9panic_fmt
    unreachable)
  (func $_RINvNtCs7RAXWwMZhcx_4core9panicking13assert_failedbbECseKMvW2SdwUu_3std (type 9) (param i32 i32 i32 i32 i32 i32)
    (local i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 6
    global.set $__stack_pointer
    local.get 6
    local.get 2
    i32.store offset=12
    local.get 6
    local.get 1
    i32.store offset=8
    local.get 0
    local.get 6
    i32.const 8
    i32.add
    i32.const 1050432
    local.get 6
    i32.const 12
    i32.add
    i32.const 1050432
    local.get 3
    local.get 4
    local.get 5
    call $_RNvNtCs7RAXWwMZhcx_4core9panicking19assert_failed_inner
    unreachable)
  (func $_RNvNvMNtNtCseKMvW2SdwUu_3std6thread2idNtB4_8ThreadId3new9exhausted (type 4)
    i32.const 1051825
    i32.const 111
    i32.const 1051880
    call $_RNvNtCs7RAXWwMZhcx_4core9panicking9panic_fmt
    unreachable)
  (func $_RINvNtCs7RAXWwMZhcx_4core3ptr13drop_in_placeINtNtB4_6option6OptionINtNtCslUrat6hAxmK_5alloc3vec3VechEEECseKMvW2SdwUu_3std (type 2) (param i32 i32)
    block  ;; label = @1
      local.get 0
      i32.const -2147483648
      i32.or
      i32.const -2147483648
      i32.eq
      br_if 0 (;@1;)
      local.get 1
      local.get 0
      i32.const 1
      call $_RNvCsfFJ77F7ERra_7___rustc14___rust_dealloc
    end)
  (func $_RINvNtCs7RAXWwMZhcx_4core3ptr13drop_in_placeINtNvNtCseKMvW2SdwUu_3std2io17default_write_fmt7AdapterINtNtBL_6cursor6CursorQShEEEBN_ (type 1) (param i32)
    (local i32 i32 i32)
    block  ;; label = @1
      local.get 0
      i32.load8_u
      i32.const 3
      i32.ne
      br_if 0 (;@1;)
      local.get 0
      i32.load offset=4
      local.tee 0
      i32.load
      local.set 1
      block  ;; label = @2
        local.get 0
        i32.const 4
        i32.add
        i32.load
        local.tee 2
        i32.load
        local.tee 3
        i32.eqz
        br_if 0 (;@2;)
        local.get 1
        local.get 3
        call_indirect (type 1)
      end
      block  ;; label = @2
        local.get 2
        i32.load offset=4
        local.tee 3
        i32.eqz
        br_if 0 (;@2;)
        local.get 1
        local.get 3
        local.get 2
        i32.load offset=8
        call $_RNvCsfFJ77F7ERra_7___rustc14___rust_dealloc
      end
      local.get 0
      i32.const 12
      i32.const 4
      call $_RNvCsfFJ77F7ERra_7___rustc14___rust_dealloc
    end)
  (func $_RINvNtCs7RAXWwMZhcx_4core3ptr13drop_in_placeNtNtCslUrat6hAxmK_5alloc6string6StringECseKMvW2SdwUu_3std (type 1) (param i32)
    (local i32)
    block  ;; label = @1
      local.get 0
      i32.load
      local.tee 1
      i32.eqz
      br_if 0 (;@1;)
      local.get 0
      i32.load offset=4
      local.get 1
      i32.const 1
      call $_RNvCsfFJ77F7ERra_7___rustc14___rust_dealloc
    end)
  (func $_RINvNtCs7RAXWwMZhcx_4core3ptr13drop_in_placeNtNvNtCseKMvW2SdwUu_3std9panicking13panic_handler19FormatStringPayloadEBM_ (type 1) (param i32)
    (local i32)
    block  ;; label = @1
      local.get 0
      i32.load
      local.tee 1
      i32.const 1
      i32.lt_s
      br_if 0 (;@1;)
      local.get 0
      i32.load offset=4
      local.get 1
      i32.const 1
      call $_RNvCsfFJ77F7ERra_7___rustc14___rust_dealloc
    end)
  (func $_RINvNvMs2_NtCslUrat6hAxmK_5alloc7raw_vecINtB8_11RawVecInnerpE7reserve21do_reserve_and_handleNtNtBa_5alloc6GlobalECseKMvW2SdwUu_3std (type 8) (param i32 i32 i32 i32 i32)
    (local i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 5
    global.set $__stack_pointer
    block  ;; label = @1
      local.get 2
      local.get 1
      i32.add
      local.tee 1
      local.get 2
      i32.ge_u
      br_if 0 (;@1;)
      i32.const 0
      i32.const 0
      call $_RNvNtCslUrat6hAxmK_5alloc7raw_vec12handle_error
      unreachable
    end
    local.get 5
    i32.const 4
    i32.add
    local.get 0
    i32.load
    local.tee 2
    local.get 0
    i32.load offset=4
    local.get 1
    local.get 2
    i32.const 1
    i32.shl
    local.tee 2
    local.get 1
    local.get 2
    i32.gt_u
    select
    local.tee 2
    i32.const 8
    i32.const 4
    local.get 4
    i32.const 1
    i32.eq
    select
    local.tee 1
    local.get 2
    local.get 1
    i32.gt_u
    select
    local.tee 2
    local.get 3
    local.get 4
    call $_RNvMs4_NtCslUrat6hAxmK_5alloc7raw_vecNtB5_11RawVecInner11finish_growCseKMvW2SdwUu_3std
    block  ;; label = @1
      local.get 5
      i32.load offset=4
      i32.const 1
      i32.ne
      br_if 0 (;@1;)
      local.get 5
      i32.load offset=8
      local.get 5
      i32.load offset=12
      call $_RNvNtCslUrat6hAxmK_5alloc7raw_vec12handle_error
      unreachable
    end
    local.get 5
    i32.load offset=8
    local.set 4
    local.get 0
    local.get 2
    i32.store
    local.get 0
    local.get 4
    i32.store offset=4
    local.get 5
    i32.const 16
    i32.add
    global.set $__stack_pointer)
  (func $_RINvNtNtCseKMvW2SdwUu_3std3sys9backtrace26___rust_end_short_backtraceNCNvNtB6_5alloc8rust_oom0zEB6_ (type 1) (param i32)
    local.get 0
    call $_RNCNvNtCseKMvW2SdwUu_3std5alloc8rust_oom0B5_
    unreachable)
  (func $_RNCNvNtCseKMvW2SdwUu_3std5alloc8rust_oom0B5_ (type 1) (param i32)
    local.get 0
    i32.load
    local.get 0
    i32.load offset=4
    i32.const 0
    i32.load offset=1053184
    local.tee 0
    i32.const 9
    local.get 0
    select
    call_indirect (type 2)
    unreachable)
  (func $_RINvNtNtCseKMvW2SdwUu_3std3sys9backtrace26___rust_end_short_backtraceNCNvNtB6_9panicking13panic_handler0zEB6_ (type 1) (param i32)
    local.get 0
    call $_RNCNvNtCseKMvW2SdwUu_3std9panicking13panic_handler0B5_
    unreachable)
  (func $_RNCNvNtCseKMvW2SdwUu_3std9panicking13panic_handler0B5_ (type 1) (param i32)
    (local i32 i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 1
    global.set $__stack_pointer
    block  ;; label = @1
      local.get 0
      i32.load
      local.tee 2
      i32.load offset=4
      local.tee 3
      i32.const 1
      i32.and
      i32.eqz
      br_if 0 (;@1;)
      local.get 2
      i32.load
      local.set 2
      local.get 1
      local.get 3
      i32.const 1
      i32.shr_u
      i32.store offset=4
      local.get 1
      local.get 2
      i32.store
      local.get 1
      i32.const 1050664
      local.get 0
      i32.load offset=4
      local.get 0
      i32.load offset=8
      local.tee 0
      i32.load8_u offset=8
      local.get 0
      i32.load8_u offset=9
      call $_RNvNtCseKMvW2SdwUu_3std9panicking15panic_with_hook
      unreachable
    end
    local.get 1
    i32.const -2147483648
    i32.store
    local.get 1
    local.get 0
    i32.store offset=12
    local.get 1
    i32.const 1050692
    local.get 0
    i32.load offset=4
    local.get 0
    i32.load offset=8
    local.tee 0
    i32.load8_u offset=8
    local.get 0
    i32.load8_u offset=9
    call $_RNvNtCseKMvW2SdwUu_3std9panicking15panic_with_hook
    unreachable)
  (func $_RNvMs4_NtCslUrat6hAxmK_5alloc7raw_vecNtB5_11RawVecInner11finish_growCseKMvW2SdwUu_3std (type 9) (param i32 i32 i32 i32 i32 i32)
    (local i32 i32 i64)
    i32.const 1
    local.set 6
    i32.const 4
    local.set 7
    block  ;; label = @1
      block  ;; label = @2
        local.get 5
        i64.extend_i32_u
        local.get 3
        i64.extend_i32_u
        i64.mul
        local.tee 8
        i64.const 32
        i64.shr_u
        i32.wrap_i64
        i32.eqz
        br_if 0 (;@2;)
        i32.const 0
        local.set 3
        br 1 (;@1;)
      end
      block  ;; label = @2
        local.get 8
        i32.wrap_i64
        local.tee 3
        i32.const -2147483648
        local.get 4
        i32.sub
        i32.le_u
        br_if 0 (;@2;)
        i32.const 0
        local.set 3
        br 1 (;@1;)
      end
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              local.get 1
              i32.eqz
              br_if 0 (;@5;)
              local.get 2
              local.get 5
              local.get 1
              i32.mul
              local.get 4
              local.get 3
              call $_RNvCsfFJ77F7ERra_7___rustc14___rust_realloc
              local.set 7
              br 1 (;@4;)
            end
            block  ;; label = @5
              local.get 3
              br_if 0 (;@5;)
              local.get 4
              local.set 7
              br 2 (;@3;)
            end
            call $_RNvCsfFJ77F7ERra_7___rustc35___rust_no_alloc_shim_is_unstable_v2
            local.get 3
            local.get 4
            call $_RNvCsfFJ77F7ERra_7___rustc12___rust_alloc
            local.set 7
          end
          local.get 7
          br_if 0 (;@3;)
          local.get 0
          local.get 4
          i32.store offset=4
          br 1 (;@2;)
        end
        local.get 0
        local.get 7
        i32.store offset=4
        i32.const 0
        local.set 6
      end
      i32.const 8
      local.set 7
    end
    local.get 0
    local.get 7
    i32.add
    local.get 3
    i32.store
    local.get 0
    local.get 6
    i32.store)
  (func $_RNvNtCseKMvW2SdwUu_3std9panicking15panic_with_hook (type 8) (param i32 i32 i32 i32 i32)
    (local i32 i32 i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 5
    global.set $__stack_pointer
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              block  ;; label = @6
                block  ;; label = @7
                  block  ;; label = @8
                    i32.const 1
                    call $_RNvNtNtCseKMvW2SdwUu_3std9panicking11panic_count8increase
                    i32.const 255
                    i32.and
                    br_table 4 (;@4;) 1 (;@7;) 0 (;@8;) 1 (;@7;)
                  end
                  i32.const 0
                  i32.load offset=1053188
                  local.tee 6
                  i32.const -1
                  i32.le_s
                  br_if 3 (;@4;)
                  local.get 6
                  i32.const 1
                  i32.add
                  local.tee 7
                  local.get 6
                  i32.lt_s
                  br_if 4 (;@3;)
                  i32.const 0
                  local.get 7
                  i32.store offset=1053188
                  i32.const 0
                  i32.load offset=1053192
                  i32.eqz
                  br_if 1 (;@6;)
                  local.get 5
                  i32.const 8
                  i32.add
                  local.get 0
                  local.get 1
                  i32.load offset=20
                  call_indirect (type 2)
                  local.get 5
                  local.get 4
                  i32.store8 offset=29
                  local.get 5
                  local.get 3
                  i32.store8 offset=28
                  local.get 5
                  local.get 2
                  i32.store offset=24
                  local.get 5
                  local.get 5
                  i64.load offset=8
                  i64.store offset=16 align=4
                  i32.const 0
                  i32.load offset=1053192
                  local.get 5
                  i32.const 16
                  i32.add
                  i32.const 0
                  i32.load offset=1053196
                  i32.load offset=20
                  call_indirect (type 2)
                  br 2 (;@5;)
                end
                local.get 5
                local.get 0
                local.get 1
                i32.load offset=24
                call_indirect (type 2)
                unreachable
              end
              i32.const -2147483648
              local.get 5
              call $_RINvNtCs7RAXWwMZhcx_4core3ptr13drop_in_placeINtNtB4_6option6OptionINtNtCslUrat6hAxmK_5alloc3vec3VechEEECseKMvW2SdwUu_3std
            end
            i32.const 0
            i32.const 0
            i32.load offset=1053188
            local.tee 5
            i32.const -1
            i32.add
            i32.store offset=1053188
            local.get 5
            i32.const 0
            i32.le_s
            br_if 2 (;@2;)
            i32.const 0
            i32.const 0
            i32.store8 offset=1053180
            local.get 3
            br_if 3 (;@1;)
          end
          unreachable
        end
        i32.const 1050892
        i32.const 28
        i32.const 1050920
        call $_RNvNtCs7RAXWwMZhcx_4core6option13expect_failed
        unreachable
      end
      i32.const 1051960
      i32.const 77
      i32.const 1052000
      call $_RNvNtCs7RAXWwMZhcx_4core9panicking9panic_fmt
      unreachable
    end
    local.get 0
    local.get 1
    call $_RNvCsfFJ77F7ERra_7___rustc10rust_panic
    unreachable)
  (func $_RNvXs1i_NtCs7RAXWwMZhcx_4core3fmtReNtB6_7Display3fmtCseKMvW2SdwUu_3std (type 0) (param i32 i32) (result i32)
    local.get 0
    i32.load
    local.get 0
    i32.load offset=4
    local.get 1
    call $_RNvXsi_NtCs7RAXWwMZhcx_4core3fmteNtB5_7Display3fmt)
  (func $_RNvNtCseKMvW2SdwUu_3std5alloc24default_alloc_error_hook (type 2) (param i32 i32)
    i32.const 0
    i32.const 1
    i32.store8 offset=1053728)
  (func $_RNvCsfFJ77F7ERra_7___rustc10rust_panic (type 2) (param i32 i32)
    local.get 0
    local.get 1
    call $_RNvCsfFJ77F7ERra_7___rustc18___rust_start_panic
    drop
    unreachable)
  (func $_RNvCsfFJ77F7ERra_7___rustc11___rdl_alloc (type 0) (param i32 i32) (result i32)
    block  ;; label = @1
      local.get 1
      i32.const 9
      i32.lt_u
      br_if 0 (;@1;)
      local.get 1
      local.get 0
      call $_RNvMs0_NtCsgufDigEqR9A_8dlmalloc8dlmallocINtB5_8DlmallocNtNtB7_3sys6SystemE8memalignCseKMvW2SdwUu_3std
      return
    end
    local.get 0
    call $_RNvMs0_NtCsgufDigEqR9A_8dlmalloc8dlmallocINtB5_8DlmallocNtNtB7_3sys6SystemE6mallocCseKMvW2SdwUu_3std)
  (func $_RNvMs0_NtCsgufDigEqR9A_8dlmalloc8dlmallocINtB5_8DlmallocNtNtB7_3sys6SystemE8memalignCseKMvW2SdwUu_3std (type 0) (param i32 i32) (result i32)
    (local i32 i32 i32 i32 i32)
    i32.const 0
    local.set 2
    block  ;; label = @1
      local.get 1
      i32.const -65587
      local.get 0
      i32.const 16
      local.get 0
      i32.const 16
      i32.gt_u
      select
      local.tee 0
      i32.sub
      i32.ge_u
      br_if 0 (;@1;)
      local.get 0
      i32.const 16
      local.get 1
      i32.const 11
      i32.add
      i32.const -8
      i32.and
      local.get 1
      i32.const 11
      i32.lt_u
      select
      local.tee 3
      i32.add
      i32.const 12
      i32.add
      call $_RNvMs0_NtCsgufDigEqR9A_8dlmalloc8dlmallocINtB5_8DlmallocNtNtB7_3sys6SystemE6mallocCseKMvW2SdwUu_3std
      local.tee 1
      i32.eqz
      br_if 0 (;@1;)
      local.get 1
      i32.const -8
      i32.add
      local.set 2
      block  ;; label = @2
        block  ;; label = @3
          local.get 0
          i32.const -1
          i32.add
          local.tee 4
          local.get 1
          i32.and
          br_if 0 (;@3;)
          local.get 2
          local.set 0
          br 1 (;@2;)
        end
        local.get 1
        i32.const -4
        i32.add
        local.tee 5
        i32.load
        local.tee 6
        i32.const -8
        i32.and
        local.get 4
        local.get 1
        i32.add
        i32.const 0
        local.get 0
        i32.sub
        i32.and
        i32.const -8
        i32.add
        local.tee 1
        i32.const 0
        local.get 0
        local.get 1
        local.get 2
        i32.sub
        i32.const 16
        i32.gt_u
        select
        i32.add
        local.tee 0
        local.get 2
        i32.sub
        local.tee 1
        i32.sub
        local.set 4
        block  ;; label = @3
          local.get 6
          i32.const 3
          i32.and
          i32.eqz
          br_if 0 (;@3;)
          local.get 0
          local.get 4
          local.get 0
          i32.load offset=4
          i32.const 1
          i32.and
          i32.or
          i32.const 2
          i32.or
          i32.store offset=4
          local.get 0
          local.get 4
          i32.add
          local.tee 4
          local.get 4
          i32.load offset=4
          i32.const 1
          i32.or
          i32.store offset=4
          local.get 5
          local.get 1
          local.get 5
          i32.load
          i32.const 1
          i32.and
          i32.or
          i32.const 2
          i32.or
          i32.store
          local.get 2
          local.get 1
          i32.add
          local.tee 4
          local.get 4
          i32.load offset=4
          i32.const 1
          i32.or
          i32.store offset=4
          local.get 2
          local.get 1
          call $_RNvMs0_NtCsgufDigEqR9A_8dlmalloc8dlmallocINtB5_8DlmallocNtNtB7_3sys6SystemE13dispose_chunkCseKMvW2SdwUu_3std
          br 1 (;@2;)
        end
        local.get 2
        i32.load
        local.set 2
        local.get 0
        local.get 4
        i32.store offset=4
        local.get 0
        local.get 2
        local.get 1
        i32.add
        i32.store
      end
      block  ;; label = @2
        local.get 0
        i32.load offset=4
        local.tee 1
        i32.const 3
        i32.and
        i32.eqz
        br_if 0 (;@2;)
        local.get 1
        i32.const -8
        i32.and
        local.tee 2
        local.get 3
        i32.const 16
        i32.add
        i32.le_u
        br_if 0 (;@2;)
        local.get 0
        local.get 3
        local.get 1
        i32.const 1
        i32.and
        i32.or
        i32.const 2
        i32.or
        i32.store offset=4
        local.get 0
        local.get 3
        i32.add
        local.tee 1
        local.get 2
        local.get 3
        i32.sub
        local.tee 3
        i32.const 3
        i32.or
        i32.store offset=4
        local.get 0
        local.get 2
        i32.add
        local.tee 2
        local.get 2
        i32.load offset=4
        i32.const 1
        i32.or
        i32.store offset=4
        local.get 1
        local.get 3
        call $_RNvMs0_NtCsgufDigEqR9A_8dlmalloc8dlmallocINtB5_8DlmallocNtNtB7_3sys6SystemE13dispose_chunkCseKMvW2SdwUu_3std
      end
      local.get 0
      i32.const 8
      i32.add
      local.set 2
    end
    local.get 2)
  (func $_RNvMs0_NtCsgufDigEqR9A_8dlmalloc8dlmallocINtB5_8DlmallocNtNtB7_3sys6SystemE6mallocCseKMvW2SdwUu_3std (type 11) (param i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i64)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 1
    global.set $__stack_pointer
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            local.get 0
            i32.const 245
            i32.lt_u
            br_if 0 (;@4;)
            block  ;; label = @5
              local.get 0
              i32.const -65588
              i32.le_u
              br_if 0 (;@5;)
              i32.const 0
              local.set 0
              br 4 (;@1;)
            end
            local.get 0
            i32.const 11
            i32.add
            local.tee 2
            i32.const -8
            i32.and
            local.set 3
            i32.const 0
            i32.load offset=1053672
            local.tee 4
            i32.eqz
            br_if 2 (;@2;)
            i32.const 31
            local.set 5
            local.get 0
            i32.const 16777205
            i32.ge_u
            br_if 1 (;@3;)
            local.get 3
            i32.const 38
            local.get 2
            i32.const 8
            i32.shr_u
            i32.clz
            local.tee 0
            i32.sub
            i32.shr_u
            i32.const 1
            i32.and
            local.get 0
            i32.const 1
            i32.shl
            i32.sub
            i32.const 62
            i32.add
            local.set 5
            br 1 (;@3;)
          end
          block  ;; label = @4
            block  ;; label = @5
              block  ;; label = @6
                block  ;; label = @7
                  block  ;; label = @8
                    block  ;; label = @9
                      i32.const 0
                      i32.load offset=1053668
                      local.tee 6
                      i32.const 16
                      local.get 0
                      i32.const 11
                      i32.add
                      i32.const 504
                      i32.and
                      local.get 0
                      i32.const 11
                      i32.lt_u
                      select
                      local.tee 3
                      i32.const 3
                      i32.shr_u
                      local.tee 2
                      i32.shr_u
                      local.tee 0
                      i32.const 3
                      i32.and
                      i32.eqz
                      br_if 0 (;@9;)
                      local.get 0
                      i32.const -1
                      i32.xor
                      i32.const 1
                      i32.and
                      local.get 2
                      i32.add
                      local.tee 7
                      i32.const 3
                      i32.shl
                      local.tee 3
                      i32.const 1053404
                      i32.add
                      local.tee 0
                      local.get 3
                      i32.const 1053412
                      i32.add
                      i32.load
                      local.tee 2
                      i32.load offset=8
                      local.tee 8
                      i32.eq
                      br_if 1 (;@8;)
                      local.get 8
                      local.get 0
                      i32.store offset=12
                      local.get 0
                      local.get 8
                      i32.store offset=8
                      br 2 (;@7;)
                    end
                    local.get 3
                    i32.const 0
                    i32.load offset=1053676
                    i32.le_u
                    br_if 6 (;@2;)
                    local.get 0
                    br_if 2 (;@6;)
                    i32.const 0
                    i32.load offset=1053672
                    local.tee 0
                    i32.eqz
                    br_if 6 (;@2;)
                    local.get 0
                    i32.ctz
                    i32.const 2
                    i32.shl
                    i32.const 1053260
                    i32.add
                    i32.load
                    local.tee 8
                    i32.load offset=4
                    i32.const -8
                    i32.and
                    local.get 3
                    i32.sub
                    local.set 2
                    local.get 8
                    local.set 6
                    loop  ;; label = @9
                      block  ;; label = @10
                        local.get 8
                        i32.load offset=16
                        local.tee 0
                        br_if 0 (;@10;)
                        local.get 8
                        i32.load offset=20
                        local.tee 0
                        br_if 0 (;@10;)
                        local.get 6
                        i32.load offset=24
                        local.set 5
                        block  ;; label = @11
                          block  ;; label = @12
                            block  ;; label = @13
                              local.get 6
                              i32.load offset=12
                              local.tee 0
                              local.get 6
                              i32.ne
                              br_if 0 (;@13;)
                              local.get 6
                              i32.const 20
                              i32.const 16
                              local.get 6
                              i32.load offset=20
                              local.tee 0
                              select
                              i32.add
                              i32.load
                              local.tee 8
                              br_if 1 (;@12;)
                              i32.const 0
                              local.set 0
                              br 2 (;@11;)
                            end
                            local.get 6
                            i32.load offset=8
                            local.tee 8
                            local.get 0
                            i32.store offset=12
                            local.get 0
                            local.get 8
                            i32.store offset=8
                            br 1 (;@11;)
                          end
                          local.get 6
                          i32.const 20
                          i32.add
                          local.get 6
                          i32.const 16
                          i32.add
                          local.get 0
                          select
                          local.set 7
                          loop  ;; label = @12
                            local.get 7
                            local.set 9
                            local.get 8
                            local.tee 0
                            i32.const 20
                            i32.add
                            local.get 0
                            i32.const 16
                            i32.add
                            local.get 0
                            i32.load offset=20
                            local.tee 8
                            select
                            local.set 7
                            local.get 0
                            i32.const 20
                            i32.const 16
                            local.get 8
                            select
                            i32.add
                            i32.load
                            local.tee 8
                            br_if 0 (;@12;)
                          end
                          local.get 9
                          i32.const 0
                          i32.store
                        end
                        local.get 5
                        i32.eqz
                        br_if 6 (;@4;)
                        block  ;; label = @11
                          block  ;; label = @12
                            local.get 6
                            local.get 6
                            i32.load offset=28
                            i32.const 2
                            i32.shl
                            i32.const 1053260
                            i32.add
                            local.tee 8
                            i32.load
                            i32.eq
                            br_if 0 (;@12;)
                            block  ;; label = @13
                              local.get 5
                              i32.load offset=16
                              local.get 6
                              i32.eq
                              br_if 0 (;@13;)
                              local.get 5
                              local.get 0
                              i32.store offset=20
                              local.get 0
                              br_if 2 (;@11;)
                              br 9 (;@4;)
                            end
                            local.get 5
                            local.get 0
                            i32.store offset=16
                            local.get 0
                            br_if 1 (;@11;)
                            br 8 (;@4;)
                          end
                          local.get 8
                          local.get 0
                          i32.store
                          local.get 0
                          i32.eqz
                          br_if 6 (;@5;)
                        end
                        local.get 0
                        local.get 5
                        i32.store offset=24
                        block  ;; label = @11
                          local.get 6
                          i32.load offset=16
                          local.tee 8
                          i32.eqz
                          br_if 0 (;@11;)
                          local.get 0
                          local.get 8
                          i32.store offset=16
                          local.get 8
                          local.get 0
                          i32.store offset=24
                        end
                        local.get 6
                        i32.load offset=20
                        local.tee 8
                        i32.eqz
                        br_if 6 (;@4;)
                        local.get 0
                        local.get 8
                        i32.store offset=20
                        local.get 8
                        local.get 0
                        i32.store offset=24
                        br 6 (;@4;)
                      end
                      local.get 0
                      i32.load offset=4
                      i32.const -8
                      i32.and
                      local.get 3
                      i32.sub
                      local.tee 8
                      local.get 2
                      local.get 8
                      local.get 2
                      i32.lt_u
                      local.tee 8
                      select
                      local.set 2
                      local.get 0
                      local.get 6
                      local.get 8
                      select
                      local.set 6
                      local.get 0
                      local.set 8
                      br 0 (;@9;)
                    end
                  end
                  i32.const 0
                  local.get 6
                  i32.const -2
                  local.get 7
                  i32.rotl
                  i32.and
                  i32.store offset=1053668
                end
                local.get 2
                i32.const 8
                i32.add
                local.set 0
                local.get 2
                local.get 3
                i32.const 3
                i32.or
                i32.store offset=4
                local.get 2
                local.get 3
                i32.add
                local.tee 3
                local.get 3
                i32.load offset=4
                i32.const 1
                i32.or
                i32.store offset=4
                br 5 (;@1;)
              end
              block  ;; label = @6
                block  ;; label = @7
                  local.get 0
                  local.get 2
                  i32.shl
                  i32.const 2
                  local.get 2
                  i32.shl
                  local.tee 0
                  i32.const 0
                  local.get 0
                  i32.sub
                  i32.or
                  i32.and
                  i32.ctz
                  local.tee 9
                  i32.const 3
                  i32.shl
                  local.tee 2
                  i32.const 1053404
                  i32.add
                  local.tee 8
                  local.get 2
                  i32.const 1053412
                  i32.add
                  i32.load
                  local.tee 0
                  i32.load offset=8
                  local.tee 7
                  i32.eq
                  br_if 0 (;@7;)
                  local.get 7
                  local.get 8
                  i32.store offset=12
                  local.get 8
                  local.get 7
                  i32.store offset=8
                  br 1 (;@6;)
                end
                i32.const 0
                local.get 6
                i32.const -2
                local.get 9
                i32.rotl
                i32.and
                i32.store offset=1053668
              end
              local.get 0
              local.get 3
              i32.const 3
              i32.or
              i32.store offset=4
              local.get 0
              local.get 3
              i32.add
              local.tee 6
              local.get 2
              local.get 3
              i32.sub
              local.tee 8
              i32.const 1
              i32.or
              i32.store offset=4
              local.get 0
              local.get 2
              i32.add
              local.get 8
              i32.store
              block  ;; label = @6
                i32.const 0
                i32.load offset=1053676
                local.tee 2
                i32.eqz
                br_if 0 (;@6;)
                i32.const 0
                i32.load offset=1053684
                local.set 3
                block  ;; label = @7
                  block  ;; label = @8
                    i32.const 0
                    i32.load offset=1053668
                    local.tee 7
                    i32.const 1
                    local.get 2
                    i32.const 3
                    i32.shr_u
                    i32.shl
                    local.tee 9
                    i32.and
                    br_if 0 (;@8;)
                    i32.const 0
                    local.get 7
                    local.get 9
                    i32.or
                    i32.store offset=1053668
                    local.get 2
                    i32.const -8
                    i32.and
                    i32.const 1053404
                    i32.add
                    local.tee 2
                    local.set 7
                    br 1 (;@7;)
                  end
                  local.get 2
                  i32.const -8
                  i32.and
                  local.tee 2
                  i32.const 1053404
                  i32.add
                  local.set 7
                  local.get 2
                  i32.const 1053412
                  i32.add
                  i32.load
                  local.set 2
                end
                local.get 7
                local.get 3
                i32.store offset=8
                local.get 2
                local.get 3
                i32.store offset=12
                local.get 3
                local.get 7
                i32.store offset=12
                local.get 3
                local.get 2
                i32.store offset=8
              end
              local.get 0
              i32.const 8
              i32.add
              local.set 0
              i32.const 0
              local.get 6
              i32.store offset=1053684
              i32.const 0
              local.get 8
              i32.store offset=1053676
              br 4 (;@1;)
            end
            i32.const 0
            i32.const 0
            i32.load offset=1053672
            i32.const -2
            local.get 6
            i32.load offset=28
            i32.rotl
            i32.and
            i32.store offset=1053672
          end
          block  ;; label = @4
            block  ;; label = @5
              block  ;; label = @6
                local.get 2
                i32.const 16
                i32.lt_u
                br_if 0 (;@6;)
                local.get 6
                local.get 3
                i32.const 3
                i32.or
                i32.store offset=4
                local.get 6
                local.get 3
                i32.add
                local.tee 8
                local.get 2
                i32.const 1
                i32.or
                i32.store offset=4
                local.get 8
                local.get 2
                i32.add
                local.get 2
                i32.store
                i32.const 0
                i32.load offset=1053676
                local.tee 7
                i32.eqz
                br_if 1 (;@5;)
                i32.const 0
                i32.load offset=1053684
                local.set 0
                block  ;; label = @7
                  block  ;; label = @8
                    i32.const 0
                    i32.load offset=1053668
                    local.tee 9
                    i32.const 1
                    local.get 7
                    i32.const 3
                    i32.shr_u
                    i32.shl
                    local.tee 5
                    i32.and
                    br_if 0 (;@8;)
                    i32.const 0
                    local.get 9
                    local.get 5
                    i32.or
                    i32.store offset=1053668
                    local.get 7
                    i32.const -8
                    i32.and
                    i32.const 1053404
                    i32.add
                    local.tee 7
                    local.set 9
                    br 1 (;@7;)
                  end
                  local.get 7
                  i32.const -8
                  i32.and
                  local.tee 7
                  i32.const 1053404
                  i32.add
                  local.set 9
                  local.get 7
                  i32.const 1053412
                  i32.add
                  i32.load
                  local.set 7
                end
                local.get 9
                local.get 0
                i32.store offset=8
                local.get 7
                local.get 0
                i32.store offset=12
                local.get 0
                local.get 9
                i32.store offset=12
                local.get 0
                local.get 7
                i32.store offset=8
                br 1 (;@5;)
              end
              local.get 6
              local.get 2
              local.get 3
              i32.add
              local.tee 0
              i32.const 3
              i32.or
              i32.store offset=4
              local.get 6
              local.get 0
              i32.add
              local.tee 0
              local.get 0
              i32.load offset=4
              i32.const 1
              i32.or
              i32.store offset=4
              br 1 (;@4;)
            end
            i32.const 0
            local.get 8
            i32.store offset=1053684
            i32.const 0
            local.get 2
            i32.store offset=1053676
          end
          local.get 6
          i32.const 8
          i32.add
          local.tee 0
          i32.eqz
          br_if 1 (;@2;)
          br 2 (;@1;)
        end
        i32.const 0
        local.get 3
        i32.sub
        local.set 2
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              block  ;; label = @6
                local.get 5
                i32.const 2
                i32.shl
                i32.const 1053260
                i32.add
                i32.load
                local.tee 6
                br_if 0 (;@6;)
                i32.const 0
                local.set 8
                i32.const 0
                local.set 0
                br 1 (;@5;)
              end
              i32.const 0
              local.set 8
              local.get 3
              i32.const 0
              i32.const 25
              local.get 5
              i32.const 1
              i32.shr_u
              i32.sub
              local.get 5
              i32.const 31
              i32.eq
              select
              i32.shl
              local.set 7
              i32.const 0
              local.set 0
              loop  ;; label = @6
                block  ;; label = @7
                  local.get 6
                  local.tee 6
                  i32.load offset=4
                  i32.const -8
                  i32.and
                  local.tee 9
                  local.get 3
                  i32.lt_u
                  br_if 0 (;@7;)
                  local.get 9
                  local.get 3
                  i32.sub
                  local.tee 9
                  local.get 2
                  i32.ge_u
                  br_if 0 (;@7;)
                  local.get 6
                  local.set 8
                  local.get 9
                  local.set 2
                  local.get 9
                  br_if 0 (;@7;)
                  i32.const 0
                  local.set 2
                  local.get 6
                  local.set 0
                  local.get 6
                  local.set 8
                  br 3 (;@4;)
                end
                local.get 6
                i32.load offset=20
                local.tee 9
                local.get 0
                local.get 9
                local.get 6
                local.get 7
                i32.const 29
                i32.shr_u
                i32.const 4
                i32.and
                i32.add
                i32.load offset=16
                local.tee 6
                i32.ne
                select
                local.get 0
                local.get 9
                select
                local.set 0
                local.get 7
                i32.const 1
                i32.shl
                local.set 7
                local.get 6
                br_if 0 (;@6;)
              end
            end
            block  ;; label = @5
              local.get 0
              local.get 8
              i32.or
              br_if 0 (;@5;)
              i32.const 0
              local.set 8
              i32.const 2
              local.get 5
              i32.shl
              local.tee 0
              i32.const 0
              local.get 0
              i32.sub
              i32.or
              local.get 4
              i32.and
              local.tee 0
              i32.eqz
              br_if 3 (;@2;)
              local.get 0
              i32.ctz
              i32.const 2
              i32.shl
              i32.const 1053260
              i32.add
              i32.load
              local.set 0
            end
            local.get 0
            i32.eqz
            br_if 1 (;@3;)
          end
          loop  ;; label = @4
            local.get 0
            i32.load offset=4
            i32.const -8
            i32.and
            local.tee 6
            local.get 3
            i32.sub
            local.tee 7
            local.get 2
            local.get 7
            local.get 2
            i32.lt_u
            local.tee 9
            select
            local.set 5
            local.get 6
            local.get 3
            i32.lt_u
            local.set 7
            local.get 0
            local.get 8
            local.get 9
            select
            local.set 9
            block  ;; label = @5
              local.get 0
              i32.load offset=16
              local.tee 6
              br_if 0 (;@5;)
              local.get 0
              i32.load offset=20
              local.set 6
            end
            local.get 2
            local.get 5
            local.get 7
            select
            local.set 2
            local.get 8
            local.get 9
            local.get 7
            select
            local.set 8
            local.get 6
            local.set 0
            local.get 6
            br_if 0 (;@4;)
          end
        end
        local.get 8
        i32.eqz
        br_if 0 (;@2;)
        block  ;; label = @3
          i32.const 0
          i32.load offset=1053676
          local.tee 0
          local.get 3
          i32.lt_u
          br_if 0 (;@3;)
          local.get 2
          local.get 0
          local.get 3
          i32.sub
          i32.ge_u
          br_if 1 (;@2;)
        end
        local.get 8
        i32.load offset=24
        local.set 5
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              local.get 8
              i32.load offset=12
              local.tee 0
              local.get 8
              i32.ne
              br_if 0 (;@5;)
              local.get 8
              i32.const 20
              i32.const 16
              local.get 8
              i32.load offset=20
              local.tee 0
              select
              i32.add
              i32.load
              local.tee 6
              br_if 1 (;@4;)
              i32.const 0
              local.set 0
              br 2 (;@3;)
            end
            local.get 8
            i32.load offset=8
            local.tee 6
            local.get 0
            i32.store offset=12
            local.get 0
            local.get 6
            i32.store offset=8
            br 1 (;@3;)
          end
          local.get 8
          i32.const 20
          i32.add
          local.get 8
          i32.const 16
          i32.add
          local.get 0
          select
          local.set 7
          loop  ;; label = @4
            local.get 7
            local.set 9
            local.get 6
            local.tee 0
            i32.const 20
            i32.add
            local.get 0
            i32.const 16
            i32.add
            local.get 0
            i32.load offset=20
            local.tee 6
            select
            local.set 7
            local.get 0
            i32.const 20
            i32.const 16
            local.get 6
            select
            i32.add
            i32.load
            local.tee 6
            br_if 0 (;@4;)
          end
          local.get 9
          i32.const 0
          i32.store
        end
        block  ;; label = @3
          local.get 5
          i32.eqz
          br_if 0 (;@3;)
          block  ;; label = @4
            block  ;; label = @5
              block  ;; label = @6
                local.get 8
                local.get 8
                i32.load offset=28
                i32.const 2
                i32.shl
                i32.const 1053260
                i32.add
                local.tee 6
                i32.load
                i32.eq
                br_if 0 (;@6;)
                block  ;; label = @7
                  local.get 5
                  i32.load offset=16
                  local.get 8
                  i32.eq
                  br_if 0 (;@7;)
                  local.get 5
                  local.get 0
                  i32.store offset=20
                  local.get 0
                  br_if 2 (;@5;)
                  br 4 (;@3;)
                end
                local.get 5
                local.get 0
                i32.store offset=16
                local.get 0
                br_if 1 (;@5;)
                br 3 (;@3;)
              end
              local.get 6
              local.get 0
              i32.store
              local.get 0
              i32.eqz
              br_if 1 (;@4;)
            end
            local.get 0
            local.get 5
            i32.store offset=24
            block  ;; label = @5
              local.get 8
              i32.load offset=16
              local.tee 6
              i32.eqz
              br_if 0 (;@5;)
              local.get 0
              local.get 6
              i32.store offset=16
              local.get 6
              local.get 0
              i32.store offset=24
            end
            local.get 8
            i32.load offset=20
            local.tee 6
            i32.eqz
            br_if 1 (;@3;)
            local.get 0
            local.get 6
            i32.store offset=20
            local.get 6
            local.get 0
            i32.store offset=24
            br 1 (;@3;)
          end
          i32.const 0
          i32.const 0
          i32.load offset=1053672
          i32.const -2
          local.get 8
          i32.load offset=28
          i32.rotl
          i32.and
          i32.store offset=1053672
        end
        block  ;; label = @3
          block  ;; label = @4
            local.get 2
            i32.const 16
            i32.lt_u
            br_if 0 (;@4;)
            local.get 8
            local.get 3
            i32.const 3
            i32.or
            i32.store offset=4
            local.get 8
            local.get 3
            i32.add
            local.tee 0
            local.get 2
            i32.const 1
            i32.or
            i32.store offset=4
            local.get 0
            local.get 2
            i32.add
            local.get 2
            i32.store
            block  ;; label = @5
              local.get 2
              i32.const 256
              i32.lt_u
              br_if 0 (;@5;)
              local.get 0
              local.get 2
              call $_RNvMs0_NtCsgufDigEqR9A_8dlmalloc8dlmallocINtB5_8DlmallocNtNtB7_3sys6SystemE18insert_large_chunkCseKMvW2SdwUu_3std
              br 2 (;@3;)
            end
            block  ;; label = @5
              block  ;; label = @6
                i32.const 0
                i32.load offset=1053668
                local.tee 6
                i32.const 1
                local.get 2
                i32.const 3
                i32.shr_u
                i32.shl
                local.tee 7
                i32.and
                br_if 0 (;@6;)
                i32.const 0
                local.get 6
                local.get 7
                i32.or
                i32.store offset=1053668
                local.get 2
                i32.const 248
                i32.and
                i32.const 1053404
                i32.add
                local.tee 2
                local.set 6
                br 1 (;@5;)
              end
              local.get 2
              i32.const 248
              i32.and
              local.tee 2
              i32.const 1053404
              i32.add
              local.set 6
              local.get 2
              i32.const 1053412
              i32.add
              i32.load
              local.set 2
            end
            local.get 6
            local.get 0
            i32.store offset=8
            local.get 2
            local.get 0
            i32.store offset=12
            local.get 0
            local.get 6
            i32.store offset=12
            local.get 0
            local.get 2
            i32.store offset=8
            br 1 (;@3;)
          end
          local.get 8
          local.get 2
          local.get 3
          i32.add
          local.tee 0
          i32.const 3
          i32.or
          i32.store offset=4
          local.get 8
          local.get 0
          i32.add
          local.tee 0
          local.get 0
          i32.load offset=4
          i32.const 1
          i32.or
          i32.store offset=4
        end
        local.get 8
        i32.const 8
        i32.add
        local.tee 0
        br_if 1 (;@1;)
      end
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              block  ;; label = @6
                block  ;; label = @7
                  i32.const 0
                  i32.load offset=1053676
                  local.tee 0
                  local.get 3
                  i32.ge_u
                  br_if 0 (;@7;)
                  block  ;; label = @8
                    i32.const 0
                    i32.load offset=1053680
                    local.tee 0
                    local.get 3
                    i32.gt_u
                    br_if 0 (;@8;)
                    local.get 1
                    i32.const 4
                    i32.add
                    i32.const 1053712
                    local.get 3
                    i32.const 65583
                    i32.add
                    i32.const -65536
                    i32.and
                    call $_RNvXs_NtCsgufDigEqR9A_8dlmalloc3sysNtB4_6SystemNtB6_9Allocator5alloc
                    block  ;; label = @9
                      local.get 1
                      i32.load offset=4
                      local.tee 6
                      br_if 0 (;@9;)
                      i32.const 0
                      local.set 0
                      br 8 (;@1;)
                    end
                    local.get 1
                    i32.load offset=12
                    local.set 5
                    i32.const 0
                    i32.const 0
                    i32.load offset=1053692
                    local.get 1
                    i32.load offset=8
                    local.tee 9
                    i32.add
                    local.tee 0
                    i32.store offset=1053692
                    i32.const 0
                    local.get 0
                    i32.const 0
                    i32.load offset=1053696
                    local.tee 2
                    local.get 0
                    local.get 2
                    i32.gt_u
                    select
                    i32.store offset=1053696
                    block  ;; label = @9
                      block  ;; label = @10
                        block  ;; label = @11
                          i32.const 0
                          i32.load offset=1053688
                          local.tee 2
                          i32.eqz
                          br_if 0 (;@11;)
                          i32.const 1053388
                          local.set 0
                          loop  ;; label = @12
                            local.get 6
                            local.get 0
                            i32.load
                            local.tee 8
                            local.get 0
                            i32.load offset=4
                            local.tee 7
                            i32.add
                            i32.eq
                            br_if 2 (;@10;)
                            local.get 0
                            i32.load offset=8
                            local.tee 0
                            br_if 0 (;@12;)
                            br 3 (;@9;)
                          end
                        end
                        block  ;; label = @11
                          block  ;; label = @12
                            i32.const 0
                            i32.load offset=1053704
                            local.tee 0
                            i32.eqz
                            br_if 0 (;@12;)
                            local.get 6
                            local.get 0
                            i32.ge_u
                            br_if 1 (;@11;)
                          end
                          i32.const 0
                          local.get 6
                          i32.store offset=1053704
                        end
                        i32.const 0
                        i32.const 4095
                        i32.store offset=1053708
                        i32.const 0
                        local.get 5
                        i32.store offset=1053400
                        i32.const 0
                        local.get 9
                        i32.store offset=1053392
                        i32.const 0
                        local.get 6
                        i32.store offset=1053388
                        i32.const 0
                        i32.const 1053404
                        i32.store offset=1053416
                        i32.const 0
                        i32.const 1053412
                        i32.store offset=1053424
                        i32.const 0
                        i32.const 1053404
                        i32.store offset=1053412
                        i32.const 0
                        i32.const 1053420
                        i32.store offset=1053432
                        i32.const 0
                        i32.const 1053412
                        i32.store offset=1053420
                        i32.const 0
                        i32.const 1053428
                        i32.store offset=1053440
                        i32.const 0
                        i32.const 1053420
                        i32.store offset=1053428
                        i32.const 0
                        i32.const 1053436
                        i32.store offset=1053448
                        i32.const 0
                        i32.const 1053428
                        i32.store offset=1053436
                        i32.const 0
                        i32.const 1053444
                        i32.store offset=1053456
                        i32.const 0
                        i32.const 1053436
                        i32.store offset=1053444
                        i32.const 0
                        i32.const 1053452
                        i32.store offset=1053464
                        i32.const 0
                        i32.const 1053444
                        i32.store offset=1053452
                        i32.const 0
                        i32.const 1053460
                        i32.store offset=1053472
                        i32.const 0
                        i32.const 1053452
                        i32.store offset=1053460
                        i32.const 0
                        i32.const 1053468
                        i32.store offset=1053480
                        i32.const 0
                        i32.const 1053460
                        i32.store offset=1053468
                        i32.const 0
                        i32.const 1053468
                        i32.store offset=1053476
                        i32.const 0
                        i32.const 1053476
                        i32.store offset=1053488
                        i32.const 0
                        i32.const 1053476
                        i32.store offset=1053484
                        i32.const 0
                        i32.const 1053484
                        i32.store offset=1053496
                        i32.const 0
                        i32.const 1053484
                        i32.store offset=1053492
                        i32.const 0
                        i32.const 1053492
                        i32.store offset=1053504
                        i32.const 0
                        i32.const 1053492
                        i32.store offset=1053500
                        i32.const 0
                        i32.const 1053500
                        i32.store offset=1053512
                        i32.const 0
                        i32.const 1053500
                        i32.store offset=1053508
                        i32.const 0
                        i32.const 1053508
                        i32.store offset=1053520
                        i32.const 0
                        i32.const 1053508
                        i32.store offset=1053516
                        i32.const 0
                        i32.const 1053516
                        i32.store offset=1053528
                        i32.const 0
                        i32.const 1053516
                        i32.store offset=1053524
                        i32.const 0
                        i32.const 1053524
                        i32.store offset=1053536
                        i32.const 0
                        i32.const 1053524
                        i32.store offset=1053532
                        i32.const 0
                        i32.const 1053532
                        i32.store offset=1053544
                        i32.const 0
                        i32.const 1053540
                        i32.store offset=1053552
                        i32.const 0
                        i32.const 1053532
                        i32.store offset=1053540
                        i32.const 0
                        i32.const 1053548
                        i32.store offset=1053560
                        i32.const 0
                        i32.const 1053540
                        i32.store offset=1053548
                        i32.const 0
                        i32.const 1053556
                        i32.store offset=1053568
                        i32.const 0
                        i32.const 1053548
                        i32.store offset=1053556
                        i32.const 0
                        i32.const 1053564
                        i32.store offset=1053576
                        i32.const 0
                        i32.const 1053556
                        i32.store offset=1053564
                        i32.const 0
                        i32.const 1053572
                        i32.store offset=1053584
                        i32.const 0
                        i32.const 1053564
                        i32.store offset=1053572
                        i32.const 0
                        i32.const 1053580
                        i32.store offset=1053592
                        i32.const 0
                        i32.const 1053572
                        i32.store offset=1053580
                        i32.const 0
                        i32.const 1053588
                        i32.store offset=1053600
                        i32.const 0
                        i32.const 1053580
                        i32.store offset=1053588
                        i32.const 0
                        i32.const 1053596
                        i32.store offset=1053608
                        i32.const 0
                        i32.const 1053588
                        i32.store offset=1053596
                        i32.const 0
                        i32.const 1053604
                        i32.store offset=1053616
                        i32.const 0
                        i32.const 1053596
                        i32.store offset=1053604
                        i32.const 0
                        i32.const 1053612
                        i32.store offset=1053624
                        i32.const 0
                        i32.const 1053604
                        i32.store offset=1053612
                        i32.const 0
                        i32.const 1053620
                        i32.store offset=1053632
                        i32.const 0
                        i32.const 1053612
                        i32.store offset=1053620
                        i32.const 0
                        i32.const 1053628
                        i32.store offset=1053640
                        i32.const 0
                        i32.const 1053620
                        i32.store offset=1053628
                        i32.const 0
                        i32.const 1053636
                        i32.store offset=1053648
                        i32.const 0
                        i32.const 1053628
                        i32.store offset=1053636
                        i32.const 0
                        i32.const 1053644
                        i32.store offset=1053656
                        i32.const 0
                        i32.const 1053636
                        i32.store offset=1053644
                        i32.const 0
                        i32.const 1053652
                        i32.store offset=1053664
                        i32.const 0
                        i32.const 1053644
                        i32.store offset=1053652
                        i32.const 0
                        local.get 6
                        i32.const 15
                        i32.add
                        i32.const -8
                        i32.and
                        local.tee 0
                        i32.const -8
                        i32.add
                        local.tee 2
                        i32.store offset=1053688
                        i32.const 0
                        i32.const 1053652
                        i32.store offset=1053660
                        i32.const 0
                        local.get 6
                        local.get 0
                        i32.sub
                        local.get 9
                        i32.const -40
                        i32.add
                        local.tee 0
                        i32.add
                        i32.const 8
                        i32.add
                        local.tee 8
                        i32.store offset=1053680
                        local.get 2
                        local.get 8
                        i32.const 1
                        i32.or
                        i32.store offset=4
                        local.get 6
                        local.get 0
                        i32.add
                        i32.const 40
                        i32.store offset=4
                        i32.const 0
                        i32.const 2097152
                        i32.store offset=1053700
                        br 8 (;@2;)
                      end
                      local.get 2
                      local.get 6
                      i32.ge_u
                      br_if 0 (;@9;)
                      local.get 8
                      local.get 2
                      i32.gt_u
                      br_if 0 (;@9;)
                      local.get 0
                      i32.load offset=12
                      local.tee 8
                      i32.const 1
                      i32.and
                      br_if 0 (;@9;)
                      local.get 8
                      i32.const 1
                      i32.shr_u
                      local.get 5
                      i32.eq
                      br_if 3 (;@6;)
                    end
                    i32.const 0
                    i32.const 0
                    i32.load offset=1053704
                    local.tee 0
                    local.get 6
                    local.get 0
                    local.get 6
                    i32.lt_u
                    select
                    i32.store offset=1053704
                    local.get 6
                    local.get 9
                    i32.add
                    local.set 8
                    i32.const 1053388
                    local.set 0
                    block  ;; label = @9
                      block  ;; label = @10
                        block  ;; label = @11
                          loop  ;; label = @12
                            local.get 0
                            i32.load
                            local.tee 7
                            local.get 8
                            i32.eq
                            br_if 1 (;@11;)
                            local.get 0
                            i32.load offset=8
                            local.tee 0
                            br_if 0 (;@12;)
                            br 2 (;@10;)
                          end
                        end
                        local.get 0
                        i32.load offset=12
                        local.tee 8
                        i32.const 1
                        i32.and
                        br_if 0 (;@10;)
                        local.get 8
                        i32.const 1
                        i32.shr_u
                        local.get 5
                        i32.eq
                        br_if 1 (;@9;)
                      end
                      i32.const 1053388
                      local.set 0
                      block  ;; label = @10
                        loop  ;; label = @11
                          block  ;; label = @12
                            local.get 0
                            i32.load
                            local.tee 8
                            local.get 2
                            i32.gt_u
                            br_if 0 (;@12;)
                            local.get 2
                            local.get 8
                            local.get 0
                            i32.load offset=4
                            i32.add
                            local.tee 8
                            i32.lt_u
                            br_if 2 (;@10;)
                          end
                          local.get 0
                          i32.load offset=8
                          local.set 0
                          br 0 (;@11;)
                        end
                      end
                      i32.const 0
                      local.get 6
                      i32.const 15
                      i32.add
                      i32.const -8
                      i32.and
                      local.tee 0
                      i32.const -8
                      i32.add
                      local.tee 7
                      i32.store offset=1053688
                      i32.const 0
                      local.get 6
                      local.get 0
                      i32.sub
                      local.get 9
                      i32.const -40
                      i32.add
                      local.tee 0
                      i32.add
                      i32.const 8
                      i32.add
                      local.tee 4
                      i32.store offset=1053680
                      local.get 7
                      local.get 4
                      i32.const 1
                      i32.or
                      i32.store offset=4
                      local.get 6
                      local.get 0
                      i32.add
                      i32.const 40
                      i32.store offset=4
                      i32.const 0
                      i32.const 2097152
                      i32.store offset=1053700
                      local.get 2
                      local.get 8
                      i32.const -32
                      i32.add
                      i32.const -8
                      i32.and
                      i32.const -8
                      i32.add
                      local.tee 0
                      local.get 0
                      local.get 2
                      i32.const 16
                      i32.add
                      i32.lt_u
                      select
                      local.tee 7
                      i32.const 27
                      i32.store offset=4
                      i32.const 0
                      i64.load offset=1053388 align=4
                      local.set 10
                      local.get 7
                      i32.const 16
                      i32.add
                      i32.const 0
                      i64.load offset=1053396 align=4
                      i64.store align=4
                      local.get 7
                      i32.const 8
                      i32.add
                      local.tee 0
                      local.get 10
                      i64.store align=4
                      i32.const 0
                      local.get 5
                      i32.store offset=1053400
                      i32.const 0
                      local.get 9
                      i32.store offset=1053392
                      i32.const 0
                      local.get 6
                      i32.store offset=1053388
                      i32.const 0
                      local.get 0
                      i32.store offset=1053396
                      local.get 7
                      i32.const 28
                      i32.add
                      local.set 0
                      loop  ;; label = @10
                        local.get 0
                        i32.const 7
                        i32.store
                        local.get 0
                        i32.const 4
                        i32.add
                        local.tee 0
                        local.get 8
                        i32.lt_u
                        br_if 0 (;@10;)
                      end
                      local.get 7
                      local.get 2
                      i32.eq
                      br_if 7 (;@2;)
                      local.get 7
                      local.get 7
                      i32.load offset=4
                      i32.const -2
                      i32.and
                      i32.store offset=4
                      local.get 2
                      local.get 7
                      local.get 2
                      i32.sub
                      local.tee 0
                      i32.const 1
                      i32.or
                      i32.store offset=4
                      local.get 7
                      local.get 0
                      i32.store
                      block  ;; label = @10
                        local.get 0
                        i32.const 256
                        i32.lt_u
                        br_if 0 (;@10;)
                        local.get 2
                        local.get 0
                        call $_RNvMs0_NtCsgufDigEqR9A_8dlmalloc8dlmallocINtB5_8DlmallocNtNtB7_3sys6SystemE18insert_large_chunkCseKMvW2SdwUu_3std
                        br 8 (;@2;)
                      end
                      block  ;; label = @10
                        block  ;; label = @11
                          i32.const 0
                          i32.load offset=1053668
                          local.tee 8
                          i32.const 1
                          local.get 0
                          i32.const 3
                          i32.shr_u
                          i32.shl
                          local.tee 6
                          i32.and
                          br_if 0 (;@11;)
                          i32.const 0
                          local.get 8
                          local.get 6
                          i32.or
                          i32.store offset=1053668
                          local.get 0
                          i32.const 248
                          i32.and
                          i32.const 1053404
                          i32.add
                          local.tee 0
                          local.set 8
                          br 1 (;@10;)
                        end
                        local.get 0
                        i32.const 248
                        i32.and
                        local.tee 0
                        i32.const 1053404
                        i32.add
                        local.set 8
                        local.get 0
                        i32.const 1053412
                        i32.add
                        i32.load
                        local.set 0
                      end
                      local.get 8
                      local.get 2
                      i32.store offset=8
                      local.get 0
                      local.get 2
                      i32.store offset=12
                      local.get 2
                      local.get 8
                      i32.store offset=12
                      local.get 2
                      local.get 0
                      i32.store offset=8
                      br 7 (;@2;)
                    end
                    local.get 0
                    local.get 6
                    i32.store
                    local.get 0
                    local.get 0
                    i32.load offset=4
                    local.get 9
                    i32.add
                    i32.store offset=4
                    local.get 6
                    i32.const 15
                    i32.add
                    i32.const -8
                    i32.and
                    i32.const -8
                    i32.add
                    local.tee 8
                    local.get 3
                    i32.const 3
                    i32.or
                    i32.store offset=4
                    local.get 7
                    i32.const 15
                    i32.add
                    i32.const -8
                    i32.and
                    i32.const -8
                    i32.add
                    local.tee 2
                    local.get 8
                    local.get 3
                    i32.add
                    local.tee 0
                    i32.sub
                    local.set 3
                    local.get 2
                    i32.const 0
                    i32.load offset=1053688
                    i32.eq
                    br_if 3 (;@5;)
                    local.get 2
                    i32.const 0
                    i32.load offset=1053684
                    i32.eq
                    br_if 4 (;@4;)
                    block  ;; label = @9
                      local.get 2
                      i32.load offset=4
                      local.tee 6
                      i32.const 3
                      i32.and
                      i32.const 1
                      i32.ne
                      br_if 0 (;@9;)
                      local.get 2
                      local.get 6
                      i32.const -8
                      i32.and
                      local.tee 6
                      call $_RNvMs0_NtCsgufDigEqR9A_8dlmalloc8dlmallocINtB5_8DlmallocNtNtB7_3sys6SystemE12unlink_chunkCseKMvW2SdwUu_3std
                      local.get 6
                      local.get 3
                      i32.add
                      local.set 3
                      local.get 2
                      local.get 6
                      i32.add
                      local.tee 2
                      i32.load offset=4
                      local.set 6
                    end
                    local.get 2
                    local.get 6
                    i32.const -2
                    i32.and
                    i32.store offset=4
                    local.get 0
                    local.get 3
                    i32.const 1
                    i32.or
                    i32.store offset=4
                    local.get 0
                    local.get 3
                    i32.add
                    local.get 3
                    i32.store
                    block  ;; label = @9
                      local.get 3
                      i32.const 256
                      i32.lt_u
                      br_if 0 (;@9;)
                      local.get 0
                      local.get 3
                      call $_RNvMs0_NtCsgufDigEqR9A_8dlmalloc8dlmallocINtB5_8DlmallocNtNtB7_3sys6SystemE18insert_large_chunkCseKMvW2SdwUu_3std
                      br 6 (;@3;)
                    end
                    block  ;; label = @9
                      block  ;; label = @10
                        i32.const 0
                        i32.load offset=1053668
                        local.tee 2
                        i32.const 1
                        local.get 3
                        i32.const 3
                        i32.shr_u
                        i32.shl
                        local.tee 6
                        i32.and
                        br_if 0 (;@10;)
                        i32.const 0
                        local.get 2
                        local.get 6
                        i32.or
                        i32.store offset=1053668
                        local.get 3
                        i32.const 248
                        i32.and
                        i32.const 1053404
                        i32.add
                        local.tee 3
                        local.set 2
                        br 1 (;@9;)
                      end
                      local.get 3
                      i32.const 248
                      i32.and
                      local.tee 3
                      i32.const 1053404
                      i32.add
                      local.set 2
                      local.get 3
                      i32.const 1053412
                      i32.add
                      i32.load
                      local.set 3
                    end
                    local.get 2
                    local.get 0
                    i32.store offset=8
                    local.get 3
                    local.get 0
                    i32.store offset=12
                    local.get 0
                    local.get 2
                    i32.store offset=12
                    local.get 0
                    local.get 3
                    i32.store offset=8
                    br 5 (;@3;)
                  end
                  i32.const 0
                  local.get 0
                  local.get 3
                  i32.sub
                  local.tee 2
                  i32.store offset=1053680
                  i32.const 0
                  i32.const 0
                  i32.load offset=1053688
                  local.tee 0
                  local.get 3
                  i32.add
                  local.tee 8
                  i32.store offset=1053688
                  local.get 8
                  local.get 2
                  i32.const 1
                  i32.or
                  i32.store offset=4
                  local.get 0
                  local.get 3
                  i32.const 3
                  i32.or
                  i32.store offset=4
                  local.get 0
                  i32.const 8
                  i32.add
                  local.set 0
                  br 6 (;@1;)
                end
                i32.const 0
                i32.load offset=1053684
                local.set 2
                block  ;; label = @7
                  block  ;; label = @8
                    local.get 0
                    local.get 3
                    i32.sub
                    local.tee 8
                    i32.const 15
                    i32.gt_u
                    br_if 0 (;@8;)
                    i32.const 0
                    i32.const 0
                    i32.store offset=1053684
                    i32.const 0
                    i32.const 0
                    i32.store offset=1053676
                    local.get 2
                    local.get 0
                    i32.const 3
                    i32.or
                    i32.store offset=4
                    local.get 2
                    local.get 0
                    i32.add
                    local.tee 0
                    local.get 0
                    i32.load offset=4
                    i32.const 1
                    i32.or
                    i32.store offset=4
                    br 1 (;@7;)
                  end
                  i32.const 0
                  local.get 8
                  i32.store offset=1053676
                  i32.const 0
                  local.get 2
                  local.get 3
                  i32.add
                  local.tee 6
                  i32.store offset=1053684
                  local.get 6
                  local.get 8
                  i32.const 1
                  i32.or
                  i32.store offset=4
                  local.get 2
                  local.get 0
                  i32.add
                  local.get 8
                  i32.store
                  local.get 2
                  local.get 3
                  i32.const 3
                  i32.or
                  i32.store offset=4
                end
                local.get 2
                i32.const 8
                i32.add
                local.set 0
                br 5 (;@1;)
              end
              local.get 0
              local.get 7
              local.get 9
              i32.add
              i32.store offset=4
              i32.const 0
              i32.const 0
              i32.load offset=1053688
              local.tee 0
              i32.const 15
              i32.add
              i32.const -8
              i32.and
              local.tee 2
              i32.const -8
              i32.add
              local.tee 8
              i32.store offset=1053688
              i32.const 0
              local.get 0
              local.get 2
              i32.sub
              i32.const 0
              i32.load offset=1053680
              local.get 9
              i32.add
              local.tee 2
              i32.add
              i32.const 8
              i32.add
              local.tee 6
              i32.store offset=1053680
              local.get 8
              local.get 6
              i32.const 1
              i32.or
              i32.store offset=4
              local.get 0
              local.get 2
              i32.add
              i32.const 40
              i32.store offset=4
              i32.const 0
              i32.const 2097152
              i32.store offset=1053700
              br 3 (;@2;)
            end
            i32.const 0
            local.get 0
            i32.store offset=1053688
            i32.const 0
            i32.const 0
            i32.load offset=1053680
            local.get 3
            i32.add
            local.tee 3
            i32.store offset=1053680
            local.get 0
            local.get 3
            i32.const 1
            i32.or
            i32.store offset=4
            br 1 (;@3;)
          end
          i32.const 0
          local.get 0
          i32.store offset=1053684
          i32.const 0
          i32.const 0
          i32.load offset=1053676
          local.get 3
          i32.add
          local.tee 3
          i32.store offset=1053676
          local.get 0
          local.get 3
          i32.const 1
          i32.or
          i32.store offset=4
          local.get 0
          local.get 3
          i32.add
          local.get 3
          i32.store
        end
        local.get 8
        i32.const 8
        i32.add
        local.set 0
        br 1 (;@1;)
      end
      i32.const 0
      local.set 0
      i32.const 0
      i32.load offset=1053680
      local.tee 2
      local.get 3
      i32.le_u
      br_if 0 (;@1;)
      i32.const 0
      local.get 2
      local.get 3
      i32.sub
      local.tee 2
      i32.store offset=1053680
      i32.const 0
      i32.const 0
      i32.load offset=1053688
      local.tee 0
      local.get 3
      i32.add
      local.tee 8
      i32.store offset=1053688
      local.get 8
      local.get 2
      i32.const 1
      i32.or
      i32.store offset=4
      local.get 0
      local.get 3
      i32.const 3
      i32.or
      i32.store offset=4
      local.get 0
      i32.const 8
      i32.add
      local.set 0
    end
    local.get 1
    i32.const 16
    i32.add
    global.set $__stack_pointer
    local.get 0)
  (func $_RNvCsfFJ77F7ERra_7___rustc12___rust_abort (type 4)
    unreachable)
  (func $_RNvCsfFJ77F7ERra_7___rustc13___rdl_dealloc (type 6) (param i32 i32 i32)
    (local i32 i32)
    block  ;; label = @1
      block  ;; label = @2
        local.get 0
        i32.const -4
        i32.add
        i32.load
        local.tee 3
        i32.const -8
        i32.and
        local.tee 4
        i32.const 4
        i32.const 8
        local.get 3
        i32.const 3
        i32.and
        local.tee 3
        select
        local.get 1
        i32.add
        i32.lt_u
        br_if 0 (;@2;)
        block  ;; label = @3
          local.get 3
          i32.eqz
          br_if 0 (;@3;)
          local.get 4
          local.get 1
          i32.const 39
          i32.add
          i32.gt_u
          br_if 2 (;@1;)
        end
        local.get 0
        call $_RNvMs0_NtCsgufDigEqR9A_8dlmalloc8dlmallocINtB5_8DlmallocNtNtB7_3sys6SystemE4freeCseKMvW2SdwUu_3std
        return
      end
      i32.const 1050764
      i32.const 46
      i32.const 1050812
      call $_RNvNtCs7RAXWwMZhcx_4core9panicking5panic
      unreachable
    end
    i32.const 1050828
    i32.const 46
    i32.const 1050876
    call $_RNvNtCs7RAXWwMZhcx_4core9panicking5panic
    unreachable)
  (func $_RNvMs0_NtCsgufDigEqR9A_8dlmalloc8dlmallocINtB5_8DlmallocNtNtB7_3sys6SystemE4freeCseKMvW2SdwUu_3std (type 1) (param i32)
    (local i32 i32 i32 i32)
    local.get 0
    i32.const -8
    i32.add
    local.tee 1
    local.get 0
    i32.const -4
    i32.add
    i32.load
    local.tee 2
    i32.const -8
    i32.and
    local.tee 0
    i32.add
    local.set 3
    block  ;; label = @1
      block  ;; label = @2
        local.get 2
        i32.const 1
        i32.and
        br_if 0 (;@2;)
        local.get 2
        i32.const 2
        i32.and
        i32.eqz
        br_if 1 (;@1;)
        local.get 1
        i32.load
        local.tee 2
        local.get 0
        i32.add
        local.set 0
        block  ;; label = @3
          local.get 1
          local.get 2
          i32.sub
          local.tee 1
          i32.const 0
          i32.load offset=1053684
          i32.ne
          br_if 0 (;@3;)
          local.get 3
          i32.load offset=4
          i32.const 3
          i32.and
          i32.const 3
          i32.ne
          br_if 1 (;@2;)
          i32.const 0
          local.get 0
          i32.store offset=1053676
          local.get 3
          local.get 3
          i32.load offset=4
          i32.const -2
          i32.and
          i32.store offset=4
          local.get 1
          local.get 0
          i32.const 1
          i32.or
          i32.store offset=4
          local.get 3
          local.get 0
          i32.store
          return
        end
        local.get 1
        local.get 2
        call $_RNvMs0_NtCsgufDigEqR9A_8dlmalloc8dlmallocINtB5_8DlmallocNtNtB7_3sys6SystemE12unlink_chunkCseKMvW2SdwUu_3std
      end
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              block  ;; label = @6
                block  ;; label = @7
                  block  ;; label = @8
                    block  ;; label = @9
                      local.get 3
                      i32.load offset=4
                      local.tee 2
                      i32.const 2
                      i32.and
                      br_if 0 (;@9;)
                      local.get 3
                      i32.const 0
                      i32.load offset=1053688
                      i32.eq
                      br_if 2 (;@7;)
                      local.get 3
                      i32.const 0
                      i32.load offset=1053684
                      i32.eq
                      br_if 3 (;@6;)
                      local.get 3
                      local.get 2
                      i32.const -8
                      i32.and
                      local.tee 2
                      call $_RNvMs0_NtCsgufDigEqR9A_8dlmalloc8dlmallocINtB5_8DlmallocNtNtB7_3sys6SystemE12unlink_chunkCseKMvW2SdwUu_3std
                      local.get 1
                      local.get 2
                      local.get 0
                      i32.add
                      local.tee 0
                      i32.const 1
                      i32.or
                      i32.store offset=4
                      local.get 1
                      local.get 0
                      i32.add
                      local.get 0
                      i32.store
                      local.get 1
                      i32.const 0
                      i32.load offset=1053684
                      i32.ne
                      br_if 1 (;@8;)
                      i32.const 0
                      local.get 0
                      i32.store offset=1053676
                      return
                    end
                    local.get 3
                    local.get 2
                    i32.const -2
                    i32.and
                    i32.store offset=4
                    local.get 1
                    local.get 0
                    i32.const 1
                    i32.or
                    i32.store offset=4
                    local.get 1
                    local.get 0
                    i32.add
                    local.get 0
                    i32.store
                  end
                  local.get 0
                  i32.const 256
                  i32.lt_u
                  br_if 4 (;@3;)
                  local.get 1
                  local.get 0
                  call $_RNvMs0_NtCsgufDigEqR9A_8dlmalloc8dlmallocINtB5_8DlmallocNtNtB7_3sys6SystemE18insert_large_chunkCseKMvW2SdwUu_3std
                  i32.const 0
                  i32.const 0
                  i32.load offset=1053708
                  i32.const -1
                  i32.add
                  local.tee 1
                  i32.store offset=1053708
                  local.get 1
                  br_if 6 (;@1;)
                  i32.const 0
                  i32.load offset=1053396
                  local.tee 0
                  br_if 2 (;@5;)
                  i32.const 4095
                  local.set 1
                  br 3 (;@4;)
                end
                i32.const 0
                local.get 1
                i32.store offset=1053688
                i32.const 0
                i32.const 0
                i32.load offset=1053680
                local.get 0
                i32.add
                local.tee 0
                i32.store offset=1053680
                local.get 1
                local.get 0
                i32.const 1
                i32.or
                i32.store offset=4
                block  ;; label = @7
                  local.get 1
                  i32.const 0
                  i32.load offset=1053684
                  i32.ne
                  br_if 0 (;@7;)
                  i32.const 0
                  i32.const 0
                  i32.store offset=1053676
                  i32.const 0
                  i32.const 0
                  i32.store offset=1053684
                end
                local.get 0
                i32.const 0
                i32.load offset=1053700
                local.tee 2
                i32.le_u
                br_if 5 (;@1;)
                i32.const 0
                i32.load offset=1053688
                local.tee 0
                i32.eqz
                br_if 5 (;@1;)
                i32.const 0
                i32.load offset=1053680
                local.tee 4
                i32.const 41
                i32.lt_u
                br_if 4 (;@2;)
                i32.const 1053388
                local.set 1
                loop  ;; label = @7
                  block  ;; label = @8
                    local.get 1
                    i32.load
                    local.tee 3
                    local.get 0
                    i32.gt_u
                    br_if 0 (;@8;)
                    local.get 0
                    local.get 3
                    local.get 1
                    i32.load offset=4
                    i32.add
                    i32.lt_u
                    br_if 6 (;@2;)
                  end
                  local.get 1
                  i32.load offset=8
                  local.set 1
                  br 0 (;@7;)
                end
              end
              i32.const 0
              local.get 1
              i32.store offset=1053684
              i32.const 0
              i32.const 0
              i32.load offset=1053676
              local.get 0
              i32.add
              local.tee 0
              i32.store offset=1053676
              local.get 1
              local.get 0
              i32.const 1
              i32.or
              i32.store offset=4
              local.get 1
              local.get 0
              i32.add
              local.get 0
              i32.store
              return
            end
            i32.const 0
            local.set 1
            loop  ;; label = @5
              local.get 1
              i32.const 1
              i32.add
              local.set 1
              local.get 0
              i32.load offset=8
              local.tee 0
              br_if 0 (;@5;)
            end
            local.get 1
            i32.const 4095
            local.get 1
            i32.const 4095
            i32.gt_u
            select
            local.set 1
          end
          i32.const 0
          local.get 1
          i32.store offset=1053708
          return
        end
        block  ;; label = @3
          block  ;; label = @4
            i32.const 0
            i32.load offset=1053668
            local.tee 3
            i32.const 1
            local.get 0
            i32.const 3
            i32.shr_u
            i32.shl
            local.tee 2
            i32.and
            br_if 0 (;@4;)
            i32.const 0
            local.get 3
            local.get 2
            i32.or
            i32.store offset=1053668
            local.get 0
            i32.const 248
            i32.and
            i32.const 1053404
            i32.add
            local.tee 0
            local.set 3
            br 1 (;@3;)
          end
          local.get 0
          i32.const 248
          i32.and
          local.tee 0
          i32.const 1053404
          i32.add
          local.set 3
          local.get 0
          i32.const 1053412
          i32.add
          i32.load
          local.set 0
        end
        local.get 3
        local.get 1
        i32.store offset=8
        local.get 0
        local.get 1
        i32.store offset=12
        local.get 1
        local.get 3
        i32.store offset=12
        local.get 1
        local.get 0
        i32.store offset=8
        return
      end
      block  ;; label = @2
        block  ;; label = @3
          i32.const 0
          i32.load offset=1053396
          local.tee 0
          br_if 0 (;@3;)
          i32.const 4095
          local.set 1
          br 1 (;@2;)
        end
        i32.const 0
        local.set 1
        loop  ;; label = @3
          local.get 1
          i32.const 1
          i32.add
          local.set 1
          local.get 0
          i32.load offset=8
          local.tee 0
          br_if 0 (;@3;)
        end
        local.get 1
        i32.const 4095
        local.get 1
        i32.const 4095
        i32.gt_u
        select
        local.set 1
      end
      i32.const 0
      local.get 1
      i32.store offset=1053708
      local.get 4
      local.get 2
      i32.le_u
      br_if 0 (;@1;)
      i32.const 0
      i32.const -1
      i32.store offset=1053700
    end)
  (func $_RNvCsfFJ77F7ERra_7___rustc13___rdl_realloc (type 7) (param i32 i32 i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32)
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              block  ;; label = @6
                block  ;; label = @7
                  block  ;; label = @8
                    local.get 0
                    i32.const -4
                    i32.add
                    local.tee 4
                    i32.load
                    local.tee 5
                    i32.const -8
                    i32.and
                    local.tee 6
                    i32.const 4
                    i32.const 8
                    local.get 5
                    i32.const 3
                    i32.and
                    local.tee 7
                    select
                    local.get 1
                    i32.add
                    i32.lt_u
                    br_if 0 (;@8;)
                    local.get 1
                    i32.const 39
                    i32.add
                    local.set 8
                    block  ;; label = @9
                      local.get 7
                      i32.eqz
                      br_if 0 (;@9;)
                      local.get 6
                      local.get 8
                      i32.gt_u
                      br_if 2 (;@7;)
                    end
                    block  ;; label = @9
                      block  ;; label = @10
                        local.get 2
                        i32.const 9
                        i32.lt_u
                        br_if 0 (;@10;)
                        local.get 2
                        local.get 3
                        call $_RNvMs0_NtCsgufDigEqR9A_8dlmalloc8dlmallocINtB5_8DlmallocNtNtB7_3sys6SystemE8memalignCseKMvW2SdwUu_3std
                        local.tee 2
                        br_if 1 (;@9;)
                        i32.const 0
                        return
                      end
                      i32.const 0
                      local.set 2
                      local.get 3
                      i32.const -65588
                      i32.gt_u
                      br_if 8 (;@1;)
                      i32.const 16
                      local.get 3
                      i32.const 11
                      i32.add
                      i32.const -8
                      i32.and
                      local.get 3
                      i32.const 11
                      i32.lt_u
                      select
                      local.set 1
                      local.get 0
                      i32.const -8
                      i32.add
                      local.set 8
                      block  ;; label = @10
                        local.get 7
                        br_if 0 (;@10;)
                        local.get 1
                        i32.const 256
                        i32.lt_u
                        br_if 7 (;@3;)
                        local.get 8
                        i32.eqz
                        br_if 7 (;@3;)
                        local.get 6
                        local.get 1
                        i32.le_u
                        br_if 7 (;@3;)
                        local.get 6
                        local.get 1
                        i32.sub
                        i32.const 131072
                        i32.gt_u
                        br_if 7 (;@3;)
                        local.get 0
                        return
                      end
                      local.get 8
                      local.get 6
                      i32.add
                      local.set 7
                      block  ;; label = @10
                        block  ;; label = @11
                          local.get 6
                          local.get 1
                          i32.ge_u
                          br_if 0 (;@11;)
                          local.get 7
                          i32.const 0
                          i32.load offset=1053688
                          i32.eq
                          br_if 1 (;@10;)
                          block  ;; label = @12
                            local.get 7
                            i32.const 0
                            i32.load offset=1053684
                            i32.eq
                            br_if 0 (;@12;)
                            local.get 7
                            i32.load offset=4
                            local.tee 5
                            i32.const 2
                            i32.and
                            br_if 9 (;@3;)
                            local.get 5
                            i32.const -8
                            i32.and
                            local.tee 9
                            local.get 6
                            i32.add
                            local.tee 5
                            local.get 1
                            i32.lt_u
                            br_if 9 (;@3;)
                            local.get 7
                            local.get 9
                            call $_RNvMs0_NtCsgufDigEqR9A_8dlmalloc8dlmallocINtB5_8DlmallocNtNtB7_3sys6SystemE12unlink_chunkCseKMvW2SdwUu_3std
                            block  ;; label = @13
                              local.get 5
                              local.get 1
                              i32.sub
                              local.tee 7
                              i32.const 16
                              i32.lt_u
                              br_if 0 (;@13;)
                              local.get 4
                              local.get 1
                              local.get 4
                              i32.load
                              i32.const 1
                              i32.and
                              i32.or
                              i32.const 2
                              i32.or
                              i32.store
                              local.get 8
                              local.get 1
                              i32.add
                              local.tee 1
                              local.get 7
                              i32.const 3
                              i32.or
                              i32.store offset=4
                              local.get 8
                              local.get 5
                              i32.add
                              local.tee 5
                              local.get 5
                              i32.load offset=4
                              i32.const 1
                              i32.or
                              i32.store offset=4
                              local.get 1
                              local.get 7
                              call $_RNvMs0_NtCsgufDigEqR9A_8dlmalloc8dlmallocINtB5_8DlmallocNtNtB7_3sys6SystemE13dispose_chunkCseKMvW2SdwUu_3std
                              br 9 (;@4;)
                            end
                            local.get 4
                            local.get 5
                            local.get 4
                            i32.load
                            i32.const 1
                            i32.and
                            i32.or
                            i32.const 2
                            i32.or
                            i32.store
                            local.get 8
                            local.get 5
                            i32.add
                            local.tee 1
                            local.get 1
                            i32.load offset=4
                            i32.const 1
                            i32.or
                            i32.store offset=4
                            br 8 (;@4;)
                          end
                          i32.const 0
                          i32.load offset=1053676
                          local.get 6
                          i32.add
                          local.tee 7
                          local.get 1
                          i32.lt_u
                          br_if 8 (;@3;)
                          block  ;; label = @12
                            block  ;; label = @13
                              local.get 7
                              local.get 1
                              i32.sub
                              local.tee 6
                              i32.const 15
                              i32.gt_u
                              br_if 0 (;@13;)
                              local.get 4
                              local.get 5
                              i32.const 1
                              i32.and
                              local.get 7
                              i32.or
                              i32.const 2
                              i32.or
                              i32.store
                              local.get 8
                              local.get 7
                              i32.add
                              local.tee 1
                              local.get 1
                              i32.load offset=4
                              i32.const 1
                              i32.or
                              i32.store offset=4
                              i32.const 0
                              local.set 6
                              i32.const 0
                              local.set 1
                              br 1 (;@12;)
                            end
                            local.get 4
                            local.get 1
                            local.get 5
                            i32.const 1
                            i32.and
                            i32.or
                            i32.const 2
                            i32.or
                            i32.store
                            local.get 8
                            local.get 1
                            i32.add
                            local.tee 1
                            local.get 6
                            i32.const 1
                            i32.or
                            i32.store offset=4
                            local.get 8
                            local.get 7
                            i32.add
                            local.tee 7
                            local.get 6
                            i32.store
                            local.get 7
                            local.get 7
                            i32.load offset=4
                            i32.const -2
                            i32.and
                            i32.store offset=4
                          end
                          i32.const 0
                          local.get 1
                          i32.store offset=1053684
                          i32.const 0
                          local.get 6
                          i32.store offset=1053676
                          br 7 (;@4;)
                        end
                        local.get 6
                        local.get 1
                        i32.sub
                        local.tee 6
                        i32.const 15
                        i32.le_u
                        br_if 6 (;@4;)
                        local.get 4
                        local.get 1
                        local.get 5
                        i32.const 1
                        i32.and
                        i32.or
                        i32.const 2
                        i32.or
                        i32.store
                        local.get 8
                        local.get 1
                        i32.add
                        local.tee 1
                        local.get 6
                        i32.const 3
                        i32.or
                        i32.store offset=4
                        local.get 7
                        local.get 7
                        i32.load offset=4
                        i32.const 1
                        i32.or
                        i32.store offset=4
                        local.get 1
                        local.get 6
                        call $_RNvMs0_NtCsgufDigEqR9A_8dlmalloc8dlmallocINtB5_8DlmallocNtNtB7_3sys6SystemE13dispose_chunkCseKMvW2SdwUu_3std
                        br 6 (;@4;)
                      end
                      i32.const 0
                      i32.load offset=1053680
                      local.get 6
                      i32.add
                      local.tee 7
                      local.get 1
                      i32.gt_u
                      br_if 4 (;@5;)
                      br 6 (;@3;)
                    end
                    block  ;; label = @9
                      local.get 3
                      local.get 1
                      local.get 3
                      local.get 1
                      i32.lt_u
                      select
                      local.tee 3
                      i32.eqz
                      br_if 0 (;@9;)
                      local.get 2
                      local.get 0
                      local.get 3
                      memory.copy
                    end
                    local.get 4
                    i32.load
                    local.tee 3
                    i32.const -8
                    i32.and
                    local.tee 7
                    i32.const 4
                    i32.const 8
                    local.get 3
                    i32.const 3
                    i32.and
                    local.tee 3
                    select
                    local.get 1
                    i32.add
                    i32.lt_u
                    br_if 2 (;@6;)
                    local.get 3
                    i32.eqz
                    br_if 6 (;@2;)
                    local.get 7
                    local.get 8
                    i32.le_u
                    br_if 6 (;@2;)
                    i32.const 1050828
                    i32.const 46
                    i32.const 1050876
                    call $_RNvNtCs7RAXWwMZhcx_4core9panicking5panic
                    unreachable
                  end
                  i32.const 1050764
                  i32.const 46
                  i32.const 1050812
                  call $_RNvNtCs7RAXWwMZhcx_4core9panicking5panic
                  unreachable
                end
                i32.const 1050828
                i32.const 46
                i32.const 1050876
                call $_RNvNtCs7RAXWwMZhcx_4core9panicking5panic
                unreachable
              end
              i32.const 1050764
              i32.const 46
              i32.const 1050812
              call $_RNvNtCs7RAXWwMZhcx_4core9panicking5panic
              unreachable
            end
            local.get 4
            local.get 1
            local.get 5
            i32.const 1
            i32.and
            i32.or
            i32.const 2
            i32.or
            i32.store
            local.get 8
            local.get 1
            i32.add
            local.tee 5
            local.get 7
            local.get 1
            i32.sub
            local.tee 1
            i32.const 1
            i32.or
            i32.store offset=4
            i32.const 0
            local.get 1
            i32.store offset=1053680
            i32.const 0
            local.get 5
            i32.store offset=1053688
          end
          local.get 8
          i32.eqz
          br_if 0 (;@3;)
          local.get 0
          return
        end
        local.get 3
        call $_RNvMs0_NtCsgufDigEqR9A_8dlmalloc8dlmallocINtB5_8DlmallocNtNtB7_3sys6SystemE6mallocCseKMvW2SdwUu_3std
        local.tee 1
        i32.eqz
        br_if 1 (;@1;)
        block  ;; label = @3
          local.get 3
          i32.const -4
          i32.const -8
          local.get 4
          i32.load
          local.tee 2
          i32.const 3
          i32.and
          select
          local.get 2
          i32.const -8
          i32.and
          i32.add
          local.tee 2
          local.get 3
          local.get 2
          i32.lt_u
          select
          local.tee 3
          i32.eqz
          br_if 0 (;@3;)
          local.get 1
          local.get 0
          local.get 3
          memory.copy
        end
        local.get 1
        local.set 2
      end
      local.get 0
      call $_RNvMs0_NtCsgufDigEqR9A_8dlmalloc8dlmallocINtB5_8DlmallocNtNtB7_3sys6SystemE4freeCseKMvW2SdwUu_3std
    end
    local.get 2)
  (func $_RNvMs0_NtCsgufDigEqR9A_8dlmalloc8dlmallocINtB5_8DlmallocNtNtB7_3sys6SystemE12unlink_chunkCseKMvW2SdwUu_3std (type 2) (param i32 i32)
    (local i32 i32 i32 i32)
    local.get 0
    i32.load offset=12
    local.set 2
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            local.get 1
            i32.const 256
            i32.lt_u
            br_if 0 (;@4;)
            local.get 0
            i32.load offset=24
            local.set 3
            block  ;; label = @5
              block  ;; label = @6
                block  ;; label = @7
                  local.get 2
                  local.get 0
                  i32.ne
                  br_if 0 (;@7;)
                  local.get 0
                  i32.const 20
                  i32.const 16
                  local.get 0
                  i32.load offset=20
                  local.tee 2
                  select
                  i32.add
                  i32.load
                  local.tee 1
                  br_if 1 (;@6;)
                  i32.const 0
                  local.set 2
                  br 2 (;@5;)
                end
                local.get 0
                i32.load offset=8
                local.tee 1
                local.get 2
                i32.store offset=12
                local.get 2
                local.get 1
                i32.store offset=8
                br 1 (;@5;)
              end
              local.get 0
              i32.const 20
              i32.add
              local.get 0
              i32.const 16
              i32.add
              local.get 2
              select
              local.set 4
              loop  ;; label = @6
                local.get 4
                local.set 5
                local.get 1
                local.tee 2
                i32.const 20
                i32.add
                local.get 2
                i32.const 16
                i32.add
                local.get 2
                i32.load offset=20
                local.tee 1
                select
                local.set 4
                local.get 2
                i32.const 20
                i32.const 16
                local.get 1
                select
                i32.add
                i32.load
                local.tee 1
                br_if 0 (;@6;)
              end
              local.get 5
              i32.const 0
              i32.store
            end
            local.get 3
            i32.eqz
            br_if 2 (;@2;)
            block  ;; label = @5
              block  ;; label = @6
                local.get 0
                local.get 0
                i32.load offset=28
                i32.const 2
                i32.shl
                i32.const 1053260
                i32.add
                local.tee 1
                i32.load
                i32.eq
                br_if 0 (;@6;)
                local.get 3
                i32.load offset=16
                local.get 0
                i32.eq
                br_if 1 (;@5;)
                local.get 3
                local.get 2
                i32.store offset=20
                local.get 2
                br_if 3 (;@3;)
                br 4 (;@2;)
              end
              local.get 1
              local.get 2
              i32.store
              local.get 2
              i32.eqz
              br_if 4 (;@1;)
              br 2 (;@3;)
            end
            local.get 3
            local.get 2
            i32.store offset=16
            local.get 2
            br_if 1 (;@3;)
            br 2 (;@2;)
          end
          block  ;; label = @4
            local.get 2
            local.get 0
            i32.load offset=8
            local.tee 4
            i32.eq
            br_if 0 (;@4;)
            local.get 4
            local.get 2
            i32.store offset=12
            local.get 2
            local.get 4
            i32.store offset=8
            return
          end
          i32.const 0
          i32.const 0
          i32.load offset=1053668
          i32.const -2
          local.get 1
          i32.const 3
          i32.shr_u
          i32.rotl
          i32.and
          i32.store offset=1053668
          return
        end
        local.get 2
        local.get 3
        i32.store offset=24
        block  ;; label = @3
          local.get 0
          i32.load offset=16
          local.tee 1
          i32.eqz
          br_if 0 (;@3;)
          local.get 2
          local.get 1
          i32.store offset=16
          local.get 1
          local.get 2
          i32.store offset=24
        end
        local.get 0
        i32.load offset=20
        local.tee 1
        i32.eqz
        br_if 0 (;@2;)
        local.get 2
        local.get 1
        i32.store offset=20
        local.get 1
        local.get 2
        i32.store offset=24
        return
      end
      return
    end
    i32.const 0
    i32.const 0
    i32.load offset=1053672
    i32.const -2
    local.get 0
    i32.load offset=28
    i32.rotl
    i32.and
    i32.store offset=1053672)
  (func $_RNvMs0_NtCsgufDigEqR9A_8dlmalloc8dlmallocINtB5_8DlmallocNtNtB7_3sys6SystemE13dispose_chunkCseKMvW2SdwUu_3std (type 2) (param i32 i32)
    (local i32 i32)
    local.get 0
    local.get 1
    i32.add
    local.set 2
    block  ;; label = @1
      block  ;; label = @2
        local.get 0
        i32.load offset=4
        local.tee 3
        i32.const 1
        i32.and
        br_if 0 (;@2;)
        local.get 3
        i32.const 2
        i32.and
        i32.eqz
        br_if 1 (;@1;)
        local.get 0
        i32.load
        local.tee 3
        local.get 1
        i32.add
        local.set 1
        block  ;; label = @3
          local.get 0
          local.get 3
          i32.sub
          local.tee 0
          i32.const 0
          i32.load offset=1053684
          i32.ne
          br_if 0 (;@3;)
          local.get 2
          i32.load offset=4
          i32.const 3
          i32.and
          i32.const 3
          i32.ne
          br_if 1 (;@2;)
          i32.const 0
          local.get 1
          i32.store offset=1053676
          local.get 2
          local.get 2
          i32.load offset=4
          i32.const -2
          i32.and
          i32.store offset=4
          local.get 0
          local.get 1
          i32.const 1
          i32.or
          i32.store offset=4
          local.get 2
          local.get 1
          i32.store
          br 2 (;@1;)
        end
        local.get 0
        local.get 3
        call $_RNvMs0_NtCsgufDigEqR9A_8dlmalloc8dlmallocINtB5_8DlmallocNtNtB7_3sys6SystemE12unlink_chunkCseKMvW2SdwUu_3std
      end
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              local.get 2
              i32.load offset=4
              local.tee 3
              i32.const 2
              i32.and
              br_if 0 (;@5;)
              local.get 2
              i32.const 0
              i32.load offset=1053688
              i32.eq
              br_if 2 (;@3;)
              local.get 2
              i32.const 0
              i32.load offset=1053684
              i32.eq
              br_if 3 (;@2;)
              local.get 2
              local.get 3
              i32.const -8
              i32.and
              local.tee 3
              call $_RNvMs0_NtCsgufDigEqR9A_8dlmalloc8dlmallocINtB5_8DlmallocNtNtB7_3sys6SystemE12unlink_chunkCseKMvW2SdwUu_3std
              local.get 0
              local.get 3
              local.get 1
              i32.add
              local.tee 1
              i32.const 1
              i32.or
              i32.store offset=4
              local.get 0
              local.get 1
              i32.add
              local.get 1
              i32.store
              local.get 0
              i32.const 0
              i32.load offset=1053684
              i32.ne
              br_if 1 (;@4;)
              i32.const 0
              local.get 1
              i32.store offset=1053676
              return
            end
            local.get 2
            local.get 3
            i32.const -2
            i32.and
            i32.store offset=4
            local.get 0
            local.get 1
            i32.const 1
            i32.or
            i32.store offset=4
            local.get 0
            local.get 1
            i32.add
            local.get 1
            i32.store
          end
          block  ;; label = @4
            local.get 1
            i32.const 256
            i32.lt_u
            br_if 0 (;@4;)
            local.get 0
            local.get 1
            call $_RNvMs0_NtCsgufDigEqR9A_8dlmalloc8dlmallocINtB5_8DlmallocNtNtB7_3sys6SystemE18insert_large_chunkCseKMvW2SdwUu_3std
            return
          end
          block  ;; label = @4
            block  ;; label = @5
              i32.const 0
              i32.load offset=1053668
              local.tee 2
              i32.const 1
              local.get 1
              i32.const 3
              i32.shr_u
              i32.shl
              local.tee 3
              i32.and
              br_if 0 (;@5;)
              i32.const 0
              local.get 2
              local.get 3
              i32.or
              i32.store offset=1053668
              local.get 1
              i32.const 248
              i32.and
              i32.const 1053404
              i32.add
              local.tee 1
              local.set 2
              br 1 (;@4;)
            end
            local.get 1
            i32.const 248
            i32.and
            local.tee 1
            i32.const 1053404
            i32.add
            local.set 2
            local.get 1
            i32.const 1053412
            i32.add
            i32.load
            local.set 1
          end
          local.get 2
          local.get 0
          i32.store offset=8
          local.get 1
          local.get 0
          i32.store offset=12
          local.get 0
          local.get 2
          i32.store offset=12
          local.get 0
          local.get 1
          i32.store offset=8
          return
        end
        i32.const 0
        local.get 0
        i32.store offset=1053688
        i32.const 0
        i32.const 0
        i32.load offset=1053680
        local.get 1
        i32.add
        local.tee 1
        i32.store offset=1053680
        local.get 0
        local.get 1
        i32.const 1
        i32.or
        i32.store offset=4
        local.get 0
        i32.const 0
        i32.load offset=1053684
        i32.ne
        br_if 1 (;@1;)
        i32.const 0
        i32.const 0
        i32.store offset=1053676
        i32.const 0
        i32.const 0
        i32.store offset=1053684
        return
      end
      i32.const 0
      local.get 0
      i32.store offset=1053684
      i32.const 0
      i32.const 0
      i32.load offset=1053676
      local.get 1
      i32.add
      local.tee 1
      i32.store offset=1053676
      local.get 0
      local.get 1
      i32.const 1
      i32.or
      i32.store offset=4
      local.get 0
      local.get 1
      i32.add
      local.get 1
      i32.store
      return
    end)
  (func $_RNvCsfFJ77F7ERra_7___rustc17rust_begin_unwind (type 1) (param i32)
    (local i32 i64)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 1
    global.set $__stack_pointer
    local.get 0
    i64.load align=4
    local.set 2
    local.get 1
    local.get 0
    i32.store offset=12
    local.get 1
    local.get 2
    i64.store offset=4 align=4
    local.get 1
    i32.const 4
    i32.add
    call $_RINvNtNtCseKMvW2SdwUu_3std3sys9backtrace26___rust_end_short_backtraceNCNvNtB6_9panicking13panic_handler0zEB6_
    unreachable)
  (func $_RNvCsfFJ77F7ERra_7___rustc18___rdl_alloc_zeroed (type 0) (param i32 i32) (result i32)
    block  ;; label = @1
      block  ;; label = @2
        local.get 1
        i32.const 9
        i32.lt_u
        br_if 0 (;@2;)
        local.get 1
        local.get 0
        call $_RNvMs0_NtCsgufDigEqR9A_8dlmalloc8dlmallocINtB5_8DlmallocNtNtB7_3sys6SystemE8memalignCseKMvW2SdwUu_3std
        local.set 1
        br 1 (;@1;)
      end
      local.get 0
      call $_RNvMs0_NtCsgufDigEqR9A_8dlmalloc8dlmallocINtB5_8DlmallocNtNtB7_3sys6SystemE6mallocCseKMvW2SdwUu_3std
      local.set 1
    end
    block  ;; label = @1
      local.get 1
      i32.eqz
      br_if 0 (;@1;)
      local.get 1
      i32.const -4
      i32.add
      i32.load8_u
      i32.const 3
      i32.and
      i32.eqz
      br_if 0 (;@1;)
      local.get 0
      i32.eqz
      br_if 0 (;@1;)
      local.get 1
      i32.const 0
      local.get 0
      memory.fill
    end
    local.get 1)
  (func $_RNvCsfFJ77F7ERra_7___rustc26___rust_alloc_error_handler (type 2) (param i32 i32)
    local.get 1
    local.get 0
    call $_RNvNtCseKMvW2SdwUu_3std5alloc8rust_oom
    unreachable)
  (func $_RNvNtCseKMvW2SdwUu_3std5alloc8rust_oom (type 2) (param i32 i32)
    (local i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    local.get 2
    local.get 1
    i32.store offset=12
    local.get 2
    local.get 0
    i32.store offset=8
    local.get 2
    i32.const 8
    i32.add
    call $_RINvNtNtCseKMvW2SdwUu_3std3sys9backtrace26___rust_end_short_backtraceNCNvNtB6_5alloc8rust_oom0zEB6_
    unreachable)
  (func $_RNvMs0_NtCsgufDigEqR9A_8dlmalloc8dlmallocINtB5_8DlmallocNtNtB7_3sys6SystemE18insert_large_chunkCseKMvW2SdwUu_3std (type 2) (param i32 i32)
    (local i32 i32 i32 i32)
    i32.const 0
    local.set 2
    block  ;; label = @1
      local.get 1
      i32.const 8
      i32.shr_u
      local.tee 3
      i32.eqz
      br_if 0 (;@1;)
      i32.const 31
      local.set 2
      local.get 1
      i32.const 16777216
      i32.ge_u
      br_if 0 (;@1;)
      local.get 1
      i32.const 38
      local.get 3
      i32.clz
      local.tee 2
      i32.sub
      i32.shr_u
      i32.const 1
      i32.and
      local.get 2
      i32.const 1
      i32.shl
      i32.or
      i32.const 62
      i32.xor
      local.set 2
    end
    local.get 0
    i64.const 0
    i64.store offset=16 align=4
    local.get 0
    local.get 2
    i32.store offset=28
    local.get 2
    i32.const 2
    i32.shl
    i32.const 1053260
    i32.add
    local.set 3
    block  ;; label = @1
      i32.const 0
      i32.load offset=1053672
      i32.const 1
      local.get 2
      i32.shl
      local.tee 4
      i32.and
      br_if 0 (;@1;)
      local.get 3
      local.get 0
      i32.store
      local.get 0
      local.get 3
      i32.store offset=24
      local.get 0
      local.get 0
      i32.store offset=12
      local.get 0
      local.get 0
      i32.store offset=8
      i32.const 0
      i32.const 0
      i32.load offset=1053672
      local.get 4
      i32.or
      i32.store offset=1053672
      return
    end
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          local.get 3
          i32.load
          local.tee 4
          i32.load offset=4
          i32.const -8
          i32.and
          local.get 1
          i32.ne
          br_if 0 (;@3;)
          local.get 4
          local.set 2
          br 1 (;@2;)
        end
        local.get 1
        i32.const 0
        i32.const 25
        local.get 2
        i32.const 1
        i32.shr_u
        i32.sub
        local.get 2
        i32.const 31
        i32.eq
        select
        i32.shl
        local.set 3
        loop  ;; label = @3
          local.get 4
          local.get 3
          i32.const 29
          i32.shr_u
          i32.const 4
          i32.and
          i32.add
          local.tee 5
          i32.load offset=16
          local.tee 2
          i32.eqz
          br_if 2 (;@1;)
          local.get 3
          i32.const 1
          i32.shl
          local.set 3
          local.get 2
          local.set 4
          local.get 2
          i32.load offset=4
          i32.const -8
          i32.and
          local.get 1
          i32.ne
          br_if 0 (;@3;)
        end
      end
      local.get 2
      i32.load offset=8
      local.tee 3
      local.get 0
      i32.store offset=12
      local.get 2
      local.get 0
      i32.store offset=8
      local.get 0
      i32.const 0
      i32.store offset=24
      local.get 0
      local.get 2
      i32.store offset=12
      local.get 0
      local.get 3
      i32.store offset=8
      return
    end
    local.get 5
    i32.const 16
    i32.add
    local.get 0
    i32.store
    local.get 0
    local.get 4
    i32.store offset=24
    local.get 0
    local.get 0
    i32.store offset=12
    local.get 0
    local.get 0
    i32.store offset=8)
  (func $_RNvMs_NtNtNtCseKMvW2SdwUu_3std2io8buffered9bufwriterINtB4_9BufWriterNtNtB8_5stdio9StdoutRawE14write_all_coldBa_ (type 10) (param i32 i32 i32 i32)
    (local i32 i32)
    local.get 1
    i32.load
    local.set 4
    block  ;; label = @1
      local.get 1
      i32.load offset=8
      local.tee 5
      i32.eqz
      br_if 0 (;@1;)
      local.get 3
      local.get 4
      local.get 5
      i32.sub
      i32.le_u
      br_if 0 (;@1;)
      i32.const 0
      local.set 5
      local.get 1
      i32.const 0
      i32.store offset=8
      local.get 1
      i32.const 0
      i32.store8 offset=12
    end
    block  ;; label = @1
      local.get 3
      local.get 4
      i32.ge_u
      br_if 0 (;@1;)
      block  ;; label = @2
        local.get 3
        i32.eqz
        br_if 0 (;@2;)
        local.get 1
        i32.load offset=4
        local.get 5
        i32.add
        local.get 2
        local.get 3
        memory.copy
      end
      local.get 0
      i32.const 4
      i32.store8
      local.get 1
      local.get 5
      local.get 3
      i32.add
      i32.store offset=8
      return
    end
    local.get 1
    i32.const 0
    i32.store8 offset=12
    local.get 0
    i32.const 4
    i32.store)
  (func $_RNvMsn_NtCslUrat6hAxmK_5alloc4syncINtB5_3ArcINtNtNtNtCseKMvW2SdwUu_3std4sync6poison5mutex5MutexINtNtB7_3vec3VechEEE9drop_slowBP_ (type 1) (param i32)
    (local i32)
    block  ;; label = @1
      local.get 0
      i32.load
      local.tee 0
      i32.const 12
      i32.add
      i32.load
      local.tee 1
      i32.eqz
      br_if 0 (;@1;)
      local.get 0
      i32.const 16
      i32.add
      i32.load
      local.get 1
      i32.const 1
      call $_RNvCsfFJ77F7ERra_7___rustc14___rust_dealloc
    end
    block  ;; label = @1
      local.get 0
      i32.const -1
      i32.eq
      br_if 0 (;@1;)
      local.get 0
      local.get 0
      i32.load offset=4
      local.tee 1
      i32.const -1
      i32.add
      i32.store offset=4
      local.get 1
      i32.const 1
      i32.ne
      br_if 0 (;@1;)
      local.get 0
      i32.const 24
      i32.const 4
      call $_RNvCsfFJ77F7ERra_7___rustc14___rust_dealloc
    end)
  (func $_RNvYINtNtCslUrat6hAxmK_5alloc3vec3VechENtNtCseKMvW2SdwUu_3std2io5Write9write_fmtBF_ (type 10) (param i32 i32 i32 i32)
    (local i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 4
    global.set $__stack_pointer
    local.get 0
    i32.const 4
    i32.store8
    local.get 4
    local.get 1
    i32.store offset=8
    local.get 4
    local.get 0
    i64.load align=4
    i64.store
    local.get 4
    i32.const 1050552
    local.get 2
    local.get 3
    call $_RNvNtCs7RAXWwMZhcx_4core3fmt5write
    local.set 1
    local.get 4
    i32.load8_u
    local.set 3
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          local.get 1
          i32.eqz
          br_if 0 (;@3;)
          local.get 3
          i32.const 255
          i32.and
          i32.const 4
          i32.ne
          br_if 1 (;@2;)
          i32.const 1050448
          i32.const 173
          i32.const 1050536
          call $_RNvNtCs7RAXWwMZhcx_4core9panicking9panic_fmt
          unreachable
        end
        local.get 3
        i32.const 255
        i32.and
        i32.const 3
        i32.ne
        br_if 1 (;@1;)
        local.get 4
        i32.load offset=4
        local.tee 0
        i32.load
        local.set 3
        block  ;; label = @3
          local.get 0
          i32.const 4
          i32.add
          i32.load
          local.tee 1
          i32.load
          local.tee 2
          i32.eqz
          br_if 0 (;@3;)
          local.get 3
          local.get 2
          call_indirect (type 1)
        end
        block  ;; label = @3
          local.get 1
          i32.load offset=4
          local.tee 2
          i32.eqz
          br_if 0 (;@3;)
          local.get 3
          local.get 2
          local.get 1
          i32.load offset=8
          call $_RNvCsfFJ77F7ERra_7___rustc14___rust_dealloc
        end
        local.get 0
        i32.const 12
        i32.const 4
        call $_RNvCsfFJ77F7ERra_7___rustc14___rust_dealloc
        br 1 (;@1;)
      end
      local.get 0
      local.get 4
      i64.load
      i64.store align=4
    end
    local.get 4
    i32.const 16
    i32.add
    global.set $__stack_pointer)
  (func $_RNvNtNtCseKMvW2SdwUu_3std9panicking11panic_count8increase (type 11) (param i32) (result i32)
    (local i32 i32)
    i32.const 0
    local.set 1
    i32.const 0
    i32.const 0
    i32.load offset=1053256
    local.tee 2
    i32.const 1
    i32.add
    i32.store offset=1053256
    block  ;; label = @1
      local.get 2
      i32.const 0
      i32.lt_s
      br_if 0 (;@1;)
      i32.const 1
      local.set 1
      i32.const 0
      i32.load8_u offset=1053180
      br_if 0 (;@1;)
      i32.const 0
      local.get 0
      i32.store8 offset=1053180
      i32.const 0
      i32.const 0
      i32.load offset=1053176
      i32.const 1
      i32.add
      i32.store offset=1053176
      i32.const 2
      local.set 1
    end
    local.get 1)
  (func $_RNvNtNtCseKMvW2SdwUu_3std2io5stdio31print_to_buffer_if_capture_used (type 0) (param i32 i32) (result i32)
    (local i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    i32.const 0
    local.set 3
    block  ;; label = @1
      block  ;; label = @2
        i32.const 0
        i32.load8_u offset=1053200
        i32.eqz
        br_if 0 (;@2;)
        i32.const 0
        local.set 3
        i32.const 0
        i32.load offset=1053172
        local.set 4
        i32.const 0
        i32.const 0
        i32.store offset=1053172
        local.get 4
        i32.eqz
        br_if 0 (;@2;)
        local.get 4
        i32.load8_u offset=8
        local.set 3
        local.get 4
        i32.const 1
        i32.store8 offset=8
        local.get 2
        local.get 3
        i32.store8 offset=15
        local.get 3
        i32.const 1
        i32.eq
        br_if 1 (;@1;)
        local.get 2
        local.get 4
        i32.const 12
        i32.add
        local.get 0
        local.get 1
        call $_RNvYINtNtCslUrat6hAxmK_5alloc3vec3VechENtNtCseKMvW2SdwUu_3std2io5Write9write_fmtBF_
        block  ;; label = @3
          local.get 2
          i32.load8_u
          i32.const 3
          i32.ne
          br_if 0 (;@3;)
          local.get 2
          i32.load offset=4
          local.tee 3
          i32.load
          local.set 0
          block  ;; label = @4
            local.get 3
            i32.const 4
            i32.add
            i32.load
            local.tee 1
            i32.load
            local.tee 5
            i32.eqz
            br_if 0 (;@4;)
            local.get 0
            local.get 5
            call_indirect (type 1)
          end
          block  ;; label = @4
            local.get 1
            i32.load offset=4
            local.tee 5
            i32.eqz
            br_if 0 (;@4;)
            local.get 0
            local.get 5
            local.get 1
            i32.load offset=8
            call $_RNvCsfFJ77F7ERra_7___rustc14___rust_dealloc
          end
          local.get 3
          i32.const 12
          i32.const 4
          call $_RNvCsfFJ77F7ERra_7___rustc14___rust_dealloc
        end
        local.get 4
        i32.const 0
        i32.store8 offset=8
        i32.const 0
        i32.load offset=1053172
        local.set 3
        i32.const 0
        local.get 4
        i32.store offset=1053172
        local.get 2
        local.get 3
        i32.store offset=8
        block  ;; label = @3
          local.get 3
          i32.eqz
          br_if 0 (;@3;)
          local.get 3
          local.get 3
          i32.load
          local.tee 4
          i32.const -1
          i32.add
          i32.store
          local.get 4
          i32.const 1
          i32.ne
          br_if 0 (;@3;)
          local.get 2
          i32.const 8
          i32.add
          call $_RNvMsn_NtCslUrat6hAxmK_5alloc4syncINtB5_3ArcINtNtNtNtCseKMvW2SdwUu_3std4sync6poison5mutex5MutexINtNtB7_3vec3VechEEE9drop_slowBP_
        end
        i32.const 1
        local.set 3
      end
      local.get 2
      i32.const 16
      i32.add
      global.set $__stack_pointer
      local.get 3
      return
    end
    i32.const 0
    local.get 2
    i32.const 15
    i32.add
    i32.const 1051792
    i32.const 1051685
    i32.const 65
    i32.const 1051720
    call $_RINvNtCs7RAXWwMZhcx_4core9panicking13assert_failedbbECseKMvW2SdwUu_3std
    unreachable)
  (func $_RNvXso_NtNtCseKMvW2SdwUu_3std2io5stdioRNtB5_6StderrNtB7_5Write9write_fmt (type 10) (param i32 i32 i32 i32)
    (local i32 i32 i64 i64 i64)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 4
    global.set $__stack_pointer
    local.get 1
    i32.load
    i32.load
    local.set 5
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            i32.const 0
            i64.load offset=1053712
            local.tee 6
            i64.const 0
            i64.ne
            br_if 0 (;@4;)
            i32.const 0
            i64.load offset=1053720
            local.set 7
            loop  ;; label = @5
              local.get 7
              i64.const -1
              i64.eq
              br_if 2 (;@3;)
              i32.const 0
              local.get 7
              i64.const 1
              i64.add
              local.tee 6
              i32.const 0
              i64.load offset=1053720
              local.tee 8
              local.get 8
              local.get 7
              i64.eq
              local.tee 1
              select
              i64.store offset=1053720
              local.get 8
              local.set 7
              local.get 1
              i32.eqz
              br_if 0 (;@5;)
            end
            i32.const 0
            local.get 6
            i64.store offset=1053712
          end
          block  ;; label = @4
            block  ;; label = @5
              local.get 6
              local.get 5
              i64.load
              i64.eq
              br_if 0 (;@5;)
              local.get 5
              i32.load8_u offset=12
              local.set 1
              local.get 5
              i32.const 1
              i32.store8 offset=12
              local.get 4
              local.get 1
              i32.store8 offset=16
              local.get 1
              br_if 3 (;@2;)
              local.get 5
              i32.const 1
              i32.store offset=8
              local.get 5
              local.get 6
              i64.store
              br 1 (;@4;)
            end
            local.get 5
            i32.load offset=8
            local.tee 1
            i32.const -1
            i32.eq
            br_if 3 (;@1;)
            local.get 5
            local.get 1
            i32.const 1
            i32.add
            i32.store offset=8
          end
          local.get 4
          local.get 5
          i32.store offset=12
          local.get 0
          i32.const 4
          i32.store8
          local.get 4
          local.get 0
          i64.load align=4
          i64.store offset=16
          local.get 4
          local.get 4
          i32.const 12
          i32.add
          i32.store offset=24
          local.get 4
          i32.const 16
          i32.add
          i32.const 1050576
          local.get 2
          local.get 3
          call $_RNvNtCs7RAXWwMZhcx_4core3fmt5write
          local.set 1
          local.get 4
          i32.load8_u offset=16
          local.set 5
          block  ;; label = @4
            block  ;; label = @5
              block  ;; label = @6
                local.get 1
                i32.eqz
                br_if 0 (;@6;)
                local.get 5
                i32.const 255
                i32.and
                i32.const 4
                i32.ne
                br_if 1 (;@5;)
                i32.const 1050448
                i32.const 173
                i32.const 1050536
                call $_RNvNtCs7RAXWwMZhcx_4core9panicking9panic_fmt
                unreachable
              end
              local.get 5
              i32.const 255
              i32.and
              i32.const 3
              i32.ne
              br_if 1 (;@4;)
              local.get 4
              i32.load offset=20
              local.tee 1
              i32.load
              local.set 0
              block  ;; label = @6
                local.get 1
                i32.const 4
                i32.add
                i32.load
                local.tee 5
                i32.load
                local.tee 3
                i32.eqz
                br_if 0 (;@6;)
                local.get 0
                local.get 3
                call_indirect (type 1)
              end
              block  ;; label = @6
                local.get 5
                i32.load offset=4
                local.tee 3
                i32.eqz
                br_if 0 (;@6;)
                local.get 0
                local.get 3
                local.get 5
                i32.load offset=8
                call $_RNvCsfFJ77F7ERra_7___rustc14___rust_dealloc
              end
              local.get 1
              i32.const 12
              i32.const 4
              call $_RNvCsfFJ77F7ERra_7___rustc14___rust_dealloc
              br 1 (;@4;)
            end
            local.get 0
            local.get 4
            i64.load offset=16
            i64.store align=4
          end
          local.get 4
          i32.load offset=12
          local.tee 1
          local.get 1
          i32.load offset=8
          i32.const -1
          i32.add
          local.tee 5
          i32.store offset=8
          block  ;; label = @4
            local.get 5
            br_if 0 (;@4;)
            local.get 1
            i32.const 0
            i32.store8 offset=12
            local.get 1
            i64.const 0
            i64.store
          end
          local.get 4
          i32.const 32
          i32.add
          global.set $__stack_pointer
          return
        end
        call $_RNvNvMNtNtCseKMvW2SdwUu_3std6thread2idNtB4_8ThreadId3new9exhausted
        unreachable
      end
      i32.const 0
      local.get 4
      i32.const 16
      i32.add
      i32.const 1051792
      i32.const 1051685
      i32.const 65
      i32.const 1051720
      call $_RINvNtCs7RAXWwMZhcx_4core9panicking13assert_failedbbECseKMvW2SdwUu_3std
      unreachable
    end
    i32.const 1051736
    i32.const 38
    i32.const 1051776
    call $_RNvNtCs7RAXWwMZhcx_4core6option13expect_failed
    unreachable)
  (func $_RNvNtNtCseKMvW2SdwUu_3std2io5stdio6__print (type 2) (param i32 i32)
    (local i32)
    global.get $__stack_pointer
    i32.const 48
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    local.get 2
    i32.const 6
    i32.store offset=4
    local.get 2
    i32.const 1051793
    i32.store
    block  ;; label = @1
      block  ;; label = @2
        local.get 0
        local.get 1
        call $_RNvNtNtCseKMvW2SdwUu_3std2io5stdio31print_to_buffer_if_capture_used
        br_if 0 (;@2;)
        block  ;; label = @3
          i32.const 0
          i32.load8_u offset=1053248
          i32.const 3
          i32.eq
          br_if 0 (;@3;)
          call $_RINvMNtNtCseKMvW2SdwUu_3std4sync9once_lockINtB3_8OnceLockINtNtB5_14reentrant_lock13ReentrantLockINtNtCs7RAXWwMZhcx_4core4cell7RefCellINtNtNtNtB7_2io8buffered10linewriter10LineWriterNtNtB2e_5stdio9StdoutRawEEEE10initializeNCINvB2_11get_or_initNCNvB2V_6stdout0E0zEB7_
        end
        local.get 2
        i32.const 1053208
        i32.store offset=20
        local.get 2
        local.get 2
        i32.const 20
        i32.add
        i32.store offset=32
        local.get 2
        i32.const 8
        i32.add
        local.get 2
        i32.const 32
        i32.add
        local.get 0
        local.get 1
        call $_RNvXse_NtNtCseKMvW2SdwUu_3std2io5stdioRNtB5_6StdoutNtB7_5Write9write_fmt
        local.get 2
        i32.load8_u offset=8
        i32.const 4
        i32.ne
        br_if 1 (;@1;)
      end
      local.get 2
      i32.const 48
      i32.add
      global.set $__stack_pointer
      return
    end
    local.get 2
    local.get 2
    i64.load offset=8
    i64.store offset=24
    local.get 2
    i32.const 10
    i64.extend_i32_u
    i64.const 32
    i64.shl
    local.get 2
    i32.const 24
    i32.add
    i64.extend_i32_u
    i64.or
    i64.store offset=40
    local.get 2
    i32.const 11
    i64.extend_i32_u
    i64.const 32
    i64.shl
    local.get 2
    i64.extend_i32_u
    i64.or
    i64.store offset=32
    i32.const 1048853
    local.get 2
    i32.const 32
    i32.add
    i32.const 1050624
    call $_RNvNtCs7RAXWwMZhcx_4core9panicking9panic_fmt
    unreachable)
  (func $_RNvXse_NtNtCseKMvW2SdwUu_3std2io5stdioRNtB5_6StdoutNtB7_5Write9write_fmt (type 10) (param i32 i32 i32 i32)
    (local i32 i32 i64 i64 i64)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 4
    global.set $__stack_pointer
    local.get 1
    i32.load
    i32.load
    local.set 5
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            i32.const 0
            i64.load offset=1053712
            local.tee 6
            i64.const 0
            i64.ne
            br_if 0 (;@4;)
            i32.const 0
            i64.load offset=1053720
            local.set 7
            loop  ;; label = @5
              local.get 7
              i64.const -1
              i64.eq
              br_if 2 (;@3;)
              i32.const 0
              local.get 7
              i64.const 1
              i64.add
              local.tee 6
              i32.const 0
              i64.load offset=1053720
              local.tee 8
              local.get 8
              local.get 7
              i64.eq
              local.tee 1
              select
              i64.store offset=1053720
              local.get 8
              local.set 7
              local.get 1
              i32.eqz
              br_if 0 (;@5;)
            end
            i32.const 0
            local.get 6
            i64.store offset=1053712
          end
          block  ;; label = @4
            block  ;; label = @5
              local.get 6
              local.get 5
              i64.load
              i64.eq
              br_if 0 (;@5;)
              local.get 5
              i32.load8_u offset=12
              local.set 1
              local.get 5
              i32.const 1
              i32.store8 offset=12
              local.get 4
              local.get 1
              i32.store8 offset=16
              local.get 1
              br_if 3 (;@2;)
              local.get 5
              i32.const 1
              i32.store offset=8
              local.get 5
              local.get 6
              i64.store
              br 1 (;@4;)
            end
            local.get 5
            i32.load offset=8
            local.tee 1
            i32.const -1
            i32.eq
            br_if 3 (;@1;)
            local.get 5
            local.get 1
            i32.const 1
            i32.add
            i32.store offset=8
          end
          local.get 4
          local.get 5
          i32.store offset=12
          local.get 0
          i32.const 4
          i32.store8
          local.get 4
          local.get 0
          i64.load align=4
          i64.store offset=16
          local.get 4
          local.get 4
          i32.const 12
          i32.add
          i32.store offset=24
          local.get 4
          i32.const 16
          i32.add
          i32.const 1050600
          local.get 2
          local.get 3
          call $_RNvNtCs7RAXWwMZhcx_4core3fmt5write
          local.set 1
          local.get 4
          i32.load8_u offset=16
          local.set 5
          block  ;; label = @4
            block  ;; label = @5
              block  ;; label = @6
                local.get 1
                i32.eqz
                br_if 0 (;@6;)
                local.get 5
                i32.const 255
                i32.and
                i32.const 4
                i32.ne
                br_if 1 (;@5;)
                i32.const 1050448
                i32.const 173
                i32.const 1050536
                call $_RNvNtCs7RAXWwMZhcx_4core9panicking9panic_fmt
                unreachable
              end
              local.get 5
              i32.const 255
              i32.and
              i32.const 3
              i32.ne
              br_if 1 (;@4;)
              local.get 4
              i32.load offset=20
              local.tee 1
              i32.load
              local.set 0
              block  ;; label = @6
                local.get 1
                i32.const 4
                i32.add
                i32.load
                local.tee 5
                i32.load
                local.tee 3
                i32.eqz
                br_if 0 (;@6;)
                local.get 0
                local.get 3
                call_indirect (type 1)
              end
              block  ;; label = @6
                local.get 5
                i32.load offset=4
                local.tee 3
                i32.eqz
                br_if 0 (;@6;)
                local.get 0
                local.get 3
                local.get 5
                i32.load offset=8
                call $_RNvCsfFJ77F7ERra_7___rustc14___rust_dealloc
              end
              local.get 1
              i32.const 12
              i32.const 4
              call $_RNvCsfFJ77F7ERra_7___rustc14___rust_dealloc
              br 1 (;@4;)
            end
            local.get 0
            local.get 4
            i64.load offset=16
            i64.store align=4
          end
          local.get 4
          i32.load offset=12
          local.tee 1
          local.get 1
          i32.load offset=8
          i32.const -1
          i32.add
          local.tee 5
          i32.store offset=8
          block  ;; label = @4
            local.get 5
            br_if 0 (;@4;)
            local.get 1
            i32.const 0
            i32.store8 offset=12
            local.get 1
            i64.const 0
            i64.store
          end
          local.get 4
          i32.const 32
          i32.add
          global.set $__stack_pointer
          return
        end
        call $_RNvNvMNtNtCseKMvW2SdwUu_3std6thread2idNtB4_8ThreadId3new9exhausted
        unreachable
      end
      i32.const 0
      local.get 4
      i32.const 16
      i32.add
      i32.const 1051792
      i32.const 1051685
      i32.const 65
      i32.const 1051720
      call $_RINvNtCs7RAXWwMZhcx_4core9panicking13assert_failedbbECseKMvW2SdwUu_3std
      unreachable
    end
    i32.const 1051736
    i32.const 38
    i32.const 1051776
    call $_RNvNtCs7RAXWwMZhcx_4core6option13expect_failed
    unreachable)
  (func $_RNvXs7_NtNtCseKMvW2SdwUu_3std2io5errorNtB5_5ErrorNtNtCs7RAXWwMZhcx_4core3fmt7Display3fmt (type 0) (param i32 i32) (result i32)
    (local i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              block  ;; label = @6
                local.get 0
                i32.load8_u
                br_table 0 (;@6;) 1 (;@5;) 2 (;@4;) 3 (;@3;) 0 (;@6;)
              end
              local.get 2
              local.get 0
              i32.load offset=4
              i32.store
              call $_RNvCsfFJ77F7ERra_7___rustc35___rust_no_alloc_shim_is_unstable_v2
              i32.const 20
              i32.const 1
              call $_RNvCsfFJ77F7ERra_7___rustc12___rust_alloc
              local.tee 0
              i32.eqz
              br_if 4 (;@1;)
              local.get 0
              i32.const 0
              i32.load offset=1051821 align=1
              i32.store offset=16 align=1
              local.get 0
              i32.const 0
              i64.load offset=1051813 align=1
              i64.store offset=8 align=1
              local.get 0
              i32.const 0
              i64.load offset=1051805 align=1
              i64.store align=1
              local.get 2
              i32.const 20
              i32.store offset=12
              local.get 2
              local.get 0
              i32.store offset=8
              local.get 2
              i32.const 20
              i32.store offset=4
              local.get 2
              i32.const 1
              i64.extend_i32_u
              i64.const 32
              i64.shl
              local.get 2
              i64.extend_i32_u
              i64.or
              i64.store offset=24
              local.get 2
              i32.const 12
              i64.extend_i32_u
              i64.const 32
              i64.shl
              local.get 2
              i32.const 4
              i32.add
              i64.extend_i32_u
              i64.or
              i64.store offset=16
              local.get 1
              i32.load
              local.get 1
              i32.load offset=4
              i32.const 1049907
              local.get 2
              i32.const 16
              i32.add
              call $_RNvNtCs7RAXWwMZhcx_4core3fmt5write
              local.set 0
              local.get 2
              i32.load offset=4
              local.tee 1
              i32.eqz
              br_if 3 (;@2;)
              local.get 2
              i32.load offset=8
              local.get 1
              i32.const 1
              call $_RNvCsfFJ77F7ERra_7___rustc14___rust_dealloc
              br 3 (;@2;)
            end
            local.get 2
            local.get 0
            i32.load8_u offset=1
            i32.const 2
            i32.shl
            local.tee 0
            i32.load offset=1052032
            i32.store offset=8
            local.get 2
            local.get 0
            i32.load offset=1052200
            i32.store offset=4
            local.get 2
            i32.const 11
            i64.extend_i32_u
            i64.const 32
            i64.shl
            local.get 2
            i32.const 4
            i32.add
            i64.extend_i32_u
            i64.or
            i64.store offset=16
            local.get 1
            i32.load
            local.get 1
            i32.load offset=4
            i32.const 1048877
            local.get 2
            i32.const 16
            i32.add
            call $_RNvNtCs7RAXWwMZhcx_4core3fmt5write
            local.set 0
            br 2 (;@2;)
          end
          local.get 0
          i32.load offset=4
          local.tee 0
          i32.load
          local.get 0
          i32.load offset=4
          local.get 1
          call $_RNvXsi_NtCs7RAXWwMZhcx_4core3fmteNtB5_7Display3fmt
          local.set 0
          br 1 (;@2;)
        end
        local.get 0
        i32.load offset=4
        local.tee 0
        i32.load
        local.get 1
        local.get 0
        i32.load offset=4
        i32.load offset=16
        call_indirect (type 0)
        local.set 0
      end
      local.get 2
      i32.const 32
      i32.add
      global.set $__stack_pointer
      local.get 0
      return
    end
    i32.const 1
    i32.const 20
    call $_RNvNtCslUrat6hAxmK_5alloc7raw_vec12handle_error
    unreachable)
  (func $_RNvNtNtCseKMvW2SdwUu_3std2io5stdio7__eprint (type 2) (param i32 i32)
    (local i32)
    global.get $__stack_pointer
    i32.const 48
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    local.get 2
    i32.const 6
    i32.store offset=4
    local.get 2
    i32.const 1051799
    i32.store
    block  ;; label = @1
      block  ;; label = @2
        local.get 0
        local.get 1
        call $_RNvNtNtCseKMvW2SdwUu_3std2io5stdio31print_to_buffer_if_capture_used
        br_if 0 (;@2;)
        local.get 2
        i32.const 1053736
        i32.store offset=20
        local.get 2
        local.get 2
        i32.const 20
        i32.add
        i32.store offset=32
        local.get 2
        i32.const 8
        i32.add
        local.get 2
        i32.const 32
        i32.add
        local.get 0
        local.get 1
        call $_RNvXso_NtNtCseKMvW2SdwUu_3std2io5stdioRNtB5_6StderrNtB7_5Write9write_fmt
        local.get 2
        i32.load8_u offset=8
        i32.const 4
        i32.ne
        br_if 1 (;@1;)
      end
      local.get 2
      i32.const 48
      i32.add
      global.set $__stack_pointer
      return
    end
    local.get 2
    local.get 2
    i64.load offset=8
    i64.store offset=24
    local.get 2
    i32.const 10
    i64.extend_i32_u
    i64.const 32
    i64.shl
    local.get 2
    i32.const 24
    i32.add
    i64.extend_i32_u
    i64.or
    i64.store offset=40
    local.get 2
    i32.const 11
    i64.extend_i32_u
    i64.const 32
    i64.shl
    local.get 2
    i64.extend_i32_u
    i64.or
    i64.store offset=32
    i32.const 1048853
    local.get 2
    i32.const 32
    i32.add
    i32.const 1050624
    call $_RNvNtCs7RAXWwMZhcx_4core9panicking9panic_fmt
    unreachable)
  (func $_RNvXNtCs7RAXWwMZhcx_4core3anyNtNtCslUrat6hAxmK_5alloc6string6StringNtB2_3Any7type_idCseKMvW2SdwUu_3std (type 2) (param i32 i32)
    local.get 0
    i32.const 0
    i64.load offset=1050756 align=4
    i64.store offset=8 align=4
    local.get 0
    i32.const 0
    i64.load offset=1050748 align=4
    i64.store align=4)
  (func $_RNvXNtCs7RAXWwMZhcx_4core3anyReNtB2_3Any7type_idCseKMvW2SdwUu_3std (type 2) (param i32 i32)
    local.get 0
    i32.const 0
    i64.load offset=1050740 align=4
    i64.store offset=8 align=4
    local.get 0
    i32.const 0
    i64.load offset=1050732 align=4
    i64.store align=4)
  (func $_RNvXNvNtCseKMvW2SdwUu_3std2io17default_write_fmtINtB2_7AdapterINtNtCslUrat6hAxmK_5alloc3vec3VechEENtNtCs7RAXWwMZhcx_4core3fmt5Write9write_strB6_ (type 3) (param i32 i32 i32) (result i32)
    (local i32)
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          local.get 2
          local.get 0
          i32.load offset=8
          local.tee 0
          i32.load
          local.get 0
          i32.load offset=8
          local.tee 3
          i32.sub
          i32.le_u
          br_if 0 (;@3;)
          local.get 0
          local.get 3
          local.get 2
          i32.const 1
          i32.const 1
          call $_RINvNvMs2_NtCslUrat6hAxmK_5alloc7raw_vecINtB8_11RawVecInnerpE7reserve21do_reserve_and_handleNtNtBa_5alloc6GlobalECseKMvW2SdwUu_3std
          local.get 0
          i32.load offset=8
          local.set 3
          br 1 (;@2;)
        end
        local.get 2
        i32.eqz
        br_if 1 (;@1;)
      end
      local.get 2
      i32.eqz
      br_if 0 (;@1;)
      local.get 0
      i32.load offset=4
      local.get 3
      i32.add
      local.get 1
      local.get 2
      memory.copy
    end
    local.get 0
    local.get 3
    local.get 2
    i32.add
    i32.store offset=8
    i32.const 0)
  (func $_RNvXNvNtCseKMvW2SdwUu_3std2io17default_write_fmtINtB2_7AdapterNtNtB4_5stdio10StderrLockENtNtCs7RAXWwMZhcx_4core3fmt5Write9write_strB6_ (type 3) (param i32 i32 i32) (result i32)
    block  ;; label = @1
      local.get 0
      i32.load offset=8
      i32.load
      i32.load offset=16
      i32.eqz
      br_if 0 (;@1;)
      i32.const 1052016
      call $_RNvNtCs7RAXWwMZhcx_4core4cell22panic_already_borrowed
      unreachable
    end
    i32.const 0)
  (func $_RNvXNvNtCseKMvW2SdwUu_3std2io17default_write_fmtINtB2_7AdapterNtNtB4_5stdio10StdoutLockENtNtCs7RAXWwMZhcx_4core3fmt5Write9write_strB6_ (type 3) (param i32 i32 i32) (result i32)
    (local i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 3
    global.set $__stack_pointer
    local.get 3
    i32.const 8
    i32.add
    local.get 0
    i32.load offset=8
    local.get 1
    local.get 2
    call $_RNvXsh_NtNtCseKMvW2SdwUu_3std2io5stdioNtB5_10StdoutLockNtB7_5Write9write_all
    block  ;; label = @1
      local.get 3
      i32.load8_u offset=8
      local.tee 2
      i32.const 4
      i32.eq
      br_if 0 (;@1;)
      block  ;; label = @2
        local.get 0
        i32.load8_u
        i32.const 3
        i32.ne
        br_if 0 (;@2;)
        local.get 0
        i32.load offset=4
        local.tee 1
        i32.load
        local.set 4
        block  ;; label = @3
          local.get 1
          i32.const 4
          i32.add
          i32.load
          local.tee 5
          i32.load
          local.tee 6
          i32.eqz
          br_if 0 (;@3;)
          local.get 4
          local.get 6
          call_indirect (type 1)
        end
        block  ;; label = @3
          local.get 5
          i32.load offset=4
          local.tee 6
          i32.eqz
          br_if 0 (;@3;)
          local.get 4
          local.get 6
          local.get 5
          i32.load offset=8
          call $_RNvCsfFJ77F7ERra_7___rustc14___rust_dealloc
        end
        local.get 1
        i32.const 12
        i32.const 4
        call $_RNvCsfFJ77F7ERra_7___rustc14___rust_dealloc
      end
      local.get 0
      local.get 3
      i64.load offset=8
      i64.store align=4
    end
    local.get 3
    i32.const 16
    i32.add
    global.set $__stack_pointer
    local.get 2
    i32.const 4
    i32.ne)
  (func $_RNvXsh_NtNtCseKMvW2SdwUu_3std2io5stdioNtB5_10StdoutLockNtB7_5Write9write_all (type 10) (param i32 i32 i32 i32)
    (local i32 i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 4
    global.set $__stack_pointer
    block  ;; label = @1
      block  ;; label = @2
        local.get 1
        i32.load
        local.tee 1
        i32.load offset=16
        br_if 0 (;@2;)
        local.get 1
        i32.const -1
        i32.store offset=16
        local.get 4
        i32.const 10
        local.get 2
        local.get 3
        call $_RNvNtNtCs7RAXWwMZhcx_4core5slice6memchr7memrchr
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              block  ;; label = @6
                block  ;; label = @7
                  block  ;; label = @8
                    local.get 4
                    i32.load
                    i32.const 1
                    i32.ne
                    br_if 0 (;@8;)
                    local.get 3
                    local.get 4
                    i32.load offset=4
                    i32.const 1
                    i32.add
                    local.tee 5
                    i32.lt_u
                    br_if 7 (;@1;)
                    local.get 1
                    i32.load offset=28
                    local.tee 6
                    i32.eqz
                    br_if 4 (;@4;)
                    local.get 5
                    local.get 1
                    i32.load offset=20
                    local.get 6
                    i32.sub
                    i32.lt_u
                    br_if 1 (;@7;)
                    local.get 4
                    i32.const 8
                    i32.add
                    local.get 1
                    i32.const 20
                    i32.add
                    local.get 2
                    local.get 5
                    call $_RNvMs_NtNtNtCseKMvW2SdwUu_3std2io8buffered9bufwriterINtB4_9BufWriterNtNtB8_5stdio9StdoutRawE14write_all_coldBa_
                    local.get 4
                    i32.load8_u offset=8
                    i32.const 4
                    i32.eq
                    br_if 2 (;@6;)
                    local.get 0
                    local.get 4
                    i64.load offset=8
                    i64.store align=4
                    br 5 (;@3;)
                  end
                  block  ;; label = @8
                    block  ;; label = @9
                      local.get 1
                      i32.load offset=28
                      local.tee 5
                      br_if 0 (;@9;)
                      i32.const 0
                      local.set 5
                      br 1 (;@8;)
                    end
                    local.get 1
                    i32.load offset=24
                    local.get 5
                    i32.add
                    i32.const -1
                    i32.add
                    i32.load8_u
                    i32.const 10
                    i32.ne
                    br_if 0 (;@8;)
                    i32.const 0
                    local.set 5
                    local.get 1
                    i32.const 0
                    i32.store offset=28
                    local.get 1
                    i32.const 0
                    i32.store8 offset=32
                  end
                  block  ;; label = @8
                    local.get 3
                    local.get 1
                    i32.load offset=20
                    local.get 5
                    i32.sub
                    i32.lt_u
                    br_if 0 (;@8;)
                    local.get 0
                    local.get 1
                    i32.const 20
                    i32.add
                    local.get 2
                    local.get 3
                    call $_RNvMs_NtNtNtCseKMvW2SdwUu_3std2io8buffered9bufwriterINtB4_9BufWriterNtNtB8_5stdio9StdoutRawE14write_all_coldBa_
                    br 5 (;@3;)
                  end
                  block  ;; label = @8
                    local.get 3
                    i32.eqz
                    br_if 0 (;@8;)
                    local.get 1
                    i32.load offset=24
                    local.get 5
                    i32.add
                    local.get 2
                    local.get 3
                    memory.copy
                  end
                  local.get 0
                  i32.const 4
                  i32.store8
                  local.get 1
                  local.get 5
                  local.get 3
                  i32.add
                  i32.store offset=28
                  br 4 (;@3;)
                end
                local.get 5
                i32.eqz
                br_if 1 (;@5;)
                local.get 1
                i32.load offset=24
                local.get 6
                i32.add
                local.get 2
                local.get 5
                memory.copy
                br 1 (;@5;)
              end
              local.get 1
              i32.load offset=28
              i32.eqz
              br_if 1 (;@4;)
            end
            local.get 1
            i32.const 0
            i32.store offset=28
            local.get 1
            i32.const 0
            i32.store8 offset=32
          end
          local.get 2
          local.get 5
          i32.add
          local.set 2
          block  ;; label = @4
            local.get 3
            local.get 5
            i32.sub
            local.tee 3
            local.get 1
            i32.load offset=20
            i32.lt_u
            br_if 0 (;@4;)
            local.get 0
            local.get 1
            i32.const 20
            i32.add
            local.get 2
            local.get 3
            call $_RNvMs_NtNtNtCseKMvW2SdwUu_3std2io8buffered9bufwriterINtB4_9BufWriterNtNtB8_5stdio9StdoutRawE14write_all_coldBa_
            br 1 (;@3;)
          end
          block  ;; label = @4
            local.get 3
            i32.eqz
            br_if 0 (;@4;)
            local.get 1
            i32.load offset=24
            local.get 2
            local.get 3
            memory.copy
          end
          local.get 0
          i32.const 4
          i32.store8
          local.get 1
          local.get 3
          i32.store offset=28
        end
        local.get 1
        local.get 1
        i32.load offset=16
        i32.const 1
        i32.add
        i32.store offset=16
        local.get 4
        i32.const 16
        i32.add
        global.set $__stack_pointer
        return
      end
      i32.const 1051944
      call $_RNvNtCs7RAXWwMZhcx_4core4cell22panic_already_borrowed
      unreachable
    end
    i32.const 1050720
    i32.const 19
    i32.const 1051912
    call $_RNvNtCs7RAXWwMZhcx_4core9panicking9panic_fmt
    unreachable)
  (func $_RNvXs0_NvNtCseKMvW2SdwUu_3std9panicking13panic_handlerNtB5_19FormatStringPayloadNtNtCs7RAXWwMZhcx_4core3fmt7Display3fmt (type 0) (param i32 i32) (result i32)
    block  ;; label = @1
      local.get 0
      i32.load
      i32.const -2147483648
      i32.eq
      br_if 0 (;@1;)
      local.get 1
      local.get 0
      i32.load offset=4
      local.get 0
      i32.load offset=8
      call $_RNvMsa_NtCs7RAXWwMZhcx_4core3fmtNtB5_9Formatter9write_str
      return
    end
    local.get 1
    i32.load
    local.get 1
    i32.load offset=4
    local.get 0
    i32.load offset=12
    i32.load
    local.tee 0
    i32.load
    local.get 0
    i32.load offset=4
    call $_RNvNtCs7RAXWwMZhcx_4core3fmt5write)
  (func $_RNvXs1_NvNtCseKMvW2SdwUu_3std9panicking13panic_handlerNtB5_16StaticStrPayloadNtNtCs7RAXWwMZhcx_4core5panic12PanicPayload3get (type 2) (param i32 i32)
    local.get 0
    i32.const 1051896
    i32.store offset=4
    local.get 0
    local.get 1
    i32.store)
  (func $_RNvXs1_NvNtCseKMvW2SdwUu_3std9panicking13panic_handlerNtB5_16StaticStrPayloadNtNtCs7RAXWwMZhcx_4core5panic12PanicPayload6as_str (type 2) (param i32 i32)
    local.get 0
    local.get 1
    i64.load align=4
    i64.store)
  (func $_RNvXs1_NvNtCseKMvW2SdwUu_3std9panicking13panic_handlerNtB5_16StaticStrPayloadNtNtCs7RAXWwMZhcx_4core5panic12PanicPayload8take_box (type 2) (param i32 i32)
    (local i32 i32)
    local.get 1
    i32.load offset=4
    local.set 2
    local.get 1
    i32.load
    local.set 3
    call $_RNvCsfFJ77F7ERra_7___rustc35___rust_no_alloc_shim_is_unstable_v2
    block  ;; label = @1
      i32.const 8
      i32.const 4
      call $_RNvCsfFJ77F7ERra_7___rustc12___rust_alloc
      local.tee 1
      br_if 0 (;@1;)
      i32.const 4
      i32.const 8
      call $_RNvNtCslUrat6hAxmK_5alloc5alloc18handle_alloc_error
      unreachable
    end
    local.get 1
    local.get 2
    i32.store offset=4
    local.get 1
    local.get 3
    i32.store
    local.get 0
    i32.const 1051896
    i32.store offset=4
    local.get 0
    local.get 1
    i32.store)
  (func $_RNvXs1g_NtCs7RAXWwMZhcx_4core3fmtRbNtB6_5Debug3fmtCseKMvW2SdwUu_3std (type 0) (param i32 i32) (result i32)
    local.get 0
    i32.load
    local.get 1
    call $_RNvXsg_NtCs7RAXWwMZhcx_4core3fmtbNtB5_7Display3fmt)
  (func $_RNvXs2_NvNtCseKMvW2SdwUu_3std9panicking13panic_handlerNtB5_16StaticStrPayloadNtNtCs7RAXWwMZhcx_4core3fmt7Display3fmt (type 0) (param i32 i32) (result i32)
    local.get 1
    local.get 0
    i32.load
    local.get 0
    i32.load offset=4
    call $_RNvMsa_NtCs7RAXWwMZhcx_4core3fmtNtB5_9Formatter9write_str)
  (func $_RNvXsq_NtCslUrat6hAxmK_5alloc6stringNtB5_6StringNtNtCs7RAXWwMZhcx_4core3fmt7Display3fmt.1 (type 0) (param i32 i32) (result i32)
    local.get 0
    i32.load offset=4
    local.get 0
    i32.load offset=8
    local.get 1
    call $_RNvXsi_NtCs7RAXWwMZhcx_4core3fmteNtB5_7Display3fmt)
  (func $_RNvXsZ_NtCslUrat6hAxmK_5alloc6stringNtB5_6StringNtNtCs7RAXWwMZhcx_4core3fmt5Write10write_char (type 0) (param i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32)
    local.get 0
    i32.load offset=8
    local.set 2
    block  ;; label = @1
      block  ;; label = @2
        local.get 1
        i32.const 128
        i32.ge_u
        br_if 0 (;@2;)
        i32.const 1
        local.set 3
        br 1 (;@1;)
      end
      block  ;; label = @2
        local.get 1
        i32.const 2048
        i32.ge_u
        br_if 0 (;@2;)
        i32.const 2
        local.set 3
        br 1 (;@1;)
      end
      i32.const 3
      i32.const 4
      local.get 1
      i32.const 65536
      i32.lt_u
      select
      local.set 3
    end
    local.get 2
    local.set 4
    block  ;; label = @1
      local.get 3
      local.get 0
      i32.load
      local.get 2
      i32.sub
      i32.le_u
      br_if 0 (;@1;)
      local.get 0
      local.get 2
      local.get 3
      i32.const 1
      i32.const 1
      call $_RINvNvMs2_NtCslUrat6hAxmK_5alloc7raw_vecINtB8_11RawVecInnerpE7reserve21do_reserve_and_handleNtNtBa_5alloc6GlobalECseKMvW2SdwUu_3std
      local.get 0
      i32.load offset=8
      local.set 4
    end
    local.get 0
    i32.load offset=4
    local.get 4
    i32.add
    local.set 4
    block  ;; label = @1
      block  ;; label = @2
        local.get 1
        i32.const 128
        i32.lt_u
        br_if 0 (;@2;)
        local.get 1
        i32.const 63
        i32.and
        i32.const -128
        i32.or
        local.set 5
        local.get 1
        i32.const 6
        i32.shr_u
        local.set 6
        block  ;; label = @3
          local.get 1
          i32.const 2048
          i32.ge_u
          br_if 0 (;@3;)
          local.get 4
          local.get 5
          i32.store8 offset=1
          local.get 4
          local.get 6
          i32.const 192
          i32.or
          i32.store8
          br 2 (;@1;)
        end
        local.get 1
        i32.const 12
        i32.shr_u
        local.set 7
        local.get 6
        i32.const 63
        i32.and
        i32.const -128
        i32.or
        local.set 6
        block  ;; label = @3
          local.get 1
          i32.const 65535
          i32.gt_u
          br_if 0 (;@3;)
          local.get 4
          local.get 5
          i32.store8 offset=2
          local.get 4
          local.get 6
          i32.store8 offset=1
          local.get 4
          local.get 7
          i32.const 224
          i32.or
          i32.store8
          br 2 (;@1;)
        end
        local.get 4
        local.get 5
        i32.store8 offset=3
        local.get 4
        local.get 6
        i32.store8 offset=2
        local.get 4
        local.get 7
        i32.const 63
        i32.and
        i32.const -128
        i32.or
        i32.store8 offset=1
        local.get 4
        local.get 1
        i32.const 18
        i32.shr_u
        i32.const -16
        i32.or
        i32.store8
        br 1 (;@1;)
      end
      local.get 4
      local.get 1
      i32.store8
    end
    local.get 0
    local.get 3
    local.get 2
    i32.add
    i32.store offset=8
    i32.const 0)
  (func $_RNvXsZ_NtCslUrat6hAxmK_5alloc6stringNtB5_6StringNtNtCs7RAXWwMZhcx_4core3fmt5Write9write_str (type 3) (param i32 i32 i32) (result i32)
    (local i32)
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          local.get 2
          local.get 0
          i32.load
          local.get 0
          i32.load offset=8
          local.tee 3
          i32.sub
          i32.le_u
          br_if 0 (;@3;)
          local.get 0
          local.get 3
          local.get 2
          i32.const 1
          i32.const 1
          call $_RINvNvMs2_NtCslUrat6hAxmK_5alloc7raw_vecINtB8_11RawVecInnerpE7reserve21do_reserve_and_handleNtNtBa_5alloc6GlobalECseKMvW2SdwUu_3std
          local.get 0
          i32.load offset=8
          local.set 3
          br 1 (;@2;)
        end
        local.get 2
        i32.eqz
        br_if 1 (;@1;)
      end
      local.get 2
      i32.eqz
      br_if 0 (;@1;)
      local.get 0
      i32.load offset=4
      local.get 3
      i32.add
      local.get 1
      local.get 2
      memory.copy
    end
    local.get 0
    local.get 3
    local.get 2
    i32.add
    i32.store offset=8
    i32.const 0)
  (func $_RNvXs_NvNtCseKMvW2SdwUu_3std9panicking13panic_handlerNtB4_19FormatStringPayloadNtNtCs7RAXWwMZhcx_4core5panic12PanicPayload3get (type 2) (param i32 i32)
    (local i32 i32 i64)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    block  ;; label = @1
      local.get 1
      i32.load
      i32.const -2147483648
      i32.ne
      br_if 0 (;@1;)
      local.get 1
      i32.load offset=12
      local.set 3
      local.get 2
      i32.const 0
      i32.store offset=28
      local.get 2
      i64.const 4294967296
      i64.store offset=20 align=4
      local.get 2
      i32.const 20
      i32.add
      i32.const 1050640
      local.get 3
      i32.load
      local.tee 3
      i32.load
      local.get 3
      i32.load offset=4
      call $_RNvNtCs7RAXWwMZhcx_4core3fmt5write
      drop
      local.get 2
      local.get 2
      i32.load offset=28
      local.tee 3
      i32.store offset=16
      local.get 2
      local.get 2
      i64.load offset=20 align=4
      local.tee 4
      i64.store offset=8
      local.get 1
      local.get 3
      i32.store offset=8
      local.get 1
      local.get 4
      i64.store align=4
    end
    local.get 0
    i32.const 1051928
    i32.store offset=4
    local.get 0
    local.get 1
    i32.store
    local.get 2
    i32.const 32
    i32.add
    global.set $__stack_pointer)
  (func $_RNvXs_NvNtCseKMvW2SdwUu_3std9panicking13panic_handlerNtB4_19FormatStringPayloadNtNtCs7RAXWwMZhcx_4core5panic12PanicPayload8take_box (type 2) (param i32 i32)
    (local i32 i32 i64)
    global.get $__stack_pointer
    i32.const 48
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    block  ;; label = @1
      local.get 1
      i32.load
      i32.const -2147483648
      i32.ne
      br_if 0 (;@1;)
      local.get 1
      i32.load offset=12
      local.set 3
      local.get 2
      i32.const 0
      i32.store offset=44
      local.get 2
      i64.const 4294967296
      i64.store offset=36 align=4
      local.get 2
      i32.const 36
      i32.add
      i32.const 1050640
      local.get 3
      i32.load
      local.tee 3
      i32.load
      local.get 3
      i32.load offset=4
      call $_RNvNtCs7RAXWwMZhcx_4core3fmt5write
      drop
      local.get 2
      local.get 2
      i32.load offset=44
      local.tee 3
      i32.store offset=32
      local.get 2
      local.get 2
      i64.load offset=36 align=4
      local.tee 4
      i64.store offset=24
      local.get 1
      local.get 3
      i32.store offset=8
      local.get 1
      local.get 4
      i64.store align=4
    end
    local.get 1
    i32.load offset=8
    local.set 3
    local.get 1
    i32.const 0
    i32.store offset=8
    local.get 1
    i64.load align=4
    local.set 4
    local.get 1
    i64.const 4294967296
    i64.store align=4
    local.get 2
    local.get 3
    i32.store offset=16
    local.get 2
    local.get 4
    i64.store offset=8
    call $_RNvCsfFJ77F7ERra_7___rustc35___rust_no_alloc_shim_is_unstable_v2
    block  ;; label = @1
      i32.const 12
      i32.const 4
      call $_RNvCsfFJ77F7ERra_7___rustc12___rust_alloc
      local.tee 1
      br_if 0 (;@1;)
      i32.const 4
      i32.const 12
      call $_RNvNtCslUrat6hAxmK_5alloc5alloc18handle_alloc_error
      unreachable
    end
    local.get 1
    local.get 2
    i32.load offset=16
    i32.store offset=8
    local.get 1
    local.get 2
    i64.load offset=8
    i64.store align=4
    local.get 0
    i32.const 1051928
    i32.store offset=4
    local.get 0
    local.get 1
    i32.store
    local.get 2
    i32.const 48
    i32.add
    global.set $__stack_pointer)
  (func $_RNvYINtNvNtCseKMvW2SdwUu_3std2io17default_write_fmt7AdapterINtNtCslUrat6hAxmK_5alloc3vec3VechEENtNtCs7RAXWwMZhcx_4core3fmt5Write10write_charB9_ (type 0) (param i32 i32) (result i32)
    (local i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    local.get 2
    i32.const 0
    i32.store offset=12
    block  ;; label = @1
      block  ;; label = @2
        local.get 1
        i32.const 128
        i32.lt_u
        br_if 0 (;@2;)
        local.get 1
        i32.const 63
        i32.and
        i32.const -128
        i32.or
        local.set 3
        local.get 1
        i32.const 6
        i32.shr_u
        local.set 4
        block  ;; label = @3
          local.get 1
          i32.const 2048
          i32.ge_u
          br_if 0 (;@3;)
          local.get 2
          local.get 3
          i32.store8 offset=13
          local.get 2
          local.get 4
          i32.const 192
          i32.or
          i32.store8 offset=12
          i32.const 2
          local.set 1
          br 2 (;@1;)
        end
        local.get 1
        i32.const 12
        i32.shr_u
        local.set 5
        local.get 4
        i32.const 63
        i32.and
        i32.const -128
        i32.or
        local.set 4
        block  ;; label = @3
          local.get 1
          i32.const 65535
          i32.gt_u
          br_if 0 (;@3;)
          local.get 2
          local.get 3
          i32.store8 offset=14
          local.get 2
          local.get 4
          i32.store8 offset=13
          local.get 2
          local.get 5
          i32.const 224
          i32.or
          i32.store8 offset=12
          i32.const 3
          local.set 1
          br 2 (;@1;)
        end
        local.get 2
        local.get 3
        i32.store8 offset=15
        local.get 2
        local.get 4
        i32.store8 offset=14
        local.get 2
        local.get 5
        i32.const 63
        i32.and
        i32.const -128
        i32.or
        i32.store8 offset=13
        local.get 2
        local.get 1
        i32.const 18
        i32.shr_u
        i32.const -16
        i32.or
        i32.store8 offset=12
        i32.const 4
        local.set 1
        br 1 (;@1;)
      end
      local.get 2
      local.get 1
      i32.store8 offset=12
      i32.const 1
      local.set 1
    end
    block  ;; label = @1
      local.get 1
      local.get 0
      i32.load offset=8
      local.tee 0
      i32.load
      local.get 0
      i32.load offset=8
      local.tee 3
      i32.sub
      i32.le_u
      br_if 0 (;@1;)
      local.get 0
      local.get 3
      local.get 1
      i32.const 1
      i32.const 1
      call $_RINvNvMs2_NtCslUrat6hAxmK_5alloc7raw_vecINtB8_11RawVecInnerpE7reserve21do_reserve_and_handleNtNtBa_5alloc6GlobalECseKMvW2SdwUu_3std
      local.get 0
      i32.load offset=8
      local.set 3
    end
    block  ;; label = @1
      local.get 1
      i32.eqz
      br_if 0 (;@1;)
      local.get 0
      i32.load offset=4
      local.get 3
      i32.add
      local.get 2
      i32.const 12
      i32.add
      local.get 1
      memory.copy
    end
    local.get 0
    local.get 3
    local.get 1
    i32.add
    i32.store offset=8
    local.get 2
    i32.const 16
    i32.add
    global.set $__stack_pointer
    i32.const 0)
  (func $_RNvYINtNvNtCseKMvW2SdwUu_3std2io17default_write_fmt7AdapterINtNtCslUrat6hAxmK_5alloc3vec3VechEENtNtCs7RAXWwMZhcx_4core3fmt5Write9write_fmtB9_ (type 3) (param i32 i32 i32) (result i32)
    local.get 0
    i32.const 1050552
    local.get 1
    local.get 2
    call $_RNvNtCs7RAXWwMZhcx_4core3fmt5write)
  (func $_RNvYINtNvNtCseKMvW2SdwUu_3std2io17default_write_fmt7AdapterNtNtB7_5stdio10StderrLockENtNtCs7RAXWwMZhcx_4core3fmt5Write10write_charB9_ (type 0) (param i32 i32) (result i32)
    block  ;; label = @1
      local.get 0
      i32.load offset=8
      i32.load
      i32.load offset=16
      i32.eqz
      br_if 0 (;@1;)
      i32.const 1052016
      call $_RNvNtCs7RAXWwMZhcx_4core4cell22panic_already_borrowed
      unreachable
    end
    i32.const 0)
  (func $_RNvYINtNvNtCseKMvW2SdwUu_3std2io17default_write_fmt7AdapterNtNtB7_5stdio10StderrLockENtNtCs7RAXWwMZhcx_4core3fmt5Write9write_fmtB9_ (type 3) (param i32 i32 i32) (result i32)
    local.get 0
    i32.const 1050576
    local.get 1
    local.get 2
    call $_RNvNtCs7RAXWwMZhcx_4core3fmt5write)
  (func $_RNvYINtNvNtCseKMvW2SdwUu_3std2io17default_write_fmt7AdapterNtNtB7_5stdio10StdoutLockENtNtCs7RAXWwMZhcx_4core3fmt5Write10write_charB9_ (type 0) (param i32 i32) (result i32)
    (local i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    local.get 2
    i32.const 0
    i32.store offset=4
    block  ;; label = @1
      block  ;; label = @2
        local.get 1
        i32.const 128
        i32.lt_u
        br_if 0 (;@2;)
        local.get 1
        i32.const 63
        i32.and
        i32.const -128
        i32.or
        local.set 3
        local.get 1
        i32.const 6
        i32.shr_u
        local.set 4
        block  ;; label = @3
          local.get 1
          i32.const 2048
          i32.ge_u
          br_if 0 (;@3;)
          local.get 2
          local.get 3
          i32.store8 offset=5
          local.get 2
          local.get 4
          i32.const 192
          i32.or
          i32.store8 offset=4
          i32.const 2
          local.set 1
          br 2 (;@1;)
        end
        local.get 1
        i32.const 12
        i32.shr_u
        local.set 5
        local.get 4
        i32.const 63
        i32.and
        i32.const -128
        i32.or
        local.set 4
        block  ;; label = @3
          local.get 1
          i32.const 65535
          i32.gt_u
          br_if 0 (;@3;)
          local.get 2
          local.get 3
          i32.store8 offset=6
          local.get 2
          local.get 4
          i32.store8 offset=5
          local.get 2
          local.get 5
          i32.const 224
          i32.or
          i32.store8 offset=4
          i32.const 3
          local.set 1
          br 2 (;@1;)
        end
        local.get 2
        local.get 3
        i32.store8 offset=7
        local.get 2
        local.get 4
        i32.store8 offset=6
        local.get 2
        local.get 5
        i32.const 63
        i32.and
        i32.const -128
        i32.or
        i32.store8 offset=5
        local.get 2
        local.get 1
        i32.const 18
        i32.shr_u
        i32.const -16
        i32.or
        i32.store8 offset=4
        i32.const 4
        local.set 1
        br 1 (;@1;)
      end
      local.get 2
      local.get 1
      i32.store8 offset=4
      i32.const 1
      local.set 1
    end
    local.get 2
    i32.const 8
    i32.add
    local.get 0
    i32.load offset=8
    local.get 2
    i32.const 4
    i32.add
    local.get 1
    call $_RNvXsh_NtNtCseKMvW2SdwUu_3std2io5stdioNtB5_10StdoutLockNtB7_5Write9write_all
    block  ;; label = @1
      local.get 2
      i32.load8_u offset=8
      local.tee 1
      i32.const 4
      i32.eq
      br_if 0 (;@1;)
      block  ;; label = @2
        local.get 0
        i32.load8_u
        i32.const 3
        i32.ne
        br_if 0 (;@2;)
        local.get 0
        i32.load offset=4
        local.tee 3
        i32.load
        local.set 5
        block  ;; label = @3
          local.get 3
          i32.const 4
          i32.add
          i32.load
          local.tee 4
          i32.load
          local.tee 6
          i32.eqz
          br_if 0 (;@3;)
          local.get 5
          local.get 6
          call_indirect (type 1)
        end
        block  ;; label = @3
          local.get 4
          i32.load offset=4
          local.tee 6
          i32.eqz
          br_if 0 (;@3;)
          local.get 5
          local.get 6
          local.get 4
          i32.load offset=8
          call $_RNvCsfFJ77F7ERra_7___rustc14___rust_dealloc
        end
        local.get 3
        i32.const 12
        i32.const 4
        call $_RNvCsfFJ77F7ERra_7___rustc14___rust_dealloc
      end
      local.get 0
      local.get 2
      i64.load offset=8
      i64.store align=4
    end
    local.get 2
    i32.const 16
    i32.add
    global.set $__stack_pointer
    local.get 1
    i32.const 4
    i32.ne)
  (func $_RNvYINtNvNtCseKMvW2SdwUu_3std2io17default_write_fmt7AdapterNtNtB7_5stdio10StdoutLockENtNtCs7RAXWwMZhcx_4core3fmt5Write9write_fmtB9_ (type 3) (param i32 i32 i32) (result i32)
    local.get 0
    i32.const 1050600
    local.get 1
    local.get 2
    call $_RNvNtCs7RAXWwMZhcx_4core3fmt5write)
  (func $_RNvYINtNvNtCseKMvW2SdwUu_3std9panicking11begin_panic7PayloadReENtNtCs7RAXWwMZhcx_4core5panic12PanicPayload6as_strB9_ (type 2) (param i32 i32)
    local.get 0
    i32.const 0
    i32.store)
  (func $_RNvYNtNtCslUrat6hAxmK_5alloc6string6StringNtNtCs7RAXWwMZhcx_4core3fmt5Write9write_fmtCseKMvW2SdwUu_3std (type 3) (param i32 i32 i32) (result i32)
    local.get 0
    i32.const 1050640
    local.get 1
    local.get 2
    call $_RNvNtCs7RAXWwMZhcx_4core3fmt5write)
  (func $_RNvXs_NtCsgufDigEqR9A_8dlmalloc3sysNtB4_6SystemNtB6_9Allocator5alloc (type 6) (param i32 i32 i32)
    (local i32 i32)
    block  ;; label = @1
      block  ;; label = @2
        local.get 2
        i32.const 16
        i32.shr_u
        local.get 2
        i32.const 65535
        i32.and
        i32.const 0
        i32.ne
        i32.add
        local.tee 2
        memory.grow
        local.tee 3
        i32.const -1
        i32.ne
        br_if 0 (;@2;)
        i32.const 0
        local.set 2
        i32.const 0
        local.set 4
        br 1 (;@1;)
      end
      local.get 2
      i32.const 16
      i32.shl
      local.tee 4
      i32.const -16
      i32.add
      local.get 4
      local.get 3
      i32.const 16
      i32.shl
      local.tee 2
      i32.const 0
      local.get 4
      i32.sub
      i32.eq
      select
      local.set 4
    end
    local.get 0
    i32.const 0
    i32.store offset=8
    local.get 0
    local.get 4
    i32.store offset=4
    local.get 0
    local.get 2
    i32.store)
  (func $_RNvNtCslUrat6hAxmK_5alloc7raw_vec12handle_error (type 2) (param i32 i32)
    block  ;; label = @1
      local.get 0
      i32.eqz
      br_if 0 (;@1;)
      local.get 0
      local.get 1
      call $_RNvNtCslUrat6hAxmK_5alloc5alloc18handle_alloc_error
      unreachable
    end
    call $_RNvNtCslUrat6hAxmK_5alloc7raw_vec17capacity_overflow
    unreachable)
  (func $_RNvNtCslUrat6hAxmK_5alloc5alloc18handle_alloc_error (type 2) (param i32 i32)
    local.get 1
    local.get 0
    call $_RNvCsfFJ77F7ERra_7___rustc26___rust_alloc_error_handler
    unreachable)
  (func $_RNvNtCslUrat6hAxmK_5alloc7raw_vec17capacity_overflow (type 4)
    i32.const 1052368
    i32.const 35
    i32.const 1052388
    call $_RNvNtCs7RAXWwMZhcx_4core9panicking9panic_fmt
    unreachable)
  (func $_RNvNtCs7RAXWwMZhcx_4core9panicking19assert_failed_inner (type 15) (param i32 i32 i32 i32 i32 i32 i32 i32)
    (local i32 i64)
    global.get $__stack_pointer
    i32.const 64
    i32.sub
    local.tee 8
    global.set $__stack_pointer
    local.get 8
    local.get 2
    i32.store offset=4
    local.get 8
    local.get 1
    i32.store
    local.get 8
    local.get 4
    i32.store offset=12
    local.get 8
    local.get 3
    i32.store offset=8
    local.get 8
    local.get 0
    i32.const 255
    i32.and
    i32.const 2
    i32.shl
    local.tee 2
    i32.load offset=1053088
    i32.store offset=20
    local.get 8
    local.get 2
    i32.load offset=1053076
    i32.store offset=16
    block  ;; label = @1
      local.get 5
      i32.eqz
      br_if 0 (;@1;)
      local.get 8
      local.get 6
      i32.store offset=28
      local.get 8
      local.get 5
      i32.store offset=24
      local.get 8
      i32.const 39
      i64.extend_i32_u
      i64.const 32
      i64.shl
      local.tee 9
      local.get 8
      i32.const 8
      i32.add
      i64.extend_i32_u
      i64.or
      i64.store offset=56
      local.get 8
      local.get 9
      local.get 8
      i64.extend_i32_u
      i64.or
      i64.store offset=48
      local.get 8
      i32.const 40
      i64.extend_i32_u
      i64.const 32
      i64.shl
      local.get 8
      i32.const 24
      i32.add
      i64.extend_i32_u
      i64.or
      i64.store offset=40
      local.get 8
      i32.const 41
      i64.extend_i32_u
      i64.const 32
      i64.shl
      local.get 8
      i32.const 16
      i32.add
      i64.extend_i32_u
      i64.or
      i64.store offset=32
      i32.const 1048794
      local.get 8
      i32.const 32
      i32.add
      local.get 7
      call $_RNvNtCs7RAXWwMZhcx_4core9panicking9panic_fmt
      unreachable
    end
    local.get 8
    i32.const 39
    i64.extend_i32_u
    i64.const 32
    i64.shl
    local.tee 9
    local.get 8
    i32.const 8
    i32.add
    i64.extend_i32_u
    i64.or
    i64.store offset=48
    local.get 8
    local.get 9
    local.get 8
    i64.extend_i32_u
    i64.or
    i64.store offset=40
    local.get 8
    i32.const 41
    i64.extend_i32_u
    i64.const 32
    i64.shl
    local.get 8
    i32.const 16
    i32.add
    i64.extend_i32_u
    i64.or
    i64.store offset=32
    i32.const 1048739
    local.get 8
    i32.const 32
    i32.add
    local.get 7
    call $_RNvNtCs7RAXWwMZhcx_4core9panicking9panic_fmt
    unreachable)
  (func $_RNvNtCs7RAXWwMZhcx_4core9panicking5panic (type 6) (param i32 i32 i32)
    local.get 0
    local.get 1
    i32.const 1
    i32.shl
    i32.const 1
    i32.or
    local.get 2
    call $_RNvNtCs7RAXWwMZhcx_4core9panicking9panic_fmt
    unreachable)
  (func $_RNvNtCs7RAXWwMZhcx_4core9panicking9panic_fmt (type 6) (param i32 i32 i32)
    (local i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 3
    global.set $__stack_pointer
    local.get 3
    local.get 1
    i32.store offset=16
    local.get 3
    local.get 0
    i32.store offset=12
    local.get 3
    i32.const 1
    i32.store16 offset=28
    local.get 3
    local.get 2
    i32.store offset=24
    local.get 3
    local.get 3
    i32.const 12
    i32.add
    i32.store offset=20
    local.get 3
    i32.const 20
    i32.add
    call $_RNvCsfFJ77F7ERra_7___rustc17rust_begin_unwind
    unreachable)
  (func $_RNvXs1i_NtCs7RAXWwMZhcx_4core3fmtReNtB6_7Display3fmtB8_ (type 0) (param i32 i32) (result i32)
    local.get 1
    local.get 0
    i32.load
    local.get 0
    i32.load offset=4
    call $_RNvMsa_NtCs7RAXWwMZhcx_4core3fmtNtB5_9Formatter3pad)
  (func $_RNvNtCs7RAXWwMZhcx_4core3fmt5write (type 7) (param i32 i32 i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 4
    global.set $__stack_pointer
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          local.get 3
          i32.const 1
          i32.and
          br_if 0 (;@3;)
          local.get 2
          i32.load8_u
          local.tee 5
          br_if 1 (;@2;)
          i32.const 0
          local.set 5
          br 2 (;@1;)
        end
        local.get 0
        local.get 2
        local.get 3
        i32.const 1
        i32.shr_u
        local.get 1
        i32.load offset=12
        call_indirect (type 3)
        local.set 5
        br 1 (;@1;)
      end
      local.get 1
      i32.load offset=12
      local.set 6
      i32.const 0
      local.set 7
      loop  ;; label = @2
        local.get 2
        i32.const 1
        i32.add
        local.set 8
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              block  ;; label = @6
                block  ;; label = @7
                  local.get 5
                  i32.extend8_s
                  i32.const -1
                  i32.gt_s
                  br_if 0 (;@7;)
                  local.get 5
                  i32.const 255
                  i32.and
                  local.tee 9
                  i32.const 128
                  i32.eq
                  br_if 1 (;@6;)
                  local.get 9
                  i32.const 192
                  i32.ne
                  br_if 3 (;@4;)
                  local.get 4
                  local.get 1
                  i32.store offset=4
                  local.get 4
                  local.get 0
                  i32.store
                  local.get 4
                  i64.const 1610612768
                  i64.store offset=8 align=4
                  local.get 3
                  local.get 7
                  i32.const 3
                  i32.shl
                  i32.add
                  local.tee 5
                  i32.load
                  local.get 4
                  local.get 5
                  i32.load offset=4
                  call_indirect (type 0)
                  i32.eqz
                  br_if 2 (;@5;)
                  i32.const 1
                  local.set 5
                  br 6 (;@1;)
                end
                block  ;; label = @7
                  local.get 0
                  local.get 8
                  local.get 5
                  i32.const 255
                  i32.and
                  local.tee 5
                  local.get 6
                  call_indirect (type 3)
                  br_if 0 (;@7;)
                  local.get 8
                  local.get 5
                  i32.add
                  local.set 2
                  br 4 (;@3;)
                end
                i32.const 1
                local.set 5
                br 5 (;@1;)
              end
              block  ;; label = @6
                local.get 0
                local.get 2
                i32.const 3
                i32.add
                local.tee 5
                local.get 2
                i32.load16_u offset=1 align=1
                local.tee 2
                local.get 6
                call_indirect (type 3)
                br_if 0 (;@6;)
                local.get 5
                local.get 2
                i32.add
                local.set 2
                br 3 (;@3;)
              end
              i32.const 1
              local.set 5
              br 4 (;@1;)
            end
            local.get 7
            i32.const 1
            i32.add
            local.set 7
            local.get 8
            local.set 2
            br 1 (;@3;)
          end
          i32.const 1610612768
          local.set 10
          block  ;; label = @4
            local.get 5
            i32.const 1
            i32.and
            i32.eqz
            br_if 0 (;@4;)
            local.get 2
            i32.const 5
            i32.add
            local.set 8
            local.get 2
            i32.load offset=1 align=1
            local.set 10
          end
          i32.const 0
          local.set 9
          block  ;; label = @4
            block  ;; label = @5
              local.get 5
              i32.const 2
              i32.and
              br_if 0 (;@5;)
              i32.const 0
              local.set 11
              local.get 8
              local.set 2
              br 1 (;@4;)
            end
            local.get 8
            i32.const 2
            i32.add
            local.set 2
            local.get 8
            i32.load16_u align=1
            local.set 11
          end
          block  ;; label = @4
            block  ;; label = @5
              local.get 5
              i32.const 4
              i32.and
              br_if 0 (;@5;)
              local.get 2
              local.set 8
              br 1 (;@4;)
            end
            local.get 2
            i32.const 2
            i32.add
            local.set 8
            local.get 2
            i32.load16_u align=1
            local.set 9
          end
          block  ;; label = @4
            block  ;; label = @5
              local.get 5
              i32.const 8
              i32.and
              br_if 0 (;@5;)
              local.get 8
              local.set 2
              br 1 (;@4;)
            end
            local.get 8
            i32.const 2
            i32.add
            local.set 2
            local.get 8
            i32.load16_u align=1
            local.set 7
          end
          block  ;; label = @4
            local.get 5
            i32.const 16
            i32.and
            i32.eqz
            br_if 0 (;@4;)
            local.get 3
            local.get 11
            i32.const 65535
            i32.and
            i32.const 3
            i32.shl
            i32.add
            i32.load16_u offset=4
            local.set 11
          end
          block  ;; label = @4
            local.get 5
            i32.const 32
            i32.and
            i32.eqz
            br_if 0 (;@4;)
            local.get 3
            local.get 9
            i32.const 65535
            i32.and
            i32.const 3
            i32.shl
            i32.add
            i32.load16_u offset=4
            local.set 9
          end
          local.get 4
          local.get 9
          i32.store16 offset=14
          local.get 4
          local.get 11
          i32.store16 offset=12
          local.get 4
          local.get 10
          i32.store offset=8
          local.get 4
          local.get 1
          i32.store offset=4
          local.get 4
          local.get 0
          i32.store
          block  ;; label = @4
            local.get 3
            local.get 7
            i32.const 3
            i32.shl
            i32.add
            local.tee 5
            i32.load
            local.get 4
            local.get 5
            i32.load offset=4
            call_indirect (type 0)
            i32.eqz
            br_if 0 (;@4;)
            i32.const 1
            local.set 5
            br 3 (;@1;)
          end
          local.get 7
          i32.const 1
          i32.add
          local.set 7
        end
        local.get 2
        i32.load8_u
        local.tee 5
        br_if 0 (;@2;)
      end
      i32.const 0
      local.set 5
    end
    local.get 4
    i32.const 16
    i32.add
    global.set $__stack_pointer
    local.get 5)
  (func $_RNvNtNtCs7RAXWwMZhcx_4core5slice5index16slice_index_fail (type 10) (param i32 i32 i32 i32)
    (local i32 i64)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 4
    global.set $__stack_pointer
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          local.get 0
          local.get 2
          i32.gt_u
          br_if 0 (;@3;)
          local.get 1
          local.get 2
          i32.gt_u
          br_if 1 (;@2;)
          i32.const 42
          i64.extend_i32_u
          i64.const 32
          i64.shl
          local.set 5
          local.get 0
          local.get 1
          i32.le_u
          br_if 2 (;@1;)
          local.get 4
          local.get 0
          i32.store offset=8
          local.get 4
          local.get 1
          i32.store offset=12
          local.get 4
          local.get 5
          local.get 4
          i32.const 12
          i32.add
          i64.extend_i32_u
          i64.or
          i64.store offset=24
          local.get 4
          local.get 5
          local.get 4
          i32.const 8
          i32.add
          i64.extend_i32_u
          i64.or
          i64.store offset=16
          i32.const 1048587
          local.get 4
          i32.const 16
          i32.add
          local.get 3
          call $_RNvNtCs7RAXWwMZhcx_4core9panicking9panic_fmt
          unreachable
        end
        local.get 4
        local.get 0
        i32.store offset=8
        local.get 4
        local.get 2
        i32.store offset=12
        local.get 4
        i32.const 42
        i64.extend_i32_u
        i64.const 32
        i64.shl
        local.tee 5
        local.get 4
        i32.const 12
        i32.add
        i64.extend_i32_u
        i64.or
        i64.store offset=24
        local.get 4
        local.get 5
        local.get 4
        i32.const 8
        i32.add
        i64.extend_i32_u
        i64.or
        i64.store offset=16
        i32.const 1048627
        local.get 4
        i32.const 16
        i32.add
        local.get 3
        call $_RNvNtCs7RAXWwMZhcx_4core9panicking9panic_fmt
        unreachable
      end
      local.get 4
      local.get 1
      i32.store offset=8
      local.get 4
      local.get 2
      i32.store offset=12
      local.get 4
      i32.const 42
      i64.extend_i32_u
      i64.const 32
      i64.shl
      local.tee 5
      local.get 4
      i32.const 12
      i32.add
      i64.extend_i32_u
      i64.or
      i64.store offset=24
      local.get 4
      local.get 5
      local.get 4
      i32.const 8
      i32.add
      i64.extend_i32_u
      i64.or
      i64.store offset=16
      i32.const 1048684
      local.get 4
      i32.const 16
      i32.add
      local.get 3
      call $_RNvNtCs7RAXWwMZhcx_4core9panicking9panic_fmt
      unreachable
    end
    local.get 4
    local.get 1
    i32.store offset=8
    local.get 4
    local.get 2
    i32.store offset=12
    local.get 4
    local.get 5
    local.get 4
    i32.const 12
    i32.add
    i64.extend_i32_u
    i64.or
    i64.store offset=24
    local.get 4
    local.get 5
    local.get 4
    i32.const 8
    i32.add
    i64.extend_i32_u
    i64.or
    i64.store offset=16
    i32.const 1048684
    local.get 4
    i32.const 16
    i32.add
    local.get 3
    call $_RNvNtCs7RAXWwMZhcx_4core9panicking9panic_fmt
    unreachable)
  (func $_RNvNtNtCs7RAXWwMZhcx_4core3str8converts9from_utf8 (type 6) (param i32 i32 i32)
    (local i32 i32 i32 i32 i32 i64 i32)
    block  ;; label = @1
      local.get 2
      i32.eqz
      br_if 0 (;@1;)
      i32.const 0
      local.get 2
      i32.const -7
      i32.add
      local.tee 3
      local.get 3
      local.get 2
      i32.gt_u
      select
      local.set 4
      local.get 1
      i32.const 3
      i32.add
      i32.const -4
      i32.and
      local.get 1
      i32.sub
      local.set 5
      i32.const 0
      local.set 3
      loop  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              block  ;; label = @6
                local.get 1
                local.get 3
                i32.add
                i32.load8_u
                local.tee 6
                i32.extend8_s
                local.tee 7
                i32.const 0
                i32.lt_s
                br_if 0 (;@6;)
                local.get 5
                local.get 3
                i32.sub
                i32.const 3
                i32.and
                br_if 1 (;@5;)
                local.get 3
                local.get 4
                i32.ge_u
                br_if 2 (;@4;)
                loop  ;; label = @7
                  local.get 1
                  local.get 3
                  i32.add
                  local.tee 6
                  i32.const 4
                  i32.add
                  i32.load
                  local.get 6
                  i32.load
                  i32.or
                  i32.const -2139062144
                  i32.and
                  br_if 3 (;@4;)
                  local.get 3
                  i32.const 8
                  i32.add
                  local.tee 3
                  local.get 4
                  i32.lt_u
                  br_if 0 (;@7;)
                  br 3 (;@4;)
                end
              end
              i64.const 1103806595072
              local.set 8
              block  ;; label = @6
                block  ;; label = @7
                  block  ;; label = @8
                    block  ;; label = @9
                      block  ;; label = @10
                        block  ;; label = @11
                          block  ;; label = @12
                            block  ;; label = @13
                              block  ;; label = @14
                                local.get 6
                                i32.load8_u offset=1052675
                                i32.const -2
                                i32.add
                                br_table 0 (;@14;) 1 (;@13;) 2 (;@12;) 7 (;@7;)
                              end
                              local.get 3
                              i32.const 1
                              i32.add
                              local.tee 6
                              local.get 2
                              i32.lt_u
                              br_if 2 (;@11;)
                              i64.const 0
                              local.set 8
                              br 6 (;@7;)
                            end
                            local.get 3
                            i32.const 1
                            i32.add
                            local.tee 9
                            local.get 2
                            i32.lt_u
                            br_if 2 (;@10;)
                            i64.const 0
                            local.set 8
                            br 5 (;@7;)
                          end
                          local.get 3
                          i32.const 1
                          i32.add
                          local.tee 9
                          local.get 2
                          i32.lt_u
                          br_if 2 (;@9;)
                          i64.const 0
                          local.set 8
                          br 4 (;@7;)
                        end
                        local.get 1
                        local.get 6
                        i32.add
                        i32.load8_s
                        i32.const -65
                        i32.gt_s
                        br_if 3 (;@7;)
                        br 4 (;@6;)
                      end
                      local.get 1
                      local.get 9
                      i32.add
                      i32.load8_s
                      local.set 9
                      block  ;; label = @10
                        block  ;; label = @11
                          block  ;; label = @12
                            local.get 6
                            i32.const -224
                            i32.add
                            br_table 0 (;@12;) 2 (;@10;) 2 (;@10;) 2 (;@10;) 2 (;@10;) 2 (;@10;) 2 (;@10;) 2 (;@10;) 2 (;@10;) 2 (;@10;) 2 (;@10;) 2 (;@10;) 2 (;@10;) 1 (;@11;) 2 (;@10;)
                          end
                          local.get 9
                          i32.const -32
                          i32.and
                          i32.const -96
                          i32.eq
                          br_if 3 (;@8;)
                          br 4 (;@7;)
                        end
                        local.get 9
                        i32.const -97
                        i32.gt_s
                        br_if 3 (;@7;)
                        br 2 (;@8;)
                      end
                      block  ;; label = @10
                        local.get 7
                        i32.const 31
                        i32.add
                        i32.const 255
                        i32.and
                        i32.const 12
                        i32.lt_u
                        br_if 0 (;@10;)
                        local.get 7
                        i32.const -2
                        i32.and
                        i32.const -18
                        i32.ne
                        br_if 3 (;@7;)
                        local.get 9
                        i32.const -64
                        i32.lt_s
                        br_if 2 (;@8;)
                        br 3 (;@7;)
                      end
                      local.get 9
                      i32.const -64
                      i32.lt_s
                      br_if 1 (;@8;)
                      br 2 (;@7;)
                    end
                    local.get 1
                    local.get 9
                    i32.add
                    i32.load8_s
                    local.set 9
                    block  ;; label = @9
                      block  ;; label = @10
                        block  ;; label = @11
                          block  ;; label = @12
                            local.get 6
                            i32.const -240
                            i32.add
                            br_table 1 (;@11;) 0 (;@12;) 0 (;@12;) 0 (;@12;) 2 (;@10;) 0 (;@12;)
                          end
                          local.get 7
                          i32.const 15
                          i32.add
                          i32.const 255
                          i32.and
                          i32.const 2
                          i32.gt_u
                          br_if 4 (;@7;)
                          local.get 9
                          i32.const -64
                          i32.lt_s
                          br_if 2 (;@9;)
                          br 4 (;@7;)
                        end
                        local.get 9
                        i32.const 112
                        i32.add
                        i32.const 255
                        i32.and
                        i32.const 48
                        i32.lt_u
                        br_if 1 (;@9;)
                        br 3 (;@7;)
                      end
                      local.get 9
                      i32.const -113
                      i32.gt_s
                      br_if 2 (;@7;)
                    end
                    block  ;; label = @9
                      local.get 3
                      i32.const 2
                      i32.add
                      local.tee 6
                      local.get 2
                      i32.lt_u
                      br_if 0 (;@9;)
                      i64.const 0
                      local.set 8
                      br 2 (;@7;)
                    end
                    block  ;; label = @9
                      local.get 1
                      local.get 6
                      i32.add
                      i32.load8_s
                      i32.const -65
                      i32.le_s
                      br_if 0 (;@9;)
                      i64.const 2203318222848
                      local.set 8
                      br 2 (;@7;)
                    end
                    i64.const 0
                    local.set 8
                    local.get 3
                    i32.const 3
                    i32.add
                    local.tee 6
                    local.get 2
                    i32.ge_u
                    br_if 1 (;@7;)
                    local.get 1
                    local.get 6
                    i32.add
                    i32.load8_s
                    i32.const -64
                    i32.lt_s
                    br_if 2 (;@6;)
                    i64.const 3302829850624
                    local.set 8
                    br 1 (;@7;)
                  end
                  i64.const 0
                  local.set 8
                  local.get 3
                  i32.const 2
                  i32.add
                  local.tee 6
                  local.get 2
                  i32.ge_u
                  br_if 0 (;@7;)
                  local.get 1
                  local.get 6
                  i32.add
                  i32.load8_s
                  i32.const -65
                  i32.le_s
                  br_if 1 (;@6;)
                  i64.const 2203318222848
                  local.set 8
                end
                local.get 0
                local.get 8
                local.get 3
                i64.extend_i32_u
                i64.or
                i64.store offset=4 align=4
                local.get 0
                i32.const 1
                i32.store
                return
              end
              local.get 6
              i32.const 1
              i32.add
              local.set 3
              br 2 (;@3;)
            end
            local.get 3
            i32.const 1
            i32.add
            local.set 3
            br 1 (;@3;)
          end
          local.get 3
          local.get 2
          i32.ge_u
          br_if 0 (;@3;)
          loop  ;; label = @4
            local.get 1
            local.get 3
            i32.add
            i32.load8_s
            i32.const 0
            i32.lt_s
            br_if 1 (;@3;)
            local.get 2
            local.get 3
            i32.const 1
            i32.add
            local.tee 3
            i32.ne
            br_if 0 (;@4;)
            br 3 (;@1;)
          end
        end
        local.get 3
        local.get 2
        i32.lt_u
        br_if 0 (;@2;)
      end
    end
    local.get 0
    local.get 2
    i32.store offset=8
    local.get 0
    local.get 1
    i32.store offset=4
    local.get 0
    i32.const 0
    i32.store)
  (func $_RNvXs0_NtNtCs7RAXWwMZhcx_4core3fmt8buildersNtB5_10PadAdapterNtB7_5Write9write_str (type 3) (param i32 i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    local.get 0
    i32.load offset=4
    local.set 3
    local.get 0
    i32.load
    local.set 4
    local.get 0
    i32.load offset=8
    local.set 5
    i32.const 0
    local.set 6
    i32.const 0
    local.set 7
    i32.const 0
    local.set 8
    i32.const 0
    local.set 9
    block  ;; label = @1
      loop  ;; label = @2
        local.get 9
        i32.const 1
        i32.and
        br_if 1 (;@1;)
        block  ;; label = @3
          block  ;; label = @4
            local.get 2
            local.get 8
            i32.lt_u
            br_if 0 (;@4;)
            loop  ;; label = @5
              local.get 1
              local.get 8
              i32.add
              local.set 9
              block  ;; label = @6
                block  ;; label = @7
                  block  ;; label = @8
                    block  ;; label = @9
                      block  ;; label = @10
                        block  ;; label = @11
                          local.get 2
                          local.get 8
                          i32.sub
                          local.tee 10
                          i32.const 7
                          i32.gt_u
                          br_if 0 (;@11;)
                          local.get 2
                          local.get 8
                          i32.ne
                          br_if 1 (;@10;)
                          local.get 2
                          local.set 8
                          br 7 (;@4;)
                        end
                        local.get 9
                        i32.const 3
                        i32.add
                        i32.const -4
                        i32.and
                        local.tee 0
                        local.get 9
                        i32.eq
                        br_if 1 (;@9;)
                        local.get 0
                        local.get 9
                        i32.sub
                        local.set 0
                        i32.const 0
                        local.set 11
                        loop  ;; label = @11
                          local.get 9
                          local.get 11
                          i32.add
                          i32.load8_u
                          i32.const 10
                          i32.eq
                          br_if 5 (;@6;)
                          local.get 0
                          local.get 11
                          i32.const 1
                          i32.add
                          local.tee 11
                          i32.ne
                          br_if 0 (;@11;)
                        end
                        local.get 0
                        local.get 10
                        i32.const -8
                        i32.add
                        local.tee 12
                        i32.gt_u
                        br_if 3 (;@7;)
                        br 2 (;@8;)
                      end
                      i32.const 0
                      local.set 11
                      loop  ;; label = @10
                        local.get 9
                        local.get 11
                        i32.add
                        i32.load8_u
                        i32.const 10
                        i32.eq
                        br_if 4 (;@6;)
                        local.get 10
                        local.get 11
                        i32.const 1
                        i32.add
                        local.tee 11
                        i32.ne
                        br_if 0 (;@10;)
                      end
                      local.get 2
                      local.set 8
                      br 5 (;@4;)
                    end
                    local.get 10
                    i32.const -8
                    i32.add
                    local.set 12
                    i32.const 0
                    local.set 0
                  end
                  loop  ;; label = @8
                    i32.const 16843008
                    local.get 9
                    local.get 0
                    i32.add
                    local.tee 11
                    i32.load
                    local.tee 13
                    i32.const 168430090
                    i32.xor
                    i32.sub
                    local.get 13
                    i32.or
                    i32.const 16843008
                    local.get 11
                    i32.const 4
                    i32.add
                    i32.load
                    local.tee 11
                    i32.const 168430090
                    i32.xor
                    i32.sub
                    local.get 11
                    i32.or
                    i32.and
                    i32.const -2139062144
                    i32.and
                    i32.const -2139062144
                    i32.ne
                    br_if 1 (;@7;)
                    local.get 0
                    i32.const 8
                    i32.add
                    local.tee 0
                    local.get 12
                    i32.le_u
                    br_if 0 (;@8;)
                  end
                end
                block  ;; label = @7
                  local.get 10
                  local.get 0
                  i32.ne
                  br_if 0 (;@7;)
                  local.get 2
                  local.set 8
                  br 3 (;@4;)
                end
                loop  ;; label = @7
                  block  ;; label = @8
                    local.get 9
                    local.get 0
                    i32.add
                    i32.load8_u
                    i32.const 10
                    i32.ne
                    br_if 0 (;@8;)
                    local.get 0
                    local.set 11
                    br 2 (;@6;)
                  end
                  local.get 10
                  local.get 0
                  i32.const 1
                  i32.add
                  local.tee 0
                  i32.ne
                  br_if 0 (;@7;)
                end
                local.get 2
                local.set 8
                br 2 (;@4;)
              end
              local.get 8
              local.get 11
              i32.add
              local.tee 0
              i32.const 1
              i32.add
              local.set 8
              block  ;; label = @6
                local.get 0
                local.get 2
                i32.ge_u
                br_if 0 (;@6;)
                local.get 9
                local.get 11
                i32.add
                i32.load8_u
                i32.const 10
                i32.ne
                br_if 0 (;@6;)
                i32.const 0
                local.set 9
                local.get 8
                local.set 10
                local.get 8
                local.set 0
                br 3 (;@3;)
              end
              local.get 2
              local.get 8
              i32.ge_u
              br_if 0 (;@5;)
            end
          end
          local.get 2
          local.get 7
          i32.eq
          br_if 2 (;@1;)
          i32.const 1
          local.set 9
          local.get 7
          local.set 10
          local.get 2
          local.set 0
        end
        block  ;; label = @3
          block  ;; label = @4
            local.get 5
            i32.load8_u
            i32.eqz
            br_if 0 (;@4;)
            local.get 4
            i32.const 1053021
            i32.const 4
            local.get 3
            i32.load offset=12
            call_indirect (type 3)
            br_if 1 (;@3;)
          end
          local.get 0
          local.get 7
          i32.sub
          local.set 13
          i32.const 0
          local.set 11
          block  ;; label = @4
            local.get 0
            local.get 7
            i32.eq
            br_if 0 (;@4;)
            local.get 1
            local.get 0
            i32.add
            i32.const -1
            i32.add
            i32.load8_u
            i32.const 10
            i32.eq
            local.set 11
          end
          local.get 1
          local.get 7
          i32.add
          local.set 0
          local.get 5
          local.get 11
          i32.store8
          local.get 10
          local.set 7
          local.get 4
          local.get 0
          local.get 13
          local.get 3
          i32.load offset=12
          call_indirect (type 3)
          i32.eqz
          br_if 1 (;@2;)
        end
      end
      i32.const 1
      local.set 6
    end
    local.get 6)
  (func $_RNvMs1_NtNtCs7RAXWwMZhcx_4core3fmt8buildersNtB5_11DebugStruct5field (type 16) (param i32 i32 i32 i32 i32) (result i32)
    (local i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 5
    global.set $__stack_pointer
    i32.const 1
    local.set 6
    block  ;; label = @1
      local.get 0
      i32.load8_u offset=4
      br_if 0 (;@1;)
      local.get 0
      i32.load8_u offset=5
      local.set 7
      block  ;; label = @2
        local.get 0
        i32.load
        local.tee 8
        i32.load8_u offset=10
        i32.const 128
        i32.and
        br_if 0 (;@2;)
        i32.const 1
        local.set 6
        local.get 8
        i32.load
        i32.const 1052423
        i32.const 1052420
        local.get 7
        i32.const 1
        i32.and
        local.tee 7
        select
        i32.const 2
        i32.const 3
        local.get 7
        select
        local.get 8
        i32.load offset=4
        i32.load offset=12
        call_indirect (type 3)
        br_if 1 (;@1;)
        local.get 8
        i32.load
        local.get 1
        local.get 2
        local.get 8
        i32.load offset=4
        i32.load offset=12
        call_indirect (type 3)
        br_if 1 (;@1;)
        local.get 8
        i32.load
        i32.const 1052425
        i32.const 2
        local.get 8
        i32.load offset=4
        i32.load offset=12
        call_indirect (type 3)
        br_if 1 (;@1;)
        local.get 3
        local.get 8
        local.get 4
        i32.load offset=12
        call_indirect (type 0)
        local.set 6
        br 1 (;@1;)
      end
      i32.const 1
      local.set 6
      block  ;; label = @2
        local.get 7
        i32.const 1
        i32.and
        br_if 0 (;@2;)
        local.get 8
        i32.load
        i32.const 1052427
        i32.const 3
        local.get 8
        i32.load offset=4
        i32.load offset=12
        call_indirect (type 3)
        br_if 1 (;@1;)
      end
      i32.const 1
      local.set 6
      local.get 5
      i32.const 1
      i32.store8 offset=15
      local.get 5
      i32.const 1052440
      i32.store offset=20
      local.get 5
      local.get 8
      i64.load align=4
      i64.store align=4
      local.get 5
      local.get 8
      i64.load offset=8 align=4
      i64.store offset=24 align=4
      local.get 5
      local.get 5
      i32.const 15
      i32.add
      i32.store offset=8
      local.get 5
      local.get 5
      i32.store offset=16
      local.get 5
      local.get 1
      local.get 2
      call $_RNvXs0_NtNtCs7RAXWwMZhcx_4core3fmt8buildersNtB5_10PadAdapterNtB7_5Write9write_str
      br_if 0 (;@1;)
      local.get 5
      i32.const 1052425
      i32.const 2
      call $_RNvXs0_NtNtCs7RAXWwMZhcx_4core3fmt8buildersNtB5_10PadAdapterNtB7_5Write9write_str
      br_if 0 (;@1;)
      block  ;; label = @2
        local.get 3
        local.get 5
        i32.const 16
        i32.add
        local.get 4
        i32.load offset=12
        call_indirect (type 0)
        i32.eqz
        br_if 0 (;@2;)
        i32.const 1
        local.set 6
        br 1 (;@1;)
      end
      local.get 5
      i32.load offset=16
      i32.const 1052430
      i32.const 2
      local.get 5
      i32.load offset=20
      i32.load offset=12
      call_indirect (type 3)
      local.set 6
    end
    local.get 0
    i32.const 1
    i32.store8 offset=5
    local.get 0
    local.get 6
    i32.store8 offset=4
    local.get 5
    i32.const 32
    i32.add
    global.set $__stack_pointer
    local.get 0)
  (func $_RNvMs3_NtNtCs7RAXWwMZhcx_4core3ffi5c_strNtB5_4CStr6to_str (type 6) (param i32 i32 i32)
    local.get 0
    local.get 1
    local.get 2
    i32.const -1
    i32.add
    call $_RNvNtNtCs7RAXWwMZhcx_4core3str8converts9from_utf8)
  (func $_RNvMsa_NtCs7RAXWwMZhcx_4core3fmtNtB5_9Formatter12pad_integral (type 17) (param i32 i32 i32 i32 i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i64)
    i32.const 43
    i32.const 1114112
    local.get 0
    i32.load offset=8
    local.tee 6
    i32.const 2097152
    i32.and
    local.tee 7
    select
    local.set 8
    local.get 7
    i32.const 21
    i32.shr_u
    i32.const 1
    local.get 1
    select
    local.get 5
    i32.add
    local.set 9
    block  ;; label = @1
      block  ;; label = @2
        local.get 6
        i32.const 8388608
        i32.and
        br_if 0 (;@2;)
        i32.const 0
        local.set 2
        br 1 (;@1;)
      end
      block  ;; label = @2
        block  ;; label = @3
          local.get 3
          i32.const 16
          i32.lt_u
          br_if 0 (;@3;)
          local.get 2
          local.get 3
          call $_RNvNtNtCs7RAXWwMZhcx_4core3str5count14do_count_chars
          local.set 7
          br 1 (;@2;)
        end
        block  ;; label = @3
          local.get 3
          br_if 0 (;@3;)
          i32.const 0
          local.set 7
          br 1 (;@2;)
        end
        local.get 3
        i32.const 3
        i32.and
        local.set 10
        i32.const 0
        local.set 11
        i32.const 0
        local.set 7
        block  ;; label = @3
          local.get 3
          i32.const 4
          i32.lt_u
          br_if 0 (;@3;)
          local.get 3
          i32.const 12
          i32.and
          local.set 12
          i32.const 0
          local.set 11
          i32.const 0
          local.set 7
          loop  ;; label = @4
            local.get 7
            local.get 2
            local.get 11
            i32.add
            local.tee 13
            i32.load8_s
            i32.const -65
            i32.gt_s
            i32.add
            local.get 13
            i32.const 1
            i32.add
            i32.load8_s
            i32.const -65
            i32.gt_s
            i32.add
            local.get 13
            i32.const 2
            i32.add
            i32.load8_s
            i32.const -65
            i32.gt_s
            i32.add
            local.get 13
            i32.const 3
            i32.add
            i32.load8_s
            i32.const -65
            i32.gt_s
            i32.add
            local.set 7
            local.get 12
            local.get 11
            i32.const 4
            i32.add
            local.tee 11
            i32.ne
            br_if 0 (;@4;)
          end
          local.get 10
          i32.eqz
          br_if 1 (;@2;)
        end
        local.get 2
        local.get 11
        i32.add
        local.set 13
        loop  ;; label = @3
          local.get 7
          local.get 13
          i32.load8_s
          i32.const -65
          i32.gt_s
          i32.add
          local.set 7
          local.get 13
          i32.const 1
          i32.add
          local.set 13
          local.get 10
          i32.const -1
          i32.add
          local.tee 10
          br_if 0 (;@3;)
        end
      end
      local.get 7
      local.get 9
      i32.add
      local.set 9
    end
    local.get 8
    i32.const 45
    local.get 1
    select
    local.set 12
    block  ;; label = @1
      block  ;; label = @2
        local.get 9
        local.get 0
        i32.load16_u offset=12
        local.tee 1
        i32.ge_u
        br_if 0 (;@2;)
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              local.get 6
              i32.const 16777216
              i32.and
              br_if 0 (;@5;)
              local.get 1
              local.get 9
              i32.sub
              local.set 8
              i32.const 0
              local.set 7
              i32.const 0
              local.set 1
              block  ;; label = @6
                block  ;; label = @7
                  block  ;; label = @8
                    local.get 6
                    i32.const 29
                    i32.shr_u
                    i32.const 3
                    i32.and
                    br_table 2 (;@6;) 0 (;@8;) 1 (;@7;) 0 (;@8;) 2 (;@6;)
                  end
                  local.get 8
                  local.set 1
                  br 1 (;@6;)
                end
                local.get 8
                i32.const 65534
                i32.and
                i32.const 1
                i32.shr_u
                local.set 1
              end
              local.get 6
              i32.const 2097151
              i32.and
              local.set 9
              local.get 0
              i32.load offset=4
              local.set 11
              local.get 0
              i32.load
              local.set 10
              loop  ;; label = @6
                local.get 7
                i32.const 65535
                i32.and
                local.get 1
                i32.const 65535
                i32.and
                i32.ge_u
                br_if 2 (;@4;)
                i32.const 1
                local.set 13
                local.get 7
                i32.const 1
                i32.add
                local.set 7
                local.get 10
                local.get 9
                local.get 11
                i32.load offset=16
                call_indirect (type 0)
                i32.eqz
                br_if 0 (;@6;)
                br 5 (;@1;)
              end
            end
            local.get 0
            local.get 0
            i64.load offset=8 align=4
            local.tee 14
            i32.wrap_i64
            i32.const -1612709888
            i32.and
            i32.const 536870960
            i32.or
            i32.store offset=8
            i32.const 1
            local.set 13
            local.get 0
            i32.load
            local.tee 10
            local.get 0
            i32.load offset=4
            local.tee 11
            local.get 12
            local.get 2
            local.get 3
            call $_RNvNvMsa_NtCs7RAXWwMZhcx_4core3fmtNtB7_9Formatter12pad_integral12write_prefix
            br_if 3 (;@1;)
            i32.const 0
            local.set 7
            local.get 1
            local.get 9
            i32.sub
            i32.const 65535
            i32.and
            local.set 2
            loop  ;; label = @5
              local.get 7
              i32.const 65535
              i32.and
              local.get 2
              i32.ge_u
              br_if 2 (;@3;)
              i32.const 1
              local.set 13
              local.get 7
              i32.const 1
              i32.add
              local.set 7
              local.get 10
              i32.const 48
              local.get 11
              i32.load offset=16
              call_indirect (type 0)
              i32.eqz
              br_if 0 (;@5;)
              br 4 (;@1;)
            end
          end
          i32.const 1
          local.set 13
          local.get 10
          local.get 11
          local.get 12
          local.get 2
          local.get 3
          call $_RNvNvMsa_NtCs7RAXWwMZhcx_4core3fmtNtB7_9Formatter12pad_integral12write_prefix
          br_if 2 (;@1;)
          local.get 10
          local.get 4
          local.get 5
          local.get 11
          i32.load offset=12
          call_indirect (type 3)
          br_if 2 (;@1;)
          i32.const 0
          local.set 7
          local.get 8
          local.get 1
          i32.sub
          i32.const 65535
          i32.and
          local.set 0
          loop  ;; label = @4
            local.get 7
            i32.const 65535
            i32.and
            local.tee 2
            local.get 0
            i32.lt_u
            local.set 13
            local.get 2
            local.get 0
            i32.ge_u
            br_if 3 (;@1;)
            local.get 7
            i32.const 1
            i32.add
            local.set 7
            local.get 10
            local.get 9
            local.get 11
            i32.load offset=16
            call_indirect (type 0)
            i32.eqz
            br_if 0 (;@4;)
            br 3 (;@1;)
          end
        end
        i32.const 1
        local.set 13
        local.get 10
        local.get 4
        local.get 5
        local.get 11
        i32.load offset=12
        call_indirect (type 3)
        br_if 1 (;@1;)
        local.get 0
        local.get 14
        i64.store offset=8 align=4
        i32.const 0
        return
      end
      i32.const 1
      local.set 13
      local.get 0
      i32.load
      local.tee 7
      local.get 0
      i32.load offset=4
      local.tee 10
      local.get 12
      local.get 2
      local.get 3
      call $_RNvNvMsa_NtCs7RAXWwMZhcx_4core3fmtNtB7_9Formatter12pad_integral12write_prefix
      br_if 0 (;@1;)
      local.get 7
      local.get 4
      local.get 5
      local.get 10
      i32.load offset=12
      call_indirect (type 3)
      local.set 13
    end
    local.get 13)
  (func $_RNvNtNtCs7RAXWwMZhcx_4core3str5count14do_count_chars (type 0) (param i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32)
    block  ;; label = @1
      block  ;; label = @2
        local.get 1
        local.get 0
        i32.const 3
        i32.add
        i32.const -4
        i32.and
        local.tee 2
        local.get 0
        i32.sub
        local.tee 3
        i32.lt_u
        br_if 0 (;@2;)
        local.get 1
        local.get 3
        i32.sub
        local.tee 4
        i32.const 2
        i32.shr_u
        local.tee 5
        i32.eqz
        br_if 0 (;@2;)
        local.get 4
        i32.const 3
        i32.and
        local.set 6
        i32.const 0
        local.set 7
        i32.const 0
        local.set 1
        block  ;; label = @3
          local.get 2
          local.get 0
          i32.eq
          br_if 0 (;@3;)
          i32.const 0
          local.set 8
          i32.const 0
          local.set 1
          block  ;; label = @4
            local.get 0
            local.get 2
            i32.sub
            local.tee 9
            i32.const -4
            i32.gt_u
            br_if 0 (;@4;)
            i32.const 0
            local.set 8
            i32.const 0
            local.set 1
            loop  ;; label = @5
              local.get 1
              local.get 0
              local.get 8
              i32.add
              local.tee 2
              i32.load8_s
              i32.const -65
              i32.gt_s
              i32.add
              local.get 2
              i32.const 1
              i32.add
              i32.load8_s
              i32.const -65
              i32.gt_s
              i32.add
              local.get 2
              i32.const 2
              i32.add
              i32.load8_s
              i32.const -65
              i32.gt_s
              i32.add
              local.get 2
              i32.const 3
              i32.add
              i32.load8_s
              i32.const -65
              i32.gt_s
              i32.add
              local.set 1
              local.get 8
              i32.const 4
              i32.add
              local.tee 8
              br_if 0 (;@5;)
            end
          end
          local.get 0
          local.get 8
          i32.add
          local.set 2
          loop  ;; label = @4
            local.get 1
            local.get 2
            i32.load8_s
            i32.const -65
            i32.gt_s
            i32.add
            local.set 1
            local.get 2
            i32.const 1
            i32.add
            local.set 2
            local.get 9
            i32.const 1
            i32.add
            local.tee 9
            br_if 0 (;@4;)
          end
        end
        local.get 0
        local.get 3
        i32.add
        local.set 9
        block  ;; label = @3
          local.get 6
          i32.eqz
          br_if 0 (;@3;)
          local.get 9
          local.get 4
          i32.const 2147483644
          i32.and
          i32.add
          local.tee 2
          i32.load8_s
          i32.const -65
          i32.gt_s
          local.set 7
          local.get 6
          i32.const 1
          i32.eq
          br_if 0 (;@3;)
          local.get 7
          local.get 2
          i32.load8_s offset=1
          i32.const -65
          i32.gt_s
          i32.add
          local.set 7
          local.get 6
          i32.const 2
          i32.eq
          br_if 0 (;@3;)
          local.get 7
          local.get 2
          i32.load8_s offset=2
          i32.const -65
          i32.gt_s
          i32.add
          local.set 7
        end
        local.get 7
        local.get 1
        i32.add
        local.set 8
        loop  ;; label = @3
          local.get 9
          local.set 3
          local.get 5
          i32.eqz
          br_if 2 (;@1;)
          local.get 5
          i32.const 192
          local.get 5
          i32.const 192
          i32.lt_u
          select
          local.tee 7
          i32.const 3
          i32.and
          local.set 6
          block  ;; label = @4
            block  ;; label = @5
              local.get 7
              i32.const 2
              i32.shl
              local.tee 4
              i32.const 1008
              i32.and
              local.tee 1
              br_if 0 (;@5;)
              i32.const 0
              local.set 2
              br 1 (;@4;)
            end
            local.get 3
            local.get 1
            i32.add
            local.set 0
            i32.const 0
            local.set 2
            local.get 3
            local.set 1
            loop  ;; label = @5
              local.get 1
              i32.const 12
              i32.add
              i32.load
              local.tee 9
              i32.const -1
              i32.xor
              i32.const 7
              i32.shr_u
              local.get 9
              i32.const 6
              i32.shr_u
              i32.or
              i32.const 16843009
              i32.and
              local.get 1
              i32.const 8
              i32.add
              i32.load
              local.tee 9
              i32.const -1
              i32.xor
              i32.const 7
              i32.shr_u
              local.get 9
              i32.const 6
              i32.shr_u
              i32.or
              i32.const 16843009
              i32.and
              local.get 1
              i32.const 4
              i32.add
              i32.load
              local.tee 9
              i32.const -1
              i32.xor
              i32.const 7
              i32.shr_u
              local.get 9
              i32.const 6
              i32.shr_u
              i32.or
              i32.const 16843009
              i32.and
              local.get 1
              i32.load
              local.tee 9
              i32.const -1
              i32.xor
              i32.const 7
              i32.shr_u
              local.get 9
              i32.const 6
              i32.shr_u
              i32.or
              i32.const 16843009
              i32.and
              local.get 2
              i32.add
              i32.add
              i32.add
              i32.add
              local.set 2
              local.get 1
              i32.const 16
              i32.add
              local.tee 1
              local.get 0
              i32.ne
              br_if 0 (;@5;)
            end
          end
          local.get 5
          local.get 7
          i32.sub
          local.set 5
          local.get 3
          local.get 4
          i32.add
          local.set 9
          local.get 2
          i32.const 8
          i32.shr_u
          i32.const 16711935
          i32.and
          local.get 2
          i32.const 16711935
          i32.and
          i32.add
          i32.const 65537
          i32.mul
          i32.const 16
          i32.shr_u
          local.get 8
          i32.add
          local.set 8
          local.get 6
          i32.eqz
          br_if 0 (;@3;)
        end
        local.get 3
        local.get 7
        i32.const 252
        i32.and
        i32.const 2
        i32.shl
        i32.add
        local.tee 2
        i32.load
        local.tee 1
        i32.const -1
        i32.xor
        i32.const 7
        i32.shr_u
        local.get 1
        i32.const 6
        i32.shr_u
        i32.or
        i32.const 16843009
        i32.and
        local.set 1
        block  ;; label = @3
          local.get 6
          i32.const 1
          i32.eq
          br_if 0 (;@3;)
          local.get 2
          i32.load offset=4
          local.tee 9
          i32.const -1
          i32.xor
          i32.const 7
          i32.shr_u
          local.get 9
          i32.const 6
          i32.shr_u
          i32.or
          i32.const 16843009
          i32.and
          local.get 1
          i32.add
          local.set 1
          local.get 6
          i32.const 2
          i32.eq
          br_if 0 (;@3;)
          local.get 2
          i32.load offset=8
          local.tee 2
          i32.const -1
          i32.xor
          i32.const 7
          i32.shr_u
          local.get 2
          i32.const 6
          i32.shr_u
          i32.or
          i32.const 16843009
          i32.and
          local.get 1
          i32.add
          local.set 1
        end
        local.get 1
        i32.const 8
        i32.shr_u
        i32.const 459007
        i32.and
        local.get 1
        i32.const 16711935
        i32.and
        i32.add
        i32.const 65537
        i32.mul
        i32.const 16
        i32.shr_u
        local.get 8
        i32.add
        local.set 8
        br 1 (;@1;)
      end
      block  ;; label = @2
        local.get 1
        br_if 0 (;@2;)
        i32.const 0
        return
      end
      local.get 1
      i32.const 3
      i32.and
      local.set 2
      i32.const 0
      local.set 9
      i32.const 0
      local.set 8
      block  ;; label = @2
        local.get 1
        i32.const 4
        i32.lt_u
        br_if 0 (;@2;)
        local.get 1
        i32.const -4
        i32.and
        local.set 5
        i32.const 0
        local.set 8
        i32.const 0
        local.set 9
        loop  ;; label = @3
          local.get 8
          local.get 0
          local.get 9
          i32.add
          local.tee 1
          i32.load8_s
          i32.const -65
          i32.gt_s
          i32.add
          local.get 1
          i32.const 1
          i32.add
          i32.load8_s
          i32.const -65
          i32.gt_s
          i32.add
          local.get 1
          i32.const 2
          i32.add
          i32.load8_s
          i32.const -65
          i32.gt_s
          i32.add
          local.get 1
          i32.const 3
          i32.add
          i32.load8_s
          i32.const -65
          i32.gt_s
          i32.add
          local.set 8
          local.get 5
          local.get 9
          i32.const 4
          i32.add
          local.tee 9
          i32.ne
          br_if 0 (;@3;)
        end
        local.get 2
        i32.eqz
        br_if 1 (;@1;)
      end
      local.get 0
      local.get 9
      i32.add
      local.set 1
      loop  ;; label = @2
        local.get 8
        local.get 1
        i32.load8_s
        i32.const -65
        i32.gt_s
        i32.add
        local.set 8
        local.get 1
        i32.const 1
        i32.add
        local.set 1
        local.get 2
        i32.const -1
        i32.add
        local.tee 2
        br_if 0 (;@2;)
      end
    end
    local.get 8)
  (func $_RNvNvMsa_NtCs7RAXWwMZhcx_4core3fmtNtB7_9Formatter12pad_integral12write_prefix (type 16) (param i32 i32 i32 i32 i32) (result i32)
    block  ;; label = @1
      local.get 2
      i32.const 1114112
      i32.eq
      br_if 0 (;@1;)
      local.get 0
      local.get 2
      local.get 1
      i32.load offset=16
      call_indirect (type 0)
      i32.eqz
      br_if 0 (;@1;)
      i32.const 1
      return
    end
    block  ;; label = @1
      local.get 3
      br_if 0 (;@1;)
      i32.const 0
      return
    end
    local.get 0
    local.get 3
    local.get 4
    local.get 1
    i32.load offset=12
    call_indirect (type 3))
  (func $_RNvMsa_NtCs7RAXWwMZhcx_4core3fmtNtB5_9Formatter25debug_tuple_field1_finish (type 16) (param i32 i32 i32 i32 i32) (result i32)
    (local i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 5
    global.set $__stack_pointer
    i32.const 1
    local.set 6
    block  ;; label = @1
      local.get 0
      i32.load
      local.tee 7
      local.get 1
      local.get 2
      local.get 0
      i32.load offset=4
      local.tee 8
      i32.load offset=12
      local.tee 9
      call_indirect (type 3)
      br_if 0 (;@1;)
      block  ;; label = @2
        block  ;; label = @3
          local.get 0
          i32.load8_u offset=10
          i32.const 128
          i32.and
          br_if 0 (;@3;)
          i32.const 1
          local.set 6
          local.get 7
          i32.const 1052432
          i32.const 1
          local.get 9
          call_indirect (type 3)
          br_if 2 (;@1;)
          local.get 3
          local.get 0
          local.get 4
          i32.load offset=12
          call_indirect (type 0)
          i32.eqz
          br_if 1 (;@2;)
          br 2 (;@1;)
        end
        local.get 7
        i32.const 1052433
        i32.const 2
        local.get 9
        call_indirect (type 3)
        br_if 1 (;@1;)
        i32.const 1
        local.set 6
        local.get 5
        i32.const 1
        i32.store8 offset=15
        local.get 5
        local.get 8
        i32.store offset=4
        local.get 5
        local.get 7
        i32.store
        local.get 5
        i32.const 1052440
        i32.store offset=20
        local.get 5
        local.get 0
        i64.load offset=8 align=4
        i64.store offset=24 align=4
        local.get 5
        local.get 5
        i32.const 15
        i32.add
        i32.store offset=8
        local.get 5
        local.get 5
        i32.store offset=16
        local.get 3
        local.get 5
        i32.const 16
        i32.add
        local.get 4
        i32.load offset=12
        call_indirect (type 0)
        br_if 1 (;@1;)
        local.get 5
        i32.load offset=16
        i32.const 1052430
        i32.const 2
        local.get 5
        i32.load offset=20
        i32.load offset=12
        call_indirect (type 3)
        br_if 1 (;@1;)
      end
      block  ;; label = @2
        local.get 2
        br_if 0 (;@2;)
        local.get 0
        i32.load8_u offset=10
        i32.const 128
        i32.and
        br_if 0 (;@2;)
        i32.const 1
        local.set 6
        local.get 0
        i32.load
        i32.const 1052437
        i32.const 1
        local.get 0
        i32.load offset=4
        i32.load offset=12
        call_indirect (type 3)
        br_if 1 (;@1;)
      end
      local.get 0
      i32.load
      i32.const 1052436
      i32.const 1
      local.get 0
      i32.load offset=4
      i32.load offset=12
      call_indirect (type 3)
      local.set 6
    end
    local.get 5
    i32.const 32
    i32.add
    global.set $__stack_pointer
    local.get 6)
  (func $_RNvMsa_NtCs7RAXWwMZhcx_4core3fmtNtB5_9Formatter26debug_struct_field2_finish (type 18) (param i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32) (result i32)
    (local i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 11
    global.set $__stack_pointer
    local.get 0
    i32.load
    local.get 1
    local.get 2
    local.get 0
    i32.load offset=4
    i32.load offset=12
    call_indirect (type 3)
    local.set 2
    local.get 11
    i32.const 0
    i32.store8 offset=13
    local.get 11
    local.get 2
    i32.store8 offset=12
    local.get 11
    local.get 0
    i32.store offset=8
    local.get 11
    i32.const 8
    i32.add
    local.get 3
    local.get 4
    local.get 5
    local.get 6
    call $_RNvMs1_NtNtCs7RAXWwMZhcx_4core3fmt8buildersNtB5_11DebugStruct5field
    local.get 7
    local.get 8
    local.get 9
    local.get 10
    call $_RNvMs1_NtNtCs7RAXWwMZhcx_4core3fmt8buildersNtB5_11DebugStruct5field
    local.set 10
    local.get 11
    i32.load8_u offset=13
    local.tee 2
    local.get 11
    i32.load8_u offset=12
    local.tee 1
    i32.or
    local.set 0
    block  ;; label = @1
      local.get 2
      i32.const 1
      i32.ne
      br_if 0 (;@1;)
      local.get 1
      i32.const 1
      i32.and
      br_if 0 (;@1;)
      block  ;; label = @2
        local.get 10
        i32.load
        local.tee 0
        i32.load8_u offset=10
        i32.const 128
        i32.and
        br_if 0 (;@2;)
        local.get 0
        i32.load
        i32.const 1052438
        i32.const 2
        local.get 0
        i32.load offset=4
        i32.load offset=12
        call_indirect (type 3)
        local.set 0
        br 1 (;@1;)
      end
      local.get 0
      i32.load
      i32.const 1052435
      i32.const 1
      local.get 0
      i32.load offset=4
      i32.load offset=12
      call_indirect (type 3)
      local.set 0
    end
    local.get 11
    i32.const 16
    i32.add
    global.set $__stack_pointer
    local.get 0
    i32.const 1
    i32.and)
  (func $_RNvMsa_NtCs7RAXWwMZhcx_4core3fmtNtB5_9Formatter3pad (type 3) (param i32 i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32)
    block  ;; label = @1
      block  ;; label = @2
        local.get 0
        i32.load offset=8
        local.tee 3
        i32.const 402653184
        i32.and
        i32.eqz
        br_if 0 (;@2;)
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              block  ;; label = @6
                block  ;; label = @7
                  local.get 3
                  i32.const 268435456
                  i32.and
                  i32.eqz
                  br_if 0 (;@7;)
                  local.get 0
                  i32.load16_u offset=14
                  local.tee 4
                  br_if 1 (;@6;)
                  i32.const 0
                  local.set 2
                  br 2 (;@5;)
                end
                block  ;; label = @7
                  local.get 2
                  i32.const 16
                  i32.lt_u
                  br_if 0 (;@7;)
                  local.get 1
                  local.get 2
                  call $_RNvNtNtCs7RAXWwMZhcx_4core3str5count14do_count_chars
                  local.set 5
                  br 4 (;@3;)
                end
                block  ;; label = @7
                  local.get 2
                  br_if 0 (;@7;)
                  i32.const 0
                  local.set 5
                  br 4 (;@3;)
                end
                local.get 2
                i32.const 3
                i32.and
                local.set 6
                i32.const 0
                local.set 7
                i32.const 0
                local.set 5
                block  ;; label = @7
                  local.get 2
                  i32.const 4
                  i32.lt_u
                  br_if 0 (;@7;)
                  local.get 2
                  i32.const 12
                  i32.and
                  local.set 4
                  i32.const 0
                  local.set 5
                  i32.const 0
                  local.set 7
                  loop  ;; label = @8
                    local.get 5
                    local.get 1
                    local.get 7
                    i32.add
                    local.tee 8
                    i32.load8_s
                    i32.const -65
                    i32.gt_s
                    i32.add
                    local.get 8
                    i32.const 1
                    i32.add
                    i32.load8_s
                    i32.const -65
                    i32.gt_s
                    i32.add
                    local.get 8
                    i32.const 2
                    i32.add
                    i32.load8_s
                    i32.const -65
                    i32.gt_s
                    i32.add
                    local.get 8
                    i32.const 3
                    i32.add
                    i32.load8_s
                    i32.const -65
                    i32.gt_s
                    i32.add
                    local.set 5
                    local.get 4
                    local.get 7
                    i32.const 4
                    i32.add
                    local.tee 7
                    i32.ne
                    br_if 0 (;@8;)
                  end
                  local.get 6
                  i32.eqz
                  br_if 4 (;@3;)
                end
                local.get 1
                local.get 7
                i32.add
                local.set 8
                loop  ;; label = @7
                  local.get 5
                  local.get 8
                  i32.load8_s
                  i32.const -65
                  i32.gt_s
                  i32.add
                  local.set 5
                  local.get 8
                  i32.const 1
                  i32.add
                  local.set 8
                  local.get 6
                  i32.const -1
                  i32.add
                  local.tee 6
                  br_if 0 (;@7;)
                  br 4 (;@3;)
                end
              end
              local.get 1
              local.get 2
              i32.add
              local.set 7
              i32.const 0
              local.set 2
              local.get 1
              local.set 8
              local.get 4
              local.set 6
              loop  ;; label = @6
                local.get 8
                local.tee 5
                local.get 7
                i32.eq
                br_if 2 (;@4;)
                block  ;; label = @7
                  block  ;; label = @8
                    local.get 5
                    i32.load8_s
                    local.tee 8
                    i32.const -1
                    i32.le_s
                    br_if 0 (;@8;)
                    local.get 5
                    i32.const 1
                    i32.add
                    local.set 8
                    br 1 (;@7;)
                  end
                  block  ;; label = @8
                    local.get 8
                    i32.const -32
                    i32.ge_u
                    br_if 0 (;@8;)
                    local.get 5
                    i32.const 2
                    i32.add
                    local.set 8
                    br 1 (;@7;)
                  end
                  local.get 5
                  i32.const 4
                  i32.const 3
                  local.get 8
                  i32.const -17
                  i32.gt_u
                  select
                  i32.add
                  local.set 8
                end
                local.get 8
                local.get 5
                i32.sub
                local.get 2
                i32.add
                local.set 2
                local.get 6
                i32.const -1
                i32.add
                local.tee 6
                br_if 0 (;@6;)
              end
            end
            i32.const 0
            local.set 6
          end
          local.get 4
          local.get 6
          i32.sub
          local.set 5
        end
        local.get 5
        local.get 0
        i32.load16_u offset=12
        local.tee 8
        i32.ge_u
        br_if 0 (;@2;)
        local.get 8
        local.get 5
        i32.sub
        local.set 9
        i32.const 0
        local.set 5
        i32.const 0
        local.set 4
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              local.get 3
              i32.const 29
              i32.shr_u
              i32.const 3
              i32.and
              br_table 2 (;@3;) 0 (;@5;) 1 (;@4;) 2 (;@3;) 2 (;@3;)
            end
            local.get 9
            local.set 4
            br 1 (;@3;)
          end
          local.get 9
          i32.const 65534
          i32.and
          i32.const 1
          i32.shr_u
          local.set 4
        end
        local.get 3
        i32.const 2097151
        i32.and
        local.set 7
        local.get 0
        i32.load offset=4
        local.set 6
        local.get 0
        i32.load
        local.set 0
        block  ;; label = @3
          loop  ;; label = @4
            local.get 5
            i32.const 65535
            i32.and
            local.get 4
            i32.const 65535
            i32.and
            i32.ge_u
            br_if 1 (;@3;)
            i32.const 1
            local.set 8
            local.get 5
            i32.const 1
            i32.add
            local.set 5
            local.get 0
            local.get 7
            local.get 6
            i32.load offset=16
            call_indirect (type 0)
            br_if 3 (;@1;)
            br 0 (;@4;)
          end
        end
        i32.const 1
        local.set 8
        local.get 0
        local.get 1
        local.get 2
        local.get 6
        i32.load offset=12
        call_indirect (type 3)
        br_if 1 (;@1;)
        i32.const 0
        local.set 5
        local.get 9
        local.get 4
        i32.sub
        i32.const 65535
        i32.and
        local.set 2
        loop  ;; label = @3
          local.get 5
          i32.const 65535
          i32.and
          local.tee 4
          local.get 2
          i32.lt_u
          local.set 8
          local.get 4
          local.get 2
          i32.ge_u
          br_if 2 (;@1;)
          local.get 5
          i32.const 1
          i32.add
          local.set 5
          local.get 0
          local.get 7
          local.get 6
          i32.load offset=16
          call_indirect (type 0)
          br_if 2 (;@1;)
          br 0 (;@3;)
        end
      end
      local.get 0
      i32.load
      local.get 1
      local.get 2
      local.get 0
      i32.load offset=4
      i32.load offset=12
      call_indirect (type 3)
      local.set 8
    end
    local.get 8)
  (func $_RNvMsa_NtCs7RAXWwMZhcx_4core3fmtNtB5_9Formatter9write_str (type 3) (param i32 i32 i32) (result i32)
    local.get 0
    i32.load
    local.get 1
    local.get 2
    local.get 0
    i32.load offset=4
    i32.load offset=12
    call_indirect (type 3))
  (func $_RNvXs8_NtNtNtCs7RAXWwMZhcx_4core3fmt3num3impmNtB9_7Display3fmt (type 0) (param i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    i32.const 10
    local.set 3
    local.get 0
    i32.load
    local.tee 4
    local.set 5
    block  ;; label = @1
      local.get 4
      i32.const 1000
      i32.lt_u
      br_if 0 (;@1;)
      i32.const 10
      local.set 3
      local.get 4
      local.set 5
      loop  ;; label = @2
        local.get 2
        i32.const 6
        i32.add
        local.get 3
        i32.add
        local.tee 6
        i32.const -4
        i32.add
        local.get 5
        local.tee 0
        local.get 0
        i32.const 10000
        i32.div_u
        local.tee 5
        i32.const 10000
        i32.mul
        i32.sub
        local.tee 7
        i32.const 65535
        i32.and
        i32.const 100
        i32.div_u
        local.tee 8
        i32.const 1
        i32.shl
        i32.load16_u offset=1052475 align=1
        i32.store16 align=1
        local.get 6
        i32.const -2
        i32.add
        local.get 7
        local.get 8
        i32.const 100
        i32.mul
        i32.sub
        i32.const 65535
        i32.and
        i32.const 1
        i32.shl
        i32.load16_u offset=1052475 align=1
        i32.store16 align=1
        local.get 3
        i32.const -4
        i32.add
        local.set 3
        local.get 0
        i32.const 9999999
        i32.gt_u
        br_if 0 (;@2;)
      end
    end
    block  ;; label = @1
      block  ;; label = @2
        local.get 5
        i32.const 9
        i32.gt_u
        br_if 0 (;@2;)
        local.get 5
        local.set 0
        br 1 (;@1;)
      end
      local.get 2
      i32.const 6
      i32.add
      local.get 3
      i32.const -2
      i32.add
      local.tee 3
      i32.add
      local.get 5
      local.get 5
      i32.const 65535
      i32.and
      i32.const 100
      i32.div_u
      local.tee 0
      i32.const 100
      i32.mul
      i32.sub
      i32.const 65535
      i32.and
      i32.const 1
      i32.shl
      i32.load16_u offset=1052475 align=1
      i32.store16 align=1
    end
    block  ;; label = @1
      block  ;; label = @2
        local.get 4
        i32.eqz
        br_if 0 (;@2;)
        local.get 0
        i32.eqz
        br_if 1 (;@1;)
      end
      local.get 2
      i32.const 6
      i32.add
      local.get 3
      i32.const -1
      i32.add
      local.tee 3
      i32.add
      local.get 0
      i32.const 1
      i32.shl
      i32.load8_u offset=1052476
      i32.store8
    end
    local.get 1
    i32.const 1
    i32.const 1
    i32.const 0
    local.get 2
    i32.const 6
    i32.add
    local.get 3
    i32.add
    i32.const 10
    local.get 3
    i32.sub
    call $_RNvMsa_NtCs7RAXWwMZhcx_4core3fmtNtB5_9Formatter12pad_integral
    local.set 3
    local.get 2
    i32.const 16
    i32.add
    global.set $__stack_pointer
    local.get 3)
  (func $_RNvNtCs7RAXWwMZhcx_4core4cell22panic_already_borrowed (type 1) (param i32)
    (local i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 1
    global.set $__stack_pointer
    local.get 1
    i32.const 43
    i64.extend_i32_u
    i64.const 32
    i64.shl
    local.get 1
    i32.const 15
    i32.add
    i64.extend_i32_u
    i64.or
    i64.store
    i32.const 1048877
    local.get 1
    local.get 0
    call $_RNvNtCs7RAXWwMZhcx_4core9panicking9panic_fmt
    unreachable)
  (func $_RNvXsr_NtCs7RAXWwMZhcx_4core4cellNtB5_14BorrowMutErrorNtNtB7_3fmt7Display3fmt (type 0) (param i32 i32) (result i32)
    local.get 1
    i32.const 1053052
    i32.const 24
    call $_RNvMsa_NtCs7RAXWwMZhcx_4core3fmtNtB5_9Formatter3pad)
  (func $_RNvNtCs7RAXWwMZhcx_4core6option13expect_failed (type 6) (param i32 i32 i32)
    (local i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 3
    global.set $__stack_pointer
    local.get 3
    local.get 1
    i32.store offset=4
    local.get 3
    local.get 0
    i32.store
    local.get 3
    i32.const 41
    i64.extend_i32_u
    i64.const 32
    i64.shl
    local.get 3
    i64.extend_i32_u
    i64.or
    i64.store offset=8
    i32.const 1048877
    local.get 3
    i32.const 8
    i32.add
    local.get 2
    call $_RNvNtCs7RAXWwMZhcx_4core9panicking9panic_fmt
    unreachable)
  (func $_RNvNtCs7RAXWwMZhcx_4core6result13unwrap_failed (type 8) (param i32 i32 i32 i32 i32)
    (local i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 5
    global.set $__stack_pointer
    local.get 5
    local.get 1
    i32.store offset=4
    local.get 5
    local.get 0
    i32.store
    local.get 5
    local.get 3
    i32.store offset=12
    local.get 5
    local.get 2
    i32.store offset=8
    local.get 5
    i32.const 39
    i64.extend_i32_u
    i64.const 32
    i64.shl
    local.get 5
    i32.const 8
    i32.add
    i64.extend_i32_u
    i64.or
    i64.store offset=24
    local.get 5
    i32.const 41
    i64.extend_i32_u
    i64.const 32
    i64.shl
    local.get 5
    i64.extend_i32_u
    i64.or
    i64.store offset=16
    i32.const 1048873
    local.get 5
    i32.const 16
    i32.add
    local.get 4
    call $_RNvNtCs7RAXWwMZhcx_4core9panicking9panic_fmt
    unreachable)
  (func $_RNvXs1g_NtCs7RAXWwMZhcx_4core3fmtRDNtB6_5DebugEL_Bx_3fmtB8_ (type 0) (param i32 i32) (result i32)
    local.get 0
    i32.load
    local.get 1
    local.get 0
    i32.load offset=4
    i32.load offset=12
    call_indirect (type 0))
  (func $_RNvXs8_NtCs7RAXWwMZhcx_4core3fmtNtB5_9ArgumentsNtB5_7Display3fmt (type 0) (param i32 i32) (result i32)
    local.get 1
    i32.load
    local.get 1
    i32.load offset=4
    local.get 0
    i32.load
    local.get 0
    i32.load offset=4
    call $_RNvNtCs7RAXWwMZhcx_4core3fmt5write)
  (func $_RNvXs6_NtNtCs7RAXWwMZhcx_4core3fmt3numjNtB7_8LowerHex3fmt (type 0) (param i32 i32) (result i32)
    (local i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    local.get 0
    i32.load
    local.set 3
    i32.const 0
    local.set 0
    loop  ;; label = @1
      local.get 2
      i32.const 8
      i32.add
      local.get 0
      i32.add
      i32.const 7
      i32.add
      local.get 3
      i32.const 15
      i32.and
      i32.load8_u offset=1052404
      i32.store8
      local.get 0
      i32.const -1
      i32.add
      local.set 0
      local.get 3
      i32.const 4
      i32.shr_u
      local.tee 3
      br_if 0 (;@1;)
    end
    local.get 1
    i32.const 1
    i32.const 1053025
    i32.const 2
    local.get 2
    i32.const 8
    i32.add
    local.get 0
    i32.add
    i32.const 8
    i32.add
    i32.const 0
    local.get 0
    i32.sub
    call $_RNvMsa_NtCs7RAXWwMZhcx_4core3fmtNtB5_9Formatter12pad_integral
    local.set 0
    local.get 2
    i32.const 16
    i32.add
    global.set $__stack_pointer
    local.get 0)
  (func $_RNvNtNtCs7RAXWwMZhcx_4core5slice6memchr7memrchr (type 10) (param i32 i32 i32 i32)
    (local i32 i32 i32 i32 i32 i32 i32)
    local.get 3
    local.set 4
    local.get 3
    local.set 5
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              block  ;; label = @6
                local.get 3
                local.get 2
                i32.const 3
                i32.add
                i32.const -4
                i32.and
                local.get 2
                i32.sub
                local.tee 6
                i32.lt_u
                br_if 0 (;@6;)
                local.get 3
                local.get 3
                local.get 6
                i32.sub
                i32.const 7
                i32.and
                local.tee 7
                i32.sub
                local.set 4
                local.get 3
                local.get 7
                i32.lt_u
                br_if 1 (;@5;)
                local.get 6
                local.set 5
              end
              i32.const 0
              local.get 4
              i32.sub
              local.set 8
              local.get 2
              i32.const -1
              i32.add
              local.set 9
              local.get 1
              i32.const 255
              i32.and
              local.set 10
              local.get 3
              local.set 6
              loop  ;; label = @6
                local.get 8
                local.get 6
                i32.add
                i32.eqz
                br_if 2 (;@4;)
                local.get 9
                local.get 6
                i32.add
                local.set 7
                local.get 6
                i32.const -1
                i32.add
                local.set 6
                local.get 7
                i32.load8_u
                local.get 10
                i32.ne
                br_if 0 (;@6;)
                br 3 (;@3;)
              end
            end
            local.get 4
            local.get 3
            local.get 3
            i32.const 1052948
            call $_RNvNtNtCs7RAXWwMZhcx_4core5slice5index16slice_index_fail
            unreachable
          end
          local.get 1
          i32.const 255
          i32.and
          i32.const 16843009
          i32.mul
          local.set 7
          block  ;; label = @4
            loop  ;; label = @5
              local.get 4
              local.tee 6
              local.get 5
              i32.le_u
              br_if 1 (;@4;)
              local.get 6
              i32.const -8
              i32.add
              local.set 4
              i32.const 16843008
              local.get 2
              local.get 6
              i32.add
              local.tee 8
              i32.const -8
              i32.add
              i32.load
              local.get 7
              i32.xor
              local.tee 9
              i32.sub
              local.get 9
              i32.or
              i32.const 16843008
              local.get 8
              i32.const -4
              i32.add
              i32.load
              local.get 7
              i32.xor
              local.tee 8
              i32.sub
              local.get 8
              i32.or
              i32.and
              i32.const -2139062144
              i32.and
              i32.const -2139062144
              i32.eq
              br_if 0 (;@5;)
            end
          end
          local.get 6
          local.get 3
          i32.gt_u
          br_if 2 (;@1;)
          local.get 2
          i32.const -1
          i32.add
          local.set 4
          local.get 1
          i32.const 255
          i32.and
          local.set 8
          loop  ;; label = @4
            block  ;; label = @5
              local.get 6
              br_if 0 (;@5;)
              i32.const 0
              local.set 7
              br 3 (;@2;)
            end
            local.get 4
            local.get 6
            i32.add
            local.set 7
            local.get 6
            i32.const -1
            i32.add
            local.set 6
            local.get 7
            i32.load8_u
            local.get 8
            i32.ne
            br_if 0 (;@4;)
          end
        end
        i32.const 1
        local.set 7
      end
      local.get 0
      local.get 6
      i32.store offset=4
      local.get 0
      local.get 7
      i32.store
      return
    end
    i32.const 0
    local.get 6
    local.get 3
    i32.const 1052932
    call $_RNvNtNtCs7RAXWwMZhcx_4core5slice5index16slice_index_fail
    unreachable)
  (func $_RNvNtNtCs7RAXWwMZhcx_4core9panicking11panic_const23panic_const_rem_by_zero (type 1) (param i32)
    i32.const 1052964
    i32.const 115
    local.get 0
    call $_RNvNtCs7RAXWwMZhcx_4core9panicking9panic_fmt
    unreachable)
  (func $_RNvXNtNtNtCs7RAXWwMZhcx_4core3fmt3num3imphNtB6_7Display3fmt (type 0) (param i32 i32) (result i32)
    (local i32 i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    i32.const 3
    local.set 3
    local.get 0
    i32.load8_u
    local.tee 0
    local.set 4
    block  ;; label = @1
      local.get 0
      i32.const 10
      i32.lt_u
      br_if 0 (;@1;)
      i32.const 1
      local.set 3
      local.get 2
      local.get 0
      local.get 0
      i32.const 100
      i32.div_u
      local.tee 4
      i32.const 100
      i32.mul
      i32.sub
      i32.const 255
      i32.and
      i32.const 1
      i32.shl
      i32.load16_u offset=1052475 align=1
      i32.store16 offset=14 align=1
    end
    block  ;; label = @1
      block  ;; label = @2
        local.get 0
        i32.eqz
        br_if 0 (;@2;)
        local.get 4
        i32.eqz
        br_if 1 (;@1;)
      end
      local.get 2
      i32.const 13
      i32.add
      local.get 3
      i32.const -1
      i32.add
      local.tee 3
      i32.add
      local.get 4
      i32.const 1
      i32.shl
      i32.load8_u offset=1052476
      i32.store8
    end
    local.get 1
    i32.const 1
    i32.const 1
    i32.const 0
    local.get 2
    i32.const 13
    i32.add
    local.get 3
    i32.add
    i32.const 3
    local.get 3
    i32.sub
    call $_RNvMsa_NtCs7RAXWwMZhcx_4core3fmtNtB5_9Formatter12pad_integral
    local.set 3
    local.get 2
    i32.const 16
    i32.add
    global.set $__stack_pointer
    local.get 3)
  (func $_RNvXs0_NtNtCs7RAXWwMZhcx_4core3fmt8buildersNtB5_10PadAdapterNtB7_5Write10write_char (type 0) (param i32 i32) (result i32)
    (local i32 i32)
    local.get 0
    i32.load offset=4
    local.set 2
    local.get 0
    i32.load
    local.set 3
    block  ;; label = @1
      local.get 0
      i32.load offset=8
      local.tee 0
      i32.load8_u
      i32.eqz
      br_if 0 (;@1;)
      local.get 3
      i32.const 1053021
      i32.const 4
      local.get 2
      i32.load offset=12
      call_indirect (type 3)
      i32.eqz
      br_if 0 (;@1;)
      i32.const 1
      return
    end
    local.get 0
    local.get 1
    i32.const 10
    i32.eq
    i32.store8
    local.get 3
    local.get 1
    local.get 2
    i32.load offset=16
    call_indirect (type 0))
  (func $_RNvXsg_NtNtCs7RAXWwMZhcx_4core3fmt3numhNtB7_8UpperHex3fmt (type 0) (param i32 i32) (result i32)
    (local i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    local.get 0
    i32.load8_u
    local.set 3
    i32.const 0
    local.set 0
    loop  ;; label = @1
      local.get 2
      i32.const 14
      i32.add
      local.get 0
      i32.add
      i32.const 1
      i32.add
      local.get 3
      i32.const 15
      i32.and
      i32.const 1053027
      i32.add
      i32.load8_u
      i32.store8
      local.get 0
      i32.const -1
      i32.add
      local.set 0
      local.get 3
      i32.const 4
      i32.shr_u
      i32.const 15
      i32.and
      local.tee 3
      br_if 0 (;@1;)
    end
    local.get 1
    i32.const 1
    i32.const 1053025
    i32.const 2
    local.get 2
    i32.const 14
    i32.add
    local.get 0
    i32.add
    i32.const 2
    i32.add
    i32.const 0
    local.get 0
    i32.sub
    call $_RNvMsa_NtCs7RAXWwMZhcx_4core3fmtNtB5_9Formatter12pad_integral
    local.set 0
    local.get 2
    i32.const 16
    i32.add
    global.set $__stack_pointer
    local.get 0)
  (func $_RNvXs9_NtNtNtCs7RAXWwMZhcx_4core3fmt3num3implNtB9_7Display3fmt (type 0) (param i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    i32.const 10
    local.set 3
    block  ;; label = @1
      local.get 0
      i32.load
      local.tee 4
      local.get 4
      i32.const 31
      i32.shr_s
      local.tee 0
      i32.xor
      local.get 0
      i32.sub
      local.tee 5
      i32.const 1000
      i32.lt_u
      br_if 0 (;@1;)
      i32.const 10
      local.set 3
      loop  ;; label = @2
        local.get 2
        i32.const 6
        i32.add
        local.get 3
        i32.add
        local.tee 6
        i32.const -4
        i32.add
        local.get 5
        local.tee 0
        local.get 0
        i32.const 10000
        i32.div_u
        local.tee 5
        i32.const 10000
        i32.mul
        i32.sub
        local.tee 7
        i32.const 65535
        i32.and
        i32.const 100
        i32.div_u
        local.tee 8
        i32.const 1
        i32.shl
        i32.load16_u offset=1052475 align=1
        i32.store16 align=1
        local.get 6
        i32.const -2
        i32.add
        local.get 7
        local.get 8
        i32.const 100
        i32.mul
        i32.sub
        i32.const 65535
        i32.and
        i32.const 1
        i32.shl
        i32.load16_u offset=1052475 align=1
        i32.store16 align=1
        local.get 3
        i32.const -4
        i32.add
        local.set 3
        local.get 0
        i32.const 9999999
        i32.gt_u
        br_if 0 (;@2;)
      end
    end
    block  ;; label = @1
      block  ;; label = @2
        local.get 5
        i32.const 9
        i32.gt_u
        br_if 0 (;@2;)
        local.get 5
        local.set 0
        br 1 (;@1;)
      end
      local.get 2
      i32.const 6
      i32.add
      local.get 3
      i32.const -2
      i32.add
      local.tee 3
      i32.add
      local.get 5
      local.get 5
      i32.const 65535
      i32.and
      i32.const 100
      i32.div_u
      local.tee 0
      i32.const 100
      i32.mul
      i32.sub
      i32.const 65535
      i32.and
      i32.const 1
      i32.shl
      i32.load16_u offset=1052475 align=1
      i32.store16 align=1
    end
    block  ;; label = @1
      block  ;; label = @2
        local.get 4
        i32.eqz
        br_if 0 (;@2;)
        local.get 0
        i32.eqz
        br_if 1 (;@1;)
      end
      local.get 2
      i32.const 6
      i32.add
      local.get 3
      i32.const -1
      i32.add
      local.tee 3
      i32.add
      local.get 0
      i32.const 1
      i32.shl
      i32.load8_u offset=1052476
      i32.store8
    end
    local.get 1
    local.get 4
    i32.const -1
    i32.xor
    i32.const 31
    i32.shr_u
    i32.const 1
    i32.const 0
    local.get 2
    i32.const 6
    i32.add
    local.get 3
    i32.add
    i32.const 10
    local.get 3
    i32.sub
    call $_RNvMsa_NtCs7RAXWwMZhcx_4core3fmtNtB5_9Formatter12pad_integral
    local.set 3
    local.get 2
    i32.const 16
    i32.add
    global.set $__stack_pointer
    local.get 3)
  (func $_RNvXse_NtNtCs7RAXWwMZhcx_4core3fmt3numhNtB7_8LowerHex3fmt (type 0) (param i32 i32) (result i32)
    (local i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    local.get 0
    i32.load8_u
    local.set 3
    i32.const 0
    local.set 0
    loop  ;; label = @1
      local.get 2
      i32.const 14
      i32.add
      local.get 0
      i32.add
      i32.const 1
      i32.add
      local.get 3
      i32.const 15
      i32.and
      i32.const 1052404
      i32.add
      i32.load8_u
      i32.store8
      local.get 0
      i32.const -1
      i32.add
      local.set 0
      local.get 3
      i32.const 4
      i32.shr_u
      i32.const 15
      i32.and
      local.tee 3
      br_if 0 (;@1;)
    end
    local.get 1
    i32.const 1
    i32.const 1053025
    i32.const 2
    local.get 2
    i32.const 14
    i32.add
    local.get 0
    i32.add
    i32.const 2
    i32.add
    i32.const 0
    local.get 0
    i32.sub
    call $_RNvMsa_NtCs7RAXWwMZhcx_4core3fmtNtB5_9Formatter12pad_integral
    local.set 0
    local.get 2
    i32.const 16
    i32.add
    global.set $__stack_pointer
    local.get 0)
  (func $_RNvXs8_NtNtCs7RAXWwMZhcx_4core3fmt3numjNtB7_8UpperHex3fmt (type 0) (param i32 i32) (result i32)
    (local i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    local.get 0
    i32.load
    local.set 3
    i32.const 0
    local.set 0
    loop  ;; label = @1
      local.get 2
      i32.const 8
      i32.add
      local.get 0
      i32.add
      i32.const 7
      i32.add
      local.get 3
      i32.const 15
      i32.and
      i32.load8_u offset=1053027
      i32.store8
      local.get 0
      i32.const -1
      i32.add
      local.set 0
      local.get 3
      i32.const 4
      i32.shr_u
      local.tee 3
      br_if 0 (;@1;)
    end
    local.get 1
    i32.const 1
    i32.const 1053025
    i32.const 2
    local.get 2
    i32.const 8
    i32.add
    local.get 0
    i32.add
    i32.const 8
    i32.add
    i32.const 0
    local.get 0
    i32.sub
    call $_RNvMsa_NtCs7RAXWwMZhcx_4core3fmtNtB5_9Formatter12pad_integral
    local.set 0
    local.get 2
    i32.const 16
    i32.add
    global.set $__stack_pointer
    local.get 0)
  (func $_RNvXsg_NtCs7RAXWwMZhcx_4core3fmtbNtB5_7Display3fmt (type 0) (param i32 i32) (result i32)
    block  ;; label = @1
      local.get 0
      i32.load8_u
      br_if 0 (;@1;)
      local.get 1
      i32.const 1053043
      i32.const 5
      call $_RNvMsa_NtCs7RAXWwMZhcx_4core3fmtNtB5_9Formatter3pad
      return
    end
    local.get 1
    i32.const 1053048
    i32.const 4
    call $_RNvMsa_NtCs7RAXWwMZhcx_4core3fmtNtB5_9Formatter3pad)
  (func $_RNvXsi_NtCs7RAXWwMZhcx_4core3fmteNtB5_7Display3fmt (type 3) (param i32 i32 i32) (result i32)
    local.get 2
    local.get 0
    local.get 1
    call $_RNvMsa_NtCs7RAXWwMZhcx_4core3fmtNtB5_9Formatter3pad)
  (func $_RNvYNtNtNtCs7RAXWwMZhcx_4core3fmt8builders10PadAdapterNtB6_5Write9write_fmtB8_ (type 3) (param i32 i32 i32) (result i32)
    local.get 0
    i32.const 1052440
    local.get 1
    local.get 2
    call $_RNvNtCs7RAXWwMZhcx_4core3fmt5write)
  (table (;0;) 47 47 funcref)
  (memory (;0;) 17)
  (global $__stack_pointer (mut i32) (i32.const 1048576))
  (global (;1;) i32 (i32.const 1053760))
  (global (;2;) i32 (i32.const 1053760))
  (export "memory" (memory 0))
  (export "subtract" (func $subtract))
  (export "calculator_add" (func $_RNvMs_Csjl1iKzzrMk6_15libc_calculatorNtB4_10Calculator3add))
  (export "calculator_divide" (func $_RNvMs_Csjl1iKzzrMk6_15libc_calculatorNtB4_10Calculator6divide))
  (export "calculator_subtract" (func $_RNvMs_Csjl1iKzzrMk6_15libc_calculatorNtB4_10Calculator8subtract))
  (export "calculator_store" (func $_RNvMs_Csjl1iKzzrMk6_15libc_calculatorNtB4_10Calculator5store))
  (export "calculator_multiply" (func $_RNvMs_Csjl1iKzzrMk6_15libc_calculatorNtB4_10Calculator8multiply))
  (export "multiply" (func $_RNvMs_Csjl1iKzzrMk6_15libc_calculatorNtB4_10Calculator8multiply))
  (export "calculator_clear" (func $_RNvMs_Csjl1iKzzrMk6_15libc_calculatorNtB4_10Calculator5clear))
  (export "calculator_retrieve" (func $_RNvMs_Csjl1iKzzrMk6_15libc_calculatorNtB4_10Calculator8retrieve))
  (export "__errno_location" (func $__errno_location))
  (export "malloc" (func $malloc))
  (export "free" (func $free))
  (export "__assert_fail" (func $__assert_fail))
  (export "abort" (func $abort))
  (export "getenv" (func $getenv))
  (export "puts" (func $puts))
  (export "qsort" (func $qsort))
  (export "raise" (func $raise))
  (export "signal" (func $signal))
  (export "abs" (func $abs))
  (export "atoi" (func $atoi))
  (export "calloc" (func $calloc))
  (export "strlen" (func $strlen))
  (export "isalpha" (func $isalpha))
  (export "isdigit" (func $isdigit))
  (export "isspace" (func $isspace))
  (export "isupper" (func $isupper))
  (export "itoa" (func $itoa))
  (export "memchr" (func $memchr))
  (export "realloc" (func $realloc))
  (export "strcat" (func $strcat))
  (export "strchr" (func $strchr))
  (export "strcmp" (func $strcmp))
  (export "strcpy" (func $strcpy))
  (export "strncasecmp" (func $strncasecmp))
  (export "strncmp" (func $strncmp))
  (export "strncpy" (func $strncpy))
  (export "strrchr" (func $strrchr))
  (export "strstr" (func $strstr))
  (export "strtoimax" (func $strtoimax))
  (export "strtol" (func $strtol))
  (export "strtoul" (func $strtoul))
  (export "strtoull" (func $strtoull))
  (export "utoa" (func $utoa))
  (export "strtoll" (func $strtoimax))
  (export "strtoumax" (func $strtoull))
  (export "__data_end" (global 1))
  (export "__heap_base" (global 2))
  (elem (;0;) (i32.const 1) func $_RNvXs9_NtNtNtCs7RAXWwMZhcx_4core3fmt3num3implNtB9_7Display3fmt $_RNvXs1i_NtCs7RAXWwMZhcx_4core3fmtReNtB6_7Display3fmtCsaJZI1b1iR8F_11wasm32_libc $_RNvXsq_NtCslUrat6hAxmK_5alloc6stringNtB5_6StringNtNtCs7RAXWwMZhcx_4core3fmt7Display3fmt $_RNvXsZ_NtNtCs7RAXWwMZhcx_4core3fmt3numjNtB7_5Debug3fmt $_RNvXs1g_NtCs7RAXWwMZhcx_4core3fmtRINtNtB8_6option6OptionhENtB6_5Debug3fmtCsaJZI1b1iR8F_11wasm32_libc $_RNvXs9_NtNtCs7RAXWwMZhcx_4core3str5errorNtB5_9Utf8ErrorNtNtB9_3fmt5Debug3fmt $_RNvXs1g_NtCs7RAXWwMZhcx_4core3fmtRhNtB6_5Debug3fmtCsaJZI1b1iR8F_11wasm32_libc $_RNvXsd_NtNtCs7RAXWwMZhcx_4core5alloc6layoutNtB5_11LayoutErrorNtNtB9_3fmt5Debug3fmt $_RNvNtCseKMvW2SdwUu_3std5alloc24default_alloc_error_hook $_RNvXs7_NtNtCseKMvW2SdwUu_3std2io5errorNtB5_5ErrorNtNtCs7RAXWwMZhcx_4core3fmt7Display3fmt $_RNvXs1i_NtCs7RAXWwMZhcx_4core3fmtReNtB6_7Display3fmtCseKMvW2SdwUu_3std $_RNvXsq_NtCslUrat6hAxmK_5alloc6stringNtB5_6StringNtNtCs7RAXWwMZhcx_4core3fmt7Display3fmt.1 $_RNvXs1g_NtCs7RAXWwMZhcx_4core3fmtRbNtB6_5Debug3fmtCseKMvW2SdwUu_3std $_RINvNtCs7RAXWwMZhcx_4core3ptr13drop_in_placeINtNvNtCseKMvW2SdwUu_3std2io17default_write_fmt7AdapterINtNtBL_6cursor6CursorQShEEEBN_ $_RNvXNvNtCseKMvW2SdwUu_3std2io17default_write_fmtINtB2_7AdapterINtNtCslUrat6hAxmK_5alloc3vec3VechEENtNtCs7RAXWwMZhcx_4core3fmt5Write9write_strB6_ $_RNvYINtNvNtCseKMvW2SdwUu_3std2io17default_write_fmt7AdapterINtNtCslUrat6hAxmK_5alloc3vec3VechEENtNtCs7RAXWwMZhcx_4core3fmt5Write10write_charB9_ $_RNvYINtNvNtCseKMvW2SdwUu_3std2io17default_write_fmt7AdapterINtNtCslUrat6hAxmK_5alloc3vec3VechEENtNtCs7RAXWwMZhcx_4core3fmt5Write9write_fmtB9_ $_RNvXNvNtCseKMvW2SdwUu_3std2io17default_write_fmtINtB2_7AdapterNtNtB4_5stdio10StderrLockENtNtCs7RAXWwMZhcx_4core3fmt5Write9write_strB6_ $_RNvYINtNvNtCseKMvW2SdwUu_3std2io17default_write_fmt7AdapterNtNtB7_5stdio10StderrLockENtNtCs7RAXWwMZhcx_4core3fmt5Write10write_charB9_ $_RNvYINtNvNtCseKMvW2SdwUu_3std2io17default_write_fmt7AdapterNtNtB7_5stdio10StderrLockENtNtCs7RAXWwMZhcx_4core3fmt5Write9write_fmtB9_ $_RNvXNvNtCseKMvW2SdwUu_3std2io17default_write_fmtINtB2_7AdapterNtNtB4_5stdio10StdoutLockENtNtCs7RAXWwMZhcx_4core3fmt5Write9write_strB6_ $_RNvYINtNvNtCseKMvW2SdwUu_3std2io17default_write_fmt7AdapterNtNtB7_5stdio10StdoutLockENtNtCs7RAXWwMZhcx_4core3fmt5Write10write_charB9_ $_RNvYINtNvNtCseKMvW2SdwUu_3std2io17default_write_fmt7AdapterNtNtB7_5stdio10StdoutLockENtNtCs7RAXWwMZhcx_4core3fmt5Write9write_fmtB9_ $_RINvNtCs7RAXWwMZhcx_4core3ptr13drop_in_placeNtNtCslUrat6hAxmK_5alloc6string6StringECseKMvW2SdwUu_3std $_RNvXsZ_NtCslUrat6hAxmK_5alloc6stringNtB5_6StringNtNtCs7RAXWwMZhcx_4core3fmt5Write9write_str $_RNvXsZ_NtCslUrat6hAxmK_5alloc6stringNtB5_6StringNtNtCs7RAXWwMZhcx_4core3fmt5Write10write_char $_RNvYNtNtCslUrat6hAxmK_5alloc6string6StringNtNtCs7RAXWwMZhcx_4core3fmt5Write9write_fmtCseKMvW2SdwUu_3std $_RNvXs2_NvNtCseKMvW2SdwUu_3std9panicking13panic_handlerNtB5_16StaticStrPayloadNtNtCs7RAXWwMZhcx_4core3fmt7Display3fmt $_RNvXs1_NvNtCseKMvW2SdwUu_3std9panicking13panic_handlerNtB5_16StaticStrPayloadNtNtCs7RAXWwMZhcx_4core5panic12PanicPayload8take_box $_RNvXs1_NvNtCseKMvW2SdwUu_3std9panicking13panic_handlerNtB5_16StaticStrPayloadNtNtCs7RAXWwMZhcx_4core5panic12PanicPayload3get $_RNvXs1_NvNtCseKMvW2SdwUu_3std9panicking13panic_handlerNtB5_16StaticStrPayloadNtNtCs7RAXWwMZhcx_4core5panic12PanicPayload6as_str $_RINvNtCs7RAXWwMZhcx_4core3ptr13drop_in_placeNtNvNtCseKMvW2SdwUu_3std9panicking13panic_handler19FormatStringPayloadEBM_ $_RNvXs0_NvNtCseKMvW2SdwUu_3std9panicking13panic_handlerNtB5_19FormatStringPayloadNtNtCs7RAXWwMZhcx_4core3fmt7Display3fmt $_RNvXs_NvNtCseKMvW2SdwUu_3std9panicking13panic_handlerNtB4_19FormatStringPayloadNtNtCs7RAXWwMZhcx_4core5panic12PanicPayload8take_box $_RNvXs_NvNtCseKMvW2SdwUu_3std9panicking13panic_handlerNtB4_19FormatStringPayloadNtNtCs7RAXWwMZhcx_4core5panic12PanicPayload3get $_RNvYINtNvNtCseKMvW2SdwUu_3std9panicking11begin_panic7PayloadReENtNtCs7RAXWwMZhcx_4core5panic12PanicPayload6as_strB9_ $_RNvXNtCs7RAXWwMZhcx_4core3anyReNtB2_3Any7type_idCseKMvW2SdwUu_3std $_RNvXNtCs7RAXWwMZhcx_4core3anyNtNtCslUrat6hAxmK_5alloc6string6StringNtB2_3Any7type_idCseKMvW2SdwUu_3std $_RNvXs1g_NtCs7RAXWwMZhcx_4core3fmtRDNtB6_5DebugEL_Bx_3fmtB8_ $_RNvXs8_NtCs7RAXWwMZhcx_4core3fmtNtB5_9ArgumentsNtB5_7Display3fmt $_RNvXs1i_NtCs7RAXWwMZhcx_4core3fmtReNtB6_7Display3fmtB8_ $_RNvXs8_NtNtNtCs7RAXWwMZhcx_4core3fmt3num3impmNtB9_7Display3fmt $_RNvXsr_NtCs7RAXWwMZhcx_4core4cellNtB5_14BorrowMutErrorNtNtB7_3fmt7Display3fmt $_RNvXs0_NtNtCs7RAXWwMZhcx_4core3fmt8buildersNtB5_10PadAdapterNtB7_5Write9write_str $_RNvXs0_NtNtCs7RAXWwMZhcx_4core3fmt8buildersNtB5_10PadAdapterNtB7_5Write10write_char $_RNvYNtNtNtCs7RAXWwMZhcx_4core3fmt8builders10PadAdapterNtB6_5Write9write_fmtB8_)
  (data $.rodata (i32.const 1048576) "\00\00\00\00Aborted\16slice index starts at \c0\0d but ends at \c0\00\12range start index \c0\22 out of range for slice of length \c0\00\10range end index \c0\22 out of range for slice of length \c0\00\10assertion `left \c0\17 right` failed\0a  left: \c0\09\0a right: \c0\00\10assertion `left \c0\10 right` failed: \c0\09\0a  left: \c0\09\0a right: \c0\00\13failed printing to \c0\02: \c0\00/rustc/7af3402cda75aaead39f72516fd6cbb2f3ee0dbd/library/std/src/sys/sync/mutex/no_threads.rs\00/rustc/7af3402cda75aaead39f72516fd6cbb2f3ee0dbd/library/std/src/sys/sync/rwlock/no_threads.rs\00/rustc/7af3402cda75aaead39f72516fd6cbb2f3ee0dbd/library/core/src/slice/memchr.rs\00/rustc/7af3402cda75aaead39f72516fd6cbb2f3ee0dbd/library/std/src/io/stdio.rs\00/rustc/7af3402cda75aaead39f72516fd6cbb2f3ee0dbd/library/std/src/io/buffered/linewritershim.rs\003rd-party/wasm32-libc/src/ffi/signal.rs\00/rustc/7af3402cda75aaead39f72516fd6cbb2f3ee0dbd/library/std/src/sync/reentrant_lock.rs\00/rustc/7af3402cda75aaead39f72516fd6cbb2f3ee0dbd/library/std/src/sync/once.rs\00/rustc/7af3402cda75aaead39f72516fd6cbb2f3ee0dbd/library/std/src/io/mod.rs\00/rustc/7af3402cda75aaead39f72516fd6cbb2f3ee0dbd/library/alloc/src/raw_vec/mod.rs\00/rustc/7af3402cda75aaead39f72516fd6cbb2f3ee0dbd/library/std/src/thread/id.rs\00/rust/deps/dlmalloc-0.2.11/src/dlmalloc.rs\003rd-party/wasm32-libc/src/ffi/malloc.rs\003rd-party/wasm32-libc/src/lib.rs\003rd-party/wasm32-libc/src/ffi/itoa.rs\00\c0\0b (os error \c0\01)\00\12Assertion failed: \c0\02 (\c0\02, \c0\01:\c0\02)\0a\00\c0\01\0a\00\00\e5\02\10\00'\00\00\00!\00\00\00\05\00\00\00\00\00\00\00\04\00\00\00\04\00\00\00\04\00\00\00\00\00\00\00\04\00\00\00\04\00\00\00\05\00\00\00Utf8Errorvalid_up_toerror_len\00\00\00\00\00\00\00\08\00\00\00\04\00\00\00\06\00\00\00called `Result::unwrap()` on an `Err` value\00\ec\04\10\00 \00\00\00;\00\00\00&\00\00\00\ec\04\10\00 \00\00\008\00\00\00\1e\00\00\00\ec\04\10\00 \00\00\005\00\00\00(\00\00\00\ec\04\10\00 \00\00\00\08\00\00\00\18\00\00\00None\00\00\00\00\04\00\00\00\04\00\00\00\07\00\00\00SomeLayoutError\00\00\00\00\00\00\00\00\00\01\00\00\00\08\00\00\00called `Result::unwrap()` on an `Err` value\00\c4\04\10\00'\00\00\00\1b\00\00\00[\00\00\00\c4\04\10\00'\00\00\00=\00\00\00Y\00\00\00\c4\04\10\00'\00\00\00\0d\00\00\00U\00\00\00\c4\04\10\00'\00\00\00,\00\00\00Y\00\00\00\0d\05\10\00%\00\00\00\1c\00\00\00\15\00\00\00\0d\05\10\00%\00\00\00%\00\00\00\11\00\00\00d\03\10\00L\00\00\00\e2\00\00\00\14\00\00\00one-time initialization may not be performed recursively\00\00\00\00\04\00\00\00\04\00\00\00\0d\00\00\00a formatting trait implementation returned an error when the underlying stream did not\00\00\b1\03\10\00I\00\00\00v\02\00\00\11\00\00\00\0e\00\00\00\0c\00\00\00\04\00\00\00\0f\00\00\00\10\00\00\00\11\00\00\00\0e\00\00\00\0c\00\00\00\04\00\00\00\12\00\00\00\13\00\00\00\14\00\00\00\0e\00\00\00\0c\00\00\00\04\00\00\00\15\00\00\00\16\00\00\00\17\00\00\00;\02\10\00K\00\00\00\8d\04\00\00\09\00\00\00\18\00\00\00\0c\00\00\00\04\00\00\00\19\00\00\00\1a\00\00\00\1b\00\00\00\00\00\00\00\08\00\00\00\04\00\00\00\1c\00\00\00\1d\00\00\00\1e\00\00\00\1f\00\00\00 \00\00\00\10\00\00\00\04\00\00\00!\00\00\00\22\00\00\00#\00\00\00$\00\00\00mid > len\00\00\00m]\cb\d6,P\ebcxA\a6Wq\1b\8b\b9\dbo\c9a=/\cd\c7\a0\1cq\ae\07\9f\09\a3assertion failed: psize >= size + min_overhead\00\00\99\04\10\00*\00\00\00\b1\04\00\00\09\00\00\00assertion failed: psize <= size + max_overhead\00\00\99\04\10\00*\00\00\00\b7\04\00\00\0d\00\00\00rwlock overflowed read locks\8c\01\10\00]\00\00\00\15\00\00\00,\00\00\00entity not foundpermission deniedconnection refusedconnection resethost unreachablenetwork unreachableconnection abortednot connectedaddress in useaddress not availablenetwork downbroken pipeentity already existsoperation would blocknot a directoryis a directorydirectory not emptyread-only filesystem or storage mediumfilesystem loop or indirection limit (e.g. symlink loop)stale network file handleinvalid input parameterinvalid datatimed outwrite zerono storage spaceseek on unseekable filequota exceededfile too largeresource busyexecutable file busydeadlockcross-device link or renametoo many linksinvalid filenameargument list too longoperation interruptedunsupportedunexpected end of fileout of memoryin progressother erroruncategorized errorcannot recursively acquire mutex\00\00\00/\01\10\00\5c\00\00\00\13\00\00\00\09\00\00\00lock count overflow in reentrant mutex\00\00\0d\03\10\00V\00\00\00#\01\00\00-\00\00\00\00stdoutstderroperation successfulfailed to generate unique thread ID: bitspace exhaustedL\04\10\00L\00\00\00&\00\00\00\0d\00\00\00\00\00\00\00\08\00\00\00\04\00\00\00%\00\00\00\87\02\10\00]\00\00\00\16\01\00\00)\00\00\00\18\00\00\00\0c\00\00\00\04\00\00\00&\00\00\00;\02\10\00K\00\00\00\5c\03\00\00\14\00\00\00rwlock has not been locked for reading\00\00\8c\01\10\00]\00\00\00>\00\00\00\09\00\00\00;\02\10\00K\00\00\00D\04\00\00\14\00\00\00\10\00\00\00\11\00\00\00\12\00\00\00\10\00\00\00\10\00\00\00\13\00\00\00\12\00\00\00\0d\00\00\00\0e\00\00\00\15\00\00\00\0c\00\00\00\0b\00\00\00\15\00\00\00\15\00\00\00\0f\00\00\00\0e\00\00\00\13\00\00\00&\00\00\008\00\00\00\19\00\00\00\17\00\00\00\0c\00\00\00\09\00\00\00\0a\00\00\00\10\00\00\00\17\00\00\00\0e\00\00\00\0e\00\00\00\0d\00\00\00\14\00\00\00\08\00\00\00\1b\00\00\00\0e\00\00\00\10\00\00\00\16\00\00\00\15\00\00\00\0b\00\00\00\16\00\00\00\0d\00\00\00\0b\00\00\00\0b\00\00\00\13\00\00\008\09\10\00H\09\10\00Y\09\10\00k\09\10\00{\09\10\00\8b\09\10\00\9e\09\10\00\b0\09\10\00\bd\09\10\00\cb\09\10\00\e0\09\10\00\ec\09\10\00\f7\09\10\00\0c\0a\10\00!\0a\10\000\0a\10\00>\0a\10\00Q\0a\10\00w\0a\10\00\af\0a\10\00\c8\0a\10\00\df\0a\10\00\eb\0a\10\00\f4\0a\10\00\fe\0a\10\00\0e\0b\10\00%\0b\10\003\0b\10\00A\0b\10\00N\0b\10\00b\0b\10\00j\0b\10\00\85\0b\10\00\93\0b\10\00\a3\0b\10\00\b9\0b\10\00\ce\0b\10\00\d9\0b\10\00\ef\0b\10\00\fc\0b\10\00\07\0c\10\00\12\0c\10\00capacity overflow\00\00\00\fb\03\10\00P\00\00\00\1c\00\00\00\05\00\00\000123456789abcdef { , :  {\0a,\0a((\0a}), }\00\00\00\00\0c\00\00\00\04\00\00\00,\00\00\00-\00\00\00.\00\00\00==!=matches00010203040506070809101112131415161718192021222324252627282930313233343536373839404142434445464748495051525354555657585960616263646566676869707172737475767778798081828384858687888990919293949596979899\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\03\03\03\03\03\03\03\03\03\03\03\03\03\03\03\03\04\04\04\04\04\00\00\00\00\00\00\00\00\00\00\00\00\ea\01\10\00P\00\00\00\a0\00\00\00\09\00\00\00\ea\01\10\00P\00\00\00\84\00\00\00\1e\00\00\00attempt to calculate the remainder with a divisor of zero    0x0123456789ABCDEFfalsetrueRefCell already borrowed0\0f\10\002\0f\10\004\0f\10\00\02\00\00\00\02\00\00\00\07\00\00\00"))
