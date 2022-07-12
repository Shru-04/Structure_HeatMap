#include <stdio.h>  
#include <string.h>    
struct employee      
{   int id;      
    char name[50];      
    float salary;      
}e1,e2;  //declaring e1 and e2 variables for structure   
struct addr      
{   int id2;      
    char name2[50];      
    float *salary2;      
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
   e2.salary = 10000;
   strcpy(e1.name,"fgdg");
   printf("%s",e1.name);
   *(x.salary2) =2;
   return 0;
}