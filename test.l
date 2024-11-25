%{
  #include<stdio.h>
%}

%%

[a-z]*bbb[a-z]* { printf("\nFound"); }
\n { return 0; }

%%

int main()
{
    printf("\nEnter a string : ");
    yylex();
    return 0;
}