%{
   #include<stdio.h>
   int v = 0;
   int c = 0;
   int length = 0;
   int result = 0;
   int digit = 0;
%}

%%

[b-df-hj-np-tv-zB-DF-HJ-NP-TV-Z]{5} { c++; } 
[b-zB-Z][b-zB-Z][b-zB-Z][b-zB-Z][b-zB-Z] { result++; }
[0-9][0-9][0-9][0-9] { digit++; }
[ \t] {}
\n { return 0; }
. {}

%%

int main(int argc , char* argv[])
 {
    FILE* fd = fopen(argv[1],"r");
    yyin = fd;
    yylex();
    printf("\nno.of words without vowels = %d",c);
    printf("\nno.of words without 'a' and length equal to 5 = %d",result);
    printf("\nno.of 4 digit numbers = %d",digit);
    fclose(fd);
    return 0;
 }