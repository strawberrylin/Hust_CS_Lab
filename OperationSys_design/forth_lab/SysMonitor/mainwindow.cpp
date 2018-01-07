#include "mainwindow.h"
#include "ui_mainwindow.h"
using namespace std;
MainWindow::MainWindow(QWidget *parent) :
    QMainWindow(parent),
    ui(new Ui::MainWindow)
{
    ui->setupUi(this);
    init_statusBar();
    getHostInfo();

    QTimer *timer1 = new QTimer(this);
    connect(timer1,SIGNAL(timeout()),this,SLOT(updateNowTime()));
    connect(timer1,SIGNAL(timeout()),this,SLOT(updateMem()));
    connect(timer1,SIGNAL(timeout()),this,SLOT(updateProInfo()));
    timer1->start(1000);

    connect(ui->pushButton_cp,SIGNAL(clicked()),this,SLOT(creatProcess()));
    connect(ui->pushButton_exit,SIGNAL(clicked(bool)),this,SLOT(exitSys()));
}

MainWindow::~MainWindow()
{
    delete ui;
}

void MainWindow::init_statusBar()
{
    QStatusBar* bar = ui->statusBar; //获取状态栏

    cpu_statusLabel = new QLabel; //新建标签
    cpu_statusLabel->setMinimumSize(210,20); //设置标签最小尺寸
    cpu_statusLabel->setFrameShape(QFrame::WinPanel); //设置标签形状
    cpu_statusLabel->setFrameShadow(QFrame::Sunken); //设置标签阴影

    time_statusLabel = new QLabel;
    time_statusLabel->setMinimumSize(210,20);
    time_statusLabel->setFrameShape(QFrame::WinPanel);
    time_statusLabel->setFrameShadow(QFrame::Sunken);

    mem_statusLabel = new QLabel; //新建标签
    mem_statusLabel->setMinimumSize(210,20); //设置标签最小尺寸
    mem_statusLabel->setFrameShape(QFrame::WinPanel); //设置标签形状
    mem_statusLabel->setFrameShadow(QFrame::Sunken); //设置标签阴影

    bar->addWidget(cpu_statusLabel);
    bar->addWidget(time_statusLabel);
    bar->addWidget(mem_statusLabel);


}

void MainWindow::getHostInfo(){
    FILE *fp,*fp1,*fp2,*fp3;
    char buf_host[20],buf_ostype[20],buf_osversion[20];
    //获取处理器信息
    int i = 0;
    QString cpu_info,temp_str;
    QFile file("/proc/cpuinfo");
    file.open(QIODevice::ReadOnly|QIODevice::Text);
    QTextStream stream(&file);
    stream.readLine();
    while(!stream.atEnd())
    {
        temp_str=stream.readLine();
        if(i==3){
            cpu_info=temp_str;
            break;
        }
        i++;
    }
    cpu_info=cpu_info.mid(13,56);
    file.close();
    ui->label_cpu->setText(QString("%1  %2").arg("处理器").arg(cpu_info));
    //计算启动时间
    struct tm *ptm;
    float getRuntime;
    time_t runTime,nowTime,bootTime;
    QString week[7] = {"星期一","星期二","星期三","星期四","星期五","星期六","星期天"};
    fp = fopen("/proc/uptime","r");
    fscanf(fp,"%f",&getRuntime);
    fclose(fp);
    runTime = (time_t)getRuntime;
    time(&nowTime);
    bootTime = nowTime - runTime;
    ptm = localtime(&bootTime);
    ui->label_runtime->setText(QString("%1-%2-%3  %4:%5:%6  %7").arg(ptm->tm_year+1900).arg(ptm->tm_mon+1).arg(ptm->tm_mday).arg(ptm->tm_hour).arg(ptm->tm_min).arg(ptm->tm_sec).arg(week[ptm->tm_wday]));
    //计算系统信息
    fp1 = fopen("/proc/sys/kernel/hostname","r");
    fp2 = fopen("/proc/sys/kernel/ostype","r");
    fp3 = fopen("/proc/sys/kernel/osrelease","r");
    fscanf(fp1,"%s",buf_host);
    fscanf(fp2,"%s",buf_ostype);
    fscanf(fp3,"%s",buf_osversion);
    fclose(fp1);
    fclose(fp2);
    fclose(fp3);

    ui->host_Label->setText((QString("%1  %2 ").arg("设备名").arg(buf_host)));
    ui->label_graph->setPixmap(QPixmap("/home/strawberrylin/Pictures/ubuntu_qt.png"));
    ui->label_version->setText(QString("%1  %2").arg(buf_ostype).arg(buf_osversion));
}

