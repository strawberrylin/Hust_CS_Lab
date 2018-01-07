/*************************************************************************
> File Name: makeIR.c
> Author: Strawberrylin 
> Github: https://github.com/strawberrylin 
> Created Time: 2016年12月19日 星期一 12时34分39秒
************************************************************************/

#include"data.h"

extern int id_cno;
int lable_id = 0;

void translate(struct syntax_node *ast_node,struct InterCodes *intercode){
    struct syntax_node *p;
    struct syntax_node *stack[100];
    int top =-1;
    int lablel =1;
    int labler =1;
    if(ast_node){
        top ++;
        stack[top] = ast_node;
        while(top>-1){
            p = stack[top--];
            if((!strcmp(p->name,"Exp"))&&(!strcmp(p->r->name,"SEMI"))){
                translate_Exp(p,intercode);
                lablel = 0;
            }
            if(!strcmp(p->name,"IF")){
                labler = 0;
                if(p->r->r->r->r->r){
                    int lable1 = lable_id++;
                    int lable2 = lable_id++;
                    int lable3 = lable_id++;
                    translate_Cond(p->r->r,intercode,lable1,lable2);
                    //lable1
                    struct InterCode *code1 = (struct InterCode *)malloc(sizeof(struct InterCode));
                    code1->op_kind = LABLE;
                    code1->u.goto_lable = lable1;
                    insertInterCode(intercode,code1);
                    translate(p->r->r->r->r->l,intercode);
                    //goto lable3
                    struct InterCode *code4 = (struct InterCode *)malloc(sizeof(struct InterCode));
                    code4->op_kind = GOTOOP;
                    code4->u.goto_lable = lable3;
                    insertInterCode(intercode,code4);
                    //lable2
                    struct InterCode *code2 = (struct InterCode *)malloc(sizeof(struct InterCode));
                    code2->op_kind = LABLE;
                    code2->u.goto_lable = lable2;
                    insertInterCode(intercode,code2);
                    translate(p->r->r->r->r->r->r,intercode);
                    //lable3
                    struct InterCode *code3 = (struct InterCode *)malloc(sizeof(struct InterCode));
                    code3->op_kind = LABLE;
                    code3->u.goto_lable = lable3;
                    insertInterCode(intercode,code3);
                }
                else{
                    int lable1 = lable_id++;
                    int lable2 = lable_id++;
                    translate_Cond(p->r->r,intercode,lable1,lable2);
                    //lable1
                    struct InterCode *code1 = (struct InterCode *)malloc(sizeof(struct InterCode));
                    code1->op_kind = LABLE;
                    code1->u.goto_lable = lable1;
                    insertInterCode(intercode,code1);
                    translate(p->r->r->r->r,intercode);
                    //lable2
                    struct InterCode *code2 = (struct InterCode *)malloc(sizeof(struct InterCode));
                    code2->op_kind = LABLE;
                    code2->u.goto_lable = lable2;
                    insertInterCode(intercode,code2);
                }
            }
            if(!strcmp(p->name,"WHILE")){
                labler = 0;
                //TODO whith while stmt 
                int lable1 = lable_id++;
                int lable2 = lable_id++;
                int lable3 = lable_id++;
                //lable1
                struct InterCode *code1 = (struct InterCode *)malloc(sizeof(struct InterCode));
                code1->op_kind = LABLE;
                code1->u.goto_lable = lable1;
                insertInterCode(intercode,code1);
                //code1
                translate_Cond(p->r->r,intercode,lable2,lable3);
                //lable2
                struct InterCode *code2 = (struct InterCode *)malloc(sizeof(struct InterCode));
                code2->op_kind = LABLE;
                code2->u.goto_lable = lable2;
                insertInterCode(intercode,code2);
                //code2
                translate(p->r->r->r->r,intercode);
                //goto lable1
                struct InterCode *code4 = (struct InterCode *)malloc(sizeof(struct InterCode));
                code4->op_kind = GOTOOP;
                code4->u.goto_lable = lable1;
                insertInterCode(intercode,code4);
                //lable3
                struct InterCode *code3 = (struct InterCode *)malloc(sizeof(struct InterCode));
                code3->op_kind = LABLE;
                code3->u.goto_lable = lable3;
                insertInterCode(intercode,code3);
            }
            if(!strcmp(p->name,"FunDec")){
                struct InterCode *code1 = (struct InterCode *)malloc(sizeof(struct InterCode));
                code1->op_kind = FUNDEC;
                code1->u.funcname = p->l->syntax_value;
                insertInterCode(intercode,code1);
                if(!strcmp(p->l->r->r->name,"VarList")){
                    int arg_num = p->l->args->arg_num;
                    struct InterCode *code[arg_num];
                    int i;
                    for(i = 0;i < arg_num;i++){
                        id_cno ++;
                        code[i] = (struct InterCode *)malloc(sizeof(struct InterCode));
                        code[i]->op_kind = VARLIST;
                        code[i]->u.arg_no = id_cno;
                        insertInterCode(intercode,code[i]);
                    }
                }
            }
            if(!strcmp(p->name,"Expp")){
                if((!strcmp(p->l->name,"IDENTIFIER"))&&(p->l->r)){
                    if(!strcmp(p->l->r->name,"LP")){
                            struct InterCode *code1 = (struct InterCode *)malloc(sizeof(struct InterCode));
                            code1->op_kind = FUNCALL;
                            code1->u.funcname = p->l->syntax_value;
                            insertInterCode(intercode,code1);
                    }
                }
            }
            if((p->r)&&labler){
                top++;
                stack[top] = p->r;
            }
            if((p->l)&&lablel){
                top++;
                stack[top] = p->l;
            }
            lablel = 1;
            labler = 1;
        }
    }
}


