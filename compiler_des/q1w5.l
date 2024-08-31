%{                                                                                                                                                     
#include <stdio.h>                                                                                                                                     
int if_c=0; 
int else_c=0; 
int while_c=0; 
int int_c=0; 
int float_c=0; 
%}                                                                                                                                                     
%%                                                                                                                                                     
"if"      { printf("if found\n"); }                                                                                                      
"else"    { printf("else fnd\n"); }                                                                                                    
"while"   { printf("while fnd\n"); }                                                                                                   
"int"     { printf("int fnd\n"); }                                                                                                     
"float"   { printf("float fnd\n"); }                                                                                                   
[a-zA-Z_][a-zA-Z0-9_]*  {  }                                                                                                                           
[ \t\n]+                {  }                                                                                                                           
.                       {  }                                                                                                                           
%%                                                                                                                                                     
int main(int argc, char **argv)                                                                                                                        
{                                                                                                                                                      
    yylex();                                                                                                                                           
    return 0;                                                                                                                                          
}                                                                                                                                                      
int yywrap()                                                                                                                                           
{                                                                                                                                                      
    return 1;                                                                                                                                          
}              
