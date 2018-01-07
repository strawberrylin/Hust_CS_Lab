#include "mainwindow.h"
#include "ui_mainwindow.h"

MainWindow::MainWindow(QWidget *parent) :
    QMainWindow(parent),
    ui(new Ui::MainWindow)
{
    ui->setupUi(this);
    init_statusBar();
}

MainWindow::~MainWindow()
{
    delete ui;
}

void MainWindow::init_statusBar()
{
    QStatusBar* bar = ui->statusBar; //获取状态栏
    first_statusLabel = new QLabel; //新建标签
    first_statusLabel->setMinimumSize(150,20); //设置标签最小尺寸
    first_statusLabel->setFrameShape(QFrame::WinPanel); //设置标签形状
    first_statusLabel->setFrameShadow(QFrame::Sunken); //设置标签阴影

    second_statusLabel = new QLabel;
    second_statusLabel->setMinimumSize(150,20);
    second_statusLabel->setFrameShape(QFrame::WinPanel);
    second_statusLabel->setFrameShadow(QFrame::Sunken);

    bar->addWidget(first_statusLabel);
    bar->addWidget(second_statusLabel);
    first_statusLabel->setText(tr("欢迎使用文本编辑器")); //初始化内容
    second_statusLabel->setText(tr("hello!"));
}
