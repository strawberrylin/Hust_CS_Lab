#include "sumwindow.h"
#include <QApplication>

int main(int argc, char *argv[])
{
    QApplication a(argc, argv);
    SumWindow w;
    w.show();

    return a.exec();
}
