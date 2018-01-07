%locations
%{
    #include<stdio.h>
    #include<stdlib.h>
    #include<unistd.h>
    #include"data.h"
%}
%union{
    struct syntax_node *a;
    double d;
}
%token <a> INT 
%token <a> FLOAT
%token <a> CHAR 
%token <a> ID
%token <a> SEMI
%token <a> COMMA
%token <a> ASSGN
%token <a> DOT
%token <a> TYPE
%token <a> LP RP LB RB LC RC
%token <a> STRUCT RETURN
%token <a> IF ELSE
%token <a> WHILE 
%token <a> PLUS SUB MUL DIV
%token <a> RELOP
%token <a> AND OR NOT ASSIGN
/*type*/
%type <a> Program ExtDefList ExtDef ExtDecList Specifier FunDec CompSt  VarDec StructSpecifier OptTag Tag VarList ParamDec Stmt Exp StmtList DefList Def Dec DecList Args
/*proority*/

%right ASSIGN
%left OR
%left AND
%left RELOP
%left PLUS SUB
%left MUL DIV
%right NOT
%left DOT
%left LB RB
%left LP RP
%nonassoc LOWER_THAN_ELSE
%nonassoc ELSE
%%
//High-level Definitions
Program:ExtDefList {$$= makeNode1("Program",$1);printf("print the syntax tree:\n");print($$,0);printf("syntax tree over\n>print the symbal table\n");
       struct s_symbal *Headp = (struct s_symbal *)malloc(sizeof(struct s_symbal));
       Headp->name = (char *)malloc(sizeof(char)*20);
       searchTreeDef($$,&Headp);printSymbal(Headp);
       searchTreePro($$,Headp);
       }
       ;
ExtDefList:{$$=makeLeaf("ExtDefList",-1);}
          |ExtDef ExtDefList {$$=makeNode2("ExtDefList",$1,$2);}
          ;
ExtDef:Specifier ExtDecList SEMI {$$=makeNode3("ExtDef",$1,$2,$3);$2->idtype = $1->syntax_value;}
      |Specifier SEMI {$$=makeNode2("ExtDef",$1,$2);}
      |Specifier FunDec CompSt {$$=makeNode3("ExtDef",$1,$2,$3);$2->idtype = $1->syntax_value;}
      |error SEMI {yyerrok;}
      ;
ExtDecList:VarDec {$$=makeNode1("ExtDecList",$1);$$->syntax_value = $1->syntax_value;$$->syn_type = $1->syn_type;}
          |VarDec COMMA ExtDecList {$$=makeNode3("ExtDecList",$1,$2,$3);$$->syntax_value = $1->syntax_value;$$->syn_type = $1->syn_type;}
          |error SEMI {yyerrok;}
          ;
//Specifier
Specifier:TYPE {$$=makeNode1("Specifier",$1);$$->syntax_value = $1->syntax_value;}
         |StructSpecifier {$$=makeNode1("Specifier",$1);$$->syntax_value = $1->syntax_value;}
         ;
StructSpecifier:STRUCT OptTag LC DefList RC {$$=makeNode5("StructSpecifier",$1,$2,$3,$4,$5);$$->syntax_value = $1->syntax_value;}
               |STRUCT Tag {$$=makeNode2("StructSpecifier",$1,$2);$$->syntax_value = $1->syntax_value;}
               ;
OptTag: {$$=makeLeaf("OptTag",-1);}
      |ID {$$=makeNode1("OptTag",$1);}
      ;
Tag:ID {$$=makeNode1("Tag",$1);}
   ;
//Declarators
VarDec:ID {$$=makeNode1("VarDec",$1);$$->syntax_value = $1->syntax_value;$$->idtype = $1->idtype;$$->syn_type = 1;}
      |VarDec LB INT RB {$$=makeNode4("VarDec",$1,$2,$3,$4);$$->syntax_value = $1->syntax_value;$$->idtype = $1->idtype;$$->syn_type = 2;}
      ;
FunDec:ID LP VarList RP {$$=makeNode4("FunDec",$1,$2,$3,$4);$$->syntax_value = $1->syntax_value;$$->syn_type = 3;$1->syn_type = 3;}
      |ID LP RP {$$=makeNode3("FunDec",$1,$2,$3);$$->syntax_value = $1->syntax_value;$$->syn_type = 3;$1->syn_type = 3;}
      ;
VarList:ParamDec COMMA VarList {$$=makeNode3("VarList",$1,$2,$3);}
       |ParamDec {$$=makeNode1("VarList",$1);}
       ;
