%option yylineno
%{
    int wordCount = 0;
    int numCount = 0;
%}
digit [1-9]+[0-9]*|0
NUMBER [+-]?({digit}*\.?{digit}+|{digit}+\.)
char [A-Za-z\_]
WORD {char}+
SPACE [\t\v\n\0]
WHILE while
INT int
FLOAT float
CHAR char
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
DOT \,|\;|\'|\"
TYPE int|float|void

OPERATOR \=|\<|\>|(!\=)|(\<\=)|(\>\=)|(\=\=)|({PLUS}{PLUS})|({SUB}{SUB})
IDENTIFIER {char}|((_|{char})({char}|{digit}|_)*)
KEYWORD {IF}|{ELSE}|{FOR}|{INT}|{FLOAT}|{CHAR}|begin|end|break|return|void
NOTE ("//".*)|("/*"(.|\n)*"*/")
INCLUDE #include<({WORD}|{WORD}.h)>
DEFINE #define 
FUNCTION ({TYPE}(main|{IDENTIFIER}){KH})
KH  {SL}(\s*){SR}
BOUND {SR}|{SL}|{LR}|{LL}|{MR}|{ML}
ERROR [~]|[@]|[$][。]|[，]|[；]
%%
{FUNCTION} {printf("Line %d: Function\t %s\n",yylineno,yytext);wordCount++;}
{KH} {printf("Line %d: KuoHu\t %s\n",yylineno,yytext);wordCount++;}
{BOUND} {printf("Line %d: Bounder\t %s\n",yylineno,yytext);wordCount++;}
{KEYWORD} {printf("Line %d: Keyword\t %s\n",yylineno,yytext);wordCount++;}
{IDENTIFIER} {printf("Line %d: Identifier\t %s\n",yylineno,yytext);wordCount++;}
{digit} {printf("Line %d: Num\t %s\n",yylineno,yytext);numCount++;}
{SPACE}+ {}
{DOT} {printf("Line %d: Dot\t %s\n",yylineno,yytext);wordCount++;}
{NOTE} {printf("Line %d: NOTE\t %s\n",yylineno,yytext);}
{INCLUDE} {printf("Line %d: Headinclude\t %s\n",yylineno,yytext);wordCount++;}
{OPERATOR} {printf("Line %d: Operator\t %s\n",yylineno,yytext);wordCount++;}
{ERROR} {printf("Error type A at line %d : Mysterious character : '%s'\n",yylineno,yytext);}
%%
int yywrap(){
    return 1;
}
int main(){
    yylex();
    printf("WordCount: %d\tNumCount: %d\n",wordCount,numCount);
    return 0;
}
