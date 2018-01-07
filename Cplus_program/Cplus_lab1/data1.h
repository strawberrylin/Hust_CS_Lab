/*************************************************************************
	> File Name: stack1.h
	> Author: 
	> Mail: 
	> Created Time: 2016年10月14日 星期五 18时50分20秒
 ************************************************************************/

#ifndef _STACK1_H
#define _STACK1_H
#include<stdio.h>
#include<iostream>
#include<malloc.h>

#define TRUE 1
#define FALSE 0
#define OVERFLOW -1

struct POSTK{
    int *elems;   //store the elements
    int max;      //the max num
    int pos;      //the number of the actual elements
};

#define MAX_NUM 10

void initPOSTK(POSTK *const p,int m);
void initPOSTK(POSTK *const p,const POSTK &s);
int size(const POSTK *const p);
int howMany(const POSTK *const p);
int getelem(const POSTK *const p,int x);
POSTK *const push(POSTK * const p,int e);
POSTK *const pop(POSTK *const p,int &e);
POSTK *const assign(POSTK *const p,const POSTK &s);
void print(const POSTK *const p);
void destroyPOSTK(POSTK *const p);

#endif
