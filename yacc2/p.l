%{
  #include "y.tab.h"
%}

%%

[A-Za-z] { return LETTER; }
\n { return 0; }
. {}

%%

int yywrap()
{
    return 1;
}
