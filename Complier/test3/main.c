/*************************************************************************
	> File Name: main.c
	> Author: Strawberrylin 
	> Github: https://github.com/strawberrylin 
	> Created Time: 2016年12月12日 星期一 11时10分50秒
 ************************************************************************/
#include"data.h"
#include"syntax.tab.h"

#define SYMBAL_PRINT
//#undef SYMBAL_PRINT

struct syntax_node *ast_head;
struct stack *scope_stack; 

int main(){
    //中间代码链表
    struct InterCodes *IR_head = (struct InterCodes *)malloc(sizeof(struct InterCodes));
    //作用域的栈
    scope_stack = (struct stack *)malloc(sizeof(struct stack));    

    //grammaer analyse
    yyparse();
    //print the tree
    printf("print the syntax tree:\n>");
    print(ast_head,0);
    printf("syntax tree over\nstart the symbal table func:\n");

    //creat the symbal table
    #ifdef SYMBAL_PRINT
    printf("gloable scope\n");
    #endif
    makeSymbal(ast_head);
    #ifdef SYMBAL_PRINT
    printSymbal(ast_head->scope->symbal_head);
    printf("quit the program\n\n");
    #endif

    //start the analyse
    scope_stack->top = 0;   
    scope_stack->elemts[scope_stack->top] = ast_head->scope; 
    if(analyseSymbal(ast_head)){
        scope_stack->top = -1;
        //TODO with the generation of the mid-code  
        if(analyseType(ast_head)){
            printf("MakeSymbal over\nStrart generate the IRcode:\n\n") ;
            translate(ast_head,IR_head);
            printIR(IR_head);
        }
    }
    return 0;
}
