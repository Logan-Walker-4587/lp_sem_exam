%{
    #include "y.tab.h"
%}

%%

[0-9]+ { yylval = atoi(yytext); return NUMBER; }
[a-zA-Z][a-zA-Z0-9]* { return id; }
[+\-*/%()] { return yytext[0]; }
[ \t\r]+ { }
. { return yytext[0]; }
\n { return 0; }

%%

int yywrap() {
    return 1;
}

