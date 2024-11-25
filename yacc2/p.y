%{
    #include<stdio.h>
    #include<stdlib.h>
    extern int yylex();
    void yyerror(const char* s);
%}

%token LETTER;
%left LETTER

%%

palindrome: 
          | LETTER palindrome LETTER
          | LETTER
          ;

%%

void yyerror(const char* s)
{
    printf("\n Error");
}
int main()
{
    printf("\nEnter a string : ");
    if (yyparse()==0)
       printf("\nValid palindrome");
    else
       printf("\nNot palindrome");

    return 0;
}