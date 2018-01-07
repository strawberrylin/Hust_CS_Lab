/*************************************************************************
	> File Name: lab2_main.c
	> Author: Strawberrylin 
	> Github: https://github.com/strawberrylin 
	> Created Time: 2016年11月26日 星期六 17时06分29秒
 ************************************************************************/

#include"lab2.h"
int sum = 0;

int main(){
    int ret1,ret2,ret3;
    union semun sem_args;

    semid = semget(0,2,IPC_CREAT|0666);
    sem_args.setval = 1;
    ret3 = semctl(semid,0,SETVAL,sem_args);
    sem_args.setval =0;
    ret3 = semctl(semid,1,SETVAL,sem_args);
    ret1 = pthread_create(&p1,NULL,subp1,NULL);
    ret2 = pthread_create(&p2,NULL,subp2,NULL);
    if(ret1||ret2){
        printf("Create pthread_child failed\n");
        exit(0);
    }
    pthread_join(p1,NULL);
    pthread_join(p2,NULL);
    semctl(semid,0,IPC_RMID,sem_args);
    return 0;
}


void P(int semid,unsigned short index){
    struct sembuf sem;
    sem.sem_num = index;
    sem.sem_op = -1;
    sem.sem_flg = 0;
    semop(semid,&sem,1);
}


void V(int semid,unsigned short index){
    struct sembuf sem;
    sem.sem_num = index;
    sem.sem_op = 1;
    sem.sem_flg = 0;
    semop(semid,&sem,1);
}


void *subp1(){
    int i;

    for(i = 1;i <= 100;i ++){
        P(semid,0);
            sum = sum + i;
        V(semid,1);
  }
}


void *subp2(){
    int i;

    for(i = 0;i < 100;i ++){
        P(semid,1);
            printf("%d\t",sum);
            if(i%10==0)printf("\n");
        V(semid,0);
    }
}
