%{
    #include "y.tab.h"
%}

%%

for                 { return FOR; }
[a-zA-Z_][a-zA-Z0-9_]* { return ID; }
"="                 { return '='; }
[><!]=              { return ROP; }
[*+-/%]             { return OP; }
[;(){}]             { return yytext[0]; }
[ \t\r]*          { /* Skip whitespace */ }
.                   { return yytext[0]; }
\n                  { return 0; }

%%

int yywrap()
{
    return 1;
}