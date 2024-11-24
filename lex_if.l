%{
    #include<stdio.h>
    FILE* dest;
%}

%%


"{" { fprintf(dest,"begin"); }
"}" { fprintf(dest,"end"); }
. { fprintf(dest,"%s",yytext); }

%%

int main (int argc , char* argv[])
{
    FILE* source = fopen(argv[1],"r");
    dest = fopen(argv[2],"w");
    
    if (!source)
    {
        printf("\nError opening file");
    } 

    yyin = source;
    yylex();
    fclose(source);
    fclose(dest);
    return 0;
}