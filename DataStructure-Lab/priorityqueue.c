#include "Priority_Queue.h"


int main(void)
{
    COORD size= {SCR_COL,SCR_ROW};                 //���ڻ�������С
    COORD pos={25,8};
    gh_std_in=GetStdHandle(STD_INPUT_HANDLE);      //��ȡ��׼�����豸���
    gh_std_out=GetStdHandle(STD_OUTPUT_HANDLE);    //��ȡ��׼����豸���
    SetConsoleTitle(gp_sys_name);                  //���ô��ڱ���
    SetConsoleScreenBufferSize(gh_std_out,size);   //���ô��ڻ�������С
    Patient patient;
    Patient *pPatient = (Patient *) malloc(sizeof(Patient));
    LinkQueue Q;              //�����������Q
    Q.queue = NULL;
    Status label=1;//��ǵ�һ������
    int i=0;              //������
    FILE *fp;

    Time intervaltime,nexttime,labletime;          //ʱ�䶨��
    HelloSys();//������ӭ����
    system("CLS");//����


    //�������ȼ�����
    InitQueue(&Q);
    ShowQueue(Q);
    while(NowTime()<=2359)
    {
        if(Q.queuelength)
        {
            if(Q.queue[0].leavingTime>NowTime())
            {
                Q.isTreating=TRUE;
            }
        }
        else Q.isTreating=FALSE;
        SetConsoleCursorPosition(gh_std_out,pos);
        if(Q.isTreating)    printf("----������...\n");
        else printf("-----�ȴ����˵���----\n");
        Sleep(2000);
        if(label==1)//������һ������
        {
            intervaltime=GetIntervaltime();
            nexttime=NowTime()+intervaltime;
            if((nexttime%100)>=60)
            {
                nexttime=(nexttime%100-60)+(nexttime/100+1)*100;
            }
            SetConsoleCursorPosition(gh_std_out,pos);
            printf("-----��һ������%d���Ӻ���-----\n",intervaltime);
            while(NowTime()<nexttime);
            patient=ComePatient();
            if (QueueInsert(&Q,patient)==OK)
            {
                ShowQueue(Q);
                SetConsoleCursorPosition(gh_std_out,pos);
                printf("[���˴ﵽ�¼�]----�Ŷӳɹ�\n");
                Sleep(2000);
            }
        }
        else
        {
            if(Q.queuelength)
            {
                while(NowTime()<Q.queue[0].arrivedTime);
            }
        }
        while(NowTime()<Q.queue[0].leavingTime)
        {
            Q.isTreating=TRUE;
            intervaltime=GetIntervaltime();
            nexttime=NowTime()+intervaltime;
            if((nexttime%100)>=60)
            {
                nexttime=(nexttime%100-60)+(nexttime/100+1)*100;
            }
            SetConsoleCursorPosition(gh_std_out,pos);
            printf("----��һ������%d���Ӻ���-----\n",intervaltime);
            if(nexttime<Q.queue[0].leavingTime)
            {
                while(NowTime()<nexttime);
                patient=ComePatient();
                if(QueueInsert(&Q,patient))
                {
                    ShowQueue(Q);
                    SetConsoleCursorPosition(gh_std_out,pos);
                    printf("[���˴ﵽ�¼�]----ȡ���Ŷӳɹ�\n");
                    Sleep(2000);
                }
            }
            else break;
        }
        while(NowTime()<Q.queue[0].leavingTime);//���ﵱǰ�����뿪ʱ���
        if(QueueDeletMaxPriority(&Q, pPatient)==OK)
        {
            SetConsoleCursorPosition(gh_std_out,pos);
            labletime=pPatient->leavingTime;
            printf("\n\n�����뿪�¼�--[��ʼʱ�䣺[%d]  ���ȼ�:[%f]  ��ȥʱ�䣺[%d] ����ʱ�䣺[%d] ]\n",
                   pPatient->starttime,pPatient->priority,pPatient->leavingTime,
                   pPatient->tratetime);
                   Sleep(2000);
            //�ļ���дģ��
            if((fp=fopen("test.dat", "ab+")) == NULL)
            {
                exit(-1);
            }
            fwrite(pPatient,sizeof(Patient),1,fp);
            fclose(fp);
            HeapSort(&Q);//�������ȼ���˳�����
        }
        //����ʱ�����
        for(i=0; i<Q.queuelength; i++)
        {
            Q.queue[i].starttime=(labletime<Q.queue[i].starttime?Q.queue[i].starttime:labletime);
            Q.queue[i].leavingTime=Q.queue[i].starttime+Q.queue[i].tratetime;
            if((Q.queue[i].leavingTime%100)>=60)
            {
                Q.queue[i].leavingTime=(Q.queue[i].leavingTime%100-60)+
                                        (Q.queue[i].leavingTime/100+1)*100;
            }
            labletime=Q.queue[i].leavingTime;
        }
        //��ʾ����
        ShowQueue(Q);
        //��鵱ǰ�����Ƿ��ڶ����еȴ�
        while(Q.queue[0].toleranttime<NowTime())
        {
            if(QueueDeletMaxPriority(&Q, pPatient)==OK)
            {
                SetConsoleCursorPosition(gh_std_out,pos);
                pPatient->leavingTime=pPatient->toleranttime;
                pPatient->starttime=0;
                labletime=NowTime();
                printf("\n\n����δ�����뿪�¼�--[�ﵽʱ�䣺[%d] ���ȼ�:[%f] ��ȥʱ��[%d] �ȴ�ʱ�䣺[%d] ]\n",
                pPatient->arrivedTime,pPatient->priority,pPatient->leavingTime,
                pPatient->waittime);
                Sleep(2000);
                //�ļ���дģ��
                if((fp=fopen("test.dat", "ab+")) == NULL)
                {
                    exit(-1);
                }
                fwrite(pPatient,sizeof(Patient),1,fp);
                fclose(fp);
                HeapSort(&Q);//�������ȼ���˳�����
                //����ʱ��
                for(i=0; i<Q.queuelength; i++)
                {
                    Q.queue[i].starttime=labletime;
                    Q.queue[i].leavingTime=Q.queue[i].starttime+Q.queue[i].tratetime;
                    if((Q.queue[i].leavingTime%100)>=60)
                    {
                        Q.queue[i].leavingTime=(Q.queue[i].leavingTime%100-60)+
                        (Q.queue[i].leavingTime/100+1)*100;
                    }
                    labletime=Q.queue[i].leavingTime;
                }
                //��ʾ����
                ShowQueue(Q);
            }
            else break;
        }
        //����������һ������
        while(NowTime()<nexttime);
        patient=ComePatient();
        if(QueueInsert(&Q,patient))
        {
            ShowQueue(Q);
            SetConsoleCursorPosition(gh_std_out,pos);
            printf("[���˴ﵽ�¼�]----ȡ���Ŷӳɹ�\n");
        }
        label++;
    }
    return 0;
}
/*----------------------���в�������ʵ��-------------------------*/

