%option noyywrap                                                                                                               
%{                                                                                                                             
        #include<stdio.h>                                                                                                      
%}                                                                                                                             
%%                                                                                                                             
end return 0;                                                                                                                  
for\s*\([^;]*;[^;]*;[^)]*\)\s*\{[^}]*\}  
{ printf("Valid for loop\n"); 
int flag1=0;
int flag2=0; 
int flag3=0;  
for (int i = 0; i < yyleng; i++)
	{
		if(yytext[i]=='\(')
		{flag1=1;}	

	if (flag1==1){
	while(yytext[i]!=';'){

	printf("%c", yytext[i]); 
	i++;flag2=1;
	}}
	printf("\nwhile\("); 
	if (flag2==1)
	{	
	while(yytext[i]!=';'){

	printf("%c", yytext[i]); 
	flag3=1;
	i++; 
	
	}}
	if (flag3==1){
	while(yytext[i]!=';'){

	printf("%c", yytext[i]); 
	flag2=1;
	}}

	
	} 

}                                                       
[^\n]+ {printf("invalid\n"); exit(0);}                                                                                         
%%                                                                                                                             
int main()                                                                                                                     
{       yylex();                                                                                                               
        return 0;                                                                                                              
}                                                                                                                              
