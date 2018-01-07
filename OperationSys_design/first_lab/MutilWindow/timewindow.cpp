#include "timewindow.h"

TimeWindow::TimeWindow(QWidget *parent)
    : QMainWindow(parent){
        this->setWindowTitle("TimeWindow");
        this->setGeometry(1300,300,500,300);
        QLabel *title = new QLabel(this);
        title->setText("Show the Time");
        title->setGeometry(QRect(180, 20, 400, 30));
        label = new QLabel(this);
        QLabel *label2 = new QLabel(this);

        label2->setGeometry(QRect(120, 120, 150, 30));
        label2->setText("Time : ");

        label->setGeometry(QRect(180, 120, 200, 30));
        label->setFrameShape(QFrame::WinPanel); //设置标签形状
        label->setFrameShadow(QFrame::Sunken); //设置标签阴影

        QTimer *timer = new QTimer(this);
        connect(timer,SIGNAL(timeout()),this,SLOT(timeUpdate()));
        timer->start(1000);
}

TimeWindow::~TimeWindow(){

}

void  TimeWindow::timeUpdate(){
    QDateTime time = QDateTime::currentDateTime();
    QString str = time.toString("yy-MM-dd hh:mm:ss dddd");
    label->setText(str);

}
