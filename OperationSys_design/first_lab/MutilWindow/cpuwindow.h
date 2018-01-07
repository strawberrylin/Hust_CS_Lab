#ifndef CPUWINDOW_H
#define CPUWINDOW_H

#include <QMainWindow>
#include <qlabel.h>
#include <qtimer.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>


class CpuWindow : public QMainWindow
{
    Q_OBJECT
    QLabel *label;
    FILE *fp1,*fp2;
    struct info{
        char cpu[16];
        float user;//用户态
        float nice;//nice值为负
        float system;//核心态
        float idle;//除IOwait的时间
        float iowait;//IO等待时间
        float irq;//硬中断
        float softirq;//软中断
        float stealstolen; //用在其他操作系统
        float guest; //用在guest操作系统
    };


public:
    CpuWindow(QWidget *parent = 0);
    ~CpuWindow();

private slots :
    void readFile();
};

#endif // CPUWINDOW_H
