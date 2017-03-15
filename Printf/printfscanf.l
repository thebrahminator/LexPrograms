%{
#include<stdio.h>
int pc = 0, sc =0;
%}

%%

"printf" {
            fprintf(yyout,"writef");
            pc++;
         }
"scanf" {   
            fprintf(yyout, "readf");
            sc++;
        }

%%

int main(int argc, char *argv[])
{
    yyin = fopen(argv[1], "r");
    yyout = fopen(argv[2], "w");

    yylex();

    printf("No of Scanf : %d \nNo of Printf: %d\n",sc,pc);
    return 1;
}

