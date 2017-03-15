%{
#include<stdio.h>
int character = 0, words = 0, newline = 0, spaces=0;
%}


WORD [^ \t\n,\.:]
EOL [ \n]
BLANK [ ]
%%

{WORD} {words++; character = character + yyleng;}
{BLANK} {spaces++;}
{EOL} {newline++;}

. {character++;}

%%

int yywrap()
{
    return 1;
}

int main()
{
    yylex();
    printf("No of Characters = %d\nNo of Spaces = %d\nNo of words = %d\nNo of Lines = %d\n", character, spaces, words, newline);
    return 1;
}

