%{
  #include<stdio.h>
  FILE* dest;
%}

%%

[a-z]*"bbb"[a-z]* { printf("\nfound"); fprintf(dest,"%s\n",yytext); }
[ \t] { }
. {}
\n { return 0; }

%%

int main(int argc , char* argv[])
{
    FILE* source = fopen(argv[1],"r");
    dest = fopen(argv[2],"w");

    yyin = source;
    yylex();
    printf("\nSuccess"); 
    fclose(source);
    fclose(dest);

    return 0;

}