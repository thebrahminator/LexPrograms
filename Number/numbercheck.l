%{
#include<stdio.h>
int posint = 0, negint = 0, posfrac = 0, negfrac = 0;
%}

%%

[+]?[0-9]+ {posint++;}
[-][0-9]+ {negint++;}
[+]?[0-9]*\.[0-9]+ {posfrac++;}
[-][0-9]*\.[0-9]+ {negfrac++;}

%%

int main()
{
yylex();
printf("Positive Integers: %d\n", posint);
printf("Negative Integers: %d\n", negint);
printf("Positive Fraction: %d\n", posfrac);
printf("Negative Fraction: %d\n", negfrac);

return 1;
}
