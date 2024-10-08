%option noyywrap

%%

"for"[ \t]*\([^;]*;[^;]*;[^)]*\)[ \t]*\{[^}]*\} {
    int i = 0;
    int flag1 = 0, flag2 = 0, flag3 = 0;

    while(yytext[i] != '\0') {
        if(yytext[i] == '(') {
            flag1 = 1;
        }
        if(flag1 == 1 && yytext[i] != ';') {
            if(flag2 == 0) {
                printf("%c", yytext[i]);
            }
        }
        if(yytext[i] == ';' && flag2 == 0) {
            flag2 = 1;
            printf(";\nwhile(");
        }
        if(flag1 == 1 && flag2 == 1 && yytext[i] != ';' && yytext[i] != '{' && yytext[i] != '}') {
            if(flag3 == 0) {
                printf("%c", yytext[i]);
            }
        }
        if(yytext[i] == ';' && flag3 == 0) {
            flag3 = 1;
            printf(") {\n");
        }
        if(yytext[i] == '}' && flag3 == 1) {
            printf("%c", yytext[i]);
            printf(";\n");
        }
        i++;
    }
}

[^\n]+ {
    printf("Invalid\n");
    exit(0);
}

%%

int main() {
    yylex();
    return 0;
}

