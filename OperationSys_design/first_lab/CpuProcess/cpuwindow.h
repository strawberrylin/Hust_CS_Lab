#ifndef CPUWINDOW_H
#define CPUWINDOW_H

#include <QMainWindow>
#include <qlabel.h>
#include <qtimer.h>

class CpuWindow : public QMainWindow
{
    Q_OBJECT

public:
    CpuWindow(QWidget *parent = 0);
    ~CpuWindow();
};

#endif // CPUWINDOW_H
