/*************************************************************************
	> File Name: quicksort.c
	> Author: Strawberrylin 
	> Github: https://github.com/strawberrylin 
	> Created Time: 2016年12月18日 星期日 09时42分00秒
 ************************************************************************/

#include<stdio.h>
#include<stdlib.h>

#define MAX 20
#define NUM 10
int partition(int m,int p);
void quicksort(int p,int q);
//int array[10] = {7,5,3,4,6,2,1,8,9,0};
//int array[10] = {0,1,2,3,4,5,6,7,8,9};
int array[10] = {43,54,65,19,0,5,245,78,83,1};


int main(){
    int i;
    //打印排序前的数组
    for(i = 0;i < NUM;i++){
        printf("%d\t",array[i]);
    }
    printf("\n\n");
    //排序
    quicksort(0,9);
    //打印排序后的数组
    printf("\n");
    for(i = 0;i < 10;i++){
        printf("%d\t",array[i]);
    }
    printf("\n");
    return 0;
}

int partition(int m,int p){
    int v,i,j; 
    i = m + 1;
    j = p;
    v = array[m];
    int temp;
    for(;;){
        for(;(v >= array[i])&&(i <= p);i++);
        for(;(v <= array[j])&&(j > -1);j--);
        if(i < j) {
            //change 
            temp = array[i];
            array[i] = array[j];
            array[j] = temp;
        }
        else{
            break;
        }
    }
    array[m] = array[i-1];
    array[i-1] = v;
    return i - 1;
}

void quicksort(int p,int q){
    int stack[MAX];
    int top = 0;
    int j;
    int n;
    for(;;) {
        while(p < q){
            j = partition(p,q);
            for(n = 0;n < 10;n++){
                printf("%d\t",array[n]);
            }
            printf("\n");
            if((j - p) < (q - j)){
                stack[top ++] = j + 1;
                //栈溢出检测
                if(top == MAX){
                    printf("Overflow\n");
                    exit(-1);
                }
                stack[top ++] = q;
                //栈溢出检测
                if(top == MAX){
                    printf("Overflow\n");
                    exit(-1);
                }
                q = j - 1;
            }
            else{
                stack[top ++] = p;
                //栈溢出检测
                if(top == MAX){
                    printf("Overflow\n");
                    exit(-1);
                }
                stack[top ++] = j - 1;
                //栈溢出检测
                if(top == MAX){
                    printf("Overflow\n");
                    exit(-1);
                }
                p = j + 1;
            }
        }
        if(top == 0) return;
        q = stack[--top];
        p = stack[--top];
    }
    return ;
}