/******************************************************************
�������ƣ�InitQueue
�������ܣ������ն���
��������������ָ��q
��������ֵ�������ɹ�������OK
*****************************************************************/
Status InitQueue(LinkQueue *q)
{
    q->queue = (Patient *) malloc(sizeof(Patient) * NUM_PATIENT);//����ռ�
    q->Content = NUM_PATIENT;
    q->queuelength = 0;
    q->isTreating = FALSE;
    return OK;
}
/******************************************************************
�������ƣ�DestroyQueue
�������ܣ����ٶ���
��������������ָ��q
��������ֵ�����ٳɹ�������OK
*****************************************************************/
Status DestroyQueue(LinkQueue *q)
{
    free(q);
    q->queue = NULL;
    q->Content = 0;
    return OK;
}
/******************************************************************
�������ƣ�ClearQueue
�������ܣ���ն���
��������������ָ��q
��������ֵ����ճɹ�������OK
*****************************************************************/
Status ClearQueue(LinkQueue *q)
{
    q->queuelength = 0;
    return OK;
}
/******************************************************************
�������ƣ�QueueLength
�������ܣ�������г���
��������������q
��������ֵ�����г���
*****************************************************************/
int QueueLength(LinkQueue q)
{
    return q.queuelength;
}
/******************************************************************
�������ƣ�QueueInsert
�������ܣ���Ԫ�����
��������������q����Ԫ��patient
��������ֵ������ɹ�������OK
*****************************************************************/
Status QueueInsert(LinkQueue *q, Patient patient)
{
    //�Ƿ�������
    if (QueueFull(*q) == TRUE)
    {
        q->queue=(Patient *)realloc(q->queue,sizeof(Patient)*(q->Content+ EXTRA_PATIENT));
        if (q->queue == NULL) return ERROR;
        q->Content += EXTRA_PATIENT;
    }
    //�������
    q->queue[q->queuelength] = patient;
    //���г�������
    q->queuelength++;
    return OK;
}
/******************************************************************
�������ƣ�QueueDeletMaxPriority
�������ܣ�ɾ����ǰ����
��������������ָ��q��ָ���˵�ָ��
��������ֵ��ɾ���ɹ�������OK
*****************************************************************/
Status QueueDeletMaxPriority(LinkQueue *q, Patient *patient)
{
    int i;
    //��ǰ�����Ƿ�Ϊ��
    if (QueueEmpty(*q) == TRUE) return ERROR;
    *patient = q->queue[0];//ɾ������
    for (i = 1; i < q->queuelength; i++)  //����Ԫ��ǰ��
    {
        q->queue[i - 1] = q->queue[i];
    }
    //���г��ȼ�һ
    q->queuelength--;
    return OK;
}
/******************************************************************
�������ƣ�QueueEmpty
�������ܣ��ж϶����Ƿ�Ϊ��
��������������q
��������ֵ��Ϊ�շ���1�����򷵻�0
*****************************************************************/
Status QueueEmpty(LinkQueue q)
{
    return (q.queuelength==0);
}
/******************************************************************
�������ƣ�QueueFull
�������ܣ��ж϶����Ƿ�������
��������������q
��������ֵ�������з���1�����򷵻�0
*****************************************************************/
Status QueueFull(LinkQueue q)
{
    return (q.queuelength == q.Content);
}

