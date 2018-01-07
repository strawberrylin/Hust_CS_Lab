/*************************************************************************
	> File Name: queis.cpp
	> Author: strawberrylin
	> Github: https://github.com/strawberrylin
	> Created Time: 2016年11月05日 星期六 23时52分19秒
 ************************************************************************/

#include "data5.h"
using namespace std;
int main(){
    int e;
    QUEIS Q(10);
    QUEIS queue2(10);
    Q<<1<<2<<3<<4<<5;
    queue2<<0<<9<<8;
    int many = queue2;
    cout<<"Te num of the queue is : "<<many<<"\n";
    queue2.print();
    queue2>>e;
    queue2>>e;
    queue2.print();
    queue2=(Q);
    cout<<"The num of the queue is : "<<many<<"\n";
    queue2.print();
    return 0;
}
QUEIS::QUEIS(int m):s(m),STACK(m){
    cout<<"Initialize the queue\n";
}
QUEIS::QUEIS(const QUEIS &q):s(q.s),STACK(q){
    cout<<"Initialize the queue form s\n";
}
QUEIS::~QUEIS(){
    cout<<"Descontruct the queue\n";
}
QUEIS::operator int()const{
    int num = STACK::operator int();//fatherClass::operator name
    return num;
}
QUEIS& QUEIS::operator << (int e){
    int num1 = STACK::operator int();
    int num2;
    int temp;
    if(num1 < STACK::size()){
        for(int i=0;i<num1;i++) {
            STACK::operator >> (temp);
            s << temp;
        }
        s << e;
        num2 = s;
        for(int j=0;j<num2;j++){
            s >> temp;
            STACK::operator << (temp);
        }
        cout<<"Insert into the queue successfully\n";
        return *this;
    }
    else 
        cout<<"Quitthe queue failed\n";
}
QUEIS& QUEIS::operator >> (int &e){
    int num = STACK::operator int();
    if(num){
        STACK::operator >> (e);
        cout<<"Quit the queue successfully\n";
        return *this;
    }
    else 
        cout<<"Quit the queue failed\n";
}
QUEIS & QUEIS::operator = (const QUEIS &q){
    this->~QUEIS();
    new (this)QUEIS(q);
    cout<<"Assign the queue by q sucessfully\n";
    return *this;
}
void QUEIS:: print()const{
    cout<<"Print the queue : \n";
    STACK::print();
}
