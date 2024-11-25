%{
   #include<stdio.h>
   int v = 0;          // Words without vowels
   int result = 0;     // Words without 'a' and length 5
   int digit = 0;      // 4-digit numbers
%}

%%

[b-df-hj-np-tv-zB-DF-HJ-NP-TV-Z] { result++; }   
[a-zA-Z]*[^aeiouAEIOU\s][a-zA-Z]* { v++; }          
[0-9][0-9][0-9][0-9] { digit++; }  
[ \t] {}  
\n { return 0; } 
. {}   

%%

int main(int argc , char* argv[]) {
    FILE* fd = fopen(argv[1], "r");
    if (!fd) {
        perror("Error opening file");
        return 1;
    }

    yyin = fd;
    yylex();

    printf("\nno.of words without vowels = %d", v);
    printf("\nno.of words without 'a' and length equal to 5 = %d", result);
    printf("\nno.of 4 digit numbers = %d", digit);

    fclose(fd);
    return 0;
}
