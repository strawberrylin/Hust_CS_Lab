#ifndef TIMEWINDOW_H
#define TIMEWINDOW_H
#include <QDateTime>
#include <QMainWindow>
#include <time.h>
#include <QTimer>
#include <QLabel>
class TimeWindow : public QMainWindow
{
    Q_OBJECT
    QLabel *label;


public:
    TimeWindow(QWidget *parent = 0);
    ~TimeWindow();

private slots:
    void timeUpdate();
};

#endif // TIMEWINDOW_H
