#include "sumwindow.h"

SumWindow::SumWindow(QWidget *parent)
    : QMainWindow(parent)
{
        this->setWindowTitle("SumWindow");
        this->setGeometry(700,300,500,300);
        QLabel *title = new QLabel(this);
        title->setText("Calculate From 0 to 100");
        title->setGeometry(QRect(180, 20, 400, 30));
        label1 = new QLabel(this);
        sum = 0;
        i = 0;

        QLabel *label2 = new QLabel(this);

        label2->setGeometry(QRect(180, 120, 80, 30));
        label2->setText("Result : ");

        label1->setGeometry(QRect(250, 120, 80, 30));
        label1->setFrameShape(QFrame::WinPanel); //设置标签形状
        label1->setFrameShadow(QFrame::Sunken); //设置标签阴影
        QTimer *timer = new QTimer(this);
        connect(timer,SIGNAL(timeout()),this,SLOT(count()));
        timer->start(3000);
}

SumWindow::~SumWindow()
{

}

void SumWindow::count(){
    QString result,sum1,i1;

    i1 = QString::number(i,10);
    sum1 = QString::number(sum,10);
    if(i > 100){
        sum = 0;
        i = 0;
        i1 = QString::number(i,10);
        sum1 = QString::number(sum,10);
    }
    else{
        sum +=i;
        i++;
    }

    result = QString::number(sum,10);

    label1->setText(sum1 + "+" + i1 + "=" + result);
}
