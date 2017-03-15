%{
#include<stdio.h>
int vowels=0;
int consonants=0;
%}
 
%%

[aeiouAEIOU] {vowels++;}
[a-zA-Z] {consonants++;}

%%
int yywrap(){
return 1;
}

int main()
{
printf("The number of vowels = %d \t consonants = %d \n", vowels, consonants);
yylex();
printf("The number of vowels = %d \t consonants = %d \n", vowels, consonants);
return 1;
}


