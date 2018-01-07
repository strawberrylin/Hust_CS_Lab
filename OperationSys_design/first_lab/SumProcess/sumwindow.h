#ifndef SUMWINDOW_H
#define SUMWINDOW_H

#include <QMainWindow>
#include <qlabel.h>
#include <qtimer.h>
#include <QTableWidget>

class SumWindow : public QMainWindow
{
    Q_OBJECT

public:
    SumWindow(QWidget *parent = 0);
    ~SumWindow();
    qint16 count();
};

#endif // SUMWINDOW_H
