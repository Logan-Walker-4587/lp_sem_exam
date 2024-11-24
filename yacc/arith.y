%{
#include <stdio.h>
#include <stdlib.h>
extern int yylex();
int yyerror(char *msg);
int flag = 0;
%}

%token NUMBER
%left '+' '-'
%left '*' '/' '%'
%left '(' ')'

%%
expr: e {  }
;

e: e '+' e
  | e '-' e
  | e '*' e
  | e '/' e
  | e '%' e
  | '(' e ')'   /* Ensure parentheses are matched */
  | NUMBER
;

%%
int main() {
    printf("Enter an expression: ");
    yyparse();
    if (flag == 0) {
        printf("Expression is valid\n");
    }
    return 0;
}

int yyerror(char *msg) {
    printf("Invalid expression\n");
    flag = 1;
    return 0;
}

