%option noyywrap

%%

"for"[ \t]*\([^;]*;[^;]*;[^)]*\)[ \t]*\{[^}]*\} {
    int i = 0;
    int flag1 = 0, flag2 = 0;
    char condition[100] = {0};
    char increment[100] = {0};

    while(yytext[i] != '\0') {
        if(yytext[i] == '(') {
            flag1 = 1;
        }
        if(flag1 == 1 && yytext[i] != ';') {
            condition[strlen(condition)] = yytext[i];
        }
        if(yytext[i] == ';' && flag2 == 0) {
            flag2 = 1;
        }
        if(flag1 == 1 && flag2 == 1 && yytext[i] != ';' && yytext[i] != '{' && yytext[i] != '}') {
            increment[strlen(increment)] = yytext[i];
        }
        i++;
    }

    printf("while(%s) {\n", condition);
    printf("%s;\n", increment);
    printf("}\n");
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
