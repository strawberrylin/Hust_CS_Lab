/*************************************************************************
	> File Name: select2.c
	> Author: Strawberrylin 
	> Github: https://github.com/strawberrylin 
	> Created Time: 2016年12月18日 星期日 13时13分02秒
 ************************************************************************/
#include<stdio.h>

#define NUM 9  //进行Insertionsort 结束的下标
#define MUM 0  // 进行Insertionsort 开始的下标
#define r 3

void insertionsort(int *array,int m,int n);
int select2(int *array,int m,int p,int k);
int partition(int *array,int m,int p);

int main(){
    int i;
    int array[NUM-MUM+1] = {5,4,6,2,1,9,8,0,3,7};
    int rt_num;
    //打印排序前的数组
    for(i = 0;i < NUM - MUM + 1;i ++){
        printf("%d\t",array[i]);
    }
    printf("\n\n");
    // insertionsort(array,MUM,NUM);
    rt_num = select2(array,MUM,NUM,5);
    printf("%d\n\n",array[rt_num]);
    for(i = 0;i < NUM - MUM + 1;i ++){
        printf("%d\t",array[i]);
    }
    printf("\n");
    return 0;
}

void insertionsort(int *array,int m,int n){
    int i,j;
    int temp;
    for(j = m+1;j <= n;j ++){
        temp = array[j];
        i = j - 1;
        while((temp < array[i])&&(i >= m)){
            array[i + 1] = array[i];
            i = i - 1;
        }
        array[i + 1] = temp;
    }
}

int select2(int *array,int m,int p,int k){
    int n,i,j;    
    int temp;
    int rs;
    if((p - m + 1 ) <= r){
        insertionsort(array,m,p);
        return m + k - 1;
    }
    for(;;){
        n = p - m + 1; 
        for(i = 1;i <= n/r; i++){//分为n/r组
            insertionsort(array,m + (i - 1) * r,m + i * r - 1);
            //将中间值收集到array的前部
            temp = array[m + i - 1] ;
            array[m + i - 1] = array[m + (i - 1) * r + r/2 ] ;
            array[m + (i - 1) * r + r/2] = temp;
        }
        //计算(n/r)/2的上界
        rs = (n/r)%2;
        if(rs) rs = (n/r)/2 + 1;
        else rs = (n/r)/2;
        //得到j
        j = select2(array,m,m + n/r - 1,rs);
        //交换Ai Aj
        temp = array[m];
        array[m] = array[j];
        array[j] = temp;
        j = p;
        partition(array,m,j);
        if((j - m + 1) == k) return j;
        else if((j - m + 1) > k) p = j - 1;
        else {
            k = k-(j - m + 1);
            m = j + 1;
        }
    }
}

int partition(int *array,int m,int p){
    int v,i,j;
    i = m + 1;
    j = p;
    v = array[m];
    int temp;
    for(;;){
        for(;(v >= array[i])&&(i <= p);i ++);
        for(;(v <= array[j])&&(j > -1);j --);
        if(i < j){
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
    return 0;
}