/*-----------------------��������ʵ��--------------------------*/

/******************************************************************
�������ƣ�HeapAdjust
�������ܣ�������ʹ����󶥶ѵ���ʽ
��������������ָ��q�����α���top,���г��ȱ���
��������ֵ�������ɹ�������OK
*****************************************************************/
Status HeapAdjust(LinkQueue *q, int top, int queuelength)
{
    int i;
    Patient temp = q->queue[top];
    if (q->queue == NULL)
        return ERROR;
    for (i = 2 * top + 1; i < queuelength; top = i, i = 2 * i + 1)//����ɸѡ
    {
        if (i+1<queuelength&&q->queue[i].priority>q->queue[i + 1].priority)
        {
            i++;
        }
        if (temp.priority <= q->queue[i].priority)
        {
            break;
        }
        q->queue[top] = q->queue[i];
    }
    q->queue[top] = temp;
    return OK;
}
/******************************************************************
�������ƣ�HeapSort
��������ʵ�ֶ�����
��������������ָ��q
��������ֵ������ɹ�������OK
*****************************************************************/
Status HeapSort(LinkQueue *q)
{
    int i;
    Patient temp;
    if (q->queue == NULL ||QueueEmpty(*q) == TRUE)
        return ERROR;
    for (i =((q->queuelength - 1) / 2); i >= 0; i--)
    {
        HeapAdjust(q,i, q->queuelength);
    }
    for (i = q->queuelength - 1; i > 0; i--)
    {
        temp = q->queue[0];
        q->queue[0] = q->queue[i];
        q->queue[i] = temp;
        HeapAdjust(q, 0, i);//���µ���Ϊ�󶥶�
    }
    return OK;
}

/*--------------------�����¼�ģ�⺯��ʵ��----------------------*/

