%{
#include <stdio.h>
#include <stdlib.h>

int yylex();
void yyerror(const char *s);
%}

%token NUMBER
%token INC DEC

%left '+' '-'
%left '*' '/'
%right INC DEC
%right UMINUS

%%
input:
      /* empty */
    | input line
    ;

line:
      '\n'
    | expr '\n' { printf("Result = %d\n", $1); }
    ;

expr:
      NUMBER              { $$ = $1; }
    | expr '+' expr       { $$ = $1 + $3; }
    | expr '-' expr       { $$ = $1 - $3; }
    | expr '*' expr       { $$ = $1 * $3; }
    | expr '/' expr       {
                              if ($3 == 0) {
                                  yyerror("Division by zero");
                                  $$ = 0;
                              } else {
                                  $$ = $1 / $3;
                              }
                          }
    | INC expr            { $$ = $2 + 1; }
    | DEC expr            { $$ = $2 - 1; }
    | expr INC            { $$ = $1 + 1; }
    | expr DEC            { $$ = $1 - 1; }
    | '-' expr %prec UMINUS { $$ = -$2; }
    | '(' expr ')'        { $$ = $2; }
    ;
%%

void yyerror(const char *s)
{
    printf("Error: %s\n", s);
}

int main()
{
    printf("Enter expression:\n");
    yyparse();
    return 0;
}