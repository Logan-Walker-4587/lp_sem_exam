%{
    #include<stdio.h>
    int a=0,r=0,s=0,num=0,id=0;
%}

%%

"int"|"return"|"if"|"else"|"while"|"for"|"include"|"printf"|"scanf"|"main"|"void"|"char"|"float"|"double"|"{"|"}"|"("|")"|"#include<stdio.h>" {}
[=] { a++; }
[><!=][=] { r++; }
; { s++; }
[0-9]* { num++; }
[A-Za-z_][A-Za-z0-9_]* { id++; }
. {}

%%

int main (int argc , char* argv[])
{
    FILE* fd = fopen(argv[1],"r");

    if (!fd)
    {
        printf("\nError opening file");
    } 

    yyin = fd;
    yylex();
    fclose(fd);
    printf("Number of statements: %d\n", s);
    printf("Number of integers: %d\n", num);
    printf("Number of relational operators: %d\n", r);
    printf("Number of identifiers: %d\n", id);
    printf("Number of assignment: %d\n", a);
}