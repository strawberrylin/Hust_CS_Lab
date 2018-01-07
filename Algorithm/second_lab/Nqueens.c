/*************************************************************************
	> File Name: Nqueens.c
	> Author: Strawberrylin 
	> Github: https://github.com/strawberrylin 
	> Created Time: 2016年12月27日 星期二 20时51分10秒
 ************************************************************************/

#include<stdlib.h>
#include<math.h>
#include<stdio.h>

#define M 10

int place(int *queen,int n);
void nqueens(int *queen,int n);
void print(int *queen,int n);

int num;

int main(){
    int queue[M] ;
    int n;
    int i;
    scanf("%d",&n);
    for(i = 1;i <= n;i++){
        num = 0;
        nqueens(queue,i);
        printf("The total selution for %d queens problem is :%d\n",i,num);
    }
    return 0;
}

int place(int *queen,int n){
    int i;
    for(i = 0;i < n;i ++ ){
        if((queen[i] == queen[n])||(abs(queen[i]-queen[n]) == abs(i - n)))
        return 0;
    }
    return 1;
}

void nqueens(int *queen,int n){
    int k;
    queen[0] = -1;
    k = 0;
    while(k>=0){
        queen[k] = queen[k] + 1;
        while((queen[k] < n)&&(!place(queen,k))) {
            queen[k] = queen[k] +1;
        }
        if(queen[k] < n){
            if(k == n - 1){
                print(queen,n);
                num ++;
            }
            else{
                k = k + 1;
                queen[k] = -1;
            }
        }
        else{
            k = k - 1;
        }
    }
}

void print(int *queen,int n){
    int i;
    for(i = 0;i < n;i ++){
        printf("%d\t",queen[i]);
    }
    printf("\n");
}
