%{
    #include<stdio.h>
    #include<stdlib.h>
    extern int yylex();
    void yyerror(const char *s);
%}

%token NUMBER 
%token id
%left '+' '-'
%left '*' '/' '%'
%left '(' ')'

%%

ex: id '=' e  

e: e '+' e
  | e '-' e
  | e '*' e
  | e '/' e
  | e '%' e
  | '(' e ')'   /* Ensure parentheses are matched */
  | NUMBER
  | id
;

%%

int main() {
    printf("Enter a string: ");
    if (yyparse() == 0) {
        printf("String belongs to the language .\n");
    } else {
        printf("String does not belong to the language .\n");
    }
    return 0;
}

void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
}

