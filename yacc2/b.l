%{
    #include "y.tab.h"
%}

%%

[A-Za-z_][A-Za-z0-9_]* { return ID; }
[*+-/%] { return OP; }
[ \t]* {}
. { return yytext[0]; }
\n { return 0; }

%%

int yywrap()
{
    return 1;
}