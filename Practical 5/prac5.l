%{
#include <stdio.h>
#include <string.h>

char changeCase(char c) {
    if (c >= 65 && c <= 90)
        return c + 32;
    else if (c >= 97 && c <= 122)
        return c - 32;
    return c;
}
%}

%%
[A-Za-z] { putchar(changeCase(yytext[0])); }
.        { putchar(yytext[0]); }
\n       { putchar('\n'); }
%%

int main() {
    yylex();
    return 0;
}

int yywrap() {
    return 1;
}