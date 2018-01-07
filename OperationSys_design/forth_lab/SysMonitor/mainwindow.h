#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QMainWindow>
#include <QLabel>
#include <QPushButton>
#include <stdio.h>
#include <stdlib.h>
#include <QTime>
#include <QTimer>
#include <unistd.h>
#include <QFile>
#include <QTextStream>
#include <iostream>
#include <QTableWidget>
#include <QTableWidgetItem>
#include <QStringList>
#include <QString>
#include <QProcess>
#include <string>
#include <qstring.h>
#include <string.h>
#include <dirent.h>
#include <sys/stat.h>
#include <sys/types.h>

namespace Ui {

class MainWindow;
}

class MainWindow : public QMainWindow
{
    Q_OBJECT
    struct info_cpu{
        char cpu[20];
        float user;//用户态
        float nice;//nice值为负
        float system;//核心态
        float idle;//除IOwait的时间
        float iowait;//IO等待时间
        float irq;//硬中断
        float softirq;//软中断
    };
    struct info_proc{
        char proName[20]; //进程名
        int  porPid; //进程号
        int proPpid; //父进程号
        char proState[20]; //进程状态
        unsigned int proMem; //进程占用内存
        int utime;       //进程utime
        int stime;       //进程stime
        int cutime;      //进程ctime
        int cstime;       //进程cstime
        int pidnum;      //进程数
        float proc_rate;   //进程cpu占用率
    };

public:
    explicit MainWindow(QWidget *parent = 0);
    ~MainWindow();

private:
    Ui::MainWindow *ui;
    QLabel *cpu_statusLabel;
    QLabel *time_statusLabel;
    QLabel *mem_statusLabel;
    QPushButton *exit_Button;
    void init_statusBar();
    void getHostInfo();
    void getBootTime();
    float getRunTime();
    void getProcTotalTime(struct info_proc *procinfo,int *num);
    void getCpuTotalTime(struct info_cpu &cpuinfo);
private slots:
    void updateNowTime();
    void updateMem();
    void updateProInfo();
    void creatProcess();
    void exitSys();
};

#endif // MAINWINDOW_H
