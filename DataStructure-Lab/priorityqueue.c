#include "Priority_Queue.h"


int main(void)
{
    COORD size= {SCR_COL,SCR_ROW};                 //窗口缓冲区大小
    COORD pos={25,8};
    gh_std_in=GetStdHandle(STD_INPUT_HANDLE);      //获取标准输入设备句柄
    gh_std_out=GetStdHandle(STD_OUTPUT_HANDLE);    //获取标准输出设备句柄
    SetConsoleTitle(gp_sys_name);                  //设置窗口标题
    SetConsoleScreenBufferSize(gh_std_out,size);   //设置窗口缓冲区大小
    Patient patient;
    Patient *pPatient = (Patient *) malloc(sizeof(Patient));
    LinkQueue Q;              //声明就诊队列Q
    Q.queue = NULL;
    Status label=1;//标记第一次运行
    int i=0;              //计数器
    FILE *fp;

    Time intervaltime,nexttime,labletime;          //时间定义
    HelloSys();//产生欢迎界面
    system("CLS");//清屏


    //构造优先级队列
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
        if(Q.isTreating)    printf("----就诊中...\n");
        else printf("-----等待病人到来----\n");
        Sleep(2000);
        if(label==1)//产生第一个病人
        {
            intervaltime=GetIntervaltime();
            nexttime=NowTime()+intervaltime;
            if((nexttime%100)>=60)
            {
                nexttime=(nexttime%100-60)+(nexttime/100+1)*100;
            }
            SetConsoleCursorPosition(gh_std_out,pos);
            printf("-----下一个病人%d分钟后到来-----\n",intervaltime);
            while(NowTime()<nexttime);
            patient=ComePatient();
            if (QueueInsert(&Q,patient)==OK)
            {
                ShowQueue(Q);
                SetConsoleCursorPosition(gh_std_out,pos);
                printf("[病人达到事件]----排队成功\n");
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
            printf("----下一个病人%d分钟后到来-----\n",intervaltime);
            if(nexttime<Q.queue[0].leavingTime)
            {
                while(NowTime()<nexttime);
                patient=ComePatient();
                if(QueueInsert(&Q,patient))
                {
                    ShowQueue(Q);
                    SetConsoleCursorPosition(gh_std_out,pos);
                    printf("[病人达到事件]----取号排队成功\n");
                    Sleep(2000);
                }
            }
            else break;
        }
        while(NowTime()<Q.queue[0].leavingTime);//到达当前病人离开时间点
        if(QueueDeletMaxPriority(&Q, pPatient)==OK)
        {
            SetConsoleCursorPosition(gh_std_out,pos);
            labletime=pPatient->leavingTime;
            printf("\n\n病人离开事件--[开始时间：[%d]  优先级:[%f]  离去时间：[%d] 就诊时间：[%d] ]\n",
                   pPatient->starttime,pPatient->priority,pPatient->leavingTime,
                   pPatient->tratetime);
                   Sleep(2000);
            //文件读写模块
            if((fp=fopen("test.dat", "ab+")) == NULL)
            {
                exit(-1);
            }
            fwrite(pPatient,sizeof(Patient),1,fp);
            fclose(fp);
            HeapSort(&Q);//按照优先级对顺序调节
        }
        //病人时间更新
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
        //显示队列
        ShowQueue(Q);
        //检查当前病人是否还在队列中等待
        while(Q.queue[0].toleranttime<NowTime())
        {
            if(QueueDeletMaxPriority(&Q, pPatient)==OK)
            {
                SetConsoleCursorPosition(gh_std_out,pos);
                pPatient->leavingTime=pPatient->toleranttime;
                pPatient->starttime=0;
                labletime=NowTime();
                printf("\n\n病人未就诊离开事件--[达到时间：[%d] 优先级:[%f] 离去时间[%d] 等待时间：[%d] ]\n",
                pPatient->arrivedTime,pPatient->priority,pPatient->leavingTime,
                pPatient->waittime);
                Sleep(2000);
                //文件读写模块
                if((fp=fopen("test.dat", "ab+")) == NULL)
                {
                    exit(-1);
                }
                fwrite(pPatient,sizeof(Patient),1,fp);
                fclose(fp);
                HeapSort(&Q);//按照优先级对顺序调节
                //更新时间
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
                //显示队列
                ShowQueue(Q);
            }
            else break;
        }
        //继续产生上一个病人
        while(NowTime()<nexttime);
        patient=ComePatient();
        if(QueueInsert(&Q,patient))
        {
            ShowQueue(Q);
            SetConsoleCursorPosition(gh_std_out,pos);
            printf("[病人达到事件]----取号排队成功\n");
        }
        label++;
    }
    return 0;
}
/*----------------------队列操作函数实现-------------------------*/

