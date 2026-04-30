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
  (type (;9;) (func (param i32 i32 i32 i64 i64) (result i64)))
  (type (;10;) (func (param i32 i32 i32 i32)))
  (type (;11;) (func (param i32) (result i32)))
  (type (;12;) (func (param i64 i32 i32 i32) (result i32)))
  (type (;13;) (func (param i32 i32 i32) (result i64)))
  (type (;14;) (func (param i32 i32 i32 i32 i32 i32)))
  (type (;15;) (func (param i32 i32 i32 i32 i32 i32 i32 i32)))
  (type (;16;) (func (param i32 i32 i32 i32 i32) (result i32)))
  (type (;17;) (func (param i32 i32 i32 i32 i32 i32) (result i32)))
  (type (;18;) (func (param i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32) (result i32)))
  (func $_ZN15libc_calculator10Calculator3add17h2f0459d1b92974d5E (type 0) (param i32 i32) (result i32)
    local.get 0
    local.get 1
    call $add)
  (func $_ZN15libc_calculator10Calculator5clear17hb6c5ad0a6560b7a6E (type 4)
    call $clear)
  (func $_ZN15libc_calculator10Calculator5store17h9352561dcbc7f0e6E (type 1) (param i32)
    local.get 0
    call $store)
  (func $_ZN15libc_calculator10Calculator6divide17ha1be07073251faabE (type 0) (param i32 i32) (result i32)
    local.get 0
    local.get 1
    call $divide)
  (func $_ZN15libc_calculator10Calculator8multiply17h1eebf12a251a49f7E (type 0) (param i32 i32) (result i32)
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
  (func $_ZN15libc_calculator10Calculator8retrieve17h941afbab10125b6aE (type 5) (result i32)
    call $retrieve)
  (func $_ZN15libc_calculator10Calculator8subtract17h7dc57159cd75c3ecE (type 0) (param i32 i32) (result i32)
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
  (func $_RNvCsfLfy6EI15iL_7___rustc12___rust_alloc (type 0) (param i32 i32) (result i32)
    local.get 0
    local.get 1
    call $_RNvCsfLfy6EI15iL_7___rustc11___rdl_alloc
    return)
  (func $_RNvCsfLfy6EI15iL_7___rustc14___rust_dealloc (type 6) (param i32 i32 i32)
    local.get 0
    local.get 1
    local.get 2
    call $_RNvCsfLfy6EI15iL_7___rustc13___rdl_dealloc
    return)
  (func $_RNvCsfLfy6EI15iL_7___rustc14___rust_realloc (type 7) (param i32 i32 i32 i32) (result i32)
    local.get 0
    local.get 1
    local.get 2
    local.get 3
    call $_RNvCsfLfy6EI15iL_7___rustc13___rdl_realloc
    return)
  (func $_RNvCsfLfy6EI15iL_7___rustc19___rust_alloc_zeroed (type 0) (param i32 i32) (result i32)
    local.get 0
    local.get 1
    call $_RNvCsfLfy6EI15iL_7___rustc18___rdl_alloc_zeroed
    return)
  (func $_RNvCsfLfy6EI15iL_7___rustc35___rust_no_alloc_shim_is_unstable_v2 (type 4)
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
        i32.load offset=1052408
        local.tee 1
        br_if 0 (;@2;)
        i32.const 0
        i32.const 4
        call $malloc
        local.tee 1
        i32.store offset=1052408
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
      i32.load offset=1052408
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
      i32.load offset=1052408
      local.tee 0
      i32.eqz
      br_if 0 (;@1;)
      local.get 0
      call $free
      i32.const 0
      i32.const 0
      i32.store offset=1052408
    end)
  (func $_RNvXs9_NtNtCsgXGp5Oqx2Ny_4core3str5errorNtB5_9Utf8ErrorNtNtB9_3fmt5Debug3fmt (type 0) (param i32 i32) (result i32)
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
    i32.const 1048608
    i32.const 9
    i32.const 1048617
    i32.const 11
    local.get 0
    i32.const 1048576
    i32.const 1048628
    i32.const 9
    local.get 2
    i32.const 12
    i32.add
    i32.const 1048592
    call $_RNvMsa_NtCsgXGp5Oqx2Ny_4core3fmtNtB5_9Formatter26debug_struct_field2_finish
    local.set 0
    local.get 2
    i32.const 16
    i32.add
    global.set $__stack_pointer
    local.get 0)
  (func $_RNvXsZ_NtNtCsgXGp5Oqx2Ny_4core3fmt3numjNtB7_5Debug3fmt (type 0) (param i32 i32) (result i32)
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
        call $_RNvXs8_NtNtNtCsgXGp5Oqx2Ny_4core3fmt3num3impmNtB9_7Display3fmt
        return
      end
      local.get 0
      local.get 1
      call $_RNvXs8_NtNtCsgXGp5Oqx2Ny_4core3fmt3numjNtB7_8UpperHex3fmt
      return
    end
    local.get 0
    local.get 1
    call $_RNvXs6_NtNtCsgXGp5Oqx2Ny_4core3fmt3numjNtB7_8LowerHex3fmt)
  (func $_RNvXsd_NtNtCsgXGp5Oqx2Ny_4core5alloc6layoutNtB5_11LayoutErrorNtNtB9_3fmt5Debug3fmt (type 0) (param i32 i32) (result i32)
    local.get 1
    i32.const 1048637
    i32.const 11
    call $_RNvMsa_NtCsgXGp5Oqx2Ny_4core3fmtNtB5_9Formatter9write_str)
  (func $_ZN11wasm32_libc3ffi5qsort14heap_sift_down17h5696ea4faee679d5E (type 8) (param i32 i32 i32 i32 i32)
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
  (func $_ZN11wasm32_libc3ffi5qsort16introsort_helper17h51397afe8fe637fbE (type 8) (param i32 i32 i32 i32 i32)
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
                call $_ZN11wasm32_libc3ffi5qsort14heap_sift_down17h5696ea4faee679d5E
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
                call $_ZN11wasm32_libc3ffi5qsort16introsort_helper17h51397afe8fe637fbE
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
              call $_ZN11wasm32_libc3ffi5qsort16introsort_helper17h51397afe8fe637fbE
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
          call $_ZN11wasm32_libc3ffi5qsort14heap_sift_down17h5696ea4faee679d5E
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
  (func $_ZN11wasm32_libc3ffi6strtol6strtox17h7f695bb3bd78a65cE (type 9) (param i32 i32 i32 i64 i64) (result i64)
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
  (func $_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h1f882f696f1c4b0dE (type 0) (param i32 i32) (result i32)
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
        i32.const 1049720
        i32.const 4
        local.get 2
        i32.const 12
        i32.add
        i32.const 1049704
        call $_RNvMsa_NtCsgXGp5Oqx2Ny_4core3fmtNtB5_9Formatter25debug_tuple_field1_finish
        local.set 0
        br 1 (;@1;)
      end
      local.get 1
      i32.const 1049700
      i32.const 4
      call $_RNvMsa_NtCsgXGp5Oqx2Ny_4core3fmtNtB5_9Formatter9write_str
      local.set 0
    end
    local.get 2
    i32.const 16
    i32.add
    global.set $__stack_pointer
    local.get 0)
  (func $_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17ha8540d357d2a969eE (type 0) (param i32 i32) (result i32)
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
        call $_RNvXNtNtNtCsgXGp5Oqx2Ny_4core3fmt3num3imphNtB6_7Display3fmt
        return
      end
      local.get 0
      local.get 1
      call $_RNvXsg_NtNtCsgXGp5Oqx2Ny_4core3fmt3numhNtB7_8UpperHex3fmt
      return
    end
    local.get 0
    local.get 1
    call $_RNvXse_NtNtCsgXGp5Oqx2Ny_4core3fmt3numhNtB7_8LowerHex3fmt)
  (func $_ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17h63d3179bc0f4f146E (type 0) (param i32 i32) (result i32)
    local.get 0
    i32.load
    local.get 0
    i32.load offset=4
    local.get 1
    call $_RNvXsi_NtCsgXGp5Oqx2Ny_4core3fmteNtB5_7Display3fmt)
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
      i32.const 2
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
      i32.const 3
      i32.add
      local.set 2
    end
    local.get 4
    i32.const 24
    i32.add
    local.get 0
    local.get 2
    call $_RNvMs3_NtNtCsgXGp5Oqx2Ny_4core3ffi5c_strNtB5_4CStr6to_str
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
            i32.const 2
            local.set 0
            local.get 1
            i32.const 1
            i32.add
            i32.load8_u
            i32.eqz
            br_if 0 (;@4;)
            local.get 1
            i32.const 2
            i32.add
            call $strlen
            i32.const 3
            i32.add
            local.set 0
          end
          local.get 4
          i32.const 24
          i32.add
          local.get 1
          local.get 0
          call $_RNvMs3_NtNtCsgXGp5Oqx2Ny_4core3ffi5c_strNtB5_4CStr6to_str
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
            i32.const 2
            local.set 0
            local.get 3
            i32.const 1
            i32.add
            i32.load8_u
            i32.eqz
            br_if 0 (;@4;)
            local.get 3
            i32.const 2
            i32.add
            call $strlen
            i32.const 3
            i32.add
            local.set 0
          end
          local.get 4
          i32.const 24
          i32.add
          local.get 3
          local.get 0
          call $_RNvMs3_NtNtCsgXGp5Oqx2Ny_4core3ffi5c_strNtB5_4CStr6to_str
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
          i32.const 1049646
          local.get 4
          i32.const 24
          i32.add
          call $_RNvNtNtCsebHcaeoSrxy_3std2io5stdio7__eprint
          unreachable
        end
        local.get 4
        local.get 4
        i64.load offset=28 align=4
        i64.store offset=56
        i32.const 1049740
        i32.const 43
        local.get 4
        i32.const 56
        i32.add
        i32.const 1049724
        i32.const 1049816
        call $_RNvNtCsgXGp5Oqx2Ny_4core6result13unwrap_failed
        unreachable
      end
      local.get 4
      local.get 4
      i64.load offset=28 align=4
      i64.store offset=56
      i32.const 1049740
      i32.const 43
      local.get 4
      i32.const 56
      i32.add
      i32.const 1049724
      i32.const 1049800
      call $_RNvNtCsgXGp5Oqx2Ny_4core6result13unwrap_failed
      unreachable
    end
    local.get 4
    local.get 4
    i64.load offset=28 align=4
    i64.store offset=56
    i32.const 1049740
    i32.const 43
    local.get 4
    i32.const 56
    i32.add
    i32.const 1049724
    i32.const 1049784
    call $_RNvNtCsgXGp5Oqx2Ny_4core6result13unwrap_failed
    unreachable)
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
  (func $abort (type 4)
    (local i32)
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          i32.const 0
          i32.load offset=1052436
          local.tee 0
          br_table 0 (;@3;) 2 (;@1;) 1 (;@2;)
        end
        i32.const 1048648
        i32.const 15
        i32.const 1049684
        call $_RNvNtCsgXGp5Oqx2Ny_4core9panicking9panic_fmt
        unreachable
      end
      i32.const 6
      local.get 0
      call_indirect (type 1)
    end)
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
    call $_ZN11wasm32_libc3ffi6strtol6strtox17h7f695bb3bd78a65cE
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
      call $_RNvCsfLfy6EI15iL_7___rustc35___rust_no_alloc_shim_is_unstable_v2
      block  ;; label = @2
        block  ;; label = @3
          local.get 0
          i32.const 16
          call $_RNvCsfLfy6EI15iL_7___rustc19___rust_alloc_zeroed
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
    i32.const 1049740
    i32.const 43
    local.get 2
    i32.const 15
    i32.add
    i32.const 1049832
    i32.const 1049848
    call $_RNvNtCsgXGp5Oqx2Ny_4core6result13unwrap_failed
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
        call $_RNvCsfLfy6EI15iL_7___rustc14___rust_dealloc
      end
      local.get 1
      i32.const 16
      i32.add
      global.set $__stack_pointer
      return
    end
    i32.const 1049740
    i32.const 43
    local.get 1
    i32.const 15
    i32.add
    i32.const 1049832
    i32.const 1049864
    call $_RNvNtCsgXGp5Oqx2Ny_4core6result13unwrap_failed
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
  (func $itoa (type 12) (param i64 i32 i32 i32) (result i32)
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
                i32.const 1049912
                call $_RNvNtNtCsgXGp5Oqx2Ny_4core9panicking11panic_const23panic_const_rem_by_zero
                unreachable
              end
              i32.const 1049912
              call $_RNvNtNtCsgXGp5Oqx2Ny_4core9panicking11panic_const23panic_const_rem_by_zero
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
          i32.const 1049928
          call $_RNvNtNtCsgXGp5Oqx2Ny_4core5slice5index16slice_index_fail
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
    i32.const 1049928
    call $_RNvNtNtCsgXGp5Oqx2Ny_4core5slice5index16slice_index_fail
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
      call $_RNvCsfLfy6EI15iL_7___rustc35___rust_no_alloc_shim_is_unstable_v2
      block  ;; label = @2
        block  ;; label = @3
          local.get 2
          i32.const 16
          call $_RNvCsfLfy6EI15iL_7___rustc12___rust_alloc
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
    i32.const 1049740
    i32.const 43
    local.get 1
    i32.const 15
    i32.add
    i32.const 1049832
    i32.const 1049880
    call $_RNvNtCsgXGp5Oqx2Ny_4core6result13unwrap_failed
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
      call $_ZN11wasm32_libc3ffi5qsort16introsort_helper17h51397afe8fe637fbE
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
          i32.load offset=1052412
          local.tee 2
          br_table 0 (;@3;) 2 (;@1;) 1 (;@2;)
        end
        i32.const 1048648
        i32.const 15
        i32.const 1049684
        call $_RNvNtCsgXGp5Oqx2Ny_4core9panicking9panic_fmt
        unreachable
      end
      local.get 0
      local.get 2
      call_indirect (type 1)
    end
    local.get 1)
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
              call $_RNvCsfLfy6EI15iL_7___rustc35___rust_no_alloc_shim_is_unstable_v2
              local.get 0
              i32.const 16
              call $_RNvCsfLfy6EI15iL_7___rustc12___rust_alloc
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
            call $_RNvCsfLfy6EI15iL_7___rustc14___rust_realloc
            local.tee 0
            br_if 2 (;@2;)
            i32.const 0
            local.set 0
            br 3 (;@1;)
          end
          i32.const 1049740
          i32.const 43
          local.get 2
          i32.const 15
          i32.add
          i32.const 1049832
          i32.const 1049880
          call $_RNvNtCsgXGp5Oqx2Ny_4core6result13unwrap_failed
          unreachable
        end
        i32.const 1049740
        i32.const 43
        local.get 2
        i32.const 15
        i32.add
        i32.const 1049832
        i32.const 1049896
        call $_RNvNtCsgXGp5Oqx2Ny_4core6result13unwrap_failed
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
      i32.load offset=1052412
      local.set 2
      local.get 0
      local.get 1
      i32.store offset=1052412
    end
    local.get 2)
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
  (func $strtoimax (type 13) (param i32 i32 i32) (result i64)
    local.get 0
    local.get 1
    local.get 2
    i64.const -9223372036854775808
    i64.const 9223372036854775807
    call $_ZN11wasm32_libc3ffi6strtol6strtox17h7f695bb3bd78a65cE)
  (func $strtol (type 3) (param i32 i32 i32) (result i32)
    local.get 0
    local.get 1
    local.get 2
    i64.const -2147483648
    i64.const 2147483647
    call $_ZN11wasm32_libc3ffi6strtol6strtox17h7f695bb3bd78a65cE
    i32.wrap_i64)
  (func $strtoul (type 3) (param i32 i32 i32) (result i32)
    local.get 0
    local.get 1
    local.get 2
    i64.const 0
    i64.const 4294967295
    call $_ZN11wasm32_libc3ffi6strtol6strtox17h7f695bb3bd78a65cE
    i32.wrap_i64)
  (func $strtoull (type 13) (param i32 i32 i32) (result i64)
    local.get 0
    local.get 1
    local.get 2
    i64.const 0
    i64.const -1
    call $_ZN11wasm32_libc3ffi6strtol6strtox17h7f695bb3bd78a65cE)
  (func $utoa (type 12) (param i64 i32 i32 i32) (result i32)
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
          i32.const 1049912
          call $_RNvNtNtCsgXGp5Oqx2Ny_4core9panicking11panic_const23panic_const_rem_by_zero
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
        i32.const 1049928
        call $_RNvNtNtCsgXGp5Oqx2Ny_4core5slice5index16slice_index_fail
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
  (func $_RNvCsfLfy6EI15iL_7___rustc18___rust_start_panic (type 0) (param i32 i32) (result i32)
    call $_RNvCsfLfy6EI15iL_7___rustc12___rust_abort
    unreachable)
  (func $_RINvNtCsgXGp5Oqx2Ny_4core9panicking13assert_failedbbECsebHcaeoSrxy_3std (type 14) (param i32 i32 i32 i32 i32 i32)
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
    i32.const 1050096
    local.get 6
    i32.const 12
    i32.add
    i32.const 1050096
    local.get 3
    local.get 4
    local.get 5
    call $_RNvNtCsgXGp5Oqx2Ny_4core9panicking19assert_failed_inner
    unreachable)
  (func $_RNvNvMNtNtCsebHcaeoSrxy_3std6thread2idNtB4_8ThreadId3new9exhausted (type 4)
    i32.const 1051251
    i32.const 111
    i32.const 1051308
    call $_RNvNtCsgXGp5Oqx2Ny_4core9panicking9panic_fmt
    unreachable)
  (func $_RINvNvMs2_NtCs5cOc02OMXlo_5alloc7raw_vecINtB8_11RawVecInnerpE7reserve21do_reserve_and_handleNtNtBa_5alloc6GlobalECsebHcaeoSrxy_3std (type 8) (param i32 i32 i32 i32 i32)
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
      call $_RNvNtCs5cOc02OMXlo_5alloc7raw_vec12handle_error
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
    call $_RNvMs4_NtCs5cOc02OMXlo_5alloc7raw_vecNtB5_11RawVecInner11finish_growCsebHcaeoSrxy_3std
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
      call $_RNvNtCs5cOc02OMXlo_5alloc7raw_vec12handle_error
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
  (func $_RINvNtCsgXGp5Oqx2Ny_4core3ptr13drop_in_placeINtNtB4_6option6OptionINtNtCs5cOc02OMXlo_5alloc3vec3VechEEECsebHcaeoSrxy_3std (type 2) (param i32 i32)
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
      call $_RNvCsfLfy6EI15iL_7___rustc14___rust_dealloc
    end)
  (func $_RINvNtCsgXGp5Oqx2Ny_4core3ptr13drop_in_placeINtNvNtCsebHcaeoSrxy_3std2io17default_write_fmt7AdapterINtNtBL_6cursor6CursorQShEEEBN_ (type 1) (param i32)
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
        call $_RNvCsfLfy6EI15iL_7___rustc14___rust_dealloc
      end
      local.get 0
      i32.const 12
      i32.const 4
      call $_RNvCsfLfy6EI15iL_7___rustc14___rust_dealloc
    end)
  (func $_RINvNtCsgXGp5Oqx2Ny_4core3ptr13drop_in_placeNtNtCs5cOc02OMXlo_5alloc6string6StringECsebHcaeoSrxy_3std (type 1) (param i32)
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
      call $_RNvCsfLfy6EI15iL_7___rustc14___rust_dealloc
    end)
  (func $_RINvNtCsgXGp5Oqx2Ny_4core3ptr13drop_in_placeNtNvNtCsebHcaeoSrxy_3std9panicking13panic_handler19FormatStringPayloadEBM_ (type 1) (param i32)
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
      call $_RNvCsfLfy6EI15iL_7___rustc14___rust_dealloc
    end)
  (func $_RINvNtNtCsebHcaeoSrxy_3std3sys9backtrace26___rust_end_short_backtraceNCNvNtB6_5alloc8rust_oom0zEB6_ (type 1) (param i32)
    local.get 0
    call $_RNCNvNtCsebHcaeoSrxy_3std5alloc8rust_oom0B5_
    unreachable)
  (func $_RNCNvNtCsebHcaeoSrxy_3std5alloc8rust_oom0B5_ (type 1) (param i32)
    local.get 0
    i32.load
    local.get 0
    i32.load offset=4
    i32.const 0
    i32.load offset=1052488
    local.tee 0
    i32.const 8
    local.get 0
    select
    call_indirect (type 2)
    unreachable)
  (func $_RINvNtNtCsebHcaeoSrxy_3std3sys9backtrace26___rust_end_short_backtraceNCNvNtB6_9panicking13panic_handler0zEB6_ (type 1) (param i32)
    local.get 0
    call $_RNCNvNtCsebHcaeoSrxy_3std9panicking13panic_handler0B5_
    unreachable)
  (func $_RNCNvNtCsebHcaeoSrxy_3std9panicking13panic_handler0B5_ (type 1) (param i32)
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
      i32.const 1050152
      local.get 0
      i32.load offset=4
      local.get 0
      i32.load offset=8
      local.tee 0
      i32.load8_u offset=8
      local.get 0
      i32.load8_u offset=9
      call $_RNvNtCsebHcaeoSrxy_3std9panicking15panic_with_hook
      unreachable
    end
    local.get 1
    i32.const -2147483648
    i32.store
    local.get 1
    local.get 0
    i32.store offset=12
    local.get 1
    i32.const 1050180
    local.get 0
    i32.load offset=4
    local.get 0
    i32.load offset=8
    local.tee 0
    i32.load8_u offset=8
    local.get 0
    i32.load8_u offset=9
    call $_RNvNtCsebHcaeoSrxy_3std9panicking15panic_with_hook
    unreachable)
  (func $_RNvMs4_NtCs5cOc02OMXlo_5alloc7raw_vecNtB5_11RawVecInner11finish_growCsebHcaeoSrxy_3std (type 14) (param i32 i32 i32 i32 i32 i32)
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
              call $_RNvCsfLfy6EI15iL_7___rustc14___rust_realloc
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
            call $_RNvCsfLfy6EI15iL_7___rustc35___rust_no_alloc_shim_is_unstable_v2
            local.get 3
            local.get 4
            call $_RNvCsfLfy6EI15iL_7___rustc12___rust_alloc
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
  (func $_RNvNtCsebHcaeoSrxy_3std9panicking15panic_with_hook (type 8) (param i32 i32 i32 i32 i32)
    (local i32 i32)
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
              i32.const 1
              call $_RNvNtNtCsebHcaeoSrxy_3std9panicking11panic_count8increase
              i32.const 255
              i32.and
              br_table 4 (;@1;) 1 (;@4;) 0 (;@5;) 1 (;@4;)
            end
            i32.const 0
            i32.load offset=1052492
            local.tee 6
            i32.const -1
            i32.le_s
            br_if 3 (;@1;)
            i32.const 0
            local.get 6
            i32.const 1
            i32.add
            i32.store offset=1052492
            i32.const 0
            i32.load offset=1052496
            i32.eqz
            br_if 1 (;@3;)
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
            i32.load offset=1052496
            local.get 5
            i32.const 16
            i32.add
            i32.const 0
            i32.load offset=1052500
            i32.load offset=20
            call_indirect (type 2)
            br 2 (;@2;)
          end
          local.get 5
          local.get 0
          local.get 1
          i32.load offset=24
          call_indirect (type 2)
          br 2 (;@1;)
        end
        i32.const -2147483648
        local.get 5
        call $_RINvNtCsgXGp5Oqx2Ny_4core3ptr13drop_in_placeINtNtB4_6option6OptionINtNtCs5cOc02OMXlo_5alloc3vec3VechEEECsebHcaeoSrxy_3std
      end
      i32.const 0
      i32.const 0
      i32.load offset=1052492
      i32.const -1
      i32.add
      i32.store offset=1052492
      i32.const 0
      i32.const 0
      i32.store8 offset=1052484
      local.get 3
      i32.eqz
      br_if 0 (;@1;)
      local.get 0
      local.get 1
      call $_RNvCsfLfy6EI15iL_7___rustc10rust_panic
      unreachable
    end
    unreachable)
  (func $_RNvXs1i_NtCsgXGp5Oqx2Ny_4core3fmtReNtB6_7Display3fmtCsebHcaeoSrxy_3std (type 0) (param i32 i32) (result i32)
    local.get 0
    i32.load
    local.get 0
    i32.load offset=4
    local.get 1
    call $_RNvXsi_NtCsgXGp5Oqx2Ny_4core3fmteNtB5_7Display3fmt)
  (func $_RNvNtCsebHcaeoSrxy_3std5alloc24default_alloc_error_hook (type 2) (param i32 i32)
    i32.const 0
    i32.const 1
    i32.store8 offset=1052984)
  (func $_RNvCsfLfy6EI15iL_7___rustc10rust_panic (type 2) (param i32 i32)
    local.get 0
    local.get 1
    call $_RNvCsfLfy6EI15iL_7___rustc18___rust_start_panic
    drop
    unreachable)
  (func $_RNvCsfLfy6EI15iL_7___rustc11___rdl_alloc (type 0) (param i32 i32) (result i32)
    block  ;; label = @1
      local.get 1
      i32.const 9
      i32.lt_u
      br_if 0 (;@1;)
      local.get 1
      local.get 0
      call $_RNvMs0_NtCsjqx8TIyZbP9_8dlmalloc8dlmallocINtB5_8DlmallocNtNtB7_3sys6SystemE8memalignCsebHcaeoSrxy_3std
      return
    end
    local.get 0
    call $_RNvMs0_NtCsjqx8TIyZbP9_8dlmalloc8dlmallocINtB5_8DlmallocNtNtB7_3sys6SystemE6mallocCsebHcaeoSrxy_3std)
  (func $_RNvMs0_NtCsjqx8TIyZbP9_8dlmalloc8dlmallocINtB5_8DlmallocNtNtB7_3sys6SystemE8memalignCsebHcaeoSrxy_3std (type 0) (param i32 i32) (result i32)
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
      call $_RNvMs0_NtCsjqx8TIyZbP9_8dlmalloc8dlmallocINtB5_8DlmallocNtNtB7_3sys6SystemE6mallocCsebHcaeoSrxy_3std
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
          call $_RNvMs0_NtCsjqx8TIyZbP9_8dlmalloc8dlmallocINtB5_8DlmallocNtNtB7_3sys6SystemE13dispose_chunkCsebHcaeoSrxy_3std
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
        call $_RNvMs0_NtCsjqx8TIyZbP9_8dlmalloc8dlmallocINtB5_8DlmallocNtNtB7_3sys6SystemE13dispose_chunkCsebHcaeoSrxy_3std
      end
      local.get 0
      i32.const 8
      i32.add
      local.set 2
    end
    local.get 2)
  (func $_RNvMs0_NtCsjqx8TIyZbP9_8dlmalloc8dlmallocINtB5_8DlmallocNtNtB7_3sys6SystemE6mallocCsebHcaeoSrxy_3std (type 11) (param i32) (result i32)
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
            i32.load offset=1052924
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
                      i32.load offset=1052920
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
                      i32.const 1052656
                      i32.add
                      local.tee 0
                      local.get 3
                      i32.const 1052664
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
                    i32.load offset=1052928
                    i32.le_u
                    br_if 6 (;@2;)
                    local.get 0
                    br_if 2 (;@6;)
                    i32.const 0
                    i32.load offset=1052924
                    local.tee 0
                    i32.eqz
                    br_if 6 (;@2;)
                    local.get 0
                    i32.ctz
                    i32.const 2
                    i32.shl
                    i32.const 1052512
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
                            i32.const 1052512
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
                  i32.store offset=1052920
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
                  i32.const 1052656
                  i32.add
                  local.tee 8
                  local.get 2
                  i32.const 1052664
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
                i32.store offset=1052920
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
                i32.load offset=1052928
                local.tee 2
                i32.eqz
                br_if 0 (;@6;)
                i32.const 0
                i32.load offset=1052936
                local.set 3
                block  ;; label = @7
                  block  ;; label = @8
                    i32.const 0
                    i32.load offset=1052920
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
                    i32.store offset=1052920
                    local.get 2
                    i32.const -8
                    i32.and
                    i32.const 1052656
                    i32.add
                    local.tee 2
                    local.set 7
                    br 1 (;@7;)
                  end
                  local.get 2
                  i32.const -8
                  i32.and
                  local.tee 2
                  i32.const 1052656
                  i32.add
                  local.set 7
                  local.get 2
                  i32.const 1052664
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
              i32.store offset=1052936
              i32.const 0
              local.get 8
              i32.store offset=1052928
              br 4 (;@1;)
            end
            i32.const 0
            i32.const 0
            i32.load offset=1052924
            i32.const -2
            local.get 6
            i32.load offset=28
            i32.rotl
            i32.and
            i32.store offset=1052924
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
                i32.load offset=1052928
                local.tee 7
                i32.eqz
                br_if 1 (;@5;)
                i32.const 0
                i32.load offset=1052936
                local.set 0
                block  ;; label = @7
                  block  ;; label = @8
                    i32.const 0
                    i32.load offset=1052920
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
                    i32.store offset=1052920
                    local.get 7
                    i32.const -8
                    i32.and
                    i32.const 1052656
                    i32.add
                    local.tee 7
                    local.set 9
                    br 1 (;@7;)
                  end
                  local.get 7
                  i32.const -8
                  i32.and
                  local.tee 7
                  i32.const 1052656
                  i32.add
                  local.set 9
                  local.get 7
                  i32.const 1052664
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
            i32.store offset=1052936
            i32.const 0
            local.get 2
            i32.store offset=1052928
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
                i32.const 1052512
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
              i32.const 1052512
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
          i32.load offset=1052928
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
                i32.const 1052512
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
          i32.load offset=1052924
          i32.const -2
          local.get 8
          i32.load offset=28
          i32.rotl
          i32.and
          i32.store offset=1052924
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
              call $_RNvMs0_NtCsjqx8TIyZbP9_8dlmalloc8dlmallocINtB5_8DlmallocNtNtB7_3sys6SystemE18insert_large_chunkCsebHcaeoSrxy_3std
              br 2 (;@3;)
            end
            block  ;; label = @5
              block  ;; label = @6
                i32.const 0
                i32.load offset=1052920
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
                i32.store offset=1052920
                local.get 2
                i32.const 248
                i32.and
                i32.const 1052656
                i32.add
                local.tee 2
                local.set 6
                br 1 (;@5;)
              end
              local.get 2
              i32.const 248
              i32.and
              local.tee 2
              i32.const 1052656
              i32.add
              local.set 6
              local.get 2
              i32.const 1052664
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
                  i32.load offset=1052928
                  local.tee 0
                  local.get 3
                  i32.ge_u
                  br_if 0 (;@7;)
                  block  ;; label = @8
                    i32.const 0
                    i32.load offset=1052932
                    local.tee 0
                    local.get 3
                    i32.gt_u
                    br_if 0 (;@8;)
                    local.get 1
                    i32.const 4
                    i32.add
                    i32.const 1052964
                    local.get 3
                    i32.const 65583
                    i32.add
                    i32.const -65536
                    i32.and
                    call $_RNvXs_NtCsjqx8TIyZbP9_8dlmalloc3sysNtB4_6SystemNtB6_9Allocator5alloc
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
                    i32.load offset=1052944
                    local.get 1
                    i32.load offset=8
                    local.tee 9
                    i32.add
                    local.tee 0
                    i32.store offset=1052944
                    i32.const 0
                    local.get 0
                    i32.const 0
                    i32.load offset=1052948
                    local.tee 2
                    local.get 0
                    local.get 2
                    i32.gt_u
                    select
                    i32.store offset=1052948
                    block  ;; label = @9
                      block  ;; label = @10
                        block  ;; label = @11
                          i32.const 0
                          i32.load offset=1052940
                          local.tee 2
                          i32.eqz
                          br_if 0 (;@11;)
                          i32.const 1052640
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
                            i32.load offset=1052956
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
                          i32.store offset=1052956
                        end
                        i32.const 0
                        i32.const 4095
                        i32.store offset=1052960
                        i32.const 0
                        local.get 5
                        i32.store offset=1052652
                        i32.const 0
                        local.get 9
                        i32.store offset=1052644
                        i32.const 0
                        local.get 6
                        i32.store offset=1052640
                        i32.const 0
                        i32.const 1052656
                        i32.store offset=1052668
                        i32.const 0
                        i32.const 1052664
                        i32.store offset=1052676
                        i32.const 0
                        i32.const 1052656
                        i32.store offset=1052664
                        i32.const 0
                        i32.const 1052672
                        i32.store offset=1052684
                        i32.const 0
                        i32.const 1052664
                        i32.store offset=1052672
                        i32.const 0
                        i32.const 1052680
                        i32.store offset=1052692
                        i32.const 0
                        i32.const 1052672
                        i32.store offset=1052680
                        i32.const 0
                        i32.const 1052688
                        i32.store offset=1052700
                        i32.const 0
                        i32.const 1052680
                        i32.store offset=1052688
                        i32.const 0
                        i32.const 1052696
                        i32.store offset=1052708
                        i32.const 0
                        i32.const 1052688
                        i32.store offset=1052696
                        i32.const 0
                        i32.const 1052704
                        i32.store offset=1052716
                        i32.const 0
                        i32.const 1052696
                        i32.store offset=1052704
                        i32.const 0
                        i32.const 1052712
                        i32.store offset=1052724
                        i32.const 0
                        i32.const 1052704
                        i32.store offset=1052712
                        i32.const 0
                        i32.const 1052720
                        i32.store offset=1052732
                        i32.const 0
                        i32.const 1052712
                        i32.store offset=1052720
                        i32.const 0
                        i32.const 1052720
                        i32.store offset=1052728
                        i32.const 0
                        i32.const 1052728
                        i32.store offset=1052740
                        i32.const 0
                        i32.const 1052728
                        i32.store offset=1052736
                        i32.const 0
                        i32.const 1052736
                        i32.store offset=1052748
                        i32.const 0
                        i32.const 1052736
                        i32.store offset=1052744
                        i32.const 0
                        i32.const 1052744
                        i32.store offset=1052756
                        i32.const 0
                        i32.const 1052744
                        i32.store offset=1052752
                        i32.const 0
                        i32.const 1052752
                        i32.store offset=1052764
                        i32.const 0
                        i32.const 1052752
                        i32.store offset=1052760
                        i32.const 0
                        i32.const 1052760
                        i32.store offset=1052772
                        i32.const 0
                        i32.const 1052760
                        i32.store offset=1052768
                        i32.const 0
                        i32.const 1052768
                        i32.store offset=1052780
                        i32.const 0
                        i32.const 1052768
                        i32.store offset=1052776
                        i32.const 0
                        i32.const 1052776
                        i32.store offset=1052788
                        i32.const 0
                        i32.const 1052776
                        i32.store offset=1052784
                        i32.const 0
                        i32.const 1052784
                        i32.store offset=1052796
                        i32.const 0
                        i32.const 1052792
                        i32.store offset=1052804
                        i32.const 0
                        i32.const 1052784
                        i32.store offset=1052792
                        i32.const 0
                        i32.const 1052800
                        i32.store offset=1052812
                        i32.const 0
                        i32.const 1052792
                        i32.store offset=1052800
                        i32.const 0
                        i32.const 1052808
                        i32.store offset=1052820
                        i32.const 0
                        i32.const 1052800
                        i32.store offset=1052808
                        i32.const 0
                        i32.const 1052816
                        i32.store offset=1052828
                        i32.const 0
                        i32.const 1052808
                        i32.store offset=1052816
                        i32.const 0
                        i32.const 1052824
                        i32.store offset=1052836
                        i32.const 0
                        i32.const 1052816
                        i32.store offset=1052824
                        i32.const 0
                        i32.const 1052832
                        i32.store offset=1052844
                        i32.const 0
                        i32.const 1052824
                        i32.store offset=1052832
                        i32.const 0
                        i32.const 1052840
                        i32.store offset=1052852
                        i32.const 0
                        i32.const 1052832
                        i32.store offset=1052840
                        i32.const 0
                        i32.const 1052848
                        i32.store offset=1052860
                        i32.const 0
                        i32.const 1052840
                        i32.store offset=1052848
                        i32.const 0
                        i32.const 1052856
                        i32.store offset=1052868
                        i32.const 0
                        i32.const 1052848
                        i32.store offset=1052856
                        i32.const 0
                        i32.const 1052864
                        i32.store offset=1052876
                        i32.const 0
                        i32.const 1052856
                        i32.store offset=1052864
                        i32.const 0
                        i32.const 1052872
                        i32.store offset=1052884
                        i32.const 0
                        i32.const 1052864
                        i32.store offset=1052872
                        i32.const 0
                        i32.const 1052880
                        i32.store offset=1052892
                        i32.const 0
                        i32.const 1052872
                        i32.store offset=1052880
                        i32.const 0
                        i32.const 1052888
                        i32.store offset=1052900
                        i32.const 0
                        i32.const 1052880
                        i32.store offset=1052888
                        i32.const 0
                        i32.const 1052896
                        i32.store offset=1052908
                        i32.const 0
                        i32.const 1052888
                        i32.store offset=1052896
                        i32.const 0
                        i32.const 1052904
                        i32.store offset=1052916
                        i32.const 0
                        i32.const 1052896
                        i32.store offset=1052904
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
                        i32.store offset=1052940
                        i32.const 0
                        i32.const 1052904
                        i32.store offset=1052912
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
                        i32.store offset=1052932
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
                        i32.store offset=1052952
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
                    i32.load offset=1052956
                    local.tee 0
                    local.get 6
                    local.get 0
                    local.get 6
                    i32.lt_u
                    select
                    i32.store offset=1052956
                    local.get 6
                    local.get 9
                    i32.add
                    local.set 8
                    i32.const 1052640
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
                      i32.const 1052640
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
                      i32.store offset=1052940
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
                      i32.store offset=1052932
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
                      i32.store offset=1052952
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
                      i64.load offset=1052640 align=4
                      local.set 10
                      local.get 7
                      i32.const 16
                      i32.add
                      i32.const 0
                      i64.load offset=1052648 align=4
                      i64.store align=4
                      local.get 7
                      i32.const 8
                      i32.add
                      local.tee 0
                      local.get 10
                      i64.store align=4
                      i32.const 0
                      local.get 5
                      i32.store offset=1052652
                      i32.const 0
                      local.get 9
                      i32.store offset=1052644
                      i32.const 0
                      local.get 6
                      i32.store offset=1052640
                      i32.const 0
                      local.get 0
                      i32.store offset=1052648
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
                        call $_RNvMs0_NtCsjqx8TIyZbP9_8dlmalloc8dlmallocINtB5_8DlmallocNtNtB7_3sys6SystemE18insert_large_chunkCsebHcaeoSrxy_3std
                        br 8 (;@2;)
                      end
                      block  ;; label = @10
                        block  ;; label = @11
                          i32.const 0
                          i32.load offset=1052920
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
                          i32.store offset=1052920
                          local.get 0
                          i32.const 248
                          i32.and
                          i32.const 1052656
                          i32.add
                          local.tee 0
                          local.set 8
                          br 1 (;@10;)
                        end
                        local.get 0
                        i32.const 248
                        i32.and
                        local.tee 0
                        i32.const 1052656
                        i32.add
                        local.set 8
                        local.get 0
                        i32.const 1052664
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
                    i32.load offset=1052940
                    i32.eq
                    br_if 3 (;@5;)
                    local.get 2
                    i32.const 0
                    i32.load offset=1052936
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
                      call $_RNvMs0_NtCsjqx8TIyZbP9_8dlmalloc8dlmallocINtB5_8DlmallocNtNtB7_3sys6SystemE12unlink_chunkCsebHcaeoSrxy_3std
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
                      call $_RNvMs0_NtCsjqx8TIyZbP9_8dlmalloc8dlmallocINtB5_8DlmallocNtNtB7_3sys6SystemE18insert_large_chunkCsebHcaeoSrxy_3std
                      br 6 (;@3;)
                    end
                    block  ;; label = @9
                      block  ;; label = @10
                        i32.const 0
                        i32.load offset=1052920
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
                        i32.store offset=1052920
                        local.get 3
                        i32.const 248
                        i32.and
                        i32.const 1052656
                        i32.add
                        local.tee 3
                        local.set 2
                        br 1 (;@9;)
                      end
                      local.get 3
                      i32.const 248
                      i32.and
                      local.tee 3
                      i32.const 1052656
                      i32.add
                      local.set 2
                      local.get 3
                      i32.const 1052664
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
                  i32.store offset=1052932
                  i32.const 0
                  i32.const 0
                  i32.load offset=1052940
                  local.tee 0
                  local.get 3
                  i32.add
                  local.tee 8
                  i32.store offset=1052940
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
                i32.load offset=1052936
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
                    i32.store offset=1052936
                    i32.const 0
                    i32.const 0
                    i32.store offset=1052928
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
                  i32.store offset=1052928
                  i32.const 0
                  local.get 2
                  local.get 3
                  i32.add
                  local.tee 6
                  i32.store offset=1052936
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
              i32.load offset=1052940
              local.tee 0
              i32.const 15
              i32.add
              i32.const -8
              i32.and
              local.tee 2
              i32.const -8
              i32.add
              local.tee 8
              i32.store offset=1052940
              i32.const 0
              local.get 0
              local.get 2
              i32.sub
              i32.const 0
              i32.load offset=1052932
              local.get 9
              i32.add
              local.tee 2
              i32.add
              i32.const 8
              i32.add
              local.tee 6
              i32.store offset=1052932
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
              i32.store offset=1052952
              br 3 (;@2;)
            end
            i32.const 0
            local.get 0
            i32.store offset=1052940
            i32.const 0
            i32.const 0
            i32.load offset=1052932
            local.get 3
            i32.add
            local.tee 3
            i32.store offset=1052932
            local.get 0
            local.get 3
            i32.const 1
            i32.or
            i32.store offset=4
            br 1 (;@3;)
          end
          i32.const 0
          local.get 0
          i32.store offset=1052936
          i32.const 0
          i32.const 0
          i32.load offset=1052928
          local.get 3
          i32.add
          local.tee 3
          i32.store offset=1052928
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
      i32.load offset=1052932
      local.tee 2
      local.get 3
      i32.le_u
      br_if 0 (;@1;)
      i32.const 0
      local.get 2
      local.get 3
      i32.sub
      local.tee 2
      i32.store offset=1052932
      i32.const 0
      i32.const 0
      i32.load offset=1052940
      local.tee 0
      local.get 3
      i32.add
      local.tee 8
      i32.store offset=1052940
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
  (func $_RNvCsfLfy6EI15iL_7___rustc12___rust_abort (type 4)
    unreachable)
  (func $_RNvCsfLfy6EI15iL_7___rustc13___rdl_dealloc (type 6) (param i32 i32 i32)
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
        call $_RNvMs0_NtCsjqx8TIyZbP9_8dlmalloc8dlmallocINtB5_8DlmallocNtNtB7_3sys6SystemE4freeCsebHcaeoSrxy_3std
        return
      end
      i32.const 1050240
      i32.const 46
      i32.const 1050288
      call $_RNvNtCsgXGp5Oqx2Ny_4core9panicking5panic
      unreachable
    end
    i32.const 1050304
    i32.const 46
    i32.const 1050352
    call $_RNvNtCsgXGp5Oqx2Ny_4core9panicking5panic
    unreachable)
  (func $_RNvMs0_NtCsjqx8TIyZbP9_8dlmalloc8dlmallocINtB5_8DlmallocNtNtB7_3sys6SystemE4freeCsebHcaeoSrxy_3std (type 1) (param i32)
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
          i32.load offset=1052936
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
          i32.store offset=1052928
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
        call $_RNvMs0_NtCsjqx8TIyZbP9_8dlmalloc8dlmallocINtB5_8DlmallocNtNtB7_3sys6SystemE12unlink_chunkCsebHcaeoSrxy_3std
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
                      i32.load offset=1052940
                      i32.eq
                      br_if 2 (;@7;)
                      local.get 3
                      i32.const 0
                      i32.load offset=1052936
                      i32.eq
                      br_if 3 (;@6;)
                      local.get 3
                      local.get 2
                      i32.const -8
                      i32.and
                      local.tee 2
                      call $_RNvMs0_NtCsjqx8TIyZbP9_8dlmalloc8dlmallocINtB5_8DlmallocNtNtB7_3sys6SystemE12unlink_chunkCsebHcaeoSrxy_3std
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
                      i32.load offset=1052936
                      i32.ne
                      br_if 1 (;@8;)
                      i32.const 0
                      local.get 0
                      i32.store offset=1052928
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
                  call $_RNvMs0_NtCsjqx8TIyZbP9_8dlmalloc8dlmallocINtB5_8DlmallocNtNtB7_3sys6SystemE18insert_large_chunkCsebHcaeoSrxy_3std
                  i32.const 0
                  i32.const 0
                  i32.load offset=1052960
                  i32.const -1
                  i32.add
                  local.tee 1
                  i32.store offset=1052960
                  local.get 1
                  br_if 6 (;@1;)
                  i32.const 0
                  i32.load offset=1052648
                  local.tee 0
                  br_if 2 (;@5;)
                  i32.const 4095
                  local.set 1
                  br 3 (;@4;)
                end
                i32.const 0
                local.get 1
                i32.store offset=1052940
                i32.const 0
                i32.const 0
                i32.load offset=1052932
                local.get 0
                i32.add
                local.tee 0
                i32.store offset=1052932
                local.get 1
                local.get 0
                i32.const 1
                i32.or
                i32.store offset=4
                block  ;; label = @7
                  local.get 1
                  i32.const 0
                  i32.load offset=1052936
                  i32.ne
                  br_if 0 (;@7;)
                  i32.const 0
                  i32.const 0
                  i32.store offset=1052928
                  i32.const 0
                  i32.const 0
                  i32.store offset=1052936
                end
                local.get 0
                i32.const 0
                i32.load offset=1052952
                local.tee 2
                i32.le_u
                br_if 5 (;@1;)
                i32.const 0
                i32.load offset=1052940
                local.tee 0
                i32.eqz
                br_if 5 (;@1;)
                i32.const 0
                i32.load offset=1052932
                local.tee 4
                i32.const 41
                i32.lt_u
                br_if 4 (;@2;)
                i32.const 1052640
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
              i32.store offset=1052936
              i32.const 0
              i32.const 0
              i32.load offset=1052928
              local.get 0
              i32.add
              local.tee 0
              i32.store offset=1052928
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
          i32.store offset=1052960
          return
        end
        block  ;; label = @3
          block  ;; label = @4
            i32.const 0
            i32.load offset=1052920
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
            i32.store offset=1052920
            local.get 0
            i32.const 248
            i32.and
            i32.const 1052656
            i32.add
            local.tee 0
            local.set 3
            br 1 (;@3;)
          end
          local.get 0
          i32.const 248
          i32.and
          local.tee 0
          i32.const 1052656
          i32.add
          local.set 3
          local.get 0
          i32.const 1052664
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
          i32.load offset=1052648
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
      i32.store offset=1052960
      local.get 4
      local.get 2
      i32.le_u
      br_if 0 (;@1;)
      i32.const 0
      i32.const -1
      i32.store offset=1052952
    end)
  (func $_RNvCsfLfy6EI15iL_7___rustc13___rdl_realloc (type 7) (param i32 i32 i32 i32) (result i32)
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
                        call $_RNvMs0_NtCsjqx8TIyZbP9_8dlmalloc8dlmallocINtB5_8DlmallocNtNtB7_3sys6SystemE8memalignCsebHcaeoSrxy_3std
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
                          i32.load offset=1052940
                          i32.eq
                          br_if 1 (;@10;)
                          block  ;; label = @12
                            local.get 7
                            i32.const 0
                            i32.load offset=1052936
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
                            call $_RNvMs0_NtCsjqx8TIyZbP9_8dlmalloc8dlmallocINtB5_8DlmallocNtNtB7_3sys6SystemE12unlink_chunkCsebHcaeoSrxy_3std
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
                              call $_RNvMs0_NtCsjqx8TIyZbP9_8dlmalloc8dlmallocINtB5_8DlmallocNtNtB7_3sys6SystemE13dispose_chunkCsebHcaeoSrxy_3std
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
                          i32.load offset=1052928
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
                          i32.store offset=1052936
                          i32.const 0
                          local.get 6
                          i32.store offset=1052928
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
                        call $_RNvMs0_NtCsjqx8TIyZbP9_8dlmalloc8dlmallocINtB5_8DlmallocNtNtB7_3sys6SystemE13dispose_chunkCsebHcaeoSrxy_3std
                        br 6 (;@4;)
                      end
                      i32.const 0
                      i32.load offset=1052932
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
                    i32.const 1050304
                    i32.const 46
                    i32.const 1050352
                    call $_RNvNtCsgXGp5Oqx2Ny_4core9panicking5panic
                    unreachable
                  end
                  i32.const 1050240
                  i32.const 46
                  i32.const 1050288
                  call $_RNvNtCsgXGp5Oqx2Ny_4core9panicking5panic
                  unreachable
                end
                i32.const 1050304
                i32.const 46
                i32.const 1050352
                call $_RNvNtCsgXGp5Oqx2Ny_4core9panicking5panic
                unreachable
              end
              i32.const 1050240
              i32.const 46
              i32.const 1050288
              call $_RNvNtCsgXGp5Oqx2Ny_4core9panicking5panic
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
            i32.store offset=1052932
            i32.const 0
            local.get 5
            i32.store offset=1052940
          end
          local.get 8
          i32.eqz
          br_if 0 (;@3;)
          local.get 0
          return
        end
        local.get 3
        call $_RNvMs0_NtCsjqx8TIyZbP9_8dlmalloc8dlmallocINtB5_8DlmallocNtNtB7_3sys6SystemE6mallocCsebHcaeoSrxy_3std
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
      call $_RNvMs0_NtCsjqx8TIyZbP9_8dlmalloc8dlmallocINtB5_8DlmallocNtNtB7_3sys6SystemE4freeCsebHcaeoSrxy_3std
    end
    local.get 2)
  (func $_RNvMs0_NtCsjqx8TIyZbP9_8dlmalloc8dlmallocINtB5_8DlmallocNtNtB7_3sys6SystemE12unlink_chunkCsebHcaeoSrxy_3std (type 2) (param i32 i32)
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
                i32.const 1052512
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
          i32.load offset=1052920
          i32.const -2
          local.get 1
          i32.const 3
          i32.shr_u
          i32.rotl
          i32.and
          i32.store offset=1052920
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
    i32.load offset=1052924
    i32.const -2
    local.get 0
    i32.load offset=28
    i32.rotl
    i32.and
    i32.store offset=1052924)
  (func $_RNvMs0_NtCsjqx8TIyZbP9_8dlmalloc8dlmallocINtB5_8DlmallocNtNtB7_3sys6SystemE13dispose_chunkCsebHcaeoSrxy_3std (type 2) (param i32 i32)
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
          i32.load offset=1052936
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
          i32.store offset=1052928
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
        call $_RNvMs0_NtCsjqx8TIyZbP9_8dlmalloc8dlmallocINtB5_8DlmallocNtNtB7_3sys6SystemE12unlink_chunkCsebHcaeoSrxy_3std
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
              i32.load offset=1052940
              i32.eq
              br_if 2 (;@3;)
              local.get 2
              i32.const 0
              i32.load offset=1052936
              i32.eq
              br_if 3 (;@2;)
              local.get 2
              local.get 3
              i32.const -8
              i32.and
              local.tee 3
              call $_RNvMs0_NtCsjqx8TIyZbP9_8dlmalloc8dlmallocINtB5_8DlmallocNtNtB7_3sys6SystemE12unlink_chunkCsebHcaeoSrxy_3std
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
              i32.load offset=1052936
              i32.ne
              br_if 1 (;@4;)
              i32.const 0
              local.get 1
              i32.store offset=1052928
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
            call $_RNvMs0_NtCsjqx8TIyZbP9_8dlmalloc8dlmallocINtB5_8DlmallocNtNtB7_3sys6SystemE18insert_large_chunkCsebHcaeoSrxy_3std
            return
          end
          block  ;; label = @4
            block  ;; label = @5
              i32.const 0
              i32.load offset=1052920
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
              i32.store offset=1052920
              local.get 1
              i32.const 248
              i32.and
              i32.const 1052656
              i32.add
              local.tee 1
              local.set 2
              br 1 (;@4;)
            end
            local.get 1
            i32.const 248
            i32.and
            local.tee 1
            i32.const 1052656
            i32.add
            local.set 2
            local.get 1
            i32.const 1052664
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
        i32.store offset=1052940
        i32.const 0
        i32.const 0
        i32.load offset=1052932
        local.get 1
        i32.add
        local.tee 1
        i32.store offset=1052932
        local.get 0
        local.get 1
        i32.const 1
        i32.or
        i32.store offset=4
        local.get 0
        i32.const 0
        i32.load offset=1052936
        i32.ne
        br_if 1 (;@1;)
        i32.const 0
        i32.const 0
        i32.store offset=1052928
        i32.const 0
        i32.const 0
        i32.store offset=1052936
        return
      end
      i32.const 0
      local.get 0
      i32.store offset=1052936
      i32.const 0
      i32.const 0
      i32.load offset=1052928
      local.get 1
      i32.add
      local.tee 1
      i32.store offset=1052928
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
  (func $_RNvCsfLfy6EI15iL_7___rustc17rust_begin_unwind (type 1) (param i32)
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
    call $_RINvNtNtCsebHcaeoSrxy_3std3sys9backtrace26___rust_end_short_backtraceNCNvNtB6_9panicking13panic_handler0zEB6_
    unreachable)
  (func $_RNvCsfLfy6EI15iL_7___rustc18___rdl_alloc_zeroed (type 0) (param i32 i32) (result i32)
    block  ;; label = @1
      block  ;; label = @2
        local.get 1
        i32.const 9
        i32.lt_u
        br_if 0 (;@2;)
        local.get 1
        local.get 0
        call $_RNvMs0_NtCsjqx8TIyZbP9_8dlmalloc8dlmallocINtB5_8DlmallocNtNtB7_3sys6SystemE8memalignCsebHcaeoSrxy_3std
        local.set 1
        br 1 (;@1;)
      end
      local.get 0
      call $_RNvMs0_NtCsjqx8TIyZbP9_8dlmalloc8dlmallocINtB5_8DlmallocNtNtB7_3sys6SystemE6mallocCsebHcaeoSrxy_3std
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
  (func $_RNvCsfLfy6EI15iL_7___rustc26___rust_alloc_error_handler (type 2) (param i32 i32)
    local.get 1
    local.get 0
    call $_RNvNtCsebHcaeoSrxy_3std5alloc8rust_oom
    unreachable)
  (func $_RNvNtCsebHcaeoSrxy_3std5alloc8rust_oom (type 2) (param i32 i32)
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
    call $_RINvNtNtCsebHcaeoSrxy_3std3sys9backtrace26___rust_end_short_backtraceNCNvNtB6_5alloc8rust_oom0zEB6_
    unreachable)
  (func $_RNvMs0_NtCsjqx8TIyZbP9_8dlmalloc8dlmallocINtB5_8DlmallocNtNtB7_3sys6SystemE18insert_large_chunkCsebHcaeoSrxy_3std (type 2) (param i32 i32)
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
    i32.const 1052512
    i32.add
    local.set 3
    block  ;; label = @1
      i32.const 0
      i32.load offset=1052924
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
      i32.load offset=1052924
      local.get 4
      i32.or
      i32.store offset=1052924
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
  (func $_RNvMsn_NtCs5cOc02OMXlo_5alloc4syncINtB5_3ArcINtNtNtNtCsebHcaeoSrxy_3std4sync6poison5mutex5MutexINtNtB7_3vec3VechEEE9drop_slowBP_ (type 1) (param i32)
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
      call $_RNvCsfLfy6EI15iL_7___rustc14___rust_dealloc
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
      call $_RNvCsfLfy6EI15iL_7___rustc14___rust_dealloc
    end)
  (func $_RNvYINtNtCs5cOc02OMXlo_5alloc3vec3VechENtNtCsebHcaeoSrxy_3std2io5Write9write_fmtBF_ (type 10) (param i32 i32 i32 i32)
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
    i32.const 1050048
    local.get 2
    local.get 3
    call $_RNvNtCsgXGp5Oqx2Ny_4core3fmt5write
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
          i32.const 1049944
          i32.const 173
          i32.const 1050032
          call $_RNvNtCsgXGp5Oqx2Ny_4core9panicking9panic_fmt
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
          call $_RNvCsfLfy6EI15iL_7___rustc14___rust_dealloc
        end
        local.get 0
        i32.const 12
        i32.const 4
        call $_RNvCsfLfy6EI15iL_7___rustc14___rust_dealloc
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
  (func $_RNvNtNtCsebHcaeoSrxy_3std9panicking11panic_count8increase (type 11) (param i32) (result i32)
    (local i32 i32)
    i32.const 0
    local.set 1
    i32.const 0
    i32.const 0
    i32.load offset=1052508
    local.tee 2
    i32.const 1
    i32.add
    i32.store offset=1052508
    block  ;; label = @1
      local.get 2
      i32.const 0
      i32.lt_s
      br_if 0 (;@1;)
      i32.const 1
      local.set 1
      i32.const 0
      i32.load8_u offset=1052484
      br_if 0 (;@1;)
      i32.const 0
      local.get 0
      i32.store8 offset=1052484
      i32.const 0
      i32.const 0
      i32.load offset=1052480
      i32.const 1
      i32.add
      i32.store offset=1052480
      i32.const 2
      local.set 1
    end
    local.get 1)
  (func $_RNvNtNtCsebHcaeoSrxy_3std2io5stdio31print_to_buffer_if_capture_used (type 0) (param i32 i32) (result i32)
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
        i32.load8_u offset=1052504
        i32.eqz
        br_if 0 (;@2;)
        i32.const 0
        local.set 3
        i32.const 0
        i32.load offset=1052476
        local.set 4
        i32.const 0
        i32.const 0
        i32.store offset=1052476
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
        call $_RNvYINtNtCs5cOc02OMXlo_5alloc3vec3VechENtNtCsebHcaeoSrxy_3std2io5Write9write_fmtBF_
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
            call $_RNvCsfLfy6EI15iL_7___rustc14___rust_dealloc
          end
          local.get 3
          i32.const 12
          i32.const 4
          call $_RNvCsfLfy6EI15iL_7___rustc14___rust_dealloc
        end
        local.get 4
        i32.const 0
        i32.store8 offset=8
        i32.const 0
        i32.load offset=1052476
        local.set 3
        i32.const 0
        local.get 4
        i32.store offset=1052476
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
          call $_RNvMsn_NtCs5cOc02OMXlo_5alloc4syncINtB5_3ArcINtNtNtNtCsebHcaeoSrxy_3std4sync6poison5mutex5MutexINtNtB7_3vec3VechEEE9drop_slowBP_
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
    i32.const 1051224
    i32.const 1051117
    i32.const 65
    i32.const 1051152
    call $_RINvNtCsgXGp5Oqx2Ny_4core9panicking13assert_failedbbECsebHcaeoSrxy_3std
    unreachable)
  (func $_RNvXso_NtNtCsebHcaeoSrxy_3std2io5stdioRNtB5_6StderrNtB7_5Write9write_fmt (type 10) (param i32 i32 i32 i32)
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
            i64.load offset=1052968
            local.tee 6
            i64.const 0
            i64.ne
            br_if 0 (;@4;)
            i32.const 0
            i64.load offset=1052976
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
              i64.load offset=1052976
              local.tee 8
              local.get 8
              local.get 7
              i64.eq
              local.tee 1
              select
              i64.store offset=1052976
              local.get 8
              local.set 7
              local.get 1
              i32.eqz
              br_if 0 (;@5;)
            end
            i32.const 0
            local.get 6
            i64.store offset=1052968
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
          i32.const 1050072
          local.get 2
          local.get 3
          call $_RNvNtCsgXGp5Oqx2Ny_4core3fmt5write
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
                i32.const 1049944
                i32.const 173
                i32.const 1050032
                call $_RNvNtCsgXGp5Oqx2Ny_4core9panicking9panic_fmt
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
                call $_RNvCsfLfy6EI15iL_7___rustc14___rust_dealloc
              end
              local.get 1
              i32.const 12
              i32.const 4
              call $_RNvCsfLfy6EI15iL_7___rustc14___rust_dealloc
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
        call $_RNvNvMNtNtCsebHcaeoSrxy_3std6thread2idNtB4_8ThreadId3new9exhausted
        unreachable
      end
      i32.const 0
      local.get 4
      i32.const 16
      i32.add
      i32.const 1051224
      i32.const 1051117
      i32.const 65
      i32.const 1051152
      call $_RINvNtCsgXGp5Oqx2Ny_4core9panicking13assert_failedbbECsebHcaeoSrxy_3std
      unreachable
    end
    i32.const 1051168
    i32.const 38
    i32.const 1051208
    call $_RNvNtCsgXGp5Oqx2Ny_4core6option13expect_failed
    unreachable)
  (func $_RNvXs7_NtNtCsebHcaeoSrxy_3std2io5errorNtB5_5ErrorNtNtCsgXGp5Oqx2Ny_4core3fmt7Display3fmt (type 0) (param i32 i32) (result i32)
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
              call $_RNvCsfLfy6EI15iL_7___rustc35___rust_no_alloc_shim_is_unstable_v2
              i32.const 20
              i32.const 1
              call $_RNvCsfLfy6EI15iL_7___rustc12___rust_alloc
              local.tee 0
              i32.eqz
              br_if 4 (;@1;)
              local.get 0
              i32.const 0
              i32.load offset=1051247 align=1
              i32.store offset=16 align=1
              local.get 0
              i32.const 0
              i64.load offset=1051239 align=1
              i64.store offset=8 align=1
              local.get 0
              i32.const 0
              i64.load offset=1051231 align=1
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
              i32.const 9
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
              i32.const 1049629
              local.get 2
              i32.const 16
              i32.add
              call $_RNvNtCsgXGp5Oqx2Ny_4core3fmt5write
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
              call $_RNvCsfLfy6EI15iL_7___rustc14___rust_dealloc
              br 3 (;@2;)
            end
            local.get 2
            local.get 0
            i32.load8_u offset=1
            i32.const 2
            i32.shl
            local.tee 0
            i32.load offset=1051372
            i32.store offset=8
            local.get 2
            local.get 0
            i32.load offset=1051540
            i32.store offset=4
            local.get 2
            i32.const 10
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
            i32.const 1048945
            local.get 2
            i32.const 16
            i32.add
            call $_RNvNtCsgXGp5Oqx2Ny_4core3fmt5write
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
          call $_RNvXsi_NtCsgXGp5Oqx2Ny_4core3fmteNtB5_7Display3fmt
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
    call $_RNvNtCs5cOc02OMXlo_5alloc7raw_vec12handle_error
    unreachable)
  (func $_RNvNtNtCsebHcaeoSrxy_3std2io5stdio7__eprint (type 2) (param i32 i32)
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
    i32.const 1051225
    i32.store
    block  ;; label = @1
      block  ;; label = @2
        local.get 0
        local.get 1
        call $_RNvNtNtCsebHcaeoSrxy_3std2io5stdio31print_to_buffer_if_capture_used
        br_if 0 (;@2;)
        local.get 2
        i32.const 1052992
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
        call $_RNvXso_NtNtCsebHcaeoSrxy_3std2io5stdioRNtB5_6StderrNtB7_5Write9write_fmt
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
    i32.const 11
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
    i32.const 10
    i64.extend_i32_u
    i64.const 32
    i64.shl
    local.get 2
    i64.extend_i32_u
    i64.or
    i64.store offset=32
    i32.const 1048921
    local.get 2
    i32.const 32
    i32.add
    i32.const 1050112
    call $_RNvNtCsgXGp5Oqx2Ny_4core9panicking9panic_fmt
    unreachable)
  (func $_RNvXNtCsgXGp5Oqx2Ny_4core3anyNtNtCs5cOc02OMXlo_5alloc6string6StringNtB2_3Any7type_idCsebHcaeoSrxy_3std (type 2) (param i32 i32)
    local.get 0
    i32.const 0
    i64.load offset=1050232 align=4
    i64.store offset=8 align=4
    local.get 0
    i32.const 0
    i64.load offset=1050224 align=4
    i64.store align=4)
  (func $_RNvXNtCsgXGp5Oqx2Ny_4core3anyReNtB2_3Any7type_idCsebHcaeoSrxy_3std (type 2) (param i32 i32)
    local.get 0
    i32.const 0
    i64.load offset=1050216 align=4
    i64.store offset=8 align=4
    local.get 0
    i32.const 0
    i64.load offset=1050208 align=4
    i64.store align=4)
  (func $_RNvXNvNtCsebHcaeoSrxy_3std2io17default_write_fmtINtB2_7AdapterINtNtCs5cOc02OMXlo_5alloc3vec3VechEENtNtCsgXGp5Oqx2Ny_4core3fmt5Write9write_strB6_ (type 3) (param i32 i32 i32) (result i32)
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
          call $_RINvNvMs2_NtCs5cOc02OMXlo_5alloc7raw_vecINtB8_11RawVecInnerpE7reserve21do_reserve_and_handleNtNtBa_5alloc6GlobalECsebHcaeoSrxy_3std
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
  (func $_RNvXNvNtCsebHcaeoSrxy_3std2io17default_write_fmtINtB2_7AdapterNtNtB4_5stdio10StderrLockENtNtCsgXGp5Oqx2Ny_4core3fmt5Write9write_strB6_ (type 3) (param i32 i32 i32) (result i32)
    block  ;; label = @1
      local.get 0
      i32.load offset=8
      i32.load
      i32.load offset=16
      i32.eqz
      br_if 0 (;@1;)
      i32.const 1051356
      call $_RNvNtCsgXGp5Oqx2Ny_4core4cell22panic_already_borrowed
      unreachable
    end
    i32.const 0)
  (func $_RNvXs0_NvNtCsebHcaeoSrxy_3std9panicking13panic_handlerNtB5_19FormatStringPayloadNtNtCsgXGp5Oqx2Ny_4core3fmt7Display3fmt (type 0) (param i32 i32) (result i32)
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
      call $_RNvMsa_NtCsgXGp5Oqx2Ny_4core3fmtNtB5_9Formatter9write_str
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
    call $_RNvNtCsgXGp5Oqx2Ny_4core3fmt5write)
  (func $_RNvXs1_NvNtCsebHcaeoSrxy_3std9panicking13panic_handlerNtB5_16StaticStrPayloadNtNtCsgXGp5Oqx2Ny_4core5panic12PanicPayload3get (type 2) (param i32 i32)
    local.get 0
    i32.const 1051324
    i32.store offset=4
    local.get 0
    local.get 1
    i32.store)
  (func $_RNvXs1_NvNtCsebHcaeoSrxy_3std9panicking13panic_handlerNtB5_16StaticStrPayloadNtNtCsgXGp5Oqx2Ny_4core5panic12PanicPayload6as_str (type 2) (param i32 i32)
    local.get 0
    local.get 1
    i64.load align=4
    i64.store)
  (func $_RNvXs1_NvNtCsebHcaeoSrxy_3std9panicking13panic_handlerNtB5_16StaticStrPayloadNtNtCsgXGp5Oqx2Ny_4core5panic12PanicPayload8take_box (type 2) (param i32 i32)
    (local i32 i32)
    local.get 1
    i32.load offset=4
    local.set 2
    local.get 1
    i32.load
    local.set 3
    call $_RNvCsfLfy6EI15iL_7___rustc35___rust_no_alloc_shim_is_unstable_v2
    block  ;; label = @1
      i32.const 8
      i32.const 4
      call $_RNvCsfLfy6EI15iL_7___rustc12___rust_alloc
      local.tee 1
      br_if 0 (;@1;)
      i32.const 4
      i32.const 8
      call $_RNvNtCs5cOc02OMXlo_5alloc5alloc18handle_alloc_error
      unreachable
    end
    local.get 1
    local.get 2
    i32.store offset=4
    local.get 1
    local.get 3
    i32.store
    local.get 0
    i32.const 1051324
    i32.store offset=4
    local.get 0
    local.get 1
    i32.store)
  (func $_RNvXs1g_NtCsgXGp5Oqx2Ny_4core3fmtRbNtB6_5Debug3fmtCsebHcaeoSrxy_3std (type 0) (param i32 i32) (result i32)
    local.get 0
    i32.load
    local.get 1
    call $_RNvXsg_NtCsgXGp5Oqx2Ny_4core3fmtbNtB5_7Display3fmt)
  (func $_RNvXs2_NvNtCsebHcaeoSrxy_3std9panicking13panic_handlerNtB5_16StaticStrPayloadNtNtCsgXGp5Oqx2Ny_4core3fmt7Display3fmt (type 0) (param i32 i32) (result i32)
    local.get 1
    local.get 0
    i32.load
    local.get 0
    i32.load offset=4
    call $_RNvMsa_NtCsgXGp5Oqx2Ny_4core3fmtNtB5_9Formatter9write_str)
  (func $_RNvXsq_NtCs5cOc02OMXlo_5alloc6stringNtB5_6StringNtNtCsgXGp5Oqx2Ny_4core3fmt7Display3fmt (type 0) (param i32 i32) (result i32)
    local.get 0
    i32.load offset=4
    local.get 0
    i32.load offset=8
    local.get 1
    call $_RNvXsi_NtCsgXGp5Oqx2Ny_4core3fmteNtB5_7Display3fmt)
  (func $_RNvXsZ_NtCs5cOc02OMXlo_5alloc6stringNtB5_6StringNtNtCsgXGp5Oqx2Ny_4core3fmt5Write10write_char (type 0) (param i32 i32) (result i32)
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
      call $_RINvNvMs2_NtCs5cOc02OMXlo_5alloc7raw_vecINtB8_11RawVecInnerpE7reserve21do_reserve_and_handleNtNtBa_5alloc6GlobalECsebHcaeoSrxy_3std
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
  (func $_RNvXsZ_NtCs5cOc02OMXlo_5alloc6stringNtB5_6StringNtNtCsgXGp5Oqx2Ny_4core3fmt5Write9write_str (type 3) (param i32 i32 i32) (result i32)
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
          call $_RINvNvMs2_NtCs5cOc02OMXlo_5alloc7raw_vecINtB8_11RawVecInnerpE7reserve21do_reserve_and_handleNtNtBa_5alloc6GlobalECsebHcaeoSrxy_3std
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
  (func $_RNvXs_NvNtCsebHcaeoSrxy_3std9panicking13panic_handlerNtB4_19FormatStringPayloadNtNtCsgXGp5Oqx2Ny_4core5panic12PanicPayload3get (type 2) (param i32 i32)
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
      i32.const 1050128
      local.get 3
      i32.load
      local.tee 3
      i32.load
      local.get 3
      i32.load offset=4
      call $_RNvNtCsgXGp5Oqx2Ny_4core3fmt5write
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
    i32.const 1051340
    i32.store offset=4
    local.get 0
    local.get 1
    i32.store
    local.get 2
    i32.const 32
    i32.add
    global.set $__stack_pointer)
  (func $_RNvXs_NvNtCsebHcaeoSrxy_3std9panicking13panic_handlerNtB4_19FormatStringPayloadNtNtCsgXGp5Oqx2Ny_4core5panic12PanicPayload8take_box (type 2) (param i32 i32)
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
      i32.const 1050128
      local.get 3
      i32.load
      local.tee 3
      i32.load
      local.get 3
      i32.load offset=4
      call $_RNvNtCsgXGp5Oqx2Ny_4core3fmt5write
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
    call $_RNvCsfLfy6EI15iL_7___rustc35___rust_no_alloc_shim_is_unstable_v2
    block  ;; label = @1
      i32.const 12
      i32.const 4
      call $_RNvCsfLfy6EI15iL_7___rustc12___rust_alloc
      local.tee 1
      br_if 0 (;@1;)
      i32.const 4
      i32.const 12
      call $_RNvNtCs5cOc02OMXlo_5alloc5alloc18handle_alloc_error
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
    i32.const 1051340
    i32.store offset=4
    local.get 0
    local.get 1
    i32.store
    local.get 2
    i32.const 48
    i32.add
    global.set $__stack_pointer)
  (func $_RNvYINtNvNtCsebHcaeoSrxy_3std2io17default_write_fmt7AdapterINtNtCs5cOc02OMXlo_5alloc3vec3VechEENtNtCsgXGp5Oqx2Ny_4core3fmt5Write10write_charB9_ (type 0) (param i32 i32) (result i32)
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
      call $_RINvNvMs2_NtCs5cOc02OMXlo_5alloc7raw_vecINtB8_11RawVecInnerpE7reserve21do_reserve_and_handleNtNtBa_5alloc6GlobalECsebHcaeoSrxy_3std
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
  (func $_RNvYINtNvNtCsebHcaeoSrxy_3std2io17default_write_fmt7AdapterINtNtCs5cOc02OMXlo_5alloc3vec3VechEENtNtCsgXGp5Oqx2Ny_4core3fmt5Write9write_fmtB9_ (type 3) (param i32 i32 i32) (result i32)
    local.get 0
    i32.const 1050048
    local.get 1
    local.get 2
    call $_RNvNtCsgXGp5Oqx2Ny_4core3fmt5write)
  (func $_RNvYINtNvNtCsebHcaeoSrxy_3std2io17default_write_fmt7AdapterNtNtB7_5stdio10StderrLockENtNtCsgXGp5Oqx2Ny_4core3fmt5Write10write_charB9_ (type 0) (param i32 i32) (result i32)
    block  ;; label = @1
      local.get 0
      i32.load offset=8
      i32.load
      i32.load offset=16
      i32.eqz
      br_if 0 (;@1;)
      i32.const 1051356
      call $_RNvNtCsgXGp5Oqx2Ny_4core4cell22panic_already_borrowed
      unreachable
    end
    i32.const 0)
  (func $_RNvYINtNvNtCsebHcaeoSrxy_3std2io17default_write_fmt7AdapterNtNtB7_5stdio10StderrLockENtNtCsgXGp5Oqx2Ny_4core3fmt5Write9write_fmtB9_ (type 3) (param i32 i32 i32) (result i32)
    local.get 0
    i32.const 1050072
    local.get 1
    local.get 2
    call $_RNvNtCsgXGp5Oqx2Ny_4core3fmt5write)
  (func $_RNvYINtNvNtCsebHcaeoSrxy_3std9panicking11begin_panic7PayloadReENtNtCsgXGp5Oqx2Ny_4core5panic12PanicPayload6as_strB9_ (type 2) (param i32 i32)
    local.get 0
    i32.const 0
    i32.store)
  (func $_RNvYNtNtCs5cOc02OMXlo_5alloc6string6StringNtNtCsgXGp5Oqx2Ny_4core3fmt5Write9write_fmtCsebHcaeoSrxy_3std (type 3) (param i32 i32 i32) (result i32)
    local.get 0
    i32.const 1050128
    local.get 1
    local.get 2
    call $_RNvNtCsgXGp5Oqx2Ny_4core3fmt5write)
  (func $_RNvXs_NtCsjqx8TIyZbP9_8dlmalloc3sysNtB4_6SystemNtB6_9Allocator5alloc (type 6) (param i32 i32 i32)
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
  (func $_RNvNtCs5cOc02OMXlo_5alloc7raw_vec12handle_error (type 2) (param i32 i32)
    block  ;; label = @1
      local.get 0
      i32.eqz
      br_if 0 (;@1;)
      local.get 0
      local.get 1
      call $_RNvNtCs5cOc02OMXlo_5alloc5alloc18handle_alloc_error
      unreachable
    end
    call $_RNvNtCs5cOc02OMXlo_5alloc7raw_vec17capacity_overflow
    unreachable)
  (func $_RNvNtCs5cOc02OMXlo_5alloc5alloc18handle_alloc_error (type 2) (param i32 i32)
    local.get 1
    local.get 0
    call $_RNvCsfLfy6EI15iL_7___rustc26___rust_alloc_error_handler
    unreachable)
  (func $_RNvNtCs5cOc02OMXlo_5alloc7raw_vec17capacity_overflow (type 4)
    i32.const 1051708
    i32.const 35
    i32.const 1051728
    call $_RNvNtCsgXGp5Oqx2Ny_4core9panicking9panic_fmt
    unreachable)
  (func $_RNvNtCsgXGp5Oqx2Ny_4core9panicking19assert_failed_inner (type 15) (param i32 i32 i32 i32 i32 i32 i32 i32)
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
    i32.load offset=1052396
    i32.store offset=20
    local.get 8
    local.get 2
    i32.load offset=1052384
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
      i32.const 35
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
      i32.const 36
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
      i32.const 37
      i64.extend_i32_u
      i64.const 32
      i64.shl
      local.get 8
      i32.const 16
      i32.add
      i64.extend_i32_u
      i64.or
      i64.store offset=32
      i32.const 1048862
      local.get 8
      i32.const 32
      i32.add
      local.get 7
      call $_RNvNtCsgXGp5Oqx2Ny_4core9panicking9panic_fmt
      unreachable
    end
    local.get 8
    i32.const 35
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
    i32.const 37
    i64.extend_i32_u
    i64.const 32
    i64.shl
    local.get 8
    i32.const 16
    i32.add
    i64.extend_i32_u
    i64.or
    i64.store offset=32
    i32.const 1048807
    local.get 8
    i32.const 32
    i32.add
    local.get 7
    call $_RNvNtCsgXGp5Oqx2Ny_4core9panicking9panic_fmt
    unreachable)
  (func $_RNvNtCsgXGp5Oqx2Ny_4core9panicking5panic (type 6) (param i32 i32 i32)
    local.get 0
    local.get 1
    i32.const 1
    i32.shl
    i32.const 1
    i32.or
    local.get 2
    call $_RNvNtCsgXGp5Oqx2Ny_4core9panicking9panic_fmt
    unreachable)
  (func $_RNvNtNtCsgXGp5Oqx2Ny_4core5slice5index16slice_index_fail (type 10) (param i32 i32 i32 i32)
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
          i32.const 38
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
          i32.const 1048655
          local.get 4
          i32.const 16
          i32.add
          local.get 3
          call $_RNvNtCsgXGp5Oqx2Ny_4core9panicking9panic_fmt
          unreachable
        end
        local.get 4
        local.get 0
        i32.store offset=8
        local.get 4
        local.get 2
        i32.store offset=12
        local.get 4
        i32.const 38
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
        i32.const 1048695
        local.get 4
        i32.const 16
        i32.add
        local.get 3
        call $_RNvNtCsgXGp5Oqx2Ny_4core9panicking9panic_fmt
        unreachable
      end
      local.get 4
      local.get 1
      i32.store offset=8
      local.get 4
      local.get 2
      i32.store offset=12
      local.get 4
      i32.const 38
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
      i32.const 1048752
      local.get 4
      i32.const 16
      i32.add
      local.get 3
      call $_RNvNtCsgXGp5Oqx2Ny_4core9panicking9panic_fmt
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
    i32.const 1048752
    local.get 4
    i32.const 16
    i32.add
    local.get 3
    call $_RNvNtCsgXGp5Oqx2Ny_4core9panicking9panic_fmt
    unreachable)
  (func $_RNvNtCsgXGp5Oqx2Ny_4core9panicking9panic_fmt (type 6) (param i32 i32 i32)
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
    call $_RNvCsfLfy6EI15iL_7___rustc17rust_begin_unwind
    unreachable)
  (func $_RNvXs1i_NtCsgXGp5Oqx2Ny_4core3fmtReNtB6_7Display3fmtB8_ (type 0) (param i32 i32) (result i32)
    local.get 1
    local.get 0
    i32.load
    local.get 0
    i32.load offset=4
    call $_RNvMsa_NtCsgXGp5Oqx2Ny_4core3fmtNtB5_9Formatter3pad)
  (func $_RNvNtCsgXGp5Oqx2Ny_4core3fmt5write (type 7) (param i32 i32 i32 i32) (result i32)
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
  (func $_RNvNtNtCsgXGp5Oqx2Ny_4core3str8converts9from_utf8 (type 6) (param i32 i32 i32)
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
                                i32.load8_u offset=1052015
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
  (func $_RNvXs0_NtNtCsgXGp5Oqx2Ny_4core3fmt8buildersNtB5_10PadAdapterNtB7_5Write9write_str (type 3) (param i32 i32 i32) (result i32)
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
            i32.const 1052328
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
  (func $_RNvMs1_NtNtCsgXGp5Oqx2Ny_4core3fmt8buildersNtB5_11DebugStruct5field (type 16) (param i32 i32 i32 i32 i32) (result i32)
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
        i32.const 1051763
        i32.const 1051760
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
        i32.const 1051765
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
        i32.const 1051767
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
      i32.const 1051780
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
      call $_RNvXs0_NtNtCsgXGp5Oqx2Ny_4core3fmt8buildersNtB5_10PadAdapterNtB7_5Write9write_str
      br_if 0 (;@1;)
      local.get 5
      i32.const 1051765
      i32.const 2
      call $_RNvXs0_NtNtCsgXGp5Oqx2Ny_4core3fmt8buildersNtB5_10PadAdapterNtB7_5Write9write_str
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
      i32.const 1051770
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
  (func $_RNvMs3_NtNtCsgXGp5Oqx2Ny_4core3ffi5c_strNtB5_4CStr6to_str (type 6) (param i32 i32 i32)
    local.get 0
    local.get 1
    local.get 2
    i32.const -1
    i32.add
    call $_RNvNtNtCsgXGp5Oqx2Ny_4core3str8converts9from_utf8)
  (func $_RNvMsa_NtCsgXGp5Oqx2Ny_4core3fmtNtB5_9Formatter12pad_integral (type 17) (param i32 i32 i32 i32 i32 i32) (result i32)
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
          call $_RNvNtNtCsgXGp5Oqx2Ny_4core3str5count14do_count_chars
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
            call $_RNvNvMsa_NtCsgXGp5Oqx2Ny_4core3fmtNtB7_9Formatter12pad_integral12write_prefix
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
          call $_RNvNvMsa_NtCsgXGp5Oqx2Ny_4core3fmtNtB7_9Formatter12pad_integral12write_prefix
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
      call $_RNvNvMsa_NtCsgXGp5Oqx2Ny_4core3fmtNtB7_9Formatter12pad_integral12write_prefix
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
  (func $_RNvNtNtCsgXGp5Oqx2Ny_4core3str5count14do_count_chars (type 0) (param i32 i32) (result i32)
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
  (func $_RNvNvMsa_NtCsgXGp5Oqx2Ny_4core3fmtNtB7_9Formatter12pad_integral12write_prefix (type 16) (param i32 i32 i32 i32 i32) (result i32)
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
  (func $_RNvMsa_NtCsgXGp5Oqx2Ny_4core3fmtNtB5_9Formatter25debug_tuple_field1_finish (type 16) (param i32 i32 i32 i32 i32) (result i32)
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
          i32.const 1051772
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
        i32.const 1051773
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
        i32.const 1051780
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
        i32.const 1051770
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
        i32.const 1051777
        i32.const 1
        local.get 0
        i32.load offset=4
        i32.load offset=12
        call_indirect (type 3)
        br_if 1 (;@1;)
      end
      local.get 0
      i32.load
      i32.const 1051776
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
  (func $_RNvMsa_NtCsgXGp5Oqx2Ny_4core3fmtNtB5_9Formatter26debug_struct_field2_finish (type 18) (param i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32) (result i32)
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
    call $_RNvMs1_NtNtCsgXGp5Oqx2Ny_4core3fmt8buildersNtB5_11DebugStruct5field
    local.get 7
    local.get 8
    local.get 9
    local.get 10
    call $_RNvMs1_NtNtCsgXGp5Oqx2Ny_4core3fmt8buildersNtB5_11DebugStruct5field
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
        i32.const 1051778
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
      i32.const 1051775
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
  (func $_RNvMsa_NtCsgXGp5Oqx2Ny_4core3fmtNtB5_9Formatter3pad (type 3) (param i32 i32 i32) (result i32)
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
                  call $_RNvNtNtCsgXGp5Oqx2Ny_4core3str5count14do_count_chars
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
  (func $_RNvMsa_NtCsgXGp5Oqx2Ny_4core3fmtNtB5_9Formatter9write_str (type 3) (param i32 i32 i32) (result i32)
    local.get 0
    i32.load
    local.get 1
    local.get 2
    local.get 0
    i32.load offset=4
    i32.load offset=12
    call_indirect (type 3))
  (func $_RNvXs8_NtNtNtCsgXGp5Oqx2Ny_4core3fmt3num3impmNtB9_7Display3fmt (type 0) (param i32 i32) (result i32)
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
        i32.load16_u offset=1051815 align=1
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
        i32.load16_u offset=1051815 align=1
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
      i32.load16_u offset=1051815 align=1
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
      i32.load8_u offset=1051816
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
    call $_RNvMsa_NtCsgXGp5Oqx2Ny_4core3fmtNtB5_9Formatter12pad_integral
    local.set 3
    local.get 2
    i32.const 16
    i32.add
    global.set $__stack_pointer
    local.get 3)
  (func $_RNvNtCsgXGp5Oqx2Ny_4core4cell22panic_already_borrowed (type 1) (param i32)
    (local i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 1
    global.set $__stack_pointer
    local.get 1
    i32.const 39
    i64.extend_i32_u
    i64.const 32
    i64.shl
    local.get 1
    i32.const 15
    i32.add
    i64.extend_i32_u
    i64.or
    i64.store
    i32.const 1048945
    local.get 1
    local.get 0
    call $_RNvNtCsgXGp5Oqx2Ny_4core9panicking9panic_fmt
    unreachable)
  (func $_RNvXsr_NtCsgXGp5Oqx2Ny_4core4cellNtB5_14BorrowMutErrorNtNtB7_3fmt7Display3fmt (type 0) (param i32 i32) (result i32)
    local.get 1
    i32.const 1052359
    i32.const 24
    call $_RNvMsa_NtCsgXGp5Oqx2Ny_4core3fmtNtB5_9Formatter3pad)
  (func $_RNvNtCsgXGp5Oqx2Ny_4core6option13expect_failed (type 6) (param i32 i32 i32)
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
    i32.const 37
    i64.extend_i32_u
    i64.const 32
    i64.shl
    local.get 3
    i64.extend_i32_u
    i64.or
    i64.store offset=8
    i32.const 1048945
    local.get 3
    i32.const 8
    i32.add
    local.get 2
    call $_RNvNtCsgXGp5Oqx2Ny_4core9panicking9panic_fmt
    unreachable)
  (func $_RNvNtCsgXGp5Oqx2Ny_4core6result13unwrap_failed (type 8) (param i32 i32 i32 i32 i32)
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
    i32.const 35
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
    i32.const 37
    i64.extend_i32_u
    i64.const 32
    i64.shl
    local.get 5
    i64.extend_i32_u
    i64.or
    i64.store offset=16
    i32.const 1048941
    local.get 5
    i32.const 16
    i32.add
    local.get 4
    call $_RNvNtCsgXGp5Oqx2Ny_4core9panicking9panic_fmt
    unreachable)
  (func $_RNvXs1g_NtCsgXGp5Oqx2Ny_4core3fmtRDNtB6_5DebugEL_Bx_3fmtB8_ (type 0) (param i32 i32) (result i32)
    local.get 0
    i32.load
    local.get 1
    local.get 0
    i32.load offset=4
    i32.load offset=12
    call_indirect (type 0))
  (func $_RNvXs8_NtCsgXGp5Oqx2Ny_4core3fmtNtB5_9ArgumentsNtB5_7Display3fmt (type 0) (param i32 i32) (result i32)
    local.get 1
    i32.load
    local.get 1
    i32.load offset=4
    local.get 0
    i32.load
    local.get 0
    i32.load offset=4
    call $_RNvNtCsgXGp5Oqx2Ny_4core3fmt5write)
  (func $_RNvXs6_NtNtCsgXGp5Oqx2Ny_4core3fmt3numjNtB7_8LowerHex3fmt (type 0) (param i32 i32) (result i32)
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
      i32.load8_u offset=1051744
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
    i32.const 1052332
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
    call $_RNvMsa_NtCsgXGp5Oqx2Ny_4core3fmtNtB5_9Formatter12pad_integral
    local.set 0
    local.get 2
    i32.const 16
    i32.add
    global.set $__stack_pointer
    local.get 0)
  (func $_RNvNtNtCsgXGp5Oqx2Ny_4core9panicking11panic_const23panic_const_rem_by_zero (type 1) (param i32)
    i32.const 1052271
    i32.const 115
    local.get 0
    call $_RNvNtCsgXGp5Oqx2Ny_4core9panicking9panic_fmt
    unreachable)
  (func $_RNvXNtNtNtCsgXGp5Oqx2Ny_4core3fmt3num3imphNtB6_7Display3fmt (type 0) (param i32 i32) (result i32)
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
      i32.load16_u offset=1051815 align=1
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
      i32.load8_u offset=1051816
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
    call $_RNvMsa_NtCsgXGp5Oqx2Ny_4core3fmtNtB5_9Formatter12pad_integral
    local.set 3
    local.get 2
    i32.const 16
    i32.add
    global.set $__stack_pointer
    local.get 3)
  (func $_RNvXs0_NtNtCsgXGp5Oqx2Ny_4core3fmt8buildersNtB5_10PadAdapterNtB7_5Write10write_char (type 0) (param i32 i32) (result i32)
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
      i32.const 1052328
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
  (func $_RNvXsg_NtNtCsgXGp5Oqx2Ny_4core3fmt3numhNtB7_8UpperHex3fmt (type 0) (param i32 i32) (result i32)
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
      i32.const 1052334
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
    i32.const 1052332
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
    call $_RNvMsa_NtCsgXGp5Oqx2Ny_4core3fmtNtB5_9Formatter12pad_integral
    local.set 0
    local.get 2
    i32.const 16
    i32.add
    global.set $__stack_pointer
    local.get 0)
  (func $_RNvXs9_NtNtNtCsgXGp5Oqx2Ny_4core3fmt3num3implNtB9_7Display3fmt (type 0) (param i32 i32) (result i32)
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
        i32.load16_u offset=1051815 align=1
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
        i32.load16_u offset=1051815 align=1
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
      i32.load16_u offset=1051815 align=1
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
      i32.load8_u offset=1051816
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
    call $_RNvMsa_NtCsgXGp5Oqx2Ny_4core3fmtNtB5_9Formatter12pad_integral
    local.set 3
    local.get 2
    i32.const 16
    i32.add
    global.set $__stack_pointer
    local.get 3)
  (func $_RNvXse_NtNtCsgXGp5Oqx2Ny_4core3fmt3numhNtB7_8LowerHex3fmt (type 0) (param i32 i32) (result i32)
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
      i32.const 1051744
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
    i32.const 1052332
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
    call $_RNvMsa_NtCsgXGp5Oqx2Ny_4core3fmtNtB5_9Formatter12pad_integral
    local.set 0
    local.get 2
    i32.const 16
    i32.add
    global.set $__stack_pointer
    local.get 0)
  (func $_RNvXs8_NtNtCsgXGp5Oqx2Ny_4core3fmt3numjNtB7_8UpperHex3fmt (type 0) (param i32 i32) (result i32)
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
      i32.load8_u offset=1052334
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
    i32.const 1052332
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
    call $_RNvMsa_NtCsgXGp5Oqx2Ny_4core3fmtNtB5_9Formatter12pad_integral
    local.set 0
    local.get 2
    i32.const 16
    i32.add
    global.set $__stack_pointer
    local.get 0)
  (func $_RNvXsg_NtCsgXGp5Oqx2Ny_4core3fmtbNtB5_7Display3fmt (type 0) (param i32 i32) (result i32)
    block  ;; label = @1
      local.get 0
      i32.load8_u
      br_if 0 (;@1;)
      local.get 1
      i32.const 1052350
      i32.const 5
      call $_RNvMsa_NtCsgXGp5Oqx2Ny_4core3fmtNtB5_9Formatter3pad
      return
    end
    local.get 1
    i32.const 1052355
    i32.const 4
    call $_RNvMsa_NtCsgXGp5Oqx2Ny_4core3fmtNtB5_9Formatter3pad)
  (func $_RNvXsi_NtCsgXGp5Oqx2Ny_4core3fmteNtB5_7Display3fmt (type 3) (param i32 i32 i32) (result i32)
    local.get 2
    local.get 0
    local.get 1
    call $_RNvMsa_NtCsgXGp5Oqx2Ny_4core3fmtNtB5_9Formatter3pad)
  (func $_RNvYNtNtNtCsgXGp5Oqx2Ny_4core3fmt8builders10PadAdapterNtB6_5Write9write_fmtB8_ (type 3) (param i32 i32 i32) (result i32)
    local.get 0
    i32.const 1051780
    local.get 1
    local.get 2
    call $_RNvNtCsgXGp5Oqx2Ny_4core3fmt5write)
  (table (;0;) 43 43 funcref)
  (memory (;0;) 17)
  (global $__stack_pointer (mut i32) (i32.const 1048576))
  (global (;1;) i32 (i32.const 1053016))
  (global (;2;) i32 (i32.const 1053024))
  (export "memory" (memory 0))
  (export "subtract" (func $subtract))
  (export "calculator_add" (func $_ZN15libc_calculator10Calculator3add17h2f0459d1b92974d5E))
  (export "calculator_divide" (func $_ZN15libc_calculator10Calculator6divide17ha1be07073251faabE))
  (export "calculator_subtract" (func $_ZN15libc_calculator10Calculator8subtract17h7dc57159cd75c3ecE))
  (export "calculator_store" (func $_ZN15libc_calculator10Calculator5store17h9352561dcbc7f0e6E))
  (export "calculator_multiply" (func $_ZN15libc_calculator10Calculator8multiply17h1eebf12a251a49f7E))
  (export "multiply" (func $_ZN15libc_calculator10Calculator8multiply17h1eebf12a251a49f7E))
  (export "calculator_clear" (func $_ZN15libc_calculator10Calculator5clear17hb6c5ad0a6560b7a6E))
  (export "calculator_retrieve" (func $_ZN15libc_calculator10Calculator8retrieve17h941afbab10125b6aE))
  (export "malloc" (func $malloc))
  (export "free" (func $free))
  (export "__assert_fail" (func $__assert_fail))
  (export "strlen" (func $strlen))
  (export "abort" (func $abort))
  (export "abs" (func $abs))
  (export "atoi" (func $atoi))
  (export "calloc" (func $calloc))
  (export "isalpha" (func $isalpha))
  (export "isdigit" (func $isdigit))
  (export "isspace" (func $isspace))
  (export "isupper" (func $isupper))
  (export "itoa" (func $itoa))
  (export "memchr" (func $memchr))
  (export "qsort" (func $qsort))
  (export "raise" (func $raise))
  (export "realloc" (func $realloc))
  (export "signal" (func $signal))
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
  (elem (;0;) (i32.const 1) func $_RNvXs9_NtNtNtCsgXGp5Oqx2Ny_4core3fmt3num3implNtB9_7Display3fmt $_ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17h63d3179bc0f4f146E $_RNvXsZ_NtNtCsgXGp5Oqx2Ny_4core3fmt3numjNtB7_5Debug3fmt $_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h1f882f696f1c4b0dE $_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17ha8540d357d2a969eE $_RNvXs9_NtNtCsgXGp5Oqx2Ny_4core3str5errorNtB5_9Utf8ErrorNtNtB9_3fmt5Debug3fmt $_RNvXsd_NtNtCsgXGp5Oqx2Ny_4core5alloc6layoutNtB5_11LayoutErrorNtNtB9_3fmt5Debug3fmt $_RNvNtCsebHcaeoSrxy_3std5alloc24default_alloc_error_hook $_RNvXsq_NtCs5cOc02OMXlo_5alloc6stringNtB5_6StringNtNtCsgXGp5Oqx2Ny_4core3fmt7Display3fmt $_RNvXs1i_NtCsgXGp5Oqx2Ny_4core3fmtReNtB6_7Display3fmtCsebHcaeoSrxy_3std $_RNvXs7_NtNtCsebHcaeoSrxy_3std2io5errorNtB5_5ErrorNtNtCsgXGp5Oqx2Ny_4core3fmt7Display3fmt $_RINvNtCsgXGp5Oqx2Ny_4core3ptr13drop_in_placeINtNvNtCsebHcaeoSrxy_3std2io17default_write_fmt7AdapterINtNtBL_6cursor6CursorQShEEEBN_ $_RNvXNvNtCsebHcaeoSrxy_3std2io17default_write_fmtINtB2_7AdapterINtNtCs5cOc02OMXlo_5alloc3vec3VechEENtNtCsgXGp5Oqx2Ny_4core3fmt5Write9write_strB6_ $_RNvYINtNvNtCsebHcaeoSrxy_3std2io17default_write_fmt7AdapterINtNtCs5cOc02OMXlo_5alloc3vec3VechEENtNtCsgXGp5Oqx2Ny_4core3fmt5Write10write_charB9_ $_RNvYINtNvNtCsebHcaeoSrxy_3std2io17default_write_fmt7AdapterINtNtCs5cOc02OMXlo_5alloc3vec3VechEENtNtCsgXGp5Oqx2Ny_4core3fmt5Write9write_fmtB9_ $_RNvXNvNtCsebHcaeoSrxy_3std2io17default_write_fmtINtB2_7AdapterNtNtB4_5stdio10StderrLockENtNtCsgXGp5Oqx2Ny_4core3fmt5Write9write_strB6_ $_RNvYINtNvNtCsebHcaeoSrxy_3std2io17default_write_fmt7AdapterNtNtB7_5stdio10StderrLockENtNtCsgXGp5Oqx2Ny_4core3fmt5Write10write_charB9_ $_RNvYINtNvNtCsebHcaeoSrxy_3std2io17default_write_fmt7AdapterNtNtB7_5stdio10StderrLockENtNtCsgXGp5Oqx2Ny_4core3fmt5Write9write_fmtB9_ $_RNvXs1g_NtCsgXGp5Oqx2Ny_4core3fmtRbNtB6_5Debug3fmtCsebHcaeoSrxy_3std $_RINvNtCsgXGp5Oqx2Ny_4core3ptr13drop_in_placeNtNtCs5cOc02OMXlo_5alloc6string6StringECsebHcaeoSrxy_3std $_RNvXsZ_NtCs5cOc02OMXlo_5alloc6stringNtB5_6StringNtNtCsgXGp5Oqx2Ny_4core3fmt5Write9write_str $_RNvXsZ_NtCs5cOc02OMXlo_5alloc6stringNtB5_6StringNtNtCsgXGp5Oqx2Ny_4core3fmt5Write10write_char $_RNvYNtNtCs5cOc02OMXlo_5alloc6string6StringNtNtCsgXGp5Oqx2Ny_4core3fmt5Write9write_fmtCsebHcaeoSrxy_3std $_RNvXs2_NvNtCsebHcaeoSrxy_3std9panicking13panic_handlerNtB5_16StaticStrPayloadNtNtCsgXGp5Oqx2Ny_4core3fmt7Display3fmt $_RNvXs1_NvNtCsebHcaeoSrxy_3std9panicking13panic_handlerNtB5_16StaticStrPayloadNtNtCsgXGp5Oqx2Ny_4core5panic12PanicPayload8take_box $_RNvXs1_NvNtCsebHcaeoSrxy_3std9panicking13panic_handlerNtB5_16StaticStrPayloadNtNtCsgXGp5Oqx2Ny_4core5panic12PanicPayload3get $_RNvXs1_NvNtCsebHcaeoSrxy_3std9panicking13panic_handlerNtB5_16StaticStrPayloadNtNtCsgXGp5Oqx2Ny_4core5panic12PanicPayload6as_str $_RINvNtCsgXGp5Oqx2Ny_4core3ptr13drop_in_placeNtNvNtCsebHcaeoSrxy_3std9panicking13panic_handler19FormatStringPayloadEBM_ $_RNvXs0_NvNtCsebHcaeoSrxy_3std9panicking13panic_handlerNtB5_19FormatStringPayloadNtNtCsgXGp5Oqx2Ny_4core3fmt7Display3fmt $_RNvXs_NvNtCsebHcaeoSrxy_3std9panicking13panic_handlerNtB4_19FormatStringPayloadNtNtCsgXGp5Oqx2Ny_4core5panic12PanicPayload8take_box $_RNvXs_NvNtCsebHcaeoSrxy_3std9panicking13panic_handlerNtB4_19FormatStringPayloadNtNtCsgXGp5Oqx2Ny_4core5panic12PanicPayload3get $_RNvYINtNvNtCsebHcaeoSrxy_3std9panicking11begin_panic7PayloadReENtNtCsgXGp5Oqx2Ny_4core5panic12PanicPayload6as_strB9_ $_RNvXNtCsgXGp5Oqx2Ny_4core3anyReNtB2_3Any7type_idCsebHcaeoSrxy_3std $_RNvXNtCsgXGp5Oqx2Ny_4core3anyNtNtCs5cOc02OMXlo_5alloc6string6StringNtB2_3Any7type_idCsebHcaeoSrxy_3std $_RNvXs1g_NtCsgXGp5Oqx2Ny_4core3fmtRDNtB6_5DebugEL_Bx_3fmtB8_ $_RNvXs8_NtCsgXGp5Oqx2Ny_4core3fmtNtB5_9ArgumentsNtB5_7Display3fmt $_RNvXs1i_NtCsgXGp5Oqx2Ny_4core3fmtReNtB6_7Display3fmtB8_ $_RNvXs8_NtNtNtCsgXGp5Oqx2Ny_4core3fmt3num3impmNtB9_7Display3fmt $_RNvXsr_NtCsgXGp5Oqx2Ny_4core4cellNtB5_14BorrowMutErrorNtNtB7_3fmt7Display3fmt $_RNvXs0_NtNtCsgXGp5Oqx2Ny_4core3fmt8buildersNtB5_10PadAdapterNtB7_5Write9write_str $_RNvXs0_NtNtCsgXGp5Oqx2Ny_4core3fmt8buildersNtB5_10PadAdapterNtB7_5Write10write_char $_RNvYNtNtNtCsgXGp5Oqx2Ny_4core3fmt8builders10PadAdapterNtB6_5Write9write_fmtB8_)
  (data $.rodata (i32.const 1048576) "\00\00\00\00\04\00\00\00\04\00\00\00\03\00\00\00\00\00\00\00\04\00\00\00\04\00\00\00\04\00\00\00Utf8Errorvalid_up_toerror_lenLayoutErrorAborted\16slice index starts at \c0\0d but ends at \c0\00\12range start index \c0\22 out of range for slice of length \c0\00\10range end index \c0\22 out of range for slice of length \c0\00\10assertion `left \c0\17 right` failed\0a  left: \c0\09\0a right: \c0\00\10assertion `left \c0\10 right` failed: \c0\09\0a  left: \c0\09\0a right: \c0\00\13failed printing to \c0\02: \c0\00/rustc/59807616e1fa2540724bfbac14d7976d7e4a3860/library/std/src/sys/sync/mutex/no_threads.rs\00/rustc/59807616e1fa2540724bfbac14d7976d7e4a3860/library/std/src/io/stdio.rs\003rd-party/wasm32-libc/src/ffi/signal.rs\00/rustc/59807616e1fa2540724bfbac14d7976d7e4a3860/library/std/src/sync/reentrant_lock.rs\00/rustc/59807616e1fa2540724bfbac14d7976d7e4a3860/library/std/src/io/mod.rs\00/rustc/59807616e1fa2540724bfbac14d7976d7e4a3860/library/alloc/src/raw_vec/mod.rs\00/rustc/59807616e1fa2540724bfbac14d7976d7e4a3860/library/std/src/thread/id.rs\00/rust/deps/dlmalloc-0.2.11/src/dlmalloc.rs\003rd-party/wasm32-libc/src/ffi/malloc.rs\003rd-party/wasm32-libc/src/lib.rs\003rd-party/wasm32-libc/src/ffi/itoa.rs\00\c0\0b (os error \c0\01)\00\12Assertion failed: \c0\02 (\c0\02, \c0\01:\c0\02)\0a\00\00\00\00\1c\02\10\00'\00\00\00!\00\00\00\05\00\00\00None\00\00\00\00\04\00\00\00\04\00\00\00\05\00\00\00Some\00\00\00\00\08\00\00\00\04\00\00\00\06\00\00\00called `Result::unwrap()` on an `Err` value\00\d6\03\10\00 \00\00\00\18\00\00\00&\00\00\00\d6\03\10\00 \00\00\00\15\00\00\00\1e\00\00\00\d6\03\10\00 \00\00\00\12\00\00\00(\00\00\00\00\00\00\00\00\00\00\00\01\00\00\00\07\00\00\00\ae\03\10\00'\00\00\00\1b\00\00\00[\00\00\00\ae\03\10\00'\00\00\00>\00\00\00Y\00\00\00\ae\03\10\00'\00\00\00\0d\00\00\00U\00\00\00\ae\03\10\00'\00\00\00.\00\00\00T\00\00\00\f7\03\10\00%\00\00\00\1f\00\00\00\19\00\00\00\f7\03\10\00%\00\00\001\00\00\00\15\00\00\00a formatting trait implementation returned an error when the underlying stream did not\00\00\9b\02\10\00I\00\00\00\88\02\00\00\11\00\00\00\0c\00\00\00\0c\00\00\00\04\00\00\00\0d\00\00\00\0e\00\00\00\0f\00\00\00\0c\00\00\00\0c\00\00\00\04\00\00\00\10\00\00\00\11\00\00\00\12\00\00\00\00\00\00\00\04\00\00\00\04\00\00\00\13\00\00\00\d0\01\10\00K\00\00\00\8d\04\00\00\09\00\00\00\14\00\00\00\0c\00\00\00\04\00\00\00\15\00\00\00\16\00\00\00\17\00\00\00\00\00\00\00\08\00\00\00\04\00\00\00\18\00\00\00\19\00\00\00\1a\00\00\00\1b\00\00\00\1c\00\00\00\10\00\00\00\04\00\00\00\1d\00\00\00\1e\00\00\00\1f\00\00\00 \00\00\00m]\cb\d6,P\ebcxA\a6Wq\1b\8b\b9\15\a2\5cU4U\07\d4Sx\ad\81Q\f0\a3\f7assertion failed: psize >= size + min_overhead\00\00\83\03\10\00*\00\00\00\b1\04\00\00\09\00\00\00assertion failed: psize <= size + max_overhead\00\00\83\03\10\00*\00\00\00\b7\04\00\00\0d\00\00\00entity not foundpermission deniedconnection refusedconnection resethost unreachablenetwork unreachableconnection abortednot connectedaddress in useaddress not availablenetwork downbroken pipeentity already existsoperation would blocknot a directoryis a directorydirectory not emptyread-only filesystem or storage mediumfilesystem loop or indirection limit (e.g. symlink loop)stale network file handleinvalid input parameterinvalid datatimed outwrite zerono storage spaceseek on unseekable filequota exceededfile too largeresource busyexecutable file busydeadlockcross-device link or renametoo many linksinvalid filenameargument list too longoperation interruptedunsupportedunexpected end of fileout of memoryin progressother erroruncategorized errorcannot recursively acquire mutex\00\00\00s\01\10\00\5c\00\00\00\13\00\00\00\09\00\00\00lock count overflow in reentrant mutex\00\00D\02\10\00V\00\00\00#\01\00\00-\00\00\00\00stderroperation successfulfailed to generate unique thread ID: bitspace exhausted\00\006\03\10\00L\00\00\00&\00\00\00\0d\00\00\00\00\00\00\00\08\00\00\00\04\00\00\00!\00\00\00\14\00\00\00\0c\00\00\00\04\00\00\00\22\00\00\00\d0\01\10\00K\00\00\00D\04\00\00\14\00\00\00\10\00\00\00\11\00\00\00\12\00\00\00\10\00\00\00\10\00\00\00\13\00\00\00\12\00\00\00\0d\00\00\00\0e\00\00\00\15\00\00\00\0c\00\00\00\0b\00\00\00\15\00\00\00\15\00\00\00\0f\00\00\00\0e\00\00\00\13\00\00\00&\00\00\008\00\00\00\19\00\00\00\17\00\00\00\0c\00\00\00\09\00\00\00\0a\00\00\00\10\00\00\00\17\00\00\00\0e\00\00\00\0e\00\00\00\0d\00\00\00\14\00\00\00\08\00\00\00\1b\00\00\00\0e\00\00\00\10\00\00\00\16\00\00\00\15\00\00\00\0b\00\00\00\16\00\00\00\0d\00\00\00\0b\00\00\00\0b\00\00\00\13\00\00\00\00\07\10\00\10\07\10\00!\07\10\003\07\10\00C\07\10\00S\07\10\00f\07\10\00x\07\10\00\85\07\10\00\93\07\10\00\a8\07\10\00\b4\07\10\00\bf\07\10\00\d4\07\10\00\e9\07\10\00\f8\07\10\00\06\08\10\00\19\08\10\00?\08\10\00w\08\10\00\90\08\10\00\a7\08\10\00\b3\08\10\00\bc\08\10\00\c6\08\10\00\d6\08\10\00\ed\08\10\00\fb\08\10\00\09\09\10\00\16\09\10\00*\09\10\002\09\10\00M\09\10\00[\09\10\00k\09\10\00\81\09\10\00\96\09\10\00\a1\09\10\00\b7\09\10\00\c4\09\10\00\cf\09\10\00\da\09\10\00capacity overflow\00\00\00\e5\02\10\00P\00\00\00\1c\00\00\00\05\00\00\000123456789abcdef { , :  {\0a,\0a((\0a}), }\00\00\00\00\0c\00\00\00\04\00\00\00(\00\00\00)\00\00\00*\00\00\00==!=matches00010203040506070809101112131415161718192021222324252627282930313233343536373839404142434445464748495051525354555657585960616263646566676869707172737475767778798081828384858687888990919293949596979899\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\03\03\03\03\03\03\03\03\03\03\03\03\03\03\03\03\04\04\04\04\04\00\00\00\00\00\00\00\00\00\00\00attempt to calculate the remainder with a divisor of zero    0x0123456789ABCDEFfalsetrueRefCell already borrowed\00\9c\0c\10\00\9e\0c\10\00\a0\0c\10\00\02\00\00\00\02\00\00\00\07\00\00\00"))
