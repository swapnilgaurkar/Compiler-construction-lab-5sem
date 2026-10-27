%{
#include <stdio.h>

void decimalToHex(char a[]) {
    int i, n = 0, r;
    char hex[20];

    for (i = 0; a[i] != '\0'; i++) {
        n = n * 10 + (a[i] - '0');
    }

    i = 0;
    while (n > 0) {
        r = n % 16;
        if (r < 10)
            hex[i] = r + '0';
        else
            hex[i] = r - 10 + 'A';
        i++;
        n = n / 16;
    }

    printf("Hexadecimal: ");
    for (i = i - 1; i >= 0; i--)
        putchar(hex[i]);

    printf("\n");
}
%}

%%
[0-9]+ { decimalToHex(yytext); }
.      { putchar(yytext[0]); }
%%

int main() {
    printf("Enter a Decimal Number: ");
    yylex();
    return 0;
}

int yywrap() {
    return 1;
}