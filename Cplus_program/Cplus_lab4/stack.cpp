/*************************************************************************
	> File Name: stack3.cpp
	> Author: strawberrylin
	> Mail: hust.wanglin@gmail.com
	> Created Time: 2016年10月28日 星期五 19时28分58秒
 ************************************************************************/

#include "sdata.h"
using namespace std;
STACK::STACK(int m):max(m),elems(new int[sizeof(int)*m]){
    pos=0;
}
STACK::STACK(const STACK &s):max(s.max),elems(new int[sizeof(int)*s.max]){
    pos=s.pos;
    for(int i=0;i<s.max;i++){
        elems[i]=s.elems[i];
    }
}
STACK::~STACK(){
    if(elems){
        delete elems;
        pos=0;
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
        return *this;
    }
    cout<<"Sorry!Insert failed";
}
STACK& STACK::operator >>(int &e){
    if(pos){
        e=elems[--pos];
        return *this;
    }
    else
        cout<< "Sorry!Pop failed\n";
}
STACK& STACK::operator =(const STACK&s){
    this->~STACK();
    new (this)STACK(s);
    return *this;
}
void STACK::print()const{
    cout<<"|-top-|\n";
    for(int i=pos-1;i>=0;i--){
        cout<<"|  ";
        cout<<elems[i];
        cout<<"  |\n";
    }
    cout<<"-------\n";
}
