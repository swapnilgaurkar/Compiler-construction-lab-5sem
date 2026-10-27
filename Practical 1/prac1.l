%{
#include <stdio.h>
int count = 0;
%}

%%
"//".* { count++; }
.|\n {}
%%

int main() {
    printf("Enter a String: ");
    yylex();
    printf("the frequency of single line comments is %d", count);
    return 0;
}

int yywrap() {
    return 1;
}