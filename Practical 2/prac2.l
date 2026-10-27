%{
#include <stdio.h>

int comments = 0, keywords = 0, identifiers = 0;
int words = 0, lines = 0, spaces = 0;
%}

%%
"//".*                                  { comments++; }

"int"|"float"|"char"|"if"|"else"|"while"|"for"|"return"  { keywords++; }

[a-zA-Z_][a-zA-Z0-9_]*                 { identifiers++; words++; }

[ \t]+                                  { spaces += yyleng; }

\n                                      { lines++; }

.                                       ;
%%

int main() {
    printf("Enter a String:\n");
    yylex();

    printf("\nComments = %d", comments);
    printf("\nKeywords = %d", keywords);
    printf("\nIdentifiers = %d", identifiers);
    printf("\nWords = %d", words);
    printf("\nLines = %d", lines);
    printf("\nSpaces = %d", spaces);

    return 0;
}

int yywrap() {
    return 1;
}