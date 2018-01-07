%{}

    #include "syntax.tab.h"
    #include "data.h"
    int yycolumn = 1;
    #define YY_USER_ACTION \
        yylloc.first_line = yylloc.last_line = yylineno; \
        yylloc.first_column = yycolumn; \
        yylloc.last_column = yycolumn + yyleng - 1; \
       yycolumn += yyleng;
%}
%option yylineno
digit [0-9]
INT [0-9]+[0-9]*|0
FLOAT ([+-]?({digit}*\.?{digit}+|{digit}+\.))
CHAR [A-Za-z\_]
IDENTIFIER {CHAR}|((_|{CHAR})({CHAR}|{digit}|_)*)
SPACE [\r\t\' \']*
ENTER [\n]
WHILE while
AND [&][&]
OR [|][|]
NOT [!]
IF if
ELSE else
FOR for
PLUS [+]
SUB [-]
MUL [*]
DIV [/]
SL \(
SR \)
ML \[
MR \]
LL \{
LR \}
TYPE int|float
DOT \.
SEMI \;
COMMA \,
ASSIGN \=
RELOP \>|\<|(\>\=)|(\<\=)|(\=\=)|(\!\=)
STRUCT struct
RETURN return
KEYWORD {IF}|{ELSE}|{FOR}|int|float|char|begin|end|break|return|void
NOTE ("//".*)|("/*"(.|\n)*"*/")
INCLUDE #include<({IDENTIFIER}|{IDENTIFIER}.h)>
DEFINE #define 
ERROR .
%%
{SR} {yylval.a=makeLeaf("RP",yylineno);return RP;}
{SL} {yylval.a=makeLeaf("LP",yylineno);return LP;}
{MR} {yylval.a=makeLeaf("RB",yylineno);return RB;}
{ML} {yylval.a=makeLeaf("LB",yylineno);return LB;}
{LR} {yylval.a=makeLeaf("RC",yylineno);return RC;}
{LL} {yylval.a=makeLeaf("LC",yylineno);return LC;}
{INT} {yylval.a=makeLeaf("INT",yylineno);return INT;}
{FLOAT} {yylval.a=makeLeaf("FLOAT",yylineno);return FLOAT;}
{ENTER} {yycolumn = 1;}
{SPACE} {}
{INCLUDE} {/*printf("Line %d: Headinclude\t %s\n",yylineno,yytext);*/}
{SEMI} {yylval.a=makeLeaf("SEMI",yylineno);return SEMI;}
{COMMA} {yylval.a=makeLeaf("COMMA",yylineno);return COMMA;}
{ASSIGN} {yylval.a=makeLeaf("ASSIGN",yylineno);return ASSIGN;}
{RELOP} {yylval.a=makeLeaf("RELOP",yylineno);return RELOP;yylval.a->syntax_value = yytext;}
{PLUS} {yylval.a=makeLeaf("PLUS",yylineno);return PLUS;}
{SUB} {yylval.a=makeLeaf("SUB",yylineno);return SUB;}
{MUL} {yylval.a=makeLeaf("MUL",yylineno);return MUL;}
{DIV} {yylval.a=makeLeaf("DIV",yylineno);return DIV;}
{AND} {yylval.a=makeLeaf("AND",yylineno);return AND;}
{OR} {yylval.a=makeLeaf("OR",yylineno);return OR;}
{NOT} {yylval.a=makeLeaf("NOT",yylineno);return NOT;}
{DOT} {yylval.a=makeLeaf("DOT",yylineno);return DOT;}
{TYPE} {yylval.a=makeLeaf("TYPE",yylineno);return TYPE;}
{STRUCT} {yylval.a=makeLeaf("STRUCT",yylineno);return STRUCT;}
{RETURN} {yylval.a=makeLeaf("RETURN",yylineno);return RETURN;}
{IF} {yylval.a=makeLeaf("IF",yylineno);return IF;}
{ELSE} {yylval.a=makeLeaf("ELSE",yylineno);return ELSE;}
{WHILE} {yylval.a=makeLeaf("WHILE",yylineno);return WHILE;}
{IDENTIFIER} {yylval.a=makeLeaf("IDENTIFIER",yylineno);yylval.a->syn_kind = MVARIABLE;return ID;}
{NOTE} {/*printf("\n %s\n",yytext);*/}
{ERROR} {printf("Error type A at line %d : Mysterious character '%s'\n",yylineno,yytext);}
%%
int yywrap(){
    return 1;
}
