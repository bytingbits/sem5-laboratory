%option noyywrap

%%

"for"[ \t]*\([^;]*;[^;]*;[^)]*\)[ \t]*\{[^}]*\} {
    int i = 0;
    int flag1 = 0, flag2 = 0, flag3 = 0;

    printf("\n");

    while(yytext[i] != '\0') {
        if(yytext[i] == '(') {
            flag1 = 1;
        }
        if(flag1 == 1 && yytext[i] != ';') {
            printf("%c", yytext[i]);
        }
	
	printf("while\("); 
        if(yytext[i] == ';' && flag2 == 0) {
            flag2 = 1;
        }
        if(flag1 == 1 && flag2 == 1 && yytext[i] != ';' && yytext[i] != '{' && yytext[i] != '}') {
            if(flag3 == 0) {
                printf("%c", yytext[i]);
                flag3 = 1;
            }
        }
        if(yytext[i] == '}' && flag3 == 1) {
            printf(";\n");
        }
        i++;
    }

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

