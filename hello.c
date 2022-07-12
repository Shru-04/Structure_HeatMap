#include<stdio.h>  
#include <string.h>    
struct employee      
{   int id;      
    char name[50];      
    float salary;      
}e1,e2;  //declaring e1 and e2 variables for structure   
struct addr      
{   int id2;      
    int name2[50];      
    float salary2;      
}x;
void foo(){
   e1.id = 1;
}
int main( )    
{    struct employee a;
   a.id=10;
   //strcpy(a.name,"shreyas");
   a.salary=100.0;
   //store first employee information    
   e1.id=101;    
   strcpy(e1.name, "Sonoo Jaiswal");//copying string into char array    
   a.salary=56000;    
   int xx =  strlen(e1.name);
  //store second employee information    
   e2.id=102;    
   //strcpy(e2.name, "James Bond");    
   e2.salary=126000;    
   x.id2=11;
   for (x.id2=10;x.id2<100;x.id2++);
   //printing first employee information    
   printf( "employee 1 id : %d\n", e1.id);    
   printf( "employee 1 name : %s\n", e1.name);    
   printf( "employee 1 salary : %f\n", e1.salary);    
    x.name2[5] = 23;
   //printing second employee information    
   printf( "employee 2 id : %d\n", e2.id);    
   printf( "employee 2 name : %s\n", e2.name);    
   printf( "employee 2 salary : %f\n", e2.salary);   
   printf( "employee 3 id : %d\n", a.id);    
   printf( "employee 3 name : %s\n", a.name);    
   printf( "employee 3 salary : %f\n", a.salary);
   foo();
   foo();   
   // foo();
   // foo();
   // foo();
   // foo();

   return 0;    
}    