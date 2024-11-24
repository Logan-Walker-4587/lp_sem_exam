%{
    #include <stdio.h>
    #include <stdlib.h>
    extern int yylex();
    void yyerror(const char *s);
%}

%token IF ELSE ROP ID NUM

%%

stmnt: IF '(' cond  ')' '{' t '}' e   
    ;

e : ELSE '{' t '}' 
  | 
  ;
cond: ID ROP ID 
    | ID ROP NUM 
    | NUM ROP NUM 
   ;

t: code ';'  
    ;

code: ID '=' ID      
    | ID '=' NUM     
    | ID '=' ID '+' ID
    | ID '=' ID '-' ID
    | ID '=' ID '*' ID
    | ID '=' ID '/' ID
    | ID '=' NUM '+' NUM
    | ID '=' NUM '-' NUM
    | ID '=' NUM '*' NUM
    | ID '=' NUM '/' NUM
    ;


%%


int main()
{
    printf("\nEnter a IF statement: ");
    if (yyparse() == 0) {
        printf("\nValid");
    } else {
        printf("\nInvalid");
    }
    return 0;
}

void yyerror(const char *s)
{
    printf("\nError: %s", s);
}
