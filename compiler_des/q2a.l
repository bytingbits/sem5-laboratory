%option noyywrap

%%

"for"[ \t]*\([^;]*;[^;]*;[^)]*\)[ \t]*\{[^}]*\} {
    int i = 0;
    int flag1 = 0, flag2 = 0, flag3 = 0;
    char init[100], cond[100], inc[100];
    int init_index = 0, cond_index = 0, inc_index = 0;

    while(yytext[i] != '\0') {
        if(yytext[i] == '(') {
            flag1 = 1;
        }
        if(flag1 == 1 && yytext[i] != ';') {
            if(flag2 == 0) {
                init[init_index++] = yytext[i];
            }
        }
        if(yytext[i] == ';' && flag2 == 0) {
            flag2 = 1;
            init[init_index] = '\0';
            printf("%s;\nwhile(", init);
        }
        if(flag1 == 1 && flag2 == 1 && yytext[i] != ';' && yytext[i] != '{' && yytext[i] != '}') {
            if(flag3 == 0) {
                cond[cond_index++] = yytext[i];
            }
        }
        if(yytext[i] == ';' && flag3 == 0) {
            flag3 = 1;
            cond[cond_index] = '\0';
            printf("%s) {\n", cond);
        }
        if(yytext[i] == '}' && flag3 == 1) {
            while(yytext[i] != ';') {
                inc[inc_index++] = yytext[i++];
            }
            inc[inc_index] = '\0';
            printf("%s;\n", inc);
            printf("}\n");
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