/******************************************************************
�������ƣ�ComePatient
�������ܣ�ģ������һλ����
������������
��������ֵ������
*****************************************************************/
Patient ComePatient()
{
    Patient patient;
    Time lablenum;
    //ϵͳʱ����Ϊ�����������
    srand((unsigned int) time(NULL));
    //ȡ����ʱ��Ϊ[3,9]����
    patient.tratetime=(int)(rand()%7+3);
    //��¼���˵���ʱ��Ϊϵͳ��ǰʱ��
    patient.arrivedTime = NowTime();
    //��¼�����뿪ʱ��Ϊ����ʱ��+����ʱ��
    patient.leavingTime = patient.arrivedTime + patient.tratetime;
    if((patient.leavingTime%100)>=60)
    {
        patient.leavingTime=(patient.leavingTime%100-60)+
                                (patient.leavingTime/100+1)*100;
    }
    //�������lablenum
    lablenum=(int)(rand()%30+20);
    //��������������̵ȴ�ʱ��
    patient.waittime=(int)(rand()%20+5);
    //����õ��������ȼ�
    patient.priority=GetPriority(patient.arrivedTime,lablenum,patient.waittime);
    //���㲡���ܹ��ȴ���ʱ��
    patient.toleranttime=patient.arrivedTime+patient.waittime;
    if((patient.toleranttime%100)>=60)
    {
        patient.toleranttime=(patient.toleranttime%100-60)+
                                (patient.toleranttime/100+1)*100;
    }
    //Ĭ�ϵĿ�ʼ����ʱ��Ϊ���˵������ҽ�����е�ʱ��
    patient.starttime=patient.arrivedTime;
    return patient;
}
/******************************************************************
�������ƣ�NowTime
�������ܣ���ȡϵͳ��ǰʱ��
������������
��������ֵ����ǰʱ��
*****************************************************************/
Time NowTime()
{
    time_t nowtime;
    struct tm *timeinfo;
    Time currenttime;
    time(&nowtime);                    //��ȡϵͳ��ǰʱ��
    timeinfo = localtime(&nowtime);
    //ȡСʱ�ͷ��ӵ�ʱ��
    currenttime =timeinfo->tm_hour*100 + timeinfo->tm_min;
    return currenttime;
}
/******************************************************************
�������ƣ�GetIntervaltime
�������ܣ�ģ�����һ�����ʱ���
������������
��������ֵ�����ʱ��
*****************************************************************/
Time GetIntervaltime()
{
    int _time;
    srand((unsigned int) time(NULL));
    //��������ʱ����Ϊ[2,6]
    _time = (Time) (rand() %5+2);
    return _time;
}
/*************************************************************************************
�������ƣ� HelloSys
�������ܣ� ��ӭ����
���������� ��
��������ֵ:TRUE
*************************************************************************************/
BOOL HelloSys()
{
    int m;
    char mark[2]= {'0'};         //���ѡ���Ƿ���
    DWORD a;
    char* Menu[] =                     //��ʾ��Ϣ
    {
        "------------------",
        "��ӭʹ�ñ�ϵͳ",
        "ȷ��",
        " (-_-)",
        "------------------"
    };
    COORD Head_Line = {32,9};             //��������ʼλ��
    COORD U= {32,8},B= {32,15},Ok= {39,11};
    COORD pos= {32,10};                //��ӭ��
    COORD pos_2;
    COORD cursor;                      //���λ��

    WORD att_headline =BACKGROUND_GREEN|BACKGROUND_RED|BACKGROUND_INTENSITY
                       |FOREGROUND_RED;    //��������ɫ�����Ʊ�������ɫǰ��
    //��ʾ��Ϣ����ɫ:����
    WORD att_background =BACKGROUND_BLUE|BACKGROUND_RED|BACKGROUND_INTENSITY;
    WORD att_end =BACKGROUND_GREEN|BACKGROUND_INTENSITY
                  |FOREGROUND_BLUE|FOREGROUND_INTENSITY;
    //��ӭ���ַ����ԣ����̱�����,����ǰ��
    WORD att_choice =FOREGROUND_BLUE|FOREGROUND_GREEN|FOREGROUND_RED;
    //ѡ��������ɫ������
    WORD att_choice_on =FOREGROUND_BLUE|FOREGROUND_INTENSITY;
    //�������"ȷ��"����ɫ
    DWORD res;
    INPUT_RECORD inRec;
    BOOL bRet =TRUE;
    FillConsoleOutputAttribute(gh_std_out,att_headline,18,Head_Line,&a); //���ñ�����
    for(m=0; m<5; m++)
    {
        FillConsoleOutputAttribute(gh_std_out,att_end,18,pos,&a);
        if(pos.Y==11)
        {
            pos_2.X=pos.X+7;
            pos_2.Y=pos.Y;
            WriteConsoleOutputCharacter(gh_std_out,Menu[2],strlen(Menu[2]),pos_2,&a);
        }
        if(pos.Y==13)
        {
            pos_2.X=pos.X+6;
            pos_2.Y=pos.Y;
            WriteConsoleOutputCharacter(gh_std_out,Menu[3],strlen(Menu[3]),pos_2,&a);
        }
        pos.Y++;
    }
    FillConsoleOutputAttribute(gh_std_out,att_background,18,U,&a);
    WriteConsoleOutputCharacter(gh_std_out,Menu[0],18,U,&a);
    FillConsoleOutputAttribute(gh_std_out,att_background,18,B,&a);
    WriteConsoleOutputCharacter(gh_std_out,Menu[4],18,B,&a);
    Head_Line.X+=2;
    WriteConsoleOutputCharacter(gh_std_out,Menu[1],strlen(Menu[1]),Head_Line,&a);


    while(bRet)
    {
        ReadConsoleInput(gh_std_in,&inRec,1,&res);     //�ӿ���̨���뻺�����ж�һ����¼
        if(inRec.EventType==MOUSE_EVENT)
        {
            /*����¼��ɰ�������*/
            cursor =inRec.Event.MouseEvent.dwMousePosition;
            //�������ڡ��ǡ����ҡ��ǡ�δ�����
            if(cursor.Y==Ok.Y&&cursor.X<=Ok.X+4&&cursor.X>=Ok.X&&mark[0]=='0')
            {
                /*�ı䡰ȷ��������*/
                FillConsoleOutputAttribute(gh_std_out,att_choice_on,strlen(Menu[2]),Ok,&a);
                WriteConsoleOutputCharacter(gh_std_out,Menu[2],strlen(Menu[2]),Ok,&a);
                mark[0]='1';
            }
            //�����겻�ڡ��ǡ����ҡ��ǡ������
            if((cursor.Y!=Ok.Y||cursor.X<Ok.X||cursor.X>Ok.X+4)&&mark[0]=='1')
            {
                /*�ı䡰ȷ��������*/
                mark[0]='0';
                FillConsoleOutputAttribute(gh_std_out,att_choice,strlen(Menu[2]),Ok,&a);
                WriteConsoleOutputCharacter(gh_std_out,Menu[2],strlen(Menu[2]),Ok,&a);
            }
            //�������ڡ��ǡ����Ұ���������
            if(cursor.Y==Ok.Y&&cursor.X<=Ok.X+2&&cursor.X>=Ok.X&&
               inRec.Event.MouseEvent.dwButtonState==FROM_LEFT_1ST_BUTTON_PRESSED)
            {
                return TRUE;
            }
        }
    }
    return TRUE;
}
/*************************************************************************************
�������ƣ� ShowQueue
�������ܣ� ��ʾ��ǰ����
���������� ����q
��������ֵ:TRUE
*************************************************************************************/
Status ShowQueue(LinkQueue q)
{
    system("CLS");//����
    int i=0;          //������
    Time currenttime=NowTime();
    WORD att_headline =BACKGROUND_GREEN|BACKGROUND_RED|BACKGROUND_INTENSITY
                      |FOREGROUND_BLUE;    //��������ɫ�����Ʊ�������ɫǰ��
    WORD att_queue =BACKGROUND_GREEN|BACKGROUND_INTENSITY
                  |FOREGROUND_BLUE|FOREGROUND_INTENSITY;
    WORD att_first=BACKGROUND_RED|BACKGROUND_INTENSITY;
    COORD Head_Line ={32,5};
    COORD Time_Line={55,0};
    COORD pos_Queue={5,13};
    COORD pos={5,11};
    DWORD a;
    char *headline="Start The Simulation";
    char *str=" ";
    //���ñ�����
    FillConsoleOutputAttribute(gh_std_out,att_headline,strlen(headline),Head_Line,&a);
    WriteConsoleOutputCharacter(gh_std_out,headline,strlen(headline),Head_Line,&a);
    SetConsoleCursorPosition(gh_std_out,Time_Line);
    printf("ϵͳ�ϴθ���ʱ��--[%d]",currenttime);
    if(q.queuelength)
    {
        for(i=0; i<q.queuelength; i++)
        {
            if(i==0)
            {
                printf("\a");
                FillConsoleOutputAttribute(gh_std_out,att_first,2,pos_Queue,&a);
                WriteConsoleOutputCharacter(gh_std_out,str,2,pos_Queue,&a);
                SetConsoleCursorPosition(gh_std_out,pos);
                printf("[---���ھ���---]");
                pos_Queue.X=pos_Queue.X+5;
                continue;
            }
            FillConsoleOutputAttribute(gh_std_out,att_queue,2,pos_Queue,&a);
            WriteConsoleOutputCharacter(gh_std_out,str,2,pos_Queue,&a);
            pos_Queue.X=pos_Queue.X+5;
            if(pos_Queue.X>=79)
            {
                pos_Queue.Y++;
                pos_Queue.X=0;
            }
        }
    }
    else
    {
        SetConsoleCursorPosition(gh_std_out,pos);
        printf("---�ȴ����˵���---");
    }
    ShowPatientInfo(q);
    return OK;
}
/*************************************************************************************
�������ƣ� ShowPatientInfo
�������ܣ� ��ʾ��ǰ�ŶӲ�����Ϣ
���������� ����q
��������ֵ:TRUE
*************************************************************************************/
Status ShowPatientInfo(LinkQueue q)
{
    int i;
    FILE *fpout;
    COORD pos={0,26};
    Patient *PatientNode;
    Status sumcure=0,sumpatient=0,sumquit=0;
    PatientNode=(Patient *)malloc(sizeof(Patient));
    if((fpout=fopen("test.dat","ab+"))==NULL)
    {
        printf("������Ϣ�ļ�����ʧ�ܣ�\n");
        exit(-1);
    }
    SetConsoleCursorPosition(gh_std_out,pos);
    for(i=0;i<32;i++) printf(("-"));
    printf("�Ѿ����ﲡ�˼�¼");
    for(i=0;i<32;i++) printf(("-"));
    while(!feof(fpout))
    {
        fread(PatientNode,sizeof(Patient),1,fpout);
        if(!feof(fpout))
        {
            sumcure++;//�Ѿ����ﲡ����Ŀ
            if(PatientNode->starttime)
            {
                printf("[����ʱ��: %d ʵ�ʿ�ʼ����:%d ����ʱ��: %d �뿪ʱ��: %d ���ȼ�: %2.3f]\n",PatientNode->arrivedTime,
                   PatientNode->starttime,PatientNode->tratetime,PatientNode->leavingTime,PatientNode->priority);
            }
            else
            {
                sumquit++;//�뿪������Ŀ
                printf("[����ʱ��: %d �ȴ�ʱ��: %d �뿪ʱ��: %d ���ȼ�: %2.3f  δ�����뿪]\n",PatientNode->arrivedTime,
                   PatientNode->waittime,PatientNode->leavingTime,PatientNode->priority);
            }
        }
    }
    fclose(fpout);
    if(q.queuelength)
    {
        for(i=0; i<32; i++) printf(("-"));
        printf("���ھ��ﲡ�˼�¼");
        for(i=0; i<32; i++) printf(("-"));
        sumpatient++;
        printf("[����ʱ��: %d ʵ�ʿ�ʼ����:%d ����ʱ��: %d �뿪ʱ��: %d ���ȼ�: %2.3f]\n",q.queue[0].arrivedTime,
        q.queue[0].starttime,q.queue[0].tratetime,q.queue[0].leavingTime,q.queue[0].priority);
        for(i=0; i<30; i++) printf(("-"));
        printf("�ŶӴ����ﲡ�˼�¼");
        for(i=0; i<32; i++) printf(("-"));
        for(i=1; i<q.queuelength; i++)
        {
            sumpatient++;
            printf("[����ʱ��: %d ԭ����ʼ����:%d ����ʱ��: %d �뿪ʱ��: %d ���ȼ�: %2.3f]\n",q.queue[i].arrivedTime,
            q.queue[i].starttime,q.queue[i].tratetime,q.queue[i].leavingTime,q.queue[i].priority);
        }
        sumpatient=sumpatient+sumcure+sumquit;//��������
        for(i=0; i<36; i++) printf(("-"));
        printf("����ͳ��");
        for(i=0; i<36; i++) printf(("-"));
        printf("�ܹҺŲ�������%d,�Ѿ����%d,δ�����뿪��%d,�ȴ����%d, �������: %1.2f%%",
               sumpatient,sumcure,sumquit,sumpatient-sumcure-sumquit-1,((float)sumcure)/sumpatient*100);
    }
    else
    {
        printf("�ȴ����˾���\n");
    }
    return OK;
}
/*************************************************************************************
�������ƣ� GetPriority
�������ܣ� ���ò������ȼ�
���������� ���ȼ�priority
��������ֵ:TRUE
*************************************************************************************/
Priority GetPriority(Time arrivetime,Status lablenum,Time waittime)
{
    return (100-(arrivetime/100+arrivetime%100)*0.49)+lablenum*0.38+waittime*0.13;
}
