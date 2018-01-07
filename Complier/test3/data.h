/*************************************************************************
	> File Name: tree.h
	> Author: strawberrylin
	> Github: https://github.com/strawberrylin
	> Created Time: 2016年11月02日 星期三 21时43分21秒
 ************************************************************************/

#ifndef _TREE_H
#define _TREE_H
#include<stdio.h>
#include<stdlib.h>
#include<string.h>

#define TRUE 1
#define FALSE 0

typedef enum{NCONSTANT,NVARIABLE,NARRAY,NFUNCTION,NSTRUCT}SYN_KIND;
typedef enum{MCONSTANT,MVARIABLE,MARRAY,MFUNCTION,MSTRUCT}SYM_KIND;

extern int yylineno;   //行号
extern int yycolumn;   //列号

extern char* yytext;
void yyerror(char *s,...);

//域结构定义
struct scope{
    struct symbal_node *symbal_head;
    char *scope_kind;
    struct syntax_node *block;
};

//参数结构定义
struct args{
    char *name;
    char *type;
    int  arg_num;
    struct args *next;
};

//语法单元结构定义
struct syntax_node{         //节点结构
    int line;               //行号 
    char *name;         //语法单元的名字
    int id_no;      //id号
    SYN_KIND syn_kind;  //语法单元的类型
    char *syntax_value;     //语义值
    char *idtype;           //int or float
    struct args *args;      //函数参数链表
    struct scope *scope;    //作用域
    struct syntax_node *l;  //左子树指针
    struct syntax_node *r;  //右子树指针
    union{          //constant共用联合体存放值
        int int_dex;
        float float_dex;
    };
};

//符号表结构定义 
struct symbal_node{
    SYM_KIND sym_kind;      //variable,array,function,struct
    int line;
    int id_no;              //id号
    char *name;             //符号名,与syntax_value对应
    char *idtype;             // idtype,int or float
    int  size;
    int num_arg;          //函数有参数个数
    struct symbal_node *next;  //指向下一个节点的指针
};

//栈结构定义
struct stack{
    struct scope *elemts[20];
    int top;
};

//中间代码结构定义
typedef struct Operand_* Operand;

struct Operand_ {
    enum{CONSTANT,VARIABLE,ADDRSS} kind;
    union{
        int var_no;
        int valuei;
        float valuef;
    } u;
};

struct InterCode{
    enum{ASSIGNOP,ADDOP,SUBOP,MULOP,DIVOP,RELOPS,GOTOOP,LABLE,FUNDEC,FUNCALL,VARLIST}op_kind;
    union{
        struct {Operand right,left;} assign;
        struct {Operand result,op1,op2;} binop;
        struct {Operand right,left;char * op;int lable_true;} relop;
        int goto_lable;
        char *funcname;
        int arg_no;
    }u;
};

struct InterCodes{
    struct InterCode *code;
    struct InterCodes *prev,*next;
};
//#######################语法树相关操作###########################

struct syntax_node *makeLeaf(char *,int);
struct syntax_node *makeNode1(char * ,struct syntax_node *);  
struct syntax_node *makeNode2(char * ,struct syntax_node *,struct syntax_node * );
struct syntax_node *makeNode3(char * ,struct syntax_node * ,struct syntax_node *,struct syntax_node *);
struct syntax_node *makeNode4(char * ,struct syntax_node * ,struct syntax_node *,struct syntax_node *,struct syntax_node *);
struct syntax_node *makeNode5(char * ,struct syntax_node * ,struct syntax_node *,struct syntax_node *,struct syntax_node *,struct syntax_node *);
struct syntax_node *makeNode6(char * ,struct syntax_node * ,struct syntax_node *,struct syntax_node *,struct syntax_node *,struct syntax_node *,struct syntax_node *);
struct syntax_node *makeNode7(char * ,struct syntax_node * ,struct syntax_node *,struct syntax_node *,struct syntax_node *,struct syntax_node *,struct syntax_node *,struct syntax_node *);
void print(struct syntax_node*,int level);           //遍历函数,level为树的高度

//######################符号表相关操作###########################

void makeSymbal(struct syntax_node *ast_node);
int lookUp(struct symbal_node *heads,struct syntax_node *ast_node);
void printSymbal(struct symbal_node *heads);
void insertSymable(struct symbal_node *heads,struct syntax_node *ast_node);
void insertArgs(struct args *args_head,struct syntax_node *ast_node);
int analyseSymbal(struct syntax_node *ast_node);
void delVarlist(struct syntax_node *ast_node);
int analyseType(struct syntax_node *ast_head);
char *getExpType(struct syntax_node *exp_node);
int getExpKind(struct syntax_node *exp_node);

//#####################中间代码相关操作##########################

void translate(struct syntax_node * ast_node,struct InterCodes *ir);
struct Operand_ *translate_Exp(struct syntax_node *exp_head,struct InterCodes *ir);
struct Operand_ *translate_Cond(struct syntax_node *exp_head,struct InterCodes *ir,int lable_true,int lable_flase);
void insertInterCode(struct InterCodes *IRhead,struct InterCode * code);
void printIR(struct InterCodes *irhead);
char *get_relop(struct syntax_node *ast_node);
#endif
