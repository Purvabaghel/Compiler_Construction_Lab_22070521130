%{
#include <stdio.h>
int comments=0, keywords=0, identifiers=0, words=0, lines=0, spaces=0;
%}

%%
"/*"([^*]|\*+[^*/])*\*+"/"  { comments++; }

"int"|"float"|"if"|"else"|"main"|"return" {
    keywords++;
    words++;
}

[a-zA-Z_][a-zA-Z0-9_]* {
    identifiers++;
    words++;
}

[ \t]    { spaces++; }
\n       { lines++; }

[0-9]+   ;       // Ignore numbers
.        ;       // Ignore symbols
%%

int yywrap() {
    return 1;
}

int main() {
    yylex();
    printf("Comments: %d\n", comments);
    printf("Keywords: %d\n", keywords);
    printf("Identifiers: %d\n", identifiers);
    printf("Words: %d\n", words);
    printf("Lines: %d\n", lines);
    printf("Spaces: %d\n", spaces);
    return 0;
}
