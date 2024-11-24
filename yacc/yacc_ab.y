%{
    #include <stdio.h>
    #include "y.tab.h"
    void yyerror(const char *);
%}

%token A B

%%

S: A L B { printf("String belongs to a^n b^n\n"); }
;

L: A L B
| 
;

%%

int main() {
    printf("Enter a string: ");
    if (yyparse() == 0) {
        printf("String belongs to a^n b^n\n");
    } else {
        printf("String does not belong to a^n b^n\n");
    }
    return 0;
}

void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
}


