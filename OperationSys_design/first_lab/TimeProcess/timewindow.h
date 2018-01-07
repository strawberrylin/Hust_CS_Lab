#ifndef TIMEWINDOW_H
#define TIMEWINDOW_H
#include <QDateTime>
#include <QMainWindow>
#include <qlabel.h>
#include <time.h>
#include <qtimer.h>

class TimeWindow : public QMainWindow
{
    Q_OBJECT

public:
    TimeWindow(QWidget *parent = 0);
    ~TimeWindow();
    QString timeUpdate();
};

#endif // TIMEWINDOW_H