ParamDec:Specifier VarDec {$$=makeNode2("ParamDec",$1,$2);}
        ;
//Statements
CompSt:LC DefList StmtList RC {$$=makeNode4("CompSt",$1,$2,$3,$4);}
      |error RC {yyerrok;}
      ;
StmtList: {$$=makeLeaf("StmtList",-1);}
        |Stmt StmtList {$$=makeNode2("StmtList",$1,$2);}
        ;
Stmt:Exp SEMI {$$=makeNode2("Stmt",$1,$2);}
    |CompSt {$$=makeNode1("Stmt",$1);}
    |RETURN Exp SEMI {$$=makeNode3("Stmt",$1,$2,$3);}
    |IF LP Exp RP Stmt %prec LOWER_THAN_ELSE {$$=makeNode5("Stmt",$1,$2,$3,$4,$5);}
    |IF LP Exp RP Stmt ELSE Stmt {$$=makeNode7("Stmt",$1,$2,$3,$4,$5,$6,$7);}
    |WHILE LP Exp RP Stmt {$$=makeNode5("Stmt",$1,$2,$3,$4,$5);}
    |error SEMI {yyerrok;}
    ;
//LocalDefinitions
DefList : {$$=makeLeaf("DefList",-1);}
        |Def DefList {$$=makeNode2("DefList",$1,$2);}
        ;
Def:Specifier DecList SEMI {$$=makeNode3("Def",$1,$2,$3);$2->idtype = $1->syntax_value;}
   |Specifier SEMI;
   ;
DecList:Dec {$$=makeNode1("DecList",$1);$$->syntax_value = $1->syntax_value;$$->idtype = $1->idtype;$$->syn_type = $1->syn_type;}
       |Dec COMMA DecList {$$=makeNode3("DecList",$1,$2,$3);$$->syntax_value = $1->syntax_value;$$->idtype = $1->idtype;$$->syn_type = $1->syn_type;}
       ;
Dec:VarDec {$$=makeNode1("Dec",$1);$$->syntax_value = $1->syntax_value;$$->idtype = $1->idtype;$$->syn_type = $1->syn_type;}
   |VarDec ASSIGN Exp {$$=makeNode3("Dec",$1,$2,$3);$$->syntax_value = $1->syntax_value;}
   |error SEMI {yyerrok;}
   ;
//Expressions
Exp:Exp ASSIGN Exp {$$=makeNode3("Exp",$1,$2,$3);}
   |Exp AND Exp {$$=makeNode3("Exp",$1,$2,$3);}
   |Exp OR Exp {$$=makeNode3("Exp",$1,$2,$3);}
   |Exp RELOP Exp {$$=makeNode3("Exp",$1,$2,$3);}
   |Exp PLUS Exp {$$=makeNode3("Exp",$1,$2,$3);}
   |Exp SUB Exp {$$=makeNode3("Exp",$1,$2,$3);}
   |Exp MUL Exp {$$=makeNode3("Exp",$1,$2,$3);}
   |Exp DIV Exp {$$=makeNode3("Exp",$1,$2,$3);}
   |LP Exp RP {$$=makeNode3("Exp",$1,$2,$3);}
   |SUB Exp {$$=makeNode2("Exp",$1,$2);}
   |NOT Exp {$$=makeNode2("Exp",$1,$2);}
   |ID LP Args RP {$$=makeNode4("Exp",$1,$2,$3,$4);$1->syn_type = 3;}
   |ID LP RP {$$=makeNode3("Exp",$1,$2,$3);$1->syn_type = 3;}
   |Exp LB Exp RB {$$=makeNode4("Exp",$1,$2,$3,$4);}
   |Exp DOT ID {$$=makeNode3("Exp",$1,$2,$3);}
   |ID {$$=makeNode1("Exp",$1);$$->syntax_value = $1->syntax_value;$$->idtype = $1->idtype;}
   |INT {$$=makeNode1("Exp",$1);$$->syn_type = 0;$$->idtype = "int";}
   |FLOAT {$$=makeNode1("Exp",$1);$$->syn_type = 0;$$->idtype = "float";}
   ;
Args:Exp COMMA Args {$$=makeNode3("Args",$1,$2,$3);}
    |Exp {$$=makeNode1("Args",$1);}
    ;
%%
#include"lex.yy.c"
int main(){
 //   struct s_symbal *Headp = (struct s_symbal *)malloc(sizeof(struct s_symbal));
 //  struct s_symbal *Tailp = Headp;
    printf(">");
    yyparse();
}
