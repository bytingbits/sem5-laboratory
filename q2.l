%{                                                                                                                                                     
#include<stdio.h>                                                                                                                                      
#include <stdlib.h>                                                                                                                                    
int word=0,num=0,ch=0,line=0,space=0;                                                                                                                  
int print();                                                                                                                                           
%}                                                                                                                                                     
%%                                                                                                                                                     
[0-9]+ { num++;                                                                                                                                        
         ch+= yyleng;}                                                                                                                                 
[\t \n] {                                                                                                                                              
space++;                                                                                                                                               
if(*yytext=='\n') line++;                                                                                                                              
}                                                                                                                                                      
[a-zA-Z] { ch+=yyleng;                                                                                                                                 
word++;                                                                                                                                                
}                                                                                                                                                      
. ch+=yyleng;                                                                                                                                          
end { print();}                                                                                                                                        
%%                                                                                                                                                     
int print(){                                                                                                                                           
        printf("\nNumber of Characters : %d ",ch);                                                                                                     
        printf("\nNumber of Words : %d ",word);                                                                                                        
        printf("\nNumber of Numbers : %d ",num);                                                                                                       
        printf("\nNumber of Lines : %d ",line);                                                                                                        
        printf("\nNumber of White space Characters : %d ",space);                                                                                      
        printf("\n\n");                                                                                                                                
exit(0);                                                                                                                                               
}                                                                                                                                                      
                                                                                                                                                       
                                                                                                                                                       
int main()                                                                                                                                             
{                                                                                                                                                      
        yylex();                                                                                                                                       
        return 0;                                                                                                                                      
}                                                                                                                                                      
                                                                                                                                                       
int yywrap(){                                                                                                                                          
return 1;                                                                                                                                              
} 
