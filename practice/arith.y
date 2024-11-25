%{
    #include<stdio.h>
    #include<stdlib.h>
    extern int yylex();
    void yyerror (const char* s);
%}

%token ID OP
%left OP 

%%

e: ID '=' term ;
term: ID  
    | term OP term
    | '(' term ')'
    ;


%%

void yyerror(const char* s)
{
    printf("\nError");
}

int main()
{
    printf("\nEnter a string : ");
    if (yyparse()==0)
        printf("\nvalid exp");
    else
        printf("\nInvalid");
    return 0;
}