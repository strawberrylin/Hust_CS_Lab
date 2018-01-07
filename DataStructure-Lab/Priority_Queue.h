#ifndef PRIORITY_QUEUE_H_INCLUDED
#define PRIORITY_QUEUE_H_INCLUDED

#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include<windows.h>
#include<io.h>

//��������
#define TRUE 1
#define FALSE 0
#define OK 1
#define ERROR 0
#define INFEASIBLE -1
#define OVERFLOW -2

//��ʼ���г���
#define NUM_PATIENT 100
//ÿ�����ݵĲ�����Ŀ
#define EXTRA_PATIENT 50

//�������Ͷ���
typedef int Status;     //����
typedef int Boolean;    // ������
typedef int Time;     //����ʱ��
typedef float Priority;  //�������ȼ�

/***************��Ļ����̨�趨******************/
#define SCR_ROW 50      //��Ļ����
#define SCR_COL 80       //��Ļ����
CHAR_INFO *gp_buff_menubar_info=NULL;//��Ų˵�����Ļ���ַ���Ϣ�Ļ�����
CHAR_INFO *gp_buff_staeBar_info=NULL;//���״̬����Ļ���ַ���Ϣ�Ļ�����
HANDLE gh_std_out;                       //��׼����豸���
HANDLE gh_std_in;                         //��׼�����豸���
char *gp_sys_name="���ȼ����з���ģ���¼�";
BOOL HelloSys();//��ӭ����

//������Ϣ�ṹ����
typedef struct patient
{
    Time arrivedTime;     //���没�˵���ʱ��
    Time starttime;         //���没�˿�ʼ���ʱ��
    Time tratetime;         //���没������ʱ��
    Time leavingTime;     //���没���뿪ʱ��
    Priority priority;   //���没�����ȼ�
    Time waittime;       //�����ܹ��ȴ�ʱ��
    Time toleranttime;    //�������̵�ʱ��
} Patient;

//���нṹ����
typedef struct LinkQueue
{
    Patient *queue;
    int queuelength;     //���г���
    int Content;       //��������
    Boolean isTreating;        //�Ƿ����ھ���
} LinkQueue;

//-------------------------���ȼ����к���------------------------
Status InitQueue(LinkQueue *q);  //��������
Status DestroyQueue(LinkQueue *q);//���ٶ���
int QueueLength(LinkQueue q); //������г���
Status QueueInsert(LinkQueue *q, Patient p);//�����
Status QueueDeletMaxPriority(LinkQueue *q, Patient *p);//ɾ�����ȼ����Ԫ��
Status QueueFull(LinkQueue q); //�ж��Ƿ�������
Status QueueEmpty(LinkQueue q);//�ж϶����Ƿ�Ϊ��

//--------------------------��������------------------------
Status HeapAdjust(LinkQueue *q, int top, int queuesize);//����Ϊ�󶥶�
Status HeapSort(LinkQueue *q); //������ʵ��

//--------------------------����ģ�⺯��-------------------------
Time NowTime();//��ȡϵͳ��ǰ����
Patient ComePatient();//�µĲ�������
Time GetIntervaltime();//���ü��ʱ��
Status ShowQueue(LinkQueue q);//��ʾ��ǰ����
Status ShowPatientInfo(LinkQueue q);//��ʾ��ǰ������Ϣ
Priority GetPriority(Time arrivetime,Status lablenum,Time waittime);  //���ò������ȼ�
#endif
// PRIORITY_QUEUE_H_INCLUDED

