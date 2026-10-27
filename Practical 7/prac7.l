%{
#include <stdio.h>
%}

%%
.*COM { printf("valid String"); }
.*    { printf("Invalid String"); }
%%

int main() {
    printf("enter the sentence:\n");
    yylex();
    return 0;
}

int yywrap() {
    return 1;
}