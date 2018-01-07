#include "mainwindow.h"
#include "cpuwindow.h"
#include "sumwindow.h"
#include "timewindow.h"
#include <QApplication>

int main(int argc, char *argv[])
{
    //QApplication a(argc, argv);
    while((p1 = fork()) == -1) printf("error1");
    if(p1 == 0){
            QApplication cpu_1(argc, argv);
            CpuWindow cpu;
            cpu.show();
            cpu_1.exec();
    }
    else {
            while((p2 = fork()) == -1) printf("error1");
             if(p2 == 0){
                 QApplication sum_2(argc, argv);
                 SumWindow sum;
                 sum.show();
                 sum_2.exec();
             }
             else {
                      while((p3 = fork()) == -1) printf("error1");
                        if(p3 == 0){
                            QApplication time_3(argc, argv);
                            TimeWindow time;
                            time.show();
                            time_3.exec();
                     }
             }
    }

    wait(&p1);
    wait(&p2);
    wait(&p3);

    //return a.exec();
}
