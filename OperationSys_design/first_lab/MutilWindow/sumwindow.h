#ifndef SUMWINDOW_H
#define SUMWINDOW_H

#include <QMainWindow>
#include <qlabel.h>
#include <qtimer.h>
#include <time.h>


class SumWindow : public QMainWindow
{
    Q_OBJECT
    QLabel *label1;
    qint16 sum,i;

public:
    SumWindow(QWidget *parent = 0);
    ~SumWindow();
private slots:
   void count();
};

#endif // SUMWINDOW_H
