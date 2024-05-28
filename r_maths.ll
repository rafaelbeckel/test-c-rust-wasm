; ModuleID = 'maths.815d0bd3a64ad952-cgu.0'
source_filename = "maths.815d0bd3a64ad952-cgu.0"
target datalayout = "e-m:e-p:32:32-p10:8:8-p20:8:8-i64:64-n32:64-S128-ni:1:10:20"
target triple = "wasm32-unknown-unknown"

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef i32 @subtract(i32 noundef %left, i32 noundef %right) unnamed_addr #0 {
start:
  %_0.sroa.0.0 = tail call i32 @llvm.usub.sat.i32(i32 %left, i32 %right)
  ret i32 %_0.sroa.0.0
}

; Function Attrs: nounwind
define dso_local noundef i32 @multiply(i32 noundef %left, i32 noundef %right) unnamed_addr #1 {
start:
  %_63.not = icmp eq i32 %right, 0
  br i1 %_63.not, label %bb5, label %bb3

bb5:                                              ; preds = %bb3, %start
  %result.sroa.0.0.lcssa = phi i32 [ 0, %start ], [ %_4, %bb3 ]
  ret i32 %result.sroa.0.0.lcssa

bb3:                                              ; preds = %start, %bb3
  %result.sroa.0.05 = phi i32 [ %_4, %bb3 ], [ 0, %start ]
  %iter.sroa.0.04 = phi i32 [ %_0.i, %bb3 ], [ 0, %start ]
  %_0.i = add nuw i32 %iter.sroa.0.04, 1
  %_4 = tail call noundef i32 @add(i32 noundef %result.sroa.0.05, i32 noundef %left) #3
  %exitcond.not = icmp eq i32 %_0.i, %right
  br i1 %exitcond.not, label %bb5, label %bb3
}

; Function Attrs: nounwind
declare dso_local noundef i32 @add(i32 noundef, i32 noundef) unnamed_addr #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.usub.sat.i32(i32, i32) #2

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(none) "target-cpu"="generic" }
attributes #1 = { nounwind "target-cpu"="generic" }
attributes #2 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #3 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"rustc version 1.80.0-nightly (791adf759 2024-05-21)"}
