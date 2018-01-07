#include "cpuwindow.h"

CpuWindow::CpuWindow(QWidget *parent)
    : QMainWindow(parent)
{
        this->setWindowTitle("CpuWindow");
        this->setGeometry(100,300,500,300);
        QLabel *title = new QLabel(this);
        title->setText("Monite the CPU ");
        title->setGeometry(QRect(180, 20, 400, 30));
        label = new QLabel(this);
        QLabel *label2 = new QLabel(this);

        label2->setGeometry(QRect(160, 120, 80, 30));
        label2->setText("Cpu Rate : ");

        label->setGeometry(QRect(250, 120, 80, 30));
        label->setFrameShape(QFrame::WinPanel); //设置标签形状
        label->setFrameShadow(QFrame::Sunken); //设置标签阴影

        QTimer *timer = new QTimer(this);
        connect(timer,SIGNAL(timeout()),this,SLOT(readFile()));
        timer->start(2000);

}

CpuWindow::~CpuWindow()
{

}

void cpurate(){

}

void CpuWindow:: readFile(){

    float total_time1,total_time2;
    float rate ,idle1,idle2,total,idle;
    QString result;
    struct info cpuinfo;
    if((fp1=fopen("//proc/stat","r"))==NULL) {
           printf("file open error\n");
           exit(-1);
    }
    fscanf(fp1,"%s%f%f%f%f%f%f%f%f%f",cpuinfo.cpu,&cpuinfo.user,
           &cpuinfo.nice,&cpuinfo.system,&cpuinfo.idle,&cpuinfo.iowait,
           &cpuinfo.irq,&cpuinfo.softirq,&cpuinfo.stealstolen,&cpuinfo.guest);
    total_time1 = cpuinfo.user+cpuinfo.nice+cpuinfo.system+cpuinfo.idle+cpuinfo.iowait
            +cpuinfo.irq+cpuinfo.softirq+cpuinfo.stealstolen+cpuinfo.guest;
    idle1 = cpuinfo.idle;
    fclose(fp1);
    sleep(1);
    if((fp2=fopen("//proc/stat","r"))==NULL) {
           printf("file open error\n");
           exit(-1);
    }
    fscanf(fp2,"%s%f%f%f%f%f%f%f%f%f",cpuinfo.cpu,&cpuinfo.user,
           &cpuinfo.nice,&cpuinfo.system,&cpuinfo.idle,&cpuinfo.iowait,
           &cpuinfo.irq,&cpuinfo.softirq,&cpuinfo.stealstolen,&cpuinfo.guest);
    total_time2 = cpuinfo.user+cpuinfo.nice+cpuinfo.system+cpuinfo.idle+cpuinfo.iowait
            +cpuinfo.irq+cpuinfo.softirq+cpuinfo.stealstolen+cpuinfo.guest;
    idle2 = cpuinfo.idle;
    fclose(fp2);
    total = total_time2 - total_time1;
    idle = idle2 - idle1;
    rate = 100 * (total - idle) / total ;
    result = QString::number(rate);
    label->setText(result + "%");
}
