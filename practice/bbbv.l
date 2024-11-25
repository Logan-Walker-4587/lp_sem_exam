%{
   #include<stdio.h>
   int flag = 0;
   int found = 0;
%}

%%

[a-z]*"bbb"[a-z]* { 
                 for (int i=0; yytext[i]!='\0' ; i++)
                 {
                    if (strchr("aeiou",yytext[i]))
                    {
                        flag++;
                    }
                 }
                 if (flag>=2)
                 {
                    printf("\n%s satisfies condtion",yytext);
                    found = 1;
                 }
                 flag = 0;
                 
} 

\n { return 0; }
. { }

%%

int main()
{
    printf("\nEnter a string: ");
    yylex();
    if (found==0)
       printf("\n No valid strings");
    return 0;
}