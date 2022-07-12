; ModuleID = 'hello.c'
source_filename = "hello.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.employee = type { i32, [50 x i8], float }
%struct.addr = type { i32, [50 x i8], float }

@e1 = dso_local global %struct.employee zeroinitializer, align 4
@.str = private unnamed_addr constant [14 x i8] c"Sonoo Jaiswal\00", align 1
@e2 = dso_local global %struct.employee zeroinitializer, align 4
@x = dso_local global %struct.addr zeroinitializer, align 4
@.str.1 = private unnamed_addr constant [20 x i8] c"employee 1 id : %d\0A\00", align 1
@.str.2 = private unnamed_addr constant [22 x i8] c"employee 1 name : %s\0A\00", align 1
@.str.3 = private unnamed_addr constant [24 x i8] c"employee 1 salary : %f\0A\00", align 1
@.str.4 = private unnamed_addr constant [20 x i8] c"employee 2 id : %d\0A\00", align 1
@.str.5 = private unnamed_addr constant [22 x i8] c"employee 2 name : %s\0A\00", align 1
@.str.6 = private unnamed_addr constant [24 x i8] c"employee 2 salary : %f\0A\00", align 1
@.str.7 = private unnamed_addr constant [20 x i8] c"employee 3 id : %d\0A\00", align 1
@.str.8 = private unnamed_addr constant [22 x i8] c"employee 3 name : %s\0A\00", align 1
@.str.9 = private unnamed_addr constant [24 x i8] c"employee 3 salary : %f\0A\00", align 1

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
  %4 = getelementptr inbounds %struct.employee, %struct.employee* %2, i32 0, i32 0
  store i32 10, i32* %4, align 4
  %5 = getelementptr inbounds %struct.employee, %struct.employee* %2, i32 0, i32 2
  store float 1.000000e+02, float* %5, align 4
  store i32 101, i32* getelementptr inbounds (%struct.employee, %struct.employee* @e1, i32 0, i32 0), align 4
  %6 = call i8* @strcpy(i8* getelementptr inbounds (%struct.employee, %struct.employee* @e1, i32 0, i32 1, i64 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str, i64 0, i64 0)) #4
  %7 = getelementptr inbounds %struct.employee, %struct.employee* %2, i32 0, i32 2
  store float 5.600000e+04, float* %7, align 4
  %8 = call i64 @strlen(i8* getelementptr inbounds (%struct.employee, %struct.employee* @e1, i32 0, i32 1, i64 0)) #5
  %9 = trunc i64 %8 to i32
  store i32 %9, i32* %3, align 4
  store i32 102, i32* getelementptr inbounds (%struct.employee, %struct.employee* @e2, i32 0, i32 0), align 4
  store float 1.260000e+05, float* getelementptr inbounds (%struct.employee, %struct.employee* @e2, i32 0, i32 2), align 4
  store i32 11, i32* getelementptr inbounds (%struct.addr, %struct.addr* @x, i32 0, i32 0), align 4
  store i32 10, i32* getelementptr inbounds (%struct.addr, %struct.addr* @x, i32 0, i32 0), align 4
  br label %10

10:                                               ; preds = %14, %0
  %11 = load i32, i32* getelementptr inbounds (%struct.addr, %struct.addr* @x, i32 0, i32 0), align 4
  %12 = icmp slt i32 %11, 100
  br i1 %12, label %13, label %17

13:                                               ; preds = %10
  br label %14

14:                                               ; preds = %13
  %15 = load i32, i32* getelementptr inbounds (%struct.addr, %struct.addr* @x, i32 0, i32 0), align 4
  %16 = add nsw i32 %15, 1
  store i32 %16, i32* getelementptr inbounds (%struct.addr, %struct.addr* @x, i32 0, i32 0), align 4
  br label %10, !llvm.loop !4

17:                                               ; preds = %10
  %18 = load i32, i32* getelementptr inbounds (%struct.employee, %struct.employee* @e1, i32 0, i32 0), align 4
  %19 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.1, i64 0, i64 0), i32 %18)
  %20 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds (%struct.employee, %struct.employee* @e1, i32 0, i32 1, i64 0))
  %21 = load float, float* getelementptr inbounds (%struct.employee, %struct.employee* @e1, i32 0, i32 2), align 4
  %22 = fpext float %21 to double
  %23 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.3, i64 0, i64 0), double %22)
  %24 = load i32, i32* getelementptr inbounds (%struct.employee, %struct.employee* @e2, i32 0, i32 0), align 4
  %25 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.4, i64 0, i64 0), i32 %24)
  %26 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.5, i64 0, i64 0), i8* getelementptr inbounds (%struct.employee, %struct.employee* @e2, i32 0, i32 1, i64 0))
  %27 = load float, float* getelementptr inbounds (%struct.employee, %struct.employee* @e2, i32 0, i32 2), align 4
  %28 = fpext float %27 to double
  %29 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.6, i64 0, i64 0), double %28)
  %30 = getelementptr inbounds %struct.employee, %struct.employee* %2, i32 0, i32 0
  %31 = load i32, i32* %30, align 4
  %32 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.7, i64 0, i64 0), i32 %31)
  %33 = getelementptr inbounds %struct.employee, %struct.employee* %2, i32 0, i32 1
  %34 = getelementptr inbounds [50 x i8], [50 x i8]* %33, i64 0, i64 0
  %35 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.8, i64 0, i64 0), i8* %34)
  %36 = getelementptr inbounds %struct.employee, %struct.employee* %2, i32 0, i32 2
  %37 = load float, float* %36, align 4
  %38 = fpext float %37 to double
  %39 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.9, i64 0, i64 0), double %38)
  call void @foo()
  call void @foo()
  ret i32 0
}

; Function Attrs: nounwind
declare dso_local i8* @strcpy(i8*, i8*) #1

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #2

declare dso_local i32 @printf(i8*, ...) #3

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }
attributes #5 = { nounwind readonly willreturn }

!llvm.module.flags = !{!0, !1, !2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"uwtable", i32 1}
!2 = !{i32 7, !"frame-pointer", i32 2}
!3 = !{!"Debian clang version 13.0.0-9+b2"}
!4 = distinct !{!4, !5}
!5 = !{!"llvm.loop.mustprogress"}
