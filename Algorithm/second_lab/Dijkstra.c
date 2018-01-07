/*************************************************************************
	> File Name: Dijkstra.c
	> Author: Strawberrylin 
	> Github: https://github.com/strawberrylin 
	> Created Time: 2016年12月25日 星期日 21时21分15秒
 ************************************************************************/
#include<stdio.h>
#include<stdlib.h>
#include<stdbool.h>

//assume 0,1,2,3,4...
#define M 7

int min1(int *array1,_Bool *array2);
int min2(int a,int b);
void print(int *array);

int main(){
    bool S[M];

    //用于测试的临接矩阵
    int COST[M][M] = {{0   ,20  ,50  ,30  ,1000,1000,1000},
                      {1000,0   ,25  ,1000,1000,70  ,1000},
                      {1000,1000,0   ,40  ,25  ,50  ,1000},
                      {1000,1000,1000,0   ,55  ,1000,1000},
                      {1000,1000,1000,1000,0   ,10  ,70  },
                      {1000,1000,1000,1000,1000,0   ,50  },
                      {1000,1000,1000,1000,1000,1000,0   },
                     };

    int DIST[M];     //存储边的权
    int node[M-1];   //存储经过的节点
    int u,v,i,w,num;
    
    v = 0;
    num = 0;
    //对DIST进行初始化
    for(i = 0;i < M;i ++){
        S[i] = 0;
        DIST[i] = COST[v][i];
    }
    S[v] = 1; //设置第一个节点已经查看的节点
    node[num++] = v + 1; //将第一个节点存储
    for(i = 0; i < M;i ++){//计算导其他每个节点的最短长度
        print(DIST);
        u = min1(DIST,S);   //选取到v最近的节点
        node[num++] = u + 1;
        for(w = 0;w < M;w++){
            if(!S[w]){
                DIST[w] = min2(DIST[w],DIST[u] + COST[u][w]);
            }
        }
    }
    node[num] = M;
    print(node);
    printf("start     end       length    node list\n");
    printf("V%-9dV%-9d%-10dV%d-V%d\n",node[0],node[M-1],DIST[M-1],node[0],node[M-1]);
    return 0;
}
int min1(int *array1,_Bool *array2){
    int res;
    int i;
    int lable;
    res = 1000;
    for(i = 0;i < M;i ++){
        if((res > array1[i])&&(!array2[i])) {
            res = array1[i];  
            lable = i;
        }
    }
    array2[lable] = 1;
    return lable;
}

int min2(int a,int b){
    return a<b?a:b;
}

void print(int *array){
    int i;
    for(i = 0;i < M;i ++){
        printf("%d\t",array[i]);
    }
    printf("\n\n");
}
