%{
    #include"stdio.h"
    void yyerror(const char *s);
%}
%token INT
%token FLOAT
%token CHAR
%token ADD SUB MUL DIV
%token IDENTIFIER SEMI TYPE

%left '+'
%left '*'
%%
type:TYPE IDENTIFIER SEMI
    ;
%%

#include "lex.yy.c"
void yyerror(const char *s)
{
    fprintf(stderr,"error:%s\n",s);
}
int main()
{
    yyparse();
    return 0;
}
