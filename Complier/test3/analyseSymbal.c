/*************************************************************************
  > File Name: analyseSymbal.c
  > Author: Strawberrylin 
  > Github: https://github.com/strawberrylin 
  > Created Time: 2016年12月15日 星期四 09时07分34秒
 ************************************************************************/
#include"data.h"

extern struct stack *scope_stack;

int analyseSymbal(struct syntax_node *ast_node){
    int success = 1;
    struct syntax_node *p;
    struct syntax_node *stack[100];
    int top = -1;
    int pos;
    int notFound = 0;
    int lable = 1;
    if(ast_node){
        top++;
        stack[top] = ast_node->l;
        while(top>-1){
            p = stack[top];
            top--;
            //判断表达式中变量是否定义，对变量的操作是否正确
            if(!strcmp(p->name,"Expp")){        //找到表达式的符号
                if(p->l->syn_kind!=0){          //不是常量
                    for(pos = scope_stack->top;pos>-1;pos-- ){ //遍历作用域栈，作用域由近及远
                        notFound = lookUp(scope_stack->elemts[pos]->symbal_head,p->l);      //查找到符号定义
                        if(!notFound){
                            if((p->r)&&(!strcmp(p->r->name,"LB"))){//使用了操作符[]
                                if(p->l->syn_kind!=2){
                                    printf("Error Type 10 at %d : '%s' is not a array\n",p->l->line,p->l->syntax_value);
                                }
                            }
                            if((p->l->r)&&(!strcmp(p->l->r->name,"LP"))){//使用了操作符()
                                if(p->l->syn_kind!=3) {
                                    printf("Error Type 11 at %d : '%s' is not a function\n",p->l->line,p->l->syntax_value);
                                }
                            }
                            if((p->r)&&(!strcmp(p->r->name,"DOT"))){//使用了操作符.
                                if(p->l->syn_kind!=4){
                                    printf("Error Type 13 at %d : '%s' is not a struct\n",p->l->line,p->l->syntax_value);
                                }
                            }
                            break;
                        }
                    }
                    if(notFound){ //没找到符号定义，报错
                        if((p->l->r)&&(!strcmp(p->l->r->name,"LP"))){ //如果是函数
                            printf("Error Type 3 at %d :Undefined function '%s';\n",p->l->line,p->l->syntax_value);
                        }
                        else{  //不是函数的其他变量
                            printf("Error Type 2 at %d :Undefined symbal '%s';\n",p->l->line,p->l->syntax_value);
                        }
                        success = 0;   //语义分析失败，有错标志
                        break;
                    }
                }
            }
            //递归调用分析函数
            if(!strcmp(p->name,"CompSt")){
                (scope_stack->top)++;
                scope_stack->elemts[scope_stack->top] = p->scope;
                if(!analyseSymbal(p)){
                    success = 0;
                }
                (scope_stack->top)--;
                lable = 0;
            }
            if(p->r){
                top++;
                stack[top] = p->r;
            }
            if((p->l)&&lable)  {
                top++;
                stack[top] = p->l;
            }
            lable  = 1;
        }
    }
    return success;
}

int analyseType(struct syntax_node *ast_head){
    int success = 1;
    struct syntax_node *p;
    struct syntax_node *stack[100];
    int top =-1;
    char *strtype;
    int lable =1;
    char *rt_type;
    char *type;

    if(ast_head){
        top ++;
        stack[top] = ast_head;
        while(top>-1){
            p = stack[top--];
            if(!strcmp(p->name,"Exp")){
                strtype = getExpType(p);
                if(!strcmp(strtype,"error")){
                    printf("Error Type 5 at line %d : Type mismatched for assignments;\n",p->line);
                    success = 0;
                }
                if(getExpKind(p) == -1){
                    printf("Error Type 7 at line %d : Type mismatched for operands;\n",p->line);
                }
                lable = 0;
            }
            if(!strcmp(p->name,"FunDec")){
                rt_type = p->l->idtype;               
            }
            if(!strcmp(p->name,"RETURN")){
               type =  getExpType(p->r);
               if(strcmp(rt_type,type)){
                   printf("Error Type at line %d : Type mismatched for return;\n",p->line);
               }
            }
            if(p->r){
                top++;
                stack[top] = p->r;
            }
            if((p->l)&&lable){
                top++;
                stack[top] = p->l;
            }
            lable = 1;
        }
    }
    return success;
}

char* getExpType(struct syntax_node *exp_node){
    char *strtype1;
    char *strtype2;
    if(exp_node){
        if(!strcmp(exp_node->name,"Expp")){
            return exp_node->l->idtype;
        }

        if(!strcmp(exp_node->name,"Exp")){
            if(!strcmp(exp_node->l->name,"Expp")){
                if(exp_node->l->l->syn_kind == NCONSTANT){
                    printf("Error Type 6 at line %d : The left-hand side must be a variable;\n",exp_node->line);
                }
            }
            strtype1 = getExpType(exp_node->l);
            strtype2 = getExpType(exp_node->l->r->r);
            if(!strcmp(strtype1,strtype2)){
                return strtype1;
            }
            else{
                return "error";
            }
        }
    }
    return " ";
}

int getExpKind(struct syntax_node *exp_node){
    int strtype1;
    int strtype2;
    if(exp_node){
        if(!strcmp(exp_node->name,"Expp")){
            return exp_node->l->syn_kind;
        }
        if(!strcmp(exp_node->name,"Exp")){
            strtype1 = getExpKind(exp_node->l);
            strtype2 = getExpKind(exp_node->l->r->r);
            if((strtype1 == strtype2)||(((strtype1==1))&&(strtype2==0))){
                return strtype1;
            }
            else{
                return -1;
            }
        }
    }
    return 0;
}

