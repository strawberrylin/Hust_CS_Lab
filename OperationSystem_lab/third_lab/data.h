/*************************************************************************
	> File Name: data.h
	> Author: Strawberrylin 
	> Github: https://github.com/strawberrylin 
	> Created Time: 2016年12月16日 星期五 22时38分03秒
 ************************************************************************/

#ifndef _DATA_H
#define _DATA_H
#include<stdio.h>
#include<stdlib.h>
#include<sys/types.h>
#include<unistd.h>
#include<signal.h>
#include<sys/sem.h>
#include<sys/ipc.h>
#include<sys/shm.h>
#include<string.h>
#include<sys/wait.h>

#define SIZE 10
pid_t p1,p2,p3; 
int semid;
int shmid[5];

union semun{
    int setval;
    struct semid_ds *buf;
    unsigned short *array;
};
//P V  function
void P(int semid,unsigned short index);
void V(int semid,unsigned short index);
#endif
