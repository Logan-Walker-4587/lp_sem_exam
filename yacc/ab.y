%{
#include <stdio.h>
#include <stdlib.h>
extern int yylex();
void yyerror(const char *s);
%}

%%
S: 'a' S 'b'  // Recursive rule to handle a^n b^n
 | /* Empty */ { /* Allow empty string as a base case */ }
 ;

%%
void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
}

int main() {
    printf("Enter a string: ");
    if (yyparse() == 0) {
        printf("String belongs to the language a^n b^n.\n");
    } else {
        printf("String does not belong to the language a^n b^n.\n");
    }
    return 0;
}

