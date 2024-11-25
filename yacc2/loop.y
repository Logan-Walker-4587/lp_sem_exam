%{
   #include<stdio.h>
   #include<stdlib.h>
   extern int yylex();
   void yyerror(const char* s);
%}

%token ID OP FOR ROP 
%left OP ROP 

%%

loop: FOR '(' assignment ';' rexp ';' assignment ')' ;

assignment: ID '=' expr ;

expr: expr OP expr
    | ID
    ;

rexp: ID ROP expr ;

%%

void yyerror(const char* s)
{
    printf("\nInvalid string error");
}

int main()
{
    printf("\nEnter a string : ");
    if (yyparse() == 0)
    {
        printf("\nValid string");
    }
    else
    {
        printf("\nInvalid string\n");
    }
    return 0;
}