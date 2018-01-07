/*************************************************************************
> File Name: makeSymbal.c
> Author: Strawberrylin 
> Github: https://github.com/strawberrylin 
> Created Time: 2016年12月12日 星期一 13时33分05秒
************************************************************************/
#include"data.h"

#define SYMBAL_PRINT
//#undef SYMBAL_PRINT

int id_cno ;
void makeSymbal(struct syntax_node *head){
    struct syntax_node *p;
    struct syntax_node *stack[20];
    char *type=(char *)malloc(sizeof(char)*10);
    int top = -1;
    int lable = 1;
    if(head){
        top ++;
        stack[top] = head->l; 
        while(top > -1){
            p = stack[top];
            top --; 
            if((!strcmp(p->name,"Def"))||(!strcmp(p->name,"ExtDef"))){//定义符号名获函数名，且不是函数参数
                type = p->l->l->syntax_value;
            }
            if(((!strcmp(p->name,"VarDec"))&&(p->l->syn_kind!=5))||(!strcmp(p->name,"FunDec"))){
                p->l->args = (struct args *)malloc(sizeof(struct args));
                p->l->args->arg_num = 0;
                if(!strcmp(p->name,"FunDec")){
                    if(!strcmp(p->l->r->r->name,"VarList")){
                        delVarlist(p->l);
                    }
                }
                if(strstr(type,"struct")){
                    p->l->syn_kind = NSTRUCT;
                }
                p->l->idtype = type;
                if(lookUp(head->scope->symbal_head,p->l)){
                    insertSymable(head->scope->symbal_head,p->l);
                }
                else{
                    if(p->l->syn_kind == 3){
                        printf("Error Type 4 at %d: Multidefined function '%s';\n",p->l->line,p->l->syntax_value);
                    }
                    else {
                        printf("Error Type 3 at %d: Multidefined symbal '%s';\n",p->l->line,p->l->syntax_value);
                    }
                }
            }

            if(!strcmp(p->name,"CompSt")){
                #ifdef SYMBAL_PRINT
                printf("a new block scope :\n");
                #endif
                p->scope->scope_kind = "BLOCK";
                makeSymbal(p);
                #ifdef SYMBAL_PRINT
                printSymbal(p->scope->symbal_head);
                printf("quit the scope\n\n");
                #endif
                lable = 0;
            }
            if(p->r){
                top ++;
                stack[top] = p->r;
            }
            if((p->l)&&lable){
                top++;
                stack[top] = p->l;
            }
lable = 1;
}
}
return;
}
int lookUp(struct symbal_node *heads,struct syntax_node *ast_node){
    struct symbal_node *p = heads->next; 
    while(p){
        if(!strcmp(p->name,ast_node->syntax_value)){//找到符号定义,获取属性值
            ast_node->syn_kind = p->sym_kind;
            ast_node->idtype = p->idtype;
            ast_node->line = p->line;
            ast_node->id_no = p->id_no;
            return FALSE;
        }
        p=p->next;
    }
    return TRUE;
}

void printSymbal(struct symbal_node *heads){
    struct symbal_node *p = heads->next;
    printf("name      idtype    lineno    kind      id_no     args\n\n");
    while(p){
        printf("%-10s%-10s%-10d%-10d%-10d",p->name,p->idtype,p->line,p->sym_kind,p->id_no);
        if(p->sym_kind == 3){
            printf("%-10d",p->num_arg);
        }
        printf("\n");
        p = p->next;
    }
}

void insertSymable(struct symbal_node *heads,struct syntax_node *ast_node){
    struct symbal_node *p = heads;

    while(p->next){
        p = p->next;
    }

    id_cno ++;

    struct symbal_node *temp_node = (struct symbal_node *)malloc(sizeof(struct symbal_node));
    temp_node->sym_kind = ast_node->syn_kind;
    temp_node->line = ast_node->line;
    temp_node->name = ast_node->syntax_value;
    temp_node->idtype = ast_node->idtype;
    temp_node->num_arg = ast_node->args->arg_num;
    temp_node->id_no = id_cno;
    p->next = temp_node;
}

void delVarlist(struct syntax_node *ast_node){
    struct syntax_node *p;
    struct syntax_node *stack[20];
    int top = -1;
    ast_node->args->arg_num = 0;    //统计函数参数个数
    if(ast_node){
        top++;
        stack[top] = ast_node;
        while(top>-1){
            p = stack[top--];
            if(!strcmp(p->name,"IDENTIFIER")){
                if(p->syn_kind!=3){
                    p->syn_kind = 5;   //函数参数代号
                    insertArgs(ast_node->args,p);
                    ast_node->args->arg_num ++;
                }
            }
            if(p->r){
                top++;
                stack[top] = p->r;
            }
            if(p->l){
                top++;
                stack[top] = p->l;
            }
        }
    }
    return ;
}

void insertArgs(struct args *args_head,struct syntax_node *ast_node){
    struct args *p = args_head;

    while(p->next){
        p = p->next;
    }

    struct args *temp_node = (struct args*)malloc(sizeof(struct args));
    temp_node->name = ast_node->syntax_value;
    temp_node->type = ast_node->idtype;
    p->next = temp_node;   
}
