#include "timewindow.h"

TimeWindow::TimeWindow(QWidget *parent)
    : QMainWindow(parent){
       this->setWindowTitle("TIMEWindow");
       this->setGeometry(1300,300,500,300);
        QLabel *label = new QLabel(this);
        QString str = timeUpdate();
        //setCentralWidget(label);
        label->setText(str);
       // label->setAlignment(Qt::AlignCenter);
        label->setGeometry(QRect(20, 20, 150, 30));

        QTimer *timer = new QTimer(this);
        connect(timer,SIGNAL(timeout()),this,SLOT(timeUpDate()));
        timer->start(1000);
}

TimeWindow::~TimeWindow(){

}

QString  TimeWindow::timeUpdate(){
    QDateTime time = QDateTime::currentDateTime();
    QString str = time.toString("yy-MM-dd hh:mm:ss dddd");
    return str;

}
