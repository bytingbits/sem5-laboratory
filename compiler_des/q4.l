%option noyywrap
%{
#include <stdio.h>
int yylex();
int yyerror(char *s);
%}

%%
"+"    { return PLUS; }
"-"    { return MINUS; }
"*"    { return MULTIPLY; }
"/"    { return DIVIDE; }
"AND"  { return AND; }
"OR"   { return OR; }
"("    { return LPAREN; }
")"    { return RPAREN; }
[0-9]+ { yylval = atoi(yytext); return NUMBER; }
\n     ;
.      { yyerror("Unknown character"); }
%%

int yyerror(char *s) {                                              
    printf("%s\n", s);
    return 0;
}

