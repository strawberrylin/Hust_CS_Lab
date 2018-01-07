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

typedef enum{NCONSTANT,NVARIABLE,NARRAY,NFUNCTION,NSTRUCT}SYN_TYPE;
typedef enum{MVARIABLE = 1,MARRAY,MFUNCTION,MSTRUCT}SYM_TYPE;

extern int yylineno;   //行号
extern int yycolumn;   //列号
extern char* yytext;
void yyerror(char *s,...);
struct syntax_node{         //节点结构
    int line;               //行号 
    char *name;         //语法单元的名字
    SYN_TYPE syn_type;  //语法单元的类型
    char *syntax_value;     //语义值
    char *idtype;
    struct syntax_node *l;  //左子树指针
    struct syntax_node *r;  //右子树指针
    union{          //共用联合体存放值
        int int_dex;
        float float_dex;
    };
};
struct s_symbal{
    SYM_TYPE sym_type;      //符号类型
    int line;
    char *name;             //符号名,与syntax_value对应
    char *idtype;             //符号类型名，与idtype对应
    int area;               //作用域
    char *type_rtn;         //如果是函数有返回值类型
    char *num_arg;          //函数有参数个数
    int  isFucDefine;              //函数是否定义
    struct s_symbal *next;  //指向下一个节点的指针
};
//#######################语法树相关操作############################
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
void makeSymbal(struct s_symbal **,int ,struct syntax_node *,int area);
int searchLinkDec(struct s_symbal *,char *,int area);
int searchLinkExp(struct s_symbal *,char *,int area);
char *judeMatchType(struct syntax_node *);
char *getExpType(struct s_symbal *,char *,int area);
void printSymbal(struct s_symbal *);
//######################栈前序遍历##############################
int searchTreeVar(struct syntax_node *,struct s_symbal **,char *,int area);
int searchTreeFunc(struct syntax_node *,struct s_symbal **,char *,int area);
int searchTreeDef(struct syntax_node *,struct s_symbal **);
int searchTreeStm(struct syntax_node *,struct s_symbal *,char *,int area);
int searchTreeExp(struct syntax_node *,struct s_symbal *,char *,int area);
int searchTreePro(struct syntax_node *,struct s_symbal *);
int searchExpTypeL(struct syntax_node *,struct s_symbal *,char *,int area);
int searchExpTypeH(struct syntax_node *,struct s_symbal *,char *,int area);

#endif
