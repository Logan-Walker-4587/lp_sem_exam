%{
   #include "y.tab.h"
%}

%%

true { return TRUE; }
false { return FALSE; }
and { return AND; }
or  { return OR; }
not   { return NOT; }
[ \t] { /* Ignore whitespace */ }
\n { return 0; }
. { return yytext[0]; }

%%

int yywrap()
{
    return 1;
}