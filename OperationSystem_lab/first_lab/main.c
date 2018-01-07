/*************************************************************************
> File Name: main.c
> Author: Strawberrylin 
> Github: https://github.com/strawberrylin 
> Created Time: 2016年11月24日 星期四 00时29分15秒
************************************************************************/

#include<stdio.h>
#include<stdlib.h>
#include<string.h>
#include<unistd.h>
#include<sys/types.h>
#include<sys/wait.h>
#include<signal.h>
typedef void (*stop_handler)(int);

int pipefd[2];
int wait1_mark,wait2_mark;
char string[] = "I send you x times."; 
char readbuffer[80];
pid_t childpid1,childpid2;

void waiting1(){
    int times = 1;
    while(wait1_mark){
        if(childpid1 == 0){
            close(pipefd[0]);
            string[11] = times%10 + '0';
            write(pipefd[1],string,(strlen(string)+1));
            times ++;
            sleep(1);
        }
    }
}
void waiting2(){
    while(wait2_mark){
        if(childpid2 == 0){
            close(pipefd[1]);
            read(pipefd[0],readbuffer,sizeof(readbuffer));
            printf("%s\n",readbuffer);
        }
    }
}

void stop1(int sig_no){
    if (sig_no == SIGUSR1) {
        wait1_mark = 0;
        printf("\nChild Process 1 is killed by Parent\n");
        exit(0);
    }
}


void stop2(int sig_no){
    if (sig_no == SIGUSR2) {
        wait2_mark = 0;
        printf("\nChild Process 2 is killed by Parent\n");
        exit(0);
    }
}

void stop3(int sig_no) {
    if (sig_no == SIGINT) {
        kill(childpid1,SIGUSR1);
        kill(childpid2,SIGUSR2);
    }
}

int main(void){
    pipe(pipefd);           //Create the pipe
    stop_handler stop1_t = stop1;
    stop_handler stop2_t = stop2;
    stop_handler stop3_t = stop3;

    signal(SIGINT,stop3_t);

    while((childpid1 = fork())==-1);
    if(childpid1 == 0){
        wait1_mark = 1;
        signal(SIGINT,SIG_IGN);
        signal(SIGUSR1,stop1_t);
        waiting1();
        exit(0);
    }
    else{
        while((childpid2 = fork())==-1);
        if(childpid2 == 0){
            wait2_mark = 1;
            signal(SIGINT,SIG_IGN);
            signal(SIGUSR2,stop2_t);
            waiting2();
            exit(0);
        } 
        else{
            wait(0);
            wait(0);
            printf("\nParent process is killed\n");
            exit(0);
        }
    }
    return 0;
}
