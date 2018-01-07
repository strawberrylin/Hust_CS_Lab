/*************************************************************************
> File Name: tree.c
> Author: strawberrylin
> Github: https://github.com/strawberrylin
> Created Time: 2016年11月03日 星期四 09时05分10秒
************************************************************************/

#include"data.h"
#include<stdarg.h>
int i;
struct node *makeLeaf(char *name,int line){
    struct node *a = (struct node *)malloc(sizeof(struct node));
    if(!a){
        yyerror("no space\n");
        exit (0);
    }
    a->name = name;
    a->line = line;
    if((!strcmp(a->name,"IDENTIFIER"))||(!strcmp(a->name,"TYPE"))){
        char *p;
        p = (char *)malloc(sizeof(char)*40);
        strcpy(p,yytext);
        a->idtype=p;
    }
    else if(!strcmp(a->name,"INT")){
        a->int_dex=atoi(yytext);
    
    }else if(!strcmp(a->name,"FLOAT")){
        a->float_dex=atof(yytext);
    } 
    return a;
}
//构造抽象语法树函数
struct node *makeNode1(char *name,struct node *p){
    struct node *a=(struct node *)malloc(sizeof(struct node)); //新生成的父结点
    if(!a){
        yyerror("no space\n");
        exit (0);
    }
    a->name=name;
    a->l=p;
    a->line=p->line;
    return a;
}
struct node *makeNode2(char *name,struct node *p1,struct node *p2){
    struct node *a = (struct node *)malloc(sizeof(struct node));
    struct node *temp=(struct node *)malloc(sizeof(struct node));//子节点
    if((!a)||(!temp)){
        yyerror("no space\n");
        exit (0);
    }
    temp = p1;
    a->name = name;
    a->l = p1;
    a->line = p1->line;
    temp->r = p2;
    temp=temp->r;
    return a;
}
struct node *makeNode3(char *name,struct node *p1,struct node *p2,struct node *p3){
    struct node *a = (struct node *)malloc(sizeof(struct node));
    struct node *temp=(struct node *)malloc(sizeof(struct node));//子节点
    if((!a)||(!temp)){
        yyerror("no space\n");
        exit (0);
    } 
    temp = p1;
    a->name = name;
    a->l = p1;
    a->line = p1->line;
    temp->r = p2;
    temp = temp->r;
    temp->r = p3;
    temp = temp->r;
    return a;
}
struct node *makeNode4(char *name,struct node *p1,struct node *p2,struct node *p3,struct node *p4){
    struct node *a = (struct node *)malloc(sizeof(struct node));
    struct node *temp=(struct node *)malloc(sizeof(struct node));//子节点
    if((!a)||(!temp)){
        yyerror("no space\n");
        exit (0);
    } 
    temp = p1;
    a->name = name;
    a->l = p1;
    a->line = p1->line;
    temp->r = p2;
    temp = temp->r;
    temp->r = p3;
    temp = temp->r;
    temp->r = p4;
    temp = temp->r;
    return a;
}
struct node *makeNode5(char *name,struct node *p1,struct node *p2,struct node *p3,struct node *p4,
                      struct node* p5){
    struct node *a = (struct node *)malloc(sizeof(struct node));
    struct node *temp=(struct node *)malloc(sizeof(struct node));//子节点
    if((!a)||(!temp)){
        yyerror("no space\n");
        exit (0);
    } 
    temp = p1;
    a->name = name;
    a->l = p1;
    a->line = p1->line;
    temp->r = p2;
    temp = temp->r;
    temp->r = p3;
    temp = temp->r;
    temp->r = p4;
    temp = temp->r;
    temp->r = p5;
    temp = temp->r;
    return a;
}
struct node *makeNode6(char *name,struct node *p1,struct node *p2,struct node *p3,struct node *p4,
                      struct node* p5,struct node *p6){
    struct node *a = (struct node *)malloc(sizeof(struct node));
    struct node *temp=(struct node *)malloc(sizeof(struct node));//子节点
    if((!a)||(!temp)){
        yyerror("no space\n");
        exit (0);
    } 
    temp = p1;
    a->name = name;
    a->l = p1;
    a->line = p1->line;
    temp->r = p2;
    temp = temp->r;
    temp->r = p3;
    temp = temp->r;
    temp->r = p4;
    temp = temp->r;
    temp->r = p5;
    temp = temp->r;
    temp->r = p6;
    temp = temp->r;
    return a;
}
struct node *makeNode7(char *name,struct node *p1,struct node *p2,struct node *p3,struct node *p4,
                      struct node* p5,struct node *p6,struct node *p7){
    struct node *a = (struct node *)malloc(sizeof(struct node));
    struct node *temp=(struct node *)malloc(sizeof(struct node));//子节点
    if((!a)||(!temp)){
        yyerror("no space\n");
        exit (0);
    } 
    temp = p1;
    a->name = name;
    a->l = p1;
    a->line = p1->line;
    temp->r = p2;
    temp = temp->r;
    temp->r = p3;
    temp = temp->r;
    temp->r = p4;
    temp = temp->r;
    temp->r = p5;
    temp = temp->r;
    temp->r = p6;
    temp = temp->r;
    temp->r = p7;
    temp = temp->r;
    return a;
}

void print(struct node *a,int level){
    if(a){
        for(i=0;i<level;++i){
            printf("  ");
        }
        if(a->line!=-1){
            printf("%s",a->name);    //打印语法单元的名字
            if((!strcmp(a->name,"IDENTIFIER"))|(!strcmp(a->name,"TYPE"))){
                printf(":%s",a->idtype);
            }
            else if(!strcmp(a->name,"INT")){
                printf(":%d",a->int_dex);
            }
            else if(!strcmp(a->name,"FLOAT")){
                printf(":%f",a->float_dex);
            }
            else{
                printf("(%d)",a->line);
            }
        }
        printf("\n");
        print(a->l,level+1);    //遍历左子树
        print(a->r,level);       //遍历右子树
    }
}
void yyerror(char *s,...){
    va_list ap;
    va_start(ap,s);
    printf(s,ap);
    printf(": Line %d : column %d :error: \"%s\" ",yylineno,yycolumn,yytext);
    printf("\n");
}
