%option noyywrap
%{
#include<stdio.h>
#include<string.h>
%}

%%
"for"[ \t]*\([^;]*;[^;]*;[^)]*\)[ \t]*\{[^}]*\} {
    printf("Valid for loop\n");
    char *p = strchr(yytext, '(');
    char *q = strchr(p, ';');
    char *r = strchr(q + 1, ';');
    char *s = strchr(r + 1, ')');
    char *t = strchr(s + 1, '{'); 
    char *u = strchr(t + 1, '}');

    printf("Equivalent while loop:\n");
    printf("%.*s\n", (int)(q - p), p + 1);
    printf("while(%.*s) {\n", (int)(r - q - 1), q + 1);
    printf("%.*s;\n", (int)(s - r - 1), r + 1);
    printf("%.*s\n", (int)(u - t), t + 1);
    printf("\n");
    
}

. {
    printf("invalid\n");
    exit(0);
}

%%

int main() {
    yylex();
    return 0;
}

