%{
   #include <stdio.h>
   #include<stdlib.h>
   extern int yylex();
   void yyerror(const char* s);
%}

%token ID OP 
%left OP     

%%

expr: simple_expr 
    | '(' expr ')'
    | '{' expr '}'
    | '[' expr']'
    | expr OP expr
    ;
simple_expr: ID OP ID ;

%%

void yyerror(const char* s)
{
    printf("\nError occured");
}

int main()
{
    printf("\nEnter a string : ");
    if (yyparse() == 0)
    {
        printf("\nValid string \n");
    }
    else
    {
        printf("\nInvalid");
    }
    return 0;
}