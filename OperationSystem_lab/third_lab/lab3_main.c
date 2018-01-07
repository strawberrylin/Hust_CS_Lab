/*************************************************************************
> File Name: main.c
> Author: Strawberrylin 
> Github: https://github.com/strawberrylin 
> Created Time: 2016年12月16日 星期五 23时38分01秒
************************************************************************/

#include"data.h"

int main(){
    int ret1,ret2;
    union semun sem_args;
    struct shmid_ds buf;
    FILE *fp1,*fp2;
    //信号灯
    semid = semget(0,3,IPC_CREAT|0666);
    sem_args.setval = 0;
    ret1 = semctl(semid,0,SETVAL,sem_args);
    sem_args.setval = 5;
    ret2 = semctl(semid,1,SETVAL,sem_args);
    sem_args.setval = 1;
    ret1 = semctl(semid,2,SETVAL,sem_args);
    //创建共享内存组
    shmid[0] = shmget(0,SIZE,IPC_CREAT|0600);
    shmctl(shmid[0],IPC_STAT,&buf);
    shmid[1] = shmget(0,SIZE,IPC_CREAT|0600);
    shmctl(shmid[1],IPC_STAT,&buf);
    shmid[2] = shmget(0,SIZE,IPC_CREAT|0600);
    shmctl(shmid[2],IPC_STAT,&buf);
    shmid[3] = shmget(0,SIZE,IPC_CREAT|0600);
    shmctl(shmid[3],IPC_STAT,&buf);
    shmid[4] = shmget(0,SIZE,IPC_CREAT|0600);
    shmctl(shmid[4],IPC_STAT,&buf);
    //创建进程
    while((p1 = fork()) == -1) printf("error1");

    if(p1 == 0){//进程1
        char *shmaddr1[5] ;
        int num1 = 0;
        if((fp1=fopen("/home/strawberrylin/Gitrepository/OperationSystem_lab/third_lab/readfile","r"))==NULL) {
            printf("file open error\n");
            exit(-1);
        }
        shmaddr1[0] = (char*)shmat(shmid[0],NULL,0);
        shmaddr1[1] = (char*)shmat(shmid[1],NULL,0);
        shmaddr1[2] = (char*)shmat(shmid[2],NULL,0);
        shmaddr1[3] = (char*)shmat(shmid[3],NULL,0);
        shmaddr1[4] = (char*)shmat(shmid[4],NULL,0);
        do{
            P(semid,1);
            P(semid,2);
            num1 = (num1 + 1)%5;
            *shmaddr1[num1] = fgetc(fp1);
            V(semid,2);
            V(semid,0);
        }while(*shmaddr1[num1]!=EOF);
        shmdt(shmaddr1[0]);
        shmdt(shmaddr1[1]);
        shmdt(shmaddr1[2]);
        shmdt(shmaddr1[3]);
        shmdt(shmaddr1[4]);
        fclose(fp1);
     }else {
        while((p2 = fork()) == -1);
        if(p2 == 0){//进程2
            char *shmaddr2[5] ;
            int num2 = 0;
            if((fp2=fopen("/home/strawberrylin/Gitrepository/OperationSystem_lab/third_lab/writefile","w+"))==NULL) {
                printf("file open error\n");
                exit(-1);
            }
            shmaddr2[0] = (char*)shmat(shmid[0],NULL,0);
            shmaddr2[1] = (char*)shmat(shmid[1],NULL,0);
            shmaddr2[2] = (char*)shmat(shmid[2],NULL,0);
            shmaddr2[3] = (char*)shmat(shmid[3],NULL,0);
            shmaddr2[4] = (char*)shmat(shmid[4],NULL,0);
            do{
                P(semid,0);
                P(semid,2);
                num2 = (num2 + 1)%5;
                if(*shmaddr2[num2]!=EOF)
                    fputc(*shmaddr2[num2],fp2);
                V(semid,2);
                V(semid,1);
            }while(*shmaddr2[num2]!=EOF);
            shmdt(shmaddr2[0]);
            shmdt(shmaddr2[1]);
            shmdt(shmaddr2[2]);
            shmdt(shmaddr2[3]);
            shmdt(shmaddr2[4]);
            fclose(fp2);
        }
         else{//主进程
            wait(&p1);
            wait(&p2);
         }
     }
    semctl(semid,0,IPC_RMID,sem_args);
    shmctl(shmid[0],IPC_RMID,NULL);
    shmctl(shmid[1],IPC_RMID,NULL);
    shmctl(shmid[2],IPC_RMID,NULL);
    shmctl(shmid[3],IPC_RMID,NULL);
    shmctl(shmid[4],IPC_RMID,NULL);
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