void MainWindow::updateNowTime(){
    QDateTime time = QDateTime::currentDateTime();
    QString str = time.toString("yy-MM-dd hh:mm:ss dddd");
    time_statusLabel->setText(str);
}

void MainWindow::getCpuTotalTime(struct info_cpu &cpuinfo){
    FILE *fp;
    if((fp=fopen("/proc/stat","r"))==NULL) {
        printf("file open error\n");
        exit(-1);
    }
    fscanf(fp,"%s%f%f%f%f%f%f%f",cpuinfo.cpu,&cpuinfo.user,
           &cpuinfo.nice,&cpuinfo.system,&cpuinfo.idle,&cpuinfo.iowait,
           &cpuinfo.irq,&cpuinfo.softirq);
    fclose(fp);
}

void MainWindow::updateMem(){
    FILE *file_MemInfo;
    float m_Total,m_Free,m_avibal,m_Buf,m_Cache;
    float m_rate;
    file_MemInfo = fopen("/proc/meminfo","r");
    char buf[20];
    fscanf(file_MemInfo,"%s%f%s%s%f%s%s%f%s%s%f%s%s%f%s",buf,&m_Total,buf,buf,&m_Free,buf,buf,&m_avibal,buf,buf,&m_Buf,buf,buf,&m_Cache,buf);
    m_rate = 100*(m_Total-m_Free-m_Buf-m_Cache)/m_Total;
    ui->label_memory->setText(QString("%1  %2 %3").arg("内存 ").arg(QString::number((m_Total/1024)/1024)).arg("Gib"));
    mem_statusLabel->setText(QString("%1 %2%3").arg("Memory Rate : ").arg(QString::number(m_rate)).arg("%"));
    ui->progressBarMem->setValue(m_rate);
    fclose(file_MemInfo);
}


