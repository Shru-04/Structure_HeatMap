; ModuleID = 'hello.c'
source_filename = "hello.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.employee = type { i32, [50 x i8], float }
%struct.addr = type { i32, [50 x i8], float }

@e1 = dso_local global %struct.employee zeroinitializer, align 4
@.str = private unnamed_addr constant [8 x i8] c"shreyas\00", align 1
@.str.1 = private unnamed_addr constant [14 x i8] c"Sonoo Jaiswal\00", align 1
@e2 = dso_local global %struct.employee zeroinitializer, align 4
@.str.2 = private unnamed_addr constant [11 x i8] c"James Bond\00", align 1
@x = dso_local global %struct.addr zeroinitializer, align 4
@.str.3 = private unnamed_addr constant [20 x i8] c"employee 1 id : %d\0A\00", align 1
@.str.4 = private unnamed_addr constant [22 x i8] c"employee 1 name : %s\0A\00", align 1
@.str.5 = private unnamed_addr constant [24 x i8] c"employee 1 salary : %f\0A\00", align 1
@.str.6 = private unnamed_addr constant [20 x i8] c"employee 2 id : %d\0A\00", align 1
@.str.7 = private unnamed_addr constant [22 x i8] c"employee 2 name : %s\0A\00", align 1
@.str.8 = private unnamed_addr constant [24 x i8] c"employee 2 salary : %f\0A\00", align 1
@.str.9 = private unnamed_addr constant [20 x i8] c"employee 3 id : %d\0A\00", align 1
@.str.10 = private unnamed_addr constant [22 x i8] c"employee 3 name : %s\0A\00", align 1
@.str.11 = private unnamed_addr constant [24 x i8] c"employee 3 salary : %f\0A\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @foo() #0 {
  store i32 1, i32* getelementptr inbounds (%struct.employee, %struct.employee* @e1, i32 0, i32 0), align 4
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca %struct.employee, align 4
  store i32 0, i32* %1, align 4
  %3 = getelementptr inbounds %struct.employee, %struct.employee* %2, i32 0, i32 0
  store i32 10, i32* %3, align 4
  %4 = getelementptr inbounds %struct.employee, %struct.employee* %2, i32 0, i32 1
  %5 = getelementptr inbounds [50 x i8], [50 x i8]* %4, i64 0, i64 0
  %6 = call i8* @strcpy(i8* %5, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str, i64 0, i64 0)) #3
  %7 = getelementptr inbounds %struct.employee, %struct.employee* %2, i32 0, i32 2
  store float 1.000000e+02, float* %7, align 4
  store i32 101, i32* getelementptr inbounds (%struct.employee, %struct.employee* @e1, i32 0, i32 0), align 4
  %8 = call i8* @strcpy(i8* getelementptr inbounds (%struct.employee, %struct.employee* @e1, i32 0, i32 1, i64 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.1, i64 0, i64 0)) #3
  store float 5.600000e+04, float* getelementptr inbounds (%struct.employee, %struct.employee* @e1, i32 0, i32 2), align 4
  store i32 102, i32* getelementptr inbounds (%struct.employee, %struct.employee* @e2, i32 0, i32 0), align 4
  %9 = call i8* @strcpy(i8* getelementptr inbounds (%struct.employee, %struct.employee* @e2, i32 0, i32 1, i64 0), i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.2, i64 0, i64 0)) #3
  store float 1.260000e+05, float* getelementptr inbounds (%struct.employee, %struct.employee* @e2, i32 0, i32 2), align 4
  store i32 11, i32* getelementptr inbounds (%struct.addr, %struct.addr* @x, i32 0, i32 0), align 4
  %10 = load i32, i32* getelementptr inbounds (%struct.employee, %struct.employee* @e1, i32 0, i32 0), align 4
  %11 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.3, i64 0, i64 0), i32 %10)
  %12 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.4, i64 0, i64 0), i8* getelementptr inbounds (%struct.employee, %struct.employee* @e1, i32 0, i32 1, i64 0))
  %13 = load float, float* getelementptr inbounds (%struct.employee, %struct.employee* @e1, i32 0, i32 2), align 4
  %14 = fpext float %13 to double
  %15 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.5, i64 0, i64 0), double %14)
  %16 = load i32, i32* getelementptr inbounds (%struct.employee, %struct.employee* @e2, i32 0, i32 0), align 4
  %17 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.6, i64 0, i64 0), i32 %16)
  %18 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.7, i64 0, i64 0), i8* getelementptr inbounds (%struct.employee, %struct.employee* @e2, i32 0, i32 1, i64 0))
  %19 = load float, float* getelementptr inbounds (%struct.employee, %struct.employee* @e2, i32 0, i32 2), align 4
  %20 = fpext float %19 to double
  %21 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.8, i64 0, i64 0), double %20)
  %22 = getelementptr inbounds %struct.employee, %struct.employee* %2, i32 0, i32 0
  %23 = load i32, i32* %22, align 4
  %24 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.9, i64 0, i64 0), i32 %23)
  %25 = getelementptr inbounds %struct.employee, %struct.employee* %2, i32 0, i32 1
  %26 = getelementptr inbounds [50 x i8], [50 x i8]* %25, i64 0, i64 0
  %27 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.10, i64 0, i64 0), i8* %26)
  %28 = getelementptr inbounds %struct.employee, %struct.employee* %2, i32 0, i32 2
  %29 = load float, float* %28, align 4
  %30 = fpext float %29 to double
  %31 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.11, i64 0, i64 0), double %30)
  call void @foo()
  call void @foo()
  ret i32 0
}

; Function Attrs: nounwind
declare dso_local i8* @strcpy(i8*, i8*) #1

declare dso_local i32 @printf(i8*, ...) #2

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind }

!llvm.module.flags = !{!0, !1, !2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"uwtable", i32 1}
!2 = !{i32 7, !"frame-pointer", i32 2}
!3 = !{!"Debian clang version 13.0.1-+rc1-1~exp4"}
