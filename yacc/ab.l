%{
#include "y.tab.h"  // Include token definitions
%}

%%
a { return 'a'; }  // Match character 'a'
b { return 'b'; }  // Match character 'b'
\n { return 0; }   // End of input
. { return yytext[0]; } // Return any other character
%%

int yywrap() {
    return 1;  // Required for Flex
}