void MainWindow::updateProInfo(){
    int pidNum1,pidNum2;
    float rate ,idle1,idle2,total,idle;
    float total_cpu1,total_cpu2;
    float total_proc1,total_proc2;
    string name;
    ui->tableWidget->clear();
    QStringList headers;
    struct info_proc procinfo1[512],procinfo2[512];
    struct info_cpu cpuinfo1,cpuinfo2;
    QTableWidgetItem *nameItem,*pidItem,*ppidItem,*rssItem,*statItem,*cpuItem;
    getProcTotalTime(procinfo1,&pidNum1);
    getCpuTotalTime(cpuinfo1);

    usleep(350000);

    getProcTotalTime(procinfo2,&pidNum2);
    getCpuTotalTime(cpuinfo2);
    //if(pidNum1!=pidNum2) exit(0);    //to test the time
    total_cpu1 = cpuinfo1.user+cpuinfo1.nice+cpuinfo1.system+cpuinfo1.idle+cpuinfo1.iowait+cpuinfo1.irq+cpuinfo1.softirq;
    idle1 = cpuinfo1.idle;
    total_cpu2 = cpuinfo2.user+cpuinfo2.nice+cpuinfo2.system+cpuinfo2.idle+cpuinfo2.iowait+cpuinfo2.irq+cpuinfo2.softirq;
    idle2 = cpuinfo2.idle;

    total = total_cpu2  - total_cpu1;
    idle = idle2 - idle1;
    rate = 100 * (total - idle) / total ;

    for(int i =0 ;i< pidNum1; i ++){
        total_proc1 = procinfo1[i].cstime + procinfo1[i].stime + procinfo1[i].cstime + procinfo1[i].cutime;
        total_proc2 = procinfo2[i].cstime + procinfo2[i].stime + procinfo2[i].cstime + procinfo2[i].cutime;
        procinfo2[i].proc_rate = 100*(total_proc2 - total_proc1)/total;
        cpu_statusLabel->setText(QString("%1 %2%3").arg("Cpu Rate : ").arg(rate).arg("%"));
        ui->progressBarCpu->setValue(rate);
        ui->progressBarCpu->setStyleSheet("QProgressBar::chunk { background-color: rgb(255, 0, 0)}");
        ui->tableWidget->setColumnCount(6);
        headers<<"Name"<<"Pid"<<"Ppid"<<"Memrory/KB"<<"State"<<"Cpu/%";
        ui->tableWidget->setHorizontalHeaderLabels(headers);

        name = procinfo1[i].proName;
        string pidName = name.substr(1,name.length()-2);
        ui->tableWidget->setRowCount(pidNum1);
        nameItem=new QTableWidgetItem(QString::fromStdString(pidName));
        ui->tableWidget->setItem(i,0,nameItem);
        nameItem->setTextAlignment(Qt::AlignCenter);
        pidItem=new QTableWidgetItem(QString("%1").arg(procinfo2[i].porPid));
        ui->tableWidget->setItem(i,1,pidItem);
        pidItem->setTextAlignment(Qt::AlignCenter);
        ppidItem=new QTableWidgetItem(QString("%1").arg(procinfo2[i].proPpid));
        ui->tableWidget->setItem(i,2,ppidItem);
        ppidItem->setTextAlignment(Qt::AlignCenter);
        rssItem=new QTableWidgetItem(QString("%1").arg(procinfo2[i].proMem/1024));
        ui->tableWidget->setItem(i,3,rssItem);
        rssItem->setTextAlignment(Qt::AlignCenter);
        statItem=new QTableWidgetItem(QString("%1").arg(procinfo2[i].proState));
        ui->tableWidget->setItem(i,4,statItem);
        statItem->setTextAlignment(Qt::AlignCenter);
        cpuItem=new QTableWidgetItem(QString("%1").arg(procinfo2[i].proc_rate));
        ui->tableWidget->setItem(i,5,cpuItem);
        cpuItem->setTextAlignment(Qt::AlignCenter);
    }
    ui->tableWidget->setEditTriggers(QAbstractItemView::NoEditTriggers);
}

void MainWindow::getProcTotalTime(struct info_proc *procinfo,int *num){
    DIR *dir;
    FILE *fpProc;
    struct dirent *entry;
    int pidNum = 0;
    char pidFile[20];
    char buf[20];
    if((dir = opendir("/proc"))==NULL){
        printf("Error\n");
        exit(0);
    }
    while((entry=readdir(dir))!=NULL)  //读取下一个目录项
    {
        if(entry->d_name[0]>='1' && entry->d_name[0]<='9')
        {
            sprintf(pidFile,"/proc/%s/stat",entry->d_name);
            fpProc = fopen(pidFile,"r");
            fscanf(fpProc,"%d%s%s%s%s%d%s%s%s%s%s%s%s%d%d%d%d%s%s%s%s%s%s%u",&procinfo[pidNum].porPid,procinfo[pidNum].proName,
                   procinfo[pidNum].proState,buf,buf,&procinfo[pidNum].proPpid,buf,buf,buf,buf,buf,buf,buf,&procinfo[pidNum].utime,
                   &procinfo[pidNum].stime,&procinfo[pidNum].cutime,&procinfo[pidNum].cstime,buf,buf,buf,buf,buf,buf,&procinfo[pidNum].proMem);
            pidNum++;
            fclose(fpProc);
        }
    }
    closedir(dir);
    *num = pidNum;
}

void MainWindow::creatProcess(){
    QProcess *process = new QProcess;
    QString newProc;
    newProc = ui->lineEdit->text();
    process->start(newProc);
}

void MainWindow::exitSys(){
    close();
}