struct Operand_ *translate_Exp(struct syntax_node *exp_head,struct InterCodes *intercode){
    if(exp_head){
        if(!strcmp(exp_head->name,"Expp")){
            Operand operand = (struct Operand_ *)malloc(sizeof(struct Operand_));
            if(exp_head->l->syn_kind == NCONSTANT){
                if(!strcmp(exp_head->l->idtype,"int")){
                    operand->kind = CONSTANT;
                    operand->u.valuei = exp_head->l->int_dex;
                }
                if(!strcmp(exp_head->l->idtype,"float")){
                    operand->kind = CONSTANT;
                    operand->u.valuei = exp_head->l->float_dex;
                }
            }
            else if(exp_head->l->syn_kind == NVARIABLE){
                operand->kind = VARIABLE; 
                operand->u.var_no = exp_head->l->id_no;
            }
            return operand;
        }

        if(!strcmp(exp_head->name,"Exp")){
            if(!strcmp(exp_head->l->r->name,"ASSIGN")){
                struct InterCode *code = (struct InterCode *)malloc(sizeof(struct InterCode));
                Operand operand_l = translate_Exp(exp_head->l,intercode);
                Operand operand_r = translate_Exp(exp_head->l->r->r,intercode);
                id_cno ++;
                Operand temp  = (struct Operand_ *)malloc(sizeof(struct Operand_));
                temp->kind = VARIABLE; 
                temp->u.var_no = id_cno;
                code->op_kind = ASSIGNOP;
                code->u.assign.right = operand_r;
                code->u.assign.left = operand_l;
                insertInterCode(intercode,code);
                return temp;
            }
            if((!strcmp(exp_head->l->r->name,"PLUS"))||(!strcmp(exp_head->l->r->name,"SUB"))||(!strcmp(exp_head->l->r->name,"MUL"))||(!strcmp(exp_head->l->r->name,"DIV"))){
                struct InterCode *code = (struct InterCode *)malloc(sizeof(struct InterCode));
                Operand operand_1 = translate_Exp(exp_head->l,intercode);
                Operand operand_2 = translate_Exp(exp_head->l->r->r,intercode);
                id_cno ++;
                Operand temp  = (struct Operand_ *)malloc(sizeof(struct Operand_));
                temp->kind = VARIABLE; 
                temp->u.var_no = id_cno;
                if((!strcmp(exp_head->l->r->name,"PLUS"))){
                    code->op_kind = ADDOP;
                }
                else if((!strcmp(exp_head->l->r->name,"SUB"))){
                    code->op_kind = SUBOP;
                }
                else if((!strcmp(exp_head->l->r->name,"MUL"))){
                    code->op_kind = MULOP;
                }
                else if((!strcmp(exp_head->l->r->name,"DIV"))){
                    code->op_kind = DIVOP;
                }

                code->u.binop.op1 = operand_1;
                code->u.binop.op2 = operand_2;
                code->u.binop.result = temp;
                insertInterCode(intercode,code);
                return temp;
            }
        }
    }   
}

struct Operand_ *translate_Cond(struct syntax_node *exp_head,struct InterCodes *intercode,int lable_true,int lable_flase){
    if(exp_head){
        if(!strcmp(exp_head->name,"Expp")){
            Operand operand = (struct Operand_ *)malloc(sizeof(struct Operand_));
            if(exp_head->l->syn_kind == NCONSTANT){
                if(!strcmp(exp_head->l->idtype,"int")){
                    operand->kind = CONSTANT;
                    operand->u.valuei = exp_head->l->int_dex;
                }
                if(!strcmp(exp_head->l->idtype,"float")){
                    operand->kind = CONSTANT;
                    operand->u.valuei = exp_head->l->float_dex;
                }
            }
            else if(exp_head->l->syn_kind == NVARIABLE){
                operand->kind = VARIABLE; 
                operand->u.var_no = exp_head->l->id_no;
            }
            return operand;
        }

        if(!strcmp(exp_head->name,"Exp")){
            if(!strcmp(exp_head->l->r->name,"RELOP")){
                char *op = get_relop(exp_head->l->r);
                struct InterCode *code1 = (struct InterCode *)malloc(sizeof(struct InterCode));

                struct InterCode *code2 = (struct InterCode *)malloc(sizeof(struct InterCode));
                Operand operand_l = translate_Exp(exp_head->l,intercode);
                Operand operand_r = translate_Exp(exp_head->l->r->r,intercode);
                id_cno ++;
                Operand temp  = (struct Operand_ *)malloc(sizeof(struct Operand_));
                temp->kind = VARIABLE; 
                temp->u.var_no = id_cno;
                code1->op_kind = RELOPS;
                code1->u.relop.right = operand_r;
                code1->u.relop.op = op;
                code1->u.relop.left = operand_l;
                code1->u.relop.lable_true = lable_true;
                insertInterCode(intercode,code1);
                code2->u.goto_lable = lable_flase;
                code2->op_kind = GOTOOP;
                insertInterCode(intercode,code2);
                return temp;
            }
        }
    }   
}

