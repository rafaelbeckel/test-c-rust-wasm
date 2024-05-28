; ModuleID = 'subtract.a598c73c53bab3b5-cgu.0'
source_filename = "subtract.a598c73c53bab3b5-cgu.0"
target datalayout = "e-m:e-p:32:32-p10:8:8-p20:8:8-i64:64-n32:64-S128-ni:1:10:20"
target triple = "wasm32-unknown-unknown"

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef i32 @subtract(i32 noundef %left, i32 noundef %right) unnamed_addr #0 {
start:
  %_0.sroa.0.0 = tail call i32 @llvm.usub.sat.i32(i32 %left, i32 %right)
  ret i32 %_0.sroa.0.0
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.usub.sat.i32(i32, i32) #1

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(none) "target-cpu"="generic" }
attributes #1 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }

!llvm.ident = !{!0}

!0 = !{!"rustc version 1.80.0-nightly (791adf759 2024-05-21)"}
