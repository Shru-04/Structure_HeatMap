; ModuleID = 'test.c'
source_filename = "test.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.employee = type { i32, [50 x i8], float }
%struct.addr = type { i32, [20 x i8] }

@e1 = dso_local global %struct.employee zeroinitializer, align 4
@.str = private unnamed_addr constant [8 x i8] c"shreyas\00", align 1
@x = dso_local global %struct.addr zeroinitializer, align 4
@.str.1 = private unnamed_addr constant [7 x i8] c"hunsur\00", align 1
@.str.2 = private unnamed_addr constant [20 x i8] c"employee 1 id : %d\0A\00", align 1
@.str.3 = private unnamed_addr constant [24 x i8] c"employee 1 salary : %f\0A\00", align 1
@.str.4 = private unnamed_addr constant [11 x i8] c"district :\00", align 1
@.str.5 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@e2 = dso_local global %struct.employee zeroinitializer, align 4

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @foo() #0 {
  store i32 1, i32* getelementptr inbounds (%struct.employee, %struct.employee* @e1, i32 0, i32 0), align 4
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca %struct.employee, align 4
  %3 = alloca i32, align 4
  store i32 0, i32* %1, align 4
  store i32 10, i32* %3, align 4
  br label %4

4:                                                ; preds = %12, %0
  %5 = load i32, i32* %3, align 4
  %6 = icmp slt i32 %5, 200
  br i1 %6, label %7, label %15

7:                                                ; preds = %4
  %8 = getelementptr inbounds %struct.employee, %struct.employee* %2, i32 0, i32 0
  store i32 12, i32* %8, align 4
  %9 = getelementptr inbounds %struct.employee, %struct.employee* %2, i32 0, i32 0
  store i32 123, i32* %9, align 4
  %10 = load i32, i32* getelementptr inbounds (%struct.employee, %struct.employee* @e1, i32 0, i32 0), align 4
  %11 = add nsw i32 %10, 1
  store i32 %11, i32* getelementptr inbounds (%struct.employee, %struct.employee* @e1, i32 0, i32 0), align 4
  br label %12

12:                                               ; preds = %7
  %13 = load i32, i32* %3, align 4
  %14 = add nsw i32 %13, 1
  store i32 %14, i32* %3, align 4
  br label %4, !llvm.loop !4

15:                                               ; preds = %4
  %16 = getelementptr inbounds %struct.employee, %struct.employee* %2, i32 0, i32 1
  %17 = getelementptr inbounds [50 x i8], [50 x i8]* %16, i64 0, i64 0
  %18 = call i8* @strcpy(i8* %17, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str, i64 0, i64 0)) #3
  %19 = call i8* @strcpy(i8* getelementptr inbounds (%struct.addr, %struct.addr* @x, i32 0, i32 1, i64 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.1, i64 0, i64 0)) #3
  store i8 115, i8* getelementptr inbounds (%struct.addr, %struct.addr* @x, i32 0, i32 1, i64 0), align 4
  %20 = load i32, i32* getelementptr inbounds (%struct.employee, %struct.employee* @e1, i32 0, i32 0), align 4
  %21 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.2, i64 0, i64 0), i32 %20)
  %22 = load float, float* getelementptr inbounds (%struct.employee, %struct.employee* @e1, i32 0, i32 2), align 4
  %23 = fpext float %22 to double
  %24 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.3, i64 0, i64 0), double %23)
  %25 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.4, i64 0, i64 0))
  %26 = call i32 @puts(i8* getelementptr inbounds (%struct.addr, %struct.addr* @x, i32 0, i32 1, i64 0))
  %27 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.5, i64 0, i64 0))
  call void @foo()
  ret i32 0
}

; Function Attrs: nounwind
declare dso_local i8* @strcpy(i8*, i8*) #1

declare dso_local i32 @printf(i8*, ...) #2

declare dso_local i32 @puts(i8*) #2

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind }

!llvm.module.flags = !{!0, !1, !2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"uwtable", i32 1}
!2 = !{i32 7, !"frame-pointer", i32 2}
!3 = !{!"Debian clang version 13.0.0-9+b2"}
!4 = distinct !{!4, !5}
!5 = !{!"llvm.loop.mustprogress"}