/******************************************************************
函数名称：InitQueue
函数功能：创建空队列
函数参数：队列指针q
函数返回值：创建成功，返回OK
*****************************************************************/
Status InitQueue(LinkQueue *q)
{
    q->queue = (Patient *) malloc(sizeof(Patient) * NUM_PATIENT);//分配空间
    q->Content = NUM_PATIENT;
    q->queuelength = 0;
    q->isTreating = FALSE;
    return OK;
}
/******************************************************************
函数名称：DestroyQueue
函数功能：销毁队列
函数参数：队列指针q
函数返回值：销毁成功，返回OK
*****************************************************************/
Status DestroyQueue(LinkQueue *q)
{
    free(q);
    q->queue = NULL;
    q->Content = 0;
    return OK;
}
/******************************************************************
函数名称：ClearQueue
函数功能：清空队列
函数参数：队列指针q
函数返回值：清空成功，返回OK
*****************************************************************/
Status ClearQueue(LinkQueue *q)
{
    q->queuelength = 0;
    return OK;
}
/******************************************************************
函数名称：QueueLength
函数功能：计算队列长度
函数参数：队列q
函数返回值：队列长度
*****************************************************************/
int QueueLength(LinkQueue q)
{
    return q.queuelength;
}
/******************************************************************
函数名称：QueueInsert
函数功能：新元素入队
函数参数：队列q，新元素patient
函数返回值：插入成功，返回OK
*****************************************************************/
Status QueueInsert(LinkQueue *q, Patient patient)
{
    //是否满队列
    if (QueueFull(*q) == TRUE)
    {
        q->queue=(Patient *)realloc(q->queue,sizeof(Patient)*(q->Content+ EXTRA_PATIENT));
        if (q->queue == NULL) return ERROR;
        q->Content += EXTRA_PATIENT;
    }
    //插入队列
    q->queue[q->queuelength] = patient;
    //队列长度增加
    q->queuelength++;
    return OK;
}
/******************************************************************
函数名称：QueueDeletMaxPriority
函数功能：删除当前队首
函数参数：队列指针q，指向病人的指针
函数返回值：删除成功，返回OK
*****************************************************************/
Status QueueDeletMaxPriority(LinkQueue *q, Patient *patient)
{
    int i;
    //当前队列是否为空
    if (QueueEmpty(*q) == TRUE) return ERROR;
    *patient = q->queue[0];//删除队首
    for (i = 1; i < q->queuelength; i++)  //其他元素前移
    {
        q->queue[i - 1] = q->queue[i];
    }
    //队列长度减一
    q->queuelength--;
    return OK;
}
/******************************************************************
函数名称：QueueEmpty
函数功能：判断队列是否为空
函数参数：队列q
函数返回值：为空返回1，否则返回0
*****************************************************************/
Status QueueEmpty(LinkQueue q)
{
    return (q.queuelength==0);
}
/******************************************************************
函数名称：QueueFull
函数功能：判断队列是否满队列
函数参数：队列q
函数返回值：满队列返回1，否则返回0
*****************************************************************/
Status QueueFull(LinkQueue q)
{
    return (q.queuelength == q.Content);
}

/*-----------------------堆排序函数实现--------------------------*/

/******************************************************************
函数名称：HeapAdjust
函数功能：调整，使满足大顶堆的形式
函数参数：队列指针q，整形变量top,队列长度变量
函数返回值：调整成功，返回OK
*****************************************************************/
Status HeapAdjust(LinkQueue *q, int top, int queuelength)
{
    int i;
    Patient temp = q->queue[top];
    if (q->queue == NULL)
        return ERROR;
    for (i = 2 * top + 1; i < queuelength; top = i, i = 2 * i + 1)//进行筛选
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
函数名称：HeapSort
函数功能实现堆排序：
函数参数：队列指针q
函数返回值：排序成功，返回OK
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
        HeapAdjust(q, 0, i);//重新调整为大顶堆
    }
    return OK;
}

/*--------------------仿真事件模拟函数实现----------------------*/

