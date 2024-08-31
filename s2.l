%option noyywrap                                                                                                                                      
%{
#include<stdio.h>
int v = 0;
                                                                                                                                                      
void print_counts();
%}
%%
end return 0;
[a-zA-Z0-9._]+"@gmail.com"|"@yahoo.com"|"@outlook.com"+$ v=1;
.;
%%
                                                                                                                                                      
int main()
{                                                                                                                                                     
printf("Enter text:");
                                                                                                                                                      
yylex();                                                                                                                                              
print_counts();                                                                                                                                       
return 0;}
                                                                                                                                                      
void print_counts(){
        if(v==1)
                printf("Valid");
        else
                printf("Invalid");                                                                                                                    

}
