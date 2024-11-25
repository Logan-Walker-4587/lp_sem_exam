%{
   #include<stdio.h>
   int v = 0;          // Words without vowels
   int result = 0;     // Words without 'a' and length 5
   int digit = 0;      // 4-digit numbers
   int length = 0;     // Length of current word
%}

%%

[a-zA-Z]+ {
    length = strlen(yytext);
    
    // Count words without vowels
    int isVowelFree = 1;  // Flag to check if word has vowels
    for (int i = 0; yytext[i] != '\0'; i++) {
        if (strchr("aeiouAEIOU", yytext[i])) {
            isVowelFree = 0;  // Word has a vowel
            break;
        }
    }

    if (isVowelFree) {
        v++;
    }

    // Check for words without 'a' and length 5
    if (length == 5 && !strchr(yytext, 'a') && !strchr(yytext, 'A')) {
        result++;
    }
}

[0-9]{4} { digit++; }  // 4-digit numbers
[ \t] {}  // Ignore spaces
\n { return 0; }  // End on newline
. {}   // Ignore other characters

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
