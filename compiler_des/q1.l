%option noyywrap                                                                                                               
%{                                                                                                                             
        #include<stdio.h>
	int if_c=0;                                                                                                       
	int else_c=0;                                                                                                       
	int while_c=0;                                                                                                       
	int int_c=0;                                                                                                       
	int float_c=0;                                                                                                       
%}                                                                                                                             
%%                                                                                                                             
"end" return 0;                                                                                                                  
"if" {printf("\nvalid if"); if_c++; }                                                                             
"else" {printf("\nvalid else"); else_c++; }                                                                             
"while"      { printf("Valid while loop\n"); while_c++; }                                                           
"int"  { printf("Valid int\n"); int_c++; }                                                       
"float"  { printf("Valid float\n"); float_c++;}                                                       
[a-zA-Z_][a-zA-Z0-9_]*  {  }                                                                                                                           
[ \t\n]+                {  }                                                                                                                           
.                       {  }                                                                                          
%%                                                                                                                             
int main()                                                                                                                     
{       yylex();                                                                                                               
        printf("\nFound the following frequencies of keywords:\n if: %d\n else: %d\nwhile: %d\n int: %d\n float: %d\n ", if_c, else_c, while_c, int_c, float_c); 
	return 0;                                                                                                              
}
