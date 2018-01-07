/*************************************************************************
	> File Name: sdata.h
	> Author: strawberrylin
	> Mail: hust.wangli@gmail.com
	> Created Time: 2016年10月28日 星期五 18时41分06秒
 ************************************************************************/

#ifndef _DATA_H
#define _DATA_H

#include<stdio.h>
#include<iostream>
#include<malloc.h>

#define TRUE 1
#define FALSE 0
#define OVERFLOW -1

#define MAX_NUM 10
//===================运算符重载面向对象的STACK=====================//
class STACK{
    int  *const  elems;		//申请内存用于存放栈的元素
    const  int   max;			//栈能存放的最大元素个数
    int   pos;				//栈实际已有元素个数，栈空时pos=0;
public:
    STACK(int m);				//初始化栈：最多m个元素
    STACK(const STACK&s); 			//用栈s拷贝初始化栈
    virtual int  size ( ) const;				//返回栈的最大元素个数max
    virtual operator int ( ) const;			//返回栈的实际元素个数pos
    virtual int operator[ ] (int x) const;		//取下标x处的栈元素
    virtual STACK& operator<<(int e); 		//将e入栈，并返回当前栈
    virtual STACK& operator>>(int &e);		//出栈到e，并返回当前栈
    virtual STACK& operator=(const STACK&s);	 //赋s给当前栈并返回该栈
    virtual  void print( ) const;				//打印栈
    virtual ~STACK( );						//销毁栈
};
//======================从STACK继承的队列=========================//
class QUEIS:  public  STACK{		//STACK作为构成队列的第1个栈
    STACK  s;						//s作为构成队列的第2个栈
public:
    QUEIS(int m);						//初始化队列：每栈最多m个元素
    QUEIS(const QUEIS &q); 		//用队列q拷贝初始化队列
    virtual operator int () const;		//返回队列的实际元素个数
    virtual QUEIS& operator<<(int e); 	//将e入队列，并返回当前队列
    virtual QUEIS& operator>>(int &e);//出队列到e，并返回当前队列
    virtual QUEIS& operator=(const QUEIS &q); //赋q给队列并返回该队列
    virtual void print() const;			//打印队列
    virtual ~QUEIS();					//销毁队列
};
#endif
