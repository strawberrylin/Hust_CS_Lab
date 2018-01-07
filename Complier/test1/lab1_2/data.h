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

extern int yylineno;   //行号
extern int yycolumn;   //列号
extern char* yytext;
void yyerror(char *s,...);
struct node{         //节点结构
    int line;       
    char *name;
    struct node *l;  //左子树指针
    struct node *r;  //右子树指针
    union{          //共用联合体存放值
        char *idtype;
        int int_dex;
        float float_dex;
    };

};
struct node *makeLeaf(char *,int);
struct node *makeNode1(char * ,struct node *);   //构造抽象语法树函数，采用变长参数
struct node *makeNode2(char * ,struct node *,struct node * );
struct node *makeNode3(char * ,struct node * ,struct node *,struct node *);
struct node *makeNode4(char * ,struct node * ,struct node *,struct node *,struct node *);
struct node *makeNode5(char * ,struct node * ,struct node *,struct node *,struct node *,struct node *);
struct node *makeNode6(char * ,struct node * ,struct node *,struct node *,struct node *,struct node *,struct node *);
struct node *makeNode7(char * ,struct node * ,struct node *,struct node *,struct node *,struct node *,struct node *,struct node *);
void print(struct node*,int level);           //遍历函数,level为树的高度
#endif
