/*************************************************************************
> File Name: stack2.cpp
> Author: 
> Mail: 
> Created Time: 2016年10月21日 星期五 18时51分59秒
************************************************************************/

#include"data2.h"
#define STACK_DEBUG
// #undef STACK_DEBUG

using namespace std;
OOSTK::OOSTK(int m):max(MAX_NUM),elems(new int[sizeof(int)*m]){
    pos=0;
}
OOSTK::OOSTK(const OOSTK &s):max(s.max),elems(new int[sizeof(int)*s.max]){
    pos=s.pos;
    for(int i=0;i<pos;i++){
        elems[i]=s.elems[i];
    }
#ifdef STACK_DEBUG
    cout<<"Initialize the stack by s \n";
#endif
}
OOSTK::~OOSTK(){
    if(elems==0)return;
#ifdef STACK_DEBUG
    cout<<"DESCONSTRUCT~"<<"\n";
#endif
    delete elems;
    pos=0;
}

int OOSTK::size()const{
#ifdef STACK_DEBUG
    cout<<"The curent size of the stack is : "<<max<<"\n";
#endif
    return max;
}
int OOSTK::howMany()const{
#ifdef STACK_DEBUG
    cout<<"The current number of the stack is :"<<pos<<"\n";
#endif
    return pos;     
}
int OOSTK::getelem(int x)const{
    if(x<pos){
#ifdef STACK_DEBUG
        cout<<"The element is : "<<elems[x]<<" at the "<<x<<"\n";
#endif
        return elems[x];
    }else
#ifdef STACK_DEBUG
    cout<<"ERROR!There is something wrrong when inquire the elems."<<"\n";
#endif
    return 0;
}
void OOSTK::print()const{
#ifdef STACK_DEBUG
    cout<<"Print the stack : \n";
    cout<<"|-top-|\n";
#endif
    for(int i=pos-1;i>=0;i--){
#ifdef STACK_DEBUG
        cout<<"|  ";
        cout<<elems[i];
        cout<<"  |\n";
#endif
    }
#ifdef STACK_DEBUG
    cout<<"-------\n";
#endif
}
OOSTK & OOSTK::push(int e){
    if(pos<max){
        elems[pos++]=e;
#ifdef STACK_DEBUG
        cout<<"Insert the element sucessfully!\n";
#endif
        return *this;
    }
    else
#ifdef STACK_DEBUG
    cout<<"Insert Error!\n";
#endif
}
OOSTK & OOSTK::pop(int &e){
    if(pos>0){
        e=elems[--pos];
#ifdef STACK_DEBUG
        cout<<"Pop the element sucessfully!\n";
#endif
        return *this;
    }
}
OOSTK & OOSTK::assign(const OOSTK &s){
    this->~OOSTK();
    new (this) OOSTK(s);
#ifdef STACK_DEBUG
    cout<<"assign the stack by s \n";
#endif
    return *this;
}

int main(){
    int x;
    OOSTK S(10);
    S.push(1).push(2).push(3).push(4).push(5);
    //OOSTK s1(10);
    OOSTK s1(S);
    s1.size();
    s1.howMany();
    s1.push(2);
    s1.print();
    s1.getelem(0);
    s1.pop(x);
    cout<<x<<"\n";
    s1.print();
}

