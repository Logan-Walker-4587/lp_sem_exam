%{
#include "y.tab.h"
#include <ctype.h>
%}

%%
if              { return IF; }
else     { return ELSE; }
"=="|"!="           { return EQ; }
">"|"<"             { return REL; }
[a-zA-Z][a-zA-Z0-9]*  { return ID; }
[0-9]+                { return NUM; }
[ \t]+                { /* Ignore whitespace */ }
.                     { return yytext[0]; }
%%
int yywrap() {
    return 1;
}

