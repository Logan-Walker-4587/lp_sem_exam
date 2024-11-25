%{
    #include<stdio.h>
    #include<stdlib.h>
    extern int yylex();
    void yyerror(const char* s);
    int result = 0;
%}

%token AND TRUE FALSE OR 
%left AND OR
%right NOT

%%

calculation: e { result=$1; }
           ;
e: e AND e { $$ = $1 && $3; }
  | e OR e  { $$ = $1 || $3; }
  | NOT e   { $$ = !$2; }
  | TRUE    { $$ = 1; }
  | FALSE   { $$ = 0; }
;

%%

int main() {
    printf("Enter a logical expression (use 'true', 'false', 'and', 'or', 'not'): ");
    if (yyparse() == 0) {
        printf("Result: %s\n", result ? "true" : "false");
    } else {
        printf("Invalid input\n");
    }
    return 0;
}

void yyerror(const char *s) {
    printf("\nError: %s\n", s);
}