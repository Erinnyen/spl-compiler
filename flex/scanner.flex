%{
/*
*   scanner.flex
*   Definitionen
*/


#define YY_NO_UNISTD_H
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "scanner.h"
YYSTYPE yylval;
static int lineNo = 1;

void illegalCharacter(int line, char character){
    fprintf(stderr, "An error occured\n");
    fprintf(stderr, "Line: %d, Illegal character 0x%02x\n", line, (unsigned char) character);
    exit(0);
}


%}
%option noyywrap
%option never-interactive

%%

\/\/.* {
        /* Kommentar wird überlesen */
}

[\ \t\r] {
        /* Wwhitespaces überlese */
}

\n      {
        /* Zeilenumbruch: lineNo erhöhen */
        lineNo++;
}

array   {
        yylval.noVal.line = lineNo;
        return ARRAY;
}

else   {
        yylval.noVal.line = lineNo;
        return ELSE;
}

if   {
        yylval.noVal.line = lineNo;
        return IF;
}

of   {
        yylval.noVal.line = lineNo;
        return OF;
}

proc   {
        yylval.noVal.line = lineNo;
        return PROC;
}

ref   {
        yylval.noVal.line = lineNo;
        return REF;
}

type   {
        yylval.noVal.line = lineNo;
        return TYPE;
}

var   {
        yylval.noVal.line = lineNo;
        return VAR;
}

while   {
        yylval.noVal.line = lineNo;
        return WHILE;
}



\(      {
        yylval.noVal.line = lineNo;
        return LPAREN;
}

\)      {
        yylval.noVal.line = lineNo;
        return RPAREN;
}

\[      {
        yylval.noVal.line = lineNo;
        return LSQBRACK;
}

\]      {
        yylval.noVal.line = lineNo;
        return RSQBRACK;
}

\{      {
        yylval.noVal.line = lineNo;
        return LBLOCK;
}

\)      {
        yylval.noVal.line = lineNo;
        return RBLOCK;
}

=      {
        yylval.noVal.line = lineNo;
        return EQUAL;
}

#      {
        yylval.noVal.line = lineNo;
        return NOTEQUAL;
}

<      {
        yylval.noVal.line = lineNo;
        return LESS;
}

<=      {
        yylval.noVal.line = lineNo;
        return LESSEQ;
}

>      {
        yylval.noVal.line = lineNo;
        return GRTR;
}

>=     {
        yylval.noVal.line = lineNo;
        return GRTREQ;
}

:=     {
        yylval.noVal.line = lineNo;
        return ASGN;
}

:      {
        yylval.noVal.line = lineNo;
        return COL;
}

,      {
        yylval.noVal.line = lineNo;
        return COMMA;
}

;      {
        yylval.noVal.line = lineNo;
        return SEMICOL;
}

+      {
        yylval.noVal.line = lineNo;
        return PLUS;
}

-      {
        yylval.noVal.line = lineNo;
        return MINUS;
}

*     {
        yylval.noVal.line = lineNo;
        return MULT;
}

\/    {
        yylval.noVal.line = lineNo;
        return DVSN;
}




[A-Za-z_][A-Za-z0-9_]* {
        yylval.stringVal.line = lineNo;
        yylval.stringVal.val = (char*) malloc(strlen(yytext) + 1);
        strcpy(yylval.stringVal.val, yytext);
        return IDENT;
}
[0-9]+ {
        yylval.intVal.line = lineNo;
        yylval.intVal.val = strtol(yytext, NULL, 10);
        return INTLIT;
}

.       {
        illegalCharacter(lineNo, yytext[0]);
}

%%

/*
*   user-defined code and datastructures;
*/

void main(int argc, char **argv){
    int token;
    if(argc > 1)
        yyin = fopen(argv[1], "r");
    else
        yyin = stdin;

    if(yyin == NULL)
        fprintf(stderr, "cannot open input file");
    else
        do
        {
            token = yylex();
            switch (token)
            {
            case ARRAY  :
                printf("ARRAY in line %d\n", yylval.noVal.line); 
                break;

            case LPAREN :
                printf("LPAREN in line %d\n", yylval.noVal.line); 
                break;

            case RPAREN :
                printf("RPAREN in line %d\n", yylval.noVal.line); 
                break;

            case IDENT  :
                printf("IDENT %s in line %d\n", yylval.stringVal.val, yylval.stringVal.line); 
                break;

            case INTLIT :
                printf("INTLIT %d in line %d\n", yylval.intVal.val, yylval.intVal.line); 
                break;

            case SEMICOL    :
                printf("SEMICOL in line %d\n", yylval.noVal.line); 
                break;
            }
        } while (token != 0);
        fclose(yyin);
}