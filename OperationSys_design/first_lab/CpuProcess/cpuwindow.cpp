#include "cpuwindow.h"

CpuWindow::CpuWindow(QWidget *parent)
    : QMainWindow(parent)
{
    this->setWindowTitle("CpuWindow");
        this->setGeometry(100,300,500,300);
        QLabel *label = new QLabel(this);
        setCentralWidget(label);
        label->setText("HelloWorld Cpu");
        label->setAlignment(Qt::AlignCenter);
}

CpuWindow::~CpuWindow()
{

}
