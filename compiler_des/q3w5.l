%{                                                                                                                                                     
#include <stdio.h>                                                                                                                                     
#include <stdlib.h>                                                                                                                                    
#include <string.h>                                                                                                                                    
int expected_operands = 0;                                                                                         
void yyerror(const char *s) {                                                                                                                          
    fprintf(stderr, "Error: %s. Invalid prefix expression\n", s);                                                                                      
    exit(1);                                                                                                                                           
}                                                                                                                                                      
%}                                                                                                                                                     
%option noyywrap                                                                                                                                       
%%                       
"++"|"--" {                                                                                        
    expected_operands += 1;                                                                                   
    printf("operator: %s\n", yytext); 
    }                                                                                                                             
"+"|"-"|"*"|"/"|"%"|"&&"|"||" {                                                                                        
    expected_operands += 2;                                                                                   
    printf("operator: %s\n", yytext);      
    
                                                                                                 
}                                                                                                                                                      
[0-9]+ {                                                                                                                                                                                                                                                                                               
    expected_operands--;                                                                                 
    printf("found: %s\n", yytext);                                                                                                        
}                                                                                                                                                      
[ \t\n]+ { }                                                                                                                                           
. {                                                                                                                                                    
    yyerror("Invalid character");                                                                                                                      
}                                                                                                                                                      
%%                                                                                                                                                     
int main(int argc, char **argv) {                                                                                                                      
                                                                                                                yylex();                                                                                                                                           
    if (expected_operands!=0) {                                                                        
        yyerror("Invalid");                                                                     
    }                                                                                                                                                  
    printf("Valid expression.\n");                                                                                                              
    return 0;                                                                                                                                          
}                                         
