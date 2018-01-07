#include <QApplication>
#include "cpuwindow.h"
int main(int argc, char *argv[])
{
    QApplication a(argc, argv);
    CpuWindow w;
    w.show();

    return a.exec();
}

