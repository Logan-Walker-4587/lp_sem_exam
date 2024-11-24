%{
    #include<stdio.h>
%}

%%

[a-zA-Z_][a-zA-Z0-9_]* { printf("\nValid Identifier"); return 0; }
. { printf("\nNot Valid"); return 0; }

%%

int main()
{
    printf("\nEnter a string : ");
    yylex();
    return 0;
}