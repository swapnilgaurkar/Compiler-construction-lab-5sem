%{
#include <stdio.h>
#include <stdlib.h>
int yylex();
int yyerror(char *s);
%}

%token NUM

%%
E : E '+' T | T;
T : T '*' F | F;
F : '(' E ')' | NUM;
%%

int yyerror(char *s) {
    printf("INVALID EXPRESSION!!!\n");
    exit(0);
}

int main() {
    printf("Enter an Expression: ");
    yyparse();
    printf("VALID EXPRESSION.\n");
    return 0;
}