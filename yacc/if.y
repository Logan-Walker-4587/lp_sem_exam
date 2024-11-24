%{
#include <stdio.h>
#include <stdlib.h>
extern int yylex();
int yyerror(char *msg);
%}
%token IF ELSE EQ REL ID NUM
%%
s: stmt { printf("valid\n"); return 0;}
 ;

stmt: IF '(' cond ')' '{' t '}'
 ;

cond: ID 
    | NUM
    | ID REL NUM
    | ID EQ NUM
 ;

t: code ';'
 ;

code: ID '=' ID
    | ID '=' NUM
    | ID '+' NUM
    | ID '-' NUM
 ;
%%
int yyerror(char *msg) {
    printf("Invalid\n");
    return 0;
}
int main() {
    printf("Enter statement:\n");
    yyparse();
    return 0;
}

