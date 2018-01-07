/*************************************************************************
  > File Name: makeSymbal.c
  > Author: Strawberrylin 
  > Github: https://github.com/strawberrylin 
  > Created Time: 2016年11月15日 星期二 22时49分17秒
 ************************************************************************/
#include"data.h"
int searchTreeVar(struct syntax_node *head,struct s_symbal **heads,char *id,int area){
    struct syntax_node *stack[200], *p;
    struct s_symbal *headem = *heads;
    int top = -1;
    if(head){
        top ++;
        stack[top]=head;
        while(top>-1){
            p = stack[top];
            top--;
            if(!(strcmp(p->name,id))){
                if(searchLinkDec(headem,p->syntax_value,area)){
                    //p->idtype = head->idtype;
                    if(!(strcmp(p->idtype,"struct"))){
                        p->syn_type = MSTRUCT;
                    }
                    makeSymbal(heads,p->syn_type,p,area);
                }
            }
            if(p->l){
                top++;
                stack[top] = p->l;
            }
            if(p->r){
                top++;
                stack[top] = p->r;
            }
        }
    }
    return TRUE;
}
int searchTreeFunc(struct syntax_node *head,struct s_symbal **heads,char *id,int area){
    struct syntax_node *stack[200], *p;
    struct s_symbal *headem = *heads;
    int top = -1;
    if(head){
        top ++;
        stack[top]=head;
        while(top>-1){
            p = stack[top];
            top--;
            if(!(strcmp(p->name,id))){
                if(searchLinkDec(headem,p->syntax_value,area)){
                    p->idtype = head->idtype;
                    makeSymbal(heads,p->syn_type,p,area);
                }
            }
            if(p->l){
                top++;
                stack[top] = p->l;
            }
            if(p->r){
                top++;
                stack[top] = p->r;
            }
        }
    }
    return TRUE;
}
int searchTreeExp(struct syntax_node *head,struct s_symbal *heads,char *exp,int area){
    struct syntax_node *stack[200], *p;
    struct s_symbal *headem = heads;
    int top = -1;
    int vf_lable = 0; //0 Var, 1 Func
    int def_lable = 0;
    if(head){
        top ++;
        stack[top]=head;
        while(top>-1){
            p = stack[top];
            top--;
            if(!(strcmp(p->name,exp))){
                if(p->r){
                    vf_lable = 1;
                }
                if(!searchLinkExp(headem,p->syntax_value,area)){
                    if(vf_lable){
                        printf("Error Type 2 at line %d : Undefined Function '%s' .\n",p->line,p->syntax_value);
                        vf_lable = 0;
                        def_lable = 1;
                    }
                    else{
                        printf("Error Type 1 at line %d : Undefined Vardec '%s' .\n",p->line,p->syntax_value);
                        def_lable = 1;
                    }
                } 
            }
            if(p->l){
                top++;
                stack[top] = p->l;
            }
            if(p->r){
                top++;
                stack[top] = p->r;
            }
        }
    }
    return def_lable;
}
int searchExpTypeL(struct syntax_node *head,struct s_symbal *heads,char *exp,int area){
    struct syntax_node *stack[200], *p;
    struct s_symbal *headem = heads;
    int top = -1;
    if(head){
        top ++;
        stack[top]=head;
        while(top>-1){
            p = stack[top];
            top--;
            if((!(strcmp(p->name,exp)))&&(!strcmp(p->l->name,"IDENTIFIER"))){
                p->idtype = getExpType(headem,p->l->syntax_value,area);
            }
            if(p->l){
                top++;
                stack[top] = p->l;
            }
            if(p->r){
                top++;
                stack[top] = p->r;
            }
        }
    }
    return TRUE;
}
int searchExpTypeH(struct syntax_node *head,struct s_symbal *heads,char *exp,int area){
    struct syntax_node *stack[200], *p;
    //struct s_symbal *headem = heads;
    int top = -1;
    if(head){
        top ++;
        stack[top]=head;
        while(top>-1){
            p = stack[top];
            top--;
            if((!(strcmp(p->name,exp)))&&(strcmp(p->l->name,"IDENTIFIER"))){
                if(!strcmp(p->l->l->name,"IDENTIFIER")){
                    p->idtype = p->l->idtype;
                }
                else if(!(strcmp(p->l->l->name,"Exp"))){
                    p->idtype = p->l->l->idtype;
                }
            }
            if(p->l){
                top++;
                stack[top] = p->l;
            }
            if(p->r){
                top++;
                stack[top] = p->r;
            }
        }
    }
    return TRUE;
}
int searchTreeStm(struct syntax_node *head,struct s_symbal *heads,char *exp,int area){
    struct syntax_node *stack[200], *p;
    //struct s_symbal *headem = heads;
    int top = -1;
    if(head){
        top ++;
        stack[top]=head;
        while(top>-1){
            p = stack[top];
            top--;
            if(!(strcmp(p->name,exp))){
                if(p->l){
                    if(!strcmp(p->l->name,"RETURN")){
                        if((!strcmp(p->l->r->l->name,"INT"))||(!strcmp(p->l->r->l->name,"FLOAT"))){
                            if(!strcmp(head->idtype,p->l->r->l->idtype)){
                                return TRUE;
                            }
                            else{
                                printf("Error Type 8 at line %d : Mismatched return type for function\n",p->line);
                                return FALSE;
                            }
                        }
                        return FALSE;
                    }
                    else if(!strcmp(p->l->name,"Exp")){
                        if(!searchTreeExp(p->l,heads,"IDENTIFIER",area)){
                            //TODO with type match
                            searchExpTypeL(p->l,heads,"Exp",area);
                            searchExpTypeH(p->l,heads,"Exp",area);
                            if(!strcmp(judeMatchType(p->l),"error")){
                                printf("Error Type 5 at %d : Mismatched Expression\n",p->line);
                            }
                        }
                    }
                }
            }
            if(p->l){
                top++;
                stack[top] = p->l;
            }
            if(p->r){
                top++;
                stack[top] = p->r;
            }
        }
    }
    return TRUE;
}
int searchTreePro(struct syntax_node *head,struct s_symbal *heads){
    struct syntax_node *stack[200], *p;
    int area = 1;
    int top = -1;
    if(head){
        top ++;
        stack[top]=head;
        while(top>-1){
            p = stack[top];
            top--;
            if(!(strcmp(p->name,"FunDec"))){
                //TODO with func dec
                searchTreeStm(p,heads,"Stmt",area ++);
            }
            if(p->l){
                top++;
                stack[top] = p->l;
            }
            if(p->r){
                top++;
                stack[top] = p->r;
            }
        }
    }
    return TRUE;
}
char *judeMatchType(struct syntax_node * head){
    if(!strcmp(head->l->name,"Exp")){
        return judeMatchType(head->l);
    }
    if(head->r){
        if(!strcmp(head->idtype,judeMatchType(head->r->r))){
            return head->idtype;
        }
        else return "error";
    }
    else return head->idtype;
}
int searchTreeDef(struct syntax_node *head,struct s_symbal **heads){
    struct syntax_node *stack[200], *p;
    //int temp;
    int area = 1;
    int top = -1;
    if(head){
        top ++;
        stack[top]=head;
        while(top>-1){
            p = stack[top];
            top--;
            if(!(strcmp(p->name,"ExtDecList"))){
                //TODO with all dec 
                searchTreeVar(p,heads,"ExtDecList",0);
            }
            else if(!(strcmp(p->name,"FunDec"))){
                //TODO with func dec
                searchTreeFunc(p,heads,"FunDec",area);
                searchTreeVar(p,heads,"DecList",area++);
            }
            else if(!(strcmp(p->name,"StructSpecifier"))){
                //TODO with struct dec
            }
            if(p->l){
                top++;
                stack[top] = p->l;
            }
            if(p->r){
                top++;
                stack[top] = p->r;
            }
        }
    }
    return TRUE;
}
int searchLinkDec(struct s_symbal *head,char *id,int area){
    struct s_symbal *p =head;
    while(p){
        if(!(strcmp(p->name,id))){
            if(p->area==area){
                printf("Error Type 3 at line %d : Redefined Variable '%s' .\n",p->line,p->name);
                return FALSE;
            }
            if(p->sym_type == MFUNCTION){
                printf("Error Type 4 at line %d : Redifined Function '%s' .\n",p->line,p->name);
                return FALSE;
            }
        }
        p = p->next;
    }
    return TRUE;
}
int searchLinkExp(struct s_symbal *head,char *id,int area){
    struct s_symbal *p =head;
    while(p){
        if(!strcmp(p->name,id)){
            if((p->area == area)||(p->area == 0)){
                return TRUE;
            }
            if(p->sym_type == MFUNCTION){
                return TRUE;
            }
        }
        p = p->next;
    }
    return FALSE;
}
char *getExpType(struct s_symbal *head,char *id,int area){
    struct s_symbal *p =head;
    while(p){
        if(!strcmp(p->name,id)){
            if((p->area == area)||(p->area == 0)){
                return p->idtype;
            }
            if(p->sym_type == MFUNCTION){
                return p->type_rtn;
            }
        }
        p = p->next;
    }
    return "error";
}
void makeSymbal(struct s_symbal **heads,int SYN_TYPE,struct syntax_node *p,int area){
    struct s_symbal *a = (struct s_symbal *)malloc(sizeof(struct s_symbal));
    struct s_symbal *head = *heads;
    switch(SYN_TYPE){
        case MVARIABLE:
            a->name = p->syntax_value;
            a->idtype = p->idtype;
            a->line = p->line; 
            a->area = area;
            a->sym_type = MVARIABLE;
            a->next = head->next;
            head->next = a;
            *heads = head;
            break;
        case MARRAY:
            a->name = p->syntax_value;
            a->idtype = p->idtype;
            a->line = p->line; 
            a->area = area;
            a->sym_type = MARRAY;
            a->next = head->next;
            head->next = a;
            *heads = head;
            break;
        case MFUNCTION:
            a->name = p->syntax_value;
            a->type_rtn = p->idtype;
            a->line = p->line;
            a->area = area;
            a->sym_type = MFUNCTION;
            a->next = head->next;
            head->next = a;
            *heads = head;
            break;
        case MSTRUCT:
            a->name = p->syntax_value;
            a->idtype = p->idtype;
            a->line = p->line; 
            a->area = area;
            a->sym_type = MSTRUCT;
            a->next = head->next;
            head->next = a;
            *heads = head;
            break;
    }
}
void printSymbal(struct s_symbal *head){
    struct s_symbal *p = head->next;
    printf("symbal    line      area      sym_type    type      rt_type \n");
    while(p){
        if(p->sym_type == MVARIABLE){
            printf("%-10s%-10d%-10d%-13d%-10s\n",p->name,p->line,p->area,p->sym_type,p->idtype);
        }
        else if(p->sym_type == MARRAY){
            printf("%-10s%-10d%-10d%-13d%-10s\n",p->name,p->line,p->area,p->sym_type,p->idtype);
        }
        else if(p->sym_type == MFUNCTION){
            printf("%-10s%-10d%-10d%-13d%-10s%-10s\n",p->name,p->line,p->area,p->sym_type," ",p->type_rtn);
        }else if(p->sym_type == MSTRUCT){
            printf("%-10s%-10d%-10d%-13d%-10s\n",p->name,p->line,p->area,p->sym_type,p->idtype);
        }
        p = p->next;
    }
}
