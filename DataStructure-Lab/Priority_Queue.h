#ifndef PRIORITY_QUEUE_H_INCLUDED
#define PRIORITY_QUEUE_H_INCLUDED

#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include<windows.h>
#include<io.h>

//常量定义
#define TRUE 1
#define FALSE 0
#define OK 1
#define ERROR 0
#define INFEASIBLE -1
#define OVERFLOW -2

//初始队列长度
#define NUM_PATIENT 100
//每次扩容的病人数目
#define EXTRA_PATIENT 50

//变量类型定义
typedef int Status;     //整型
typedef int Boolean;    // 布尔型
typedef int Time;     //储存时间
typedef float Priority;  //储存优先级

/***************屏幕控制台设定******************/
#define SCR_ROW 50      //屏幕行数
#define SCR_COL 80       //屏幕列数
CHAR_INFO *gp_buff_menubar_info=NULL;//存放菜单条屏幕区字符信息的缓冲区
CHAR_INFO *gp_buff_staeBar_info=NULL;//存放状态条屏幕区字符信息的缓冲区
HANDLE gh_std_out;                       //标准输出设备句柄
HANDLE gh_std_in;                         //标准输入设备句柄
char *gp_sys_name="优先级队列仿真模拟事件";
BOOL HelloSys();//欢迎界面

//病人信息结构类型
typedef struct patient
{
    Time arrivedTime;     //储存病人到达时间
    Time starttime;         //储存病人开始诊断时间
    Time tratetime;         //储存病人治疗时间
    Time leavingTime;     //储存病人离开时间
    Priority priority;   //储存病人优先级
    Time waittime;       //病人能够等待时间
    Time toleranttime;    //病人容忍的时间
} Patient;

//队列结构类型
typedef struct LinkQueue
{
    Patient *queue;
    int queuelength;     //队列长度
    int Content;       //队列容量
    Boolean isTreating;        //是否正在就诊
} LinkQueue;

//-------------------------优先级队列函数------------------------
Status InitQueue(LinkQueue *q);  //创建队列
Status DestroyQueue(LinkQueue *q);//销毁队列
int QueueLength(LinkQueue q); //计算队列长度
Status QueueInsert(LinkQueue *q, Patient p);//入队列
Status QueueDeletMaxPriority(LinkQueue *q, Patient *p);//删除优先级最高元素
Status QueueFull(LinkQueue q); //判断是否满队列
Status QueueEmpty(LinkQueue q);//判断队列是否为空

//--------------------------堆排序函数------------------------
Status HeapAdjust(LinkQueue *q, int top, int queuesize);//调整为大顶堆
Status HeapSort(LinkQueue *q); //堆排序实现

//--------------------------仿真模拟函数-------------------------
Time NowTime();//获取系统当前函数
Patient ComePatient();//新的病人来到
Time GetIntervaltime();//设置间隔时间
Status ShowQueue(LinkQueue q);//显示当前队列
Status ShowPatientInfo(LinkQueue q);//显示当前病人信息
Priority GetPriority(Time arrivetime,Status lablenum,Time waittime);  //设置病人优先级
#endif
// PRIORITY_QUEUE_H_INCLUDED

