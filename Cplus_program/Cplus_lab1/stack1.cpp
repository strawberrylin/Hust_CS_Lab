/*************************************************************************
	> File Name: stack1.cpp
	> Author: 
	> Mail: 
	> Created Time: 2016年10月14日 星期五 19时27分42秒
 ************************************************************************/

#include"data1.h"
using namespace std;
int main(void){
    struct POSTK *P;
    struct POSTK S;
    int x;
    P=(struct POSTK *)malloc(sizeof(struct POSTK));
    S.elems=(int*)malloc(sizeof(int)*5);
    S.elems[0]=1;
    S.elems[1]=2;
    S.elems[2]=3;
    S.elems[3]=4;
    S.max=5;
    S.pos=5;
    initPOSTK(P,5);
    cout<<"The current size of the stack is : "<<size(P)<<"\n";
    cout<<"The curret num of the stack is : "<<howMany(P)<<"\n";
    if(getelem(P,x)>=0){
        cout<<"The 0th num of the stack is : "<<getelem(P,x)<<"\n";
    }
    else
        cout<<"print the 0th num error!\n";
    push(P,1);
    if(getelem(P,x)>=0){
        cout<<"The 0th num of the stack is : "<<getelem(P,x)<<"\n";
    }
    else
       cout<<"print the 0th num error!\n";
    push(P,2);
    print(P);
    pop(P,x);
    P=assign(P,S);
    print(P);
    cout<<"The current size of the stack is : "<<size(P)<<"\n";
    cout<<"The curret num of the stack is : "<<howMany(P)<<"\n";
    destroyPOSTK(P);
}
/********************************************************************
 * initPOSTK
 p,m
*************************************************** ****************/
void initPOSTK(POSTK *const p,int m){
    if(p->elems=(int *)malloc(sizeof(int) * m)){
        p->max=m;
        p->pos=0;
        cout<<"Congratulations!Initial sucessfully!\n";
    }
}
void initPOSTK(POSTK * const p,const POSTK &s){
    if(p->elems=(int *)malloc(sizeof(int)*s.max)){
        p->max=s.max;
        p->pos=s.pos;
        for(int i=0;i<s.max;i++){
          *((p->elems)+i)=*(s.elems+i);
        }
        cout<<"Initialize the stack by s succesfully"<<"\n";
    }    
}
int size(const POSTK *const p){
    return p->max;
}
int howMany(const POSTK * const p){
    return p->pos;
}
int getelem(const POSTK *const p,int x){
    if(x<p->pos){
         return *((p->elems)+x);      
    }
    else return OVERFLOW;
   
}
POSTK *const push(POSTK *const p,int e){
    if(p->pos<p->max){
        p->elems[p->pos] =e;
        (p->pos)++;
        cout<<"Intert Sucessfully!\n";
        cout<<"The current num of the stack is : "<<howMany(p)<<"\n";
        return p;
    }
}
POSTK *const pop(POSTK *const p,int &e){
    if(p->pos>0){
        e=(p->elems)[--(p->pos)];
        cout<<"Pop sucessfully!It's : "<<e<<"\n";
        return p;
    } 
}
POSTK *const assign(POSTK *const p,const POSTK &s){
    if(p->max<s.max){
        p->elems=(int *)realloc(p->elems,sizeof(int)*s.max);
    }
    for(int i=0;i<(s.max);i++){
         p->elems[i]=*(s.elems+i);
    }    
    p->pos=s.pos;
    cout<<"Assign to stack from s sucessfully!"<<"\n";
    return p;
}
void print(const POSTK * const p){
    cout<<"Print the stack is : \n";
    for(int i=p->pos-1;i>=0;i--){
        cout<<"|  ";
        cout<<(p->elems)[i];
        cout<<"  |\n";
    }
    cout<<"|-top-|\n";
    cout<<"-------";
    cout<<"\n";
}
void destroyPOSTK(POSTK * const p){
    free(p->elems);
    p->max=0;
    p->pos=0;
    cout<<"Destroy sucessfully!\n";
}