char *get_relop(struct syntax_node *ast_node){
    return ast_node->syntax_value;
}

void insertInterCode(struct InterCodes *IRhead,struct InterCode *code){
    struct InterCodes *p = IRhead;

    while(p->next){
        p = p->next;
    }

    p->next = (struct InterCodes *)malloc(sizeof(struct InterCodes));
    p->next->code = code;
    p = p->next;    
}


void printIR(struct InterCodes *IRhead){
    struct InterCodes *p = IRhead -> next;
    while(p){
        switch(p->code->op_kind){
            case ASSIGNOP : 
            if(p->code->u.assign.right->kind == CONSTANT){
                printf("V%d := #%d\n",p->code->u.assign.left->u.var_no,p->code->u.assign.right->u.valuei);
            }
            if(p->code->u.assign.right->kind == VARIABLE){
                printf("V%d := V%d\n",p->code->u.assign.left->u.var_no,p->code->u.assign.right->u.var_no);
            }
            break;
            case ADDOP:
            if(p->code->u.binop.op2->kind == CONSTANT){
                printf("V%d := V%d + #%d\n",p->code->u.binop.result->u.var_no,p->code->u.binop.op1->u.var_no,p->code->u.binop.op2->u.valuei);
            }
            if(p->code->u.binop.op2->kind == VARIABLE){
                printf("V%d := V%d + V%d\n",p->code->u.binop.result->u.var_no,p->code->u.binop.op1->u.var_no,p->code->u.binop.op2->u.var_no);
            }
            break;
            case SUBOP:
            if(p->code->u.binop.op2->kind == CONSTANT){
                printf("V%d := V%d - #%d\n",p->code->u.binop.result->u.var_no,p->code->u.binop.op1->u.var_no,p->code->u.binop.op2->u.valuei);
            }
            if(p->code->u.binop.op2->kind == VARIABLE){
                printf("V%d := V%d - V%d\n",p->code->u.binop.result->u.var_no,p->code->u.binop.op1->u.var_no,p->code->u.binop.op2->u.var_no);
            }
            break;
            case MULOP:
            if(p->code->u.binop.op2->kind == CONSTANT){
                printf("V%d := V%d * #%d\n",p->code->u.binop.result->u.var_no,p->code->u.binop.op1->u.var_no,p->code->u.binop.op2->u.valuei);
            }
            if(p->code->u.binop.op2->kind == VARIABLE){
                printf("V%d := V%d * V%d\n",p->code->u.binop.result->u.var_no,p->code->u.binop.op1->u.var_no,p->code->u.binop.op2->u.var_no);
            }
            break;
            case DIVOP:
            if(p->code->u.binop.op2->kind == CONSTANT){
                printf("V%d := V%d / #%d\n",p->code->u.binop.result->u.var_no,p->code->u.binop.op1->u.var_no,p->code->u.binop.op2->u.valuei);
            }
            if(p->code->u.binop.op2->kind == VARIABLE){
                printf("V%d := V%d / V%d\n",p->code->u.binop.result->u.var_no,p->code->u.binop.op1->u.var_no,p->code->u.binop.op2->u.var_no);
            }
            break;
            case RELOPS:
            if(p->code->u.relop.right->kind == CONSTANT){
                printf("IF V%d %s #%d GOTO LABLE%d\n",p->code->u.relop.left->u.var_no,p->code->u.relop.op,p->code->u.relop.left->u.valuei,p->code->u.relop.lable_true);
            }
            else{
                printf("IF V%d %s V%d GOTO LABLE%d\n",p->code->u.relop.left->u.var_no,p->code->u.relop.op,p->code->u.relop.right->u.var_no,p->code->u.relop.lable_true);
            }
            break;
            case GOTOOP:
            printf("GOTO LABLE%d\n",p->code->u.goto_lable);
break;
            case LABLE:
                printf("LABLE%d:\n",p->code->u.goto_lable);
                break;
            case FUNDEC:
                printf("FUNCTION %s:\n",p->code->u.funcname);
                break;
            case VARLIST:
                printf("PARAM v%d:\n",p->code->u.arg_no);
                break;
            case FUNCALL:
                printf("CALL %s\n",p->code->u.funcname);
                break;
            default: break;

        }
        p = p->next;
    }
}