/******************************************************************
函数名称：ComePatient
函数功能：模拟来了一位病人
函数参数：无
函数返回值：病人
*****************************************************************/
Patient ComePatient()
{
    Patient patient;
    Time lablenum;
    //系统时间作为随机数的种子
    srand((unsigned int) time(NULL));
    //取治疗时间为[3,9]分钟
    patient.tratetime=(int)(rand()%7+3);
    //记录病人到达时间为系统当前时间
    patient.arrivedTime = NowTime();
    //记录病人离开时间为到达时间+治疗时间
    patient.leavingTime = patient.arrivedTime + patient.tratetime;
    if((patient.leavingTime%100)>=60)
    {
        patient.leavingTime=(patient.leavingTime%100-60)+
                                (patient.leavingTime/100+1)*100;
    }
    //随机产生lablenum
    lablenum=(int)(rand()%30+20);
    //随机产生病人容忍等待时间
    patient.waittime=(int)(rand()%20+5);
    //计算得到病人优先级
    patient.priority=GetPriority(patient.arrivedTime,lablenum,patient.waittime);
    //计算病人能够等待的时刻
    patient.toleranttime=patient.arrivedTime+patient.waittime;
    if((patient.toleranttime%100)>=60)
    {
        patient.toleranttime=(patient.toleranttime%100-60)+
                                (patient.toleranttime/100+1)*100;
    }
    //默认的开始治疗时间为病人到达诊室进入队列的时刻
    patient.starttime=patient.arrivedTime;
    return patient;
}
/******************************************************************
函数名称：NowTime
函数功能：获取系统当前时间
函数参数：无
函数返回值：当前时间
*****************************************************************/
Time NowTime()
{
    time_t nowtime;
    struct tm *timeinfo;
    Time currenttime;
    time(&nowtime);                    //获取系统当前时间
    timeinfo = localtime(&nowtime);
    //取小时和分钟的时间
    currenttime =timeinfo->tm_hour*100 + timeinfo->tm_min;
    return currenttime;
}
/******************************************************************
函数名称：GetIntervaltime
函数功能：模拟产生一个间隔时间段
函数参数：无
函数返回值：间隔时间
*****************************************************************/
Time GetIntervaltime()
{
    int _time;
    srand((unsigned int) time(NULL));
    //病人来的时间间隔为[2,6]
    _time = (Time) (rand() %5+2);
    return _time;
}
/*************************************************************************************
函数名称： HelloSys
函数功能： 欢迎界面
函数参数： 无
函数返回值:TRUE
*************************************************************************************/
BOOL HelloSys()
{
    int m;
    char mark[2]= {'0'};         //存放选项是否标记
    DWORD a;
    char* Menu[] =                     //提示信息
    {
        "------------------",
        "欢迎使用本系统",
        "确定",
        " (-_-)",
        "------------------"
    };
    COORD Head_Line = {32,9};             //标题行起始位置
    COORD U= {32,8},B= {32,15},Ok= {39,11};
    COORD pos= {32,10};                //欢迎语
    COORD pos_2;
    COORD cursor;                      //鼠标位置

    WORD att_headline =BACKGROUND_GREEN|BACKGROUND_RED|BACKGROUND_INTENSITY
                       |FOREGROUND_RED;    //标题行颜色：亮黄背景和蓝色前景
    //提示信息背景色:暗紫
    WORD att_background =BACKGROUND_BLUE|BACKGROUND_RED|BACKGROUND_INTENSITY;
    WORD att_end =BACKGROUND_GREEN|BACKGROUND_INTENSITY
                  |FOREGROUND_BLUE|FOREGROUND_INTENSITY;
    //欢迎语字符属性：亮绿背景景,亮蓝前景
    WORD att_choice =FOREGROUND_BLUE|FOREGROUND_GREEN|FOREGROUND_RED;
    //选择区域颜色：亮黄
    WORD att_choice_on =FOREGROUND_BLUE|FOREGROUND_INTENSITY;
    //鼠标移至"确定"处颜色
    DWORD res;
    INPUT_RECORD inRec;
    BOOL bRet =TRUE;
    FillConsoleOutputAttribute(gh_std_out,att_headline,18,Head_Line,&a); //设置标题行
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
        ReadConsoleInput(gh_std_in,&inRec,1,&res);     //从控制台输入缓冲区中读一条记录
        if(inRec.EventType==MOUSE_EVENT)
        {
            /*如果事件由按键产生*/
            cursor =inRec.Event.MouseEvent.dwMousePosition;
            //如果鼠标在“是”处且“是”未被标记
            if(cursor.Y==Ok.Y&&cursor.X<=Ok.X+4&&cursor.X>=Ok.X&&mark[0]=='0')
            {
                /*改变“确定”属性*/
                FillConsoleOutputAttribute(gh_std_out,att_choice_on,strlen(Menu[2]),Ok,&a);
                WriteConsoleOutputCharacter(gh_std_out,Menu[2],strlen(Menu[2]),Ok,&a);
                mark[0]='1';
            }
            //如果鼠标不在“是”处且“是”被标记
            if((cursor.Y!=Ok.Y||cursor.X<Ok.X||cursor.X>Ok.X+4)&&mark[0]=='1')
            {
                /*改变“确定”属性*/
                mark[0]='0';
                FillConsoleOutputAttribute(gh_std_out,att_choice,strlen(Menu[2]),Ok,&a);
                WriteConsoleOutputCharacter(gh_std_out,Menu[2],strlen(Menu[2]),Ok,&a);
            }
            //如果鼠标在“是”处且按下鼠标左键
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
函数名称： ShowQueue
函数功能： 显示当前队列
函数参数： 队列q
函数返回值:TRUE
*************************************************************************************/
Status ShowQueue(LinkQueue q)
{
    system("CLS");//清屏
    int i=0;          //计数器
    Time currenttime=NowTime();
    WORD att_headline =BACKGROUND_GREEN|BACKGROUND_RED|BACKGROUND_INTENSITY
                      |FOREGROUND_BLUE;    //标题行颜色：亮黄背景和蓝色前景
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
    //设置标题行
    FillConsoleOutputAttribute(gh_std_out,att_headline,strlen(headline),Head_Line,&a);
    WriteConsoleOutputCharacter(gh_std_out,headline,strlen(headline),Head_Line,&a);
    SetConsoleCursorPosition(gh_std_out,Time_Line);
    printf("系统上次更新时间--[%d]",currenttime);
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
                printf("[---正在就诊---]");
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
        printf("---等待病人到来---");
    }
    ShowPatientInfo(q);
    return OK;
}
/*************************************************************************************
函数名称： ShowPatientInfo
函数功能： 显示当前排队病人信息
函数参数： 队列q
函数返回值:TRUE
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
        printf("病人信息文件创建失败！\n");
        exit(-1);
    }
    SetConsoleCursorPosition(gh_std_out,pos);
    for(i=0;i<32;i++) printf(("-"));
    printf("已经就诊病人记录");
    for(i=0;i<32;i++) printf(("-"));
    while(!feof(fpout))
    {
        fread(PatientNode,sizeof(Patient),1,fpout);
        if(!feof(fpout))
        {
            sumcure++;//已经就诊病人数目
            if(PatientNode->starttime)
            {
                printf("[到达时间: %d 实际开始就诊:%d 治疗时间: %d 离开时间: %d 优先级: %2.3f]\n",PatientNode->arrivedTime,
                   PatientNode->starttime,PatientNode->tratetime,PatientNode->leavingTime,PatientNode->priority);
            }
            else
            {
                sumquit++;//离开病人数目
                printf("[到达时间: %d 等待时间: %d 离开时间: %d 优先级: %2.3f  未就诊离开]\n",PatientNode->arrivedTime,
                   PatientNode->waittime,PatientNode->leavingTime,PatientNode->priority);
            }
        }
    }
    fclose(fpout);
    if(q.queuelength)
    {
        for(i=0; i<32; i++) printf(("-"));
        printf("正在就诊病人记录");
        for(i=0; i<32; i++) printf(("-"));
        sumpatient++;
        printf("[到达时间: %d 实际开始就诊:%d 治疗时间: %d 离开时间: %d 优先级: %2.3f]\n",q.queue[0].arrivedTime,
        q.queue[0].starttime,q.queue[0].tratetime,q.queue[0].leavingTime,q.queue[0].priority);
        for(i=0; i<30; i++) printf(("-"));
        printf("排队待就诊病人记录");
        for(i=0; i<32; i++) printf(("-"));
        for(i=1; i<q.queuelength; i++)
        {
            sumpatient++;
            printf("[到达时间: %d 原本开始就诊:%d 治疗时间: %d 离开时间: %d 优先级: %2.3f]\n",q.queue[i].arrivedTime,
            q.queue[i].starttime,q.queue[i].tratetime,q.queue[i].leavingTime,q.queue[i].priority);
        }
        sumpatient=sumpatient+sumcure+sumquit;//病人总数
        for(i=0; i<36; i++) printf(("-"));
        printf("就诊统计");
        for(i=0; i<36; i++) printf(("-"));
        printf("总挂号病人数：%d,已经就诊：%d,未就诊离开：%d,等待就诊：%d, 就诊比例: %1.2f%%",
               sumpatient,sumcure,sumquit,sumpatient-sumcure-sumquit-1,((float)sumcure)/sumpatient*100);
    }
    else
    {
        printf("等待病人就诊\n");
    }
    return OK;
}
/*************************************************************************************
函数名称： GetPriority
函数功能： 设置病人优先级
函数参数： 优先级priority
函数返回值:TRUE
*************************************************************************************/
Priority GetPriority(Time arrivetime,Status lablenum,Time waittime)
{
    return (100-(arrivetime/100+arrivetime%100)*0.49)+lablenum*0.38+waittime*0.13;
}
