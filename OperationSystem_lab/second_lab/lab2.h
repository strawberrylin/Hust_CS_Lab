/*************************************************************************
	> File Name: lab2.h
	> Author: Strawberrylin 
	> Github: https://github.com/strawberrylin 
	> Created Time: 2016年11月26日 星期六 17时00分20秒
 ************************************************************************/

#ifndef _LAB2_H
#define _LAB2_H
#include<stdio.h>
#include<stdlib.h>
#include<pthread.h>
#include<sys/types.h>
#include<sys/sem.h>
#include<unistd.h>

union semun{
    int setval;
    struct semid_ds *buf;
    unsigned short *array;
};

//functionalion definition:P() V()
void P(int semid,unsigned short index);
void V(int semid,unsigned short index);

//message light and the handler
int semid;
pthread_t p1,p2;

//function : 
void *subp1();
void *subp2();
#endif
