/*************************************************************************
	> File Name: stack3.cpp
	> Author: strawberrylin
	> Mail: hust.wanglin@gmail.com
	> Created Time: 2016年10月28日 星期五 19时28分58秒
 ************************************************************************/

#include"data3.h"
using namespace std;
int main(void){
    int x=1;
    STACK S(10);
    S<<(1)<<(2)<<(3)<<(4)<<(5);
    STACK s1(S);
    int size=s1.size();
    cout<<"The content of the stack is :  "<<size<<"\n";
    int many=s1;
    cout<<"The current number of the stack is : "<<many<<"\n";
    s1<<(6);
    s1.print();
    cout<<"The inquired element is : "<<s1[5]<<"\n";
    s1>>(x);
    cout<<"the element is : "<<x<<"\n";
    s1.print();
    S<<6;
    s1 = S;
    s1.print();
    return 0;
}
STACK::STACK(int m):max(m),elems(new int[sizeof(int)*m]){
    pos=0;
}
STACK::STACK(const STACK &s):max(s.max),elems(new int[sizeof(int)*s.max]){
    pos=s.pos;
    for(int i=0;i<s.max;i++){
        elems[i]=s.elems[i];
    }
    cout<<"Initialize the stack by s\n";
}
STACK::~STACK(){
    if(elems){
        delete elems;
        pos=0;
        cout<<"DESCONSTRUCT~\n";
    }
}
int STACK::size()const{
    return max;
}
STACK::operator int()const {
    return pos;
}
int STACK::operator [](int x)const{
    if(x<pos)
        return elems[x];
    else
        cout<<"sorry!There is something wrong when inquore the element\n";
}
STACK& STACK::operator << (int e){
    if(pos<max) {
        elems[pos++]=e;
        cout<<"Insert the element successfully!\n";
        return *this;
    }
    cout<<"Sorry!Insert failed";
}
STACK& STACK::operator >>(int &e){
    if(pos){
        e=elems[--pos];
        cout<<"Pop the element successfully\n";
        return *this;
    }
    else
        cout<< "Sorry!Pop failed\n";
}
STACK& STACK::operator =(const STACK&s){
    this->~STACK();
    new (this)STACK(s);
    cout<<"Assign the stack from s successfully\n";
    return *this;
}
void STACK::print()const{
    cout<<"print the stack :  \n";
    cout<<"|-top-|\n";
    for(int i=pos-1;i>=0;i--){
        cout<<"|  ";
        cout<<elems[i];
        cout<<"  |\n";
    }
    cout<<"-------\n";
}
