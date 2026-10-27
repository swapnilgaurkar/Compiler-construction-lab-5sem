%{
#include <stdio.h>
int numbers = 0;
int a_count = 0;
%}

%%
[0-9]+(\.[0-9]+)?([E][+-]?[0-9]+)? { numbers++; }
[aA][a-zA-Z]* { a_count++; }
%%

int main() {
    printf("Enter a String: ");
    yylex();
    printf("Numbers: %d\n", numbers);
    printf("a/A count: %d\n", a_count);
    return 0;
}

int yywrap() {
    return 1;
}