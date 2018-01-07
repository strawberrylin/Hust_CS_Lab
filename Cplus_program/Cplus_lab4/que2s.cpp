/*************************************************************************
	> File Name: que2s.cpp
	> Author: strawberrylin
	> Github: https://github.com/strawberrylin
	> Created Time: 2016年11月05日 星期六 14时18分59秒
 ************************************************************************/

#include"data4.h"
using namespace std;
int main(){
    int e;
    QUE2S Q(10);
    Q<<1<<9<<8<<6<<5;
    QUE2S queue(10);
    queue<<1<<2<<3<<4<<5;
    cout<<"The num of the queue is : ";
    int many = queue;
    cout<<many<<"\n";
    queue.print();
    queue >> e;
    queue >> e;
    queue >> e;
    queue.print();
    queue=(Q);
    many=queue;
    cout<<"Tht num of the queue is : "<<many<<"\n";
    queue.print();
    return 0;
}
QUE2S::QUE2S(int m):s1(m),s2(m){
    cout<<"Construct Queue\n";
}
QUE2S::QUE2S(const QUE2S &q):s1(q.s1),s2(q.s2){
    s1=q.s1;
    s2=q.s2;
    cout<<"Initialize the queue from Q\n";
}
QUE2S::~QUE2S(){
    cout<<"Destruct Queue\n";
}
QUE2S::operator int() const{
    return (int)s1;
}
QUE2S& QUE2S::operator << (int e){
    int num1 = s1;
    int num2;
    int temp;
    if(num1 < s1.size()){
        for(int i=0;i<num1;i++){
            s1 >> temp;
            s2 << temp;
        }
        s2 << e;
        num2=s2;
        for(int j=0;j<num2;j++){
            s2>>temp;
            s1<<temp;
        }
        cout<<"Insert into the queue successfully\n";
        return *this;
    }
    else
        cout<<"Insert into the queue failed\n";
}
QUE2S& QUE2S::operator >> (int &e){
    int num = s1;
    if(num){
        s1>>e;
        cout<<"Quit the queue successfully\n";
        return *this;
    }
    else
        cout<<"Quit tht queue failed\n";
}
QUE2S& QUE2S::operator = (const QUE2S &q){
    this->~QUE2S();
    new (this)QUE2S(q);
    cout<<"Assign the queue by Q succeddfully\n";
    return *this;
}
void QUE2S:: print()const{
    cout<<"Print the queue : \n";
    s1.print();
}
