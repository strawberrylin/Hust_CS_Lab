%{
    #include"syntax.tab.h"
    int wordCount = 0;
    int numCount = 0;
    extern int yylval;
%}
digit [0-9]
number {digit}+
chars [A-Za-z\_\'\.\"]
delim [" "\n\t\x0B\f\r\x20]
whitescape {delim}+
words {chars}+
WHILE while
PLUS [+]
MINUS [-]
STAR [*]
DIV [/]
AND [&][&]
OR [|][|]
NOT [!]
IF if
ELSE else
SEMI \;
TYPE int
%%
{WHILE} {printf("%s\n",yytext);}
{chars} {return IDENTIFIER;}
{SEMI} {return SEMI;}
{TYPE} {return TYPE;}
"char" {return CHAR;}
{PLUS} {return ADD;}
{MINUS} {return SUB;}
{STAR} {return MUL;}
{DIV} {return DIV;}
{number} {numCount++;yylval = atoi(yytext);return INT;}
{words} {wordCount++;
       /*increas the word count by one*/}
[+*/()\n] {return yytext[0];}
. {}
%%
int yywrap()
{
    return 1;
}


