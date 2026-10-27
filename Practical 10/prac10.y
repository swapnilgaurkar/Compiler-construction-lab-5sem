%{
#include <stdio.h>
#include <stdlib.h>

void yyerror(const char *s);
int yylex();
%}

%token FOR INT ID NUM RELOP INC DEC

%%
program: stmt
       ;

stmt: for_stmt
    ;

for_stmt:
    FOR '(' decl ';' condition ';' update ')' '{' '}'
    {
        printf("Valid for loop\n");
    }
    ;

decl: INT ID '=' NUM
    ;

condition: ID RELOP NUM
         ;

update: ID INC
      | ID DEC
      ;
%%

void yyerror(const char *s)
{
    printf("Invalid for loop\n");
}

int main()
{
    yyparse();
    return 0;
}