%{
    #include<stdio.h>
    int v = 0,c = 0;
%}

%%

[ \t] {}
[\n] { return 0; }
[AEIOUaeiou] { v++; }
. { c++; }


%%

int main()
{
    printf("\nEnter a string : ");
    yylex();
    printf("\nNo.of vowels = %d",v);
    printf("\nNo.of consonants = %d",c);
    return 0;
}