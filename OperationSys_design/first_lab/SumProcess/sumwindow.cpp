#include "sumwindow.h"

SumWindow::SumWindow(QWidget *parent)
    : QMainWindow(parent)
{

    this->setWindowTitle("SumWindow");
        //this->setGeometry(700,300,500,300);

        QTimer *timer = new QTimer(this);
        //connect(timer,SIGNAL(timeout()),this,SLOT(count()));
        count();
        timer->start(3000);
}

SumWindow::~SumWindow()
{

}

qint16 SumWindow::count(){
    QTableWidget *table = new QTableWidget(4,2);  //新建一4行2列的表格


    //设置表格行标题
    QStringList headerLabels;
    headerLabels << "C1" << "C2";
    table->setHorizontalHeaderLabels(headerLabels);


    //设置表格行标题的对齐方式
   // table->horizontalHeader()->setDefaultAlignment(Qt::AlignLeft);

    //设置行表题
    QStringList rowLabels;
    rowLabels << "Line1" << "Line2" << "Line3" << "Line4";
    table->setVerticalHeaderLabels(rowLabels);


    //设置每一行的高度
    for(int i = 0; i < 4; i++)
        table->setRowHeight(i, 22);

    //自动调整最后一列的宽度使它和表格的右边界对齐
    //table->horizontalHeader()->setStretchLastSection(true);

    //设置表格的选择方式
    table->setSelectionBehavior(QAbstractItemView::SelectItems);

    //设置编辑方式
    table->setEditTriggers(QAbstractItemView::DoubleClicked);

    //设置表格的内容
    for (int row = 0; row < 4; ++row)
    {
        QTableWidgetItem *item0, *item1;
        item0 = new QTableWidgetItem;
        item1 = new QTableWidgetItem;

        QString txt = QString("%1").arg(row + 1);
        item0->setText(txt);
        table->setItem(row, 0, item0);

        txt = QString("%1").arg((row + 1) * 2);
        item1->setText(txt);
        table->setItem(row, 1, item1);
    }
    return 0;
}
