#include <stdio.h>  
#include <string.h>    
struct employee      
{   int id;      
    char name[50];      
    float salary;      
}e1,e2;  //declaring e1 and e2 variables for structure   
struct addr      
{
    int num;
    char district[20];    
}x;
void foo(){
   e1.id = 1;
}
int main( )    
{    struct employee a;
   for (int i =10;i < 200; i++){
        a.id=12;
        a.id=123;
        e1.id = e1.id +  1;
   }
   strcpy(a.name,"shreyas");
   strcpy(x.district,"hunsur");
   x.district[0] = 's';
   printf( "employee 1 id : %d\n", e1.id);    
   printf( "employee 1 salary : %f\n", e1.salary);
   printf("district :");
   puts(x.district);
   printf("\n");
   foo();
   return 0;
}