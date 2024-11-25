%{
   #include "y.tab.h"
%}

%%

[a-z]* { printf("\nfound ID"); return ID; }
[*+-/%] { printf("\nfound OP"); return OP; }
[ \t]* { }
. { return yytext[0]; }
\n { return 0; }


%%

int yywrap()
{
    return 1;
}