/*************************************************************************
	> File Name: doLinkList.c
	> Author: Strawberrylin 
	> Github: https://github.com/strawberrylin 
	> Created Time: 2016年11月16日 星期三 15时54分04秒
 ************************************************************************/

#include"data.h"
int makeLinkList(struct s_symbal **head){
    struct s_symbal *phead = (struct s_symbal *)malloc(sizeof(struct s_symbal));
    if(!phead);return FALSE;
    phead->name = NULL;
    phead->type = -1;
    phead->next = NULL;
    *head = phead;
    return TRUE;;
}
int insertLinkNode(struct s_symbal **head,struct s_symbal *p){
    struct s_symbal *temp = *head;
    p->next = temp->next;
    temp->next = p;
    *head = temp;
    return TRUE;
}
int deleteLinkNode(struct s_symbal **head){
    struct s_symbal *temp = *head;
    temp = temp->next;
    *head = temp;
    return TRUE;
}
