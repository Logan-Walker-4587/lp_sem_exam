%{
    #include<stdio.h>
    #include<stdlib.h>
    extern int yylex();
    void yyerror(const char *s);
    int result; // Store the result of the evaluation
%}

%token NUMBER 
%token id
%left '+' '-'
%left '*' '/' '%'
%left '(' ')'

%%

calculation:
      e { result = $1; }  
    ;

e: e '+' e { $$ = $1 + $3; }
  | e '-' e { $$ = $1 - $3; }
  | e '*' e { $$ = $1 * $3; }
  | e '/' e { 
        if ($3 == 0) {
            printf("Division by zero");
        } else {
            $$ = $1 / $3; 
        }
    }
  | e '%' e { $$ = $1 % $3; }
  | '(' e ')' { $$ = $2; }
  | NUMBER { $$ = $1; }
;

%%

int main() {
    printf("Enter an expression : ");
    if (yyparse() == 0) {
        printf("Result: %d\n", result);
    } else {
        printf("Invalid input\n");
    }
    return 0;
}

void yyerror(const char *s) {
    printf("\nError");
}
