/********************************************************************************
** Form generated from reading UI file 'mainwindow.ui'
**
** Created by: Qt User Interface Compiler version 5.5.1
**
** WARNING! All changes made in this file will be lost when recompiling UI file!
********************************************************************************/

#ifndef UI_MAINWINDOW_H
#define UI_MAINWINDOW_H

#include <QtCore/QVariant>
#include <QtWidgets/QAction>
#include <QtWidgets/QApplication>
#include <QtWidgets/QButtonGroup>
#include <QtWidgets/QHeaderView>
#include <QtWidgets/QLabel>
#include <QtWidgets/QLineEdit>
#include <QtWidgets/QMainWindow>
#include <QtWidgets/QMenuBar>
#include <QtWidgets/QProgressBar>
#include <QtWidgets/QPushButton>
#include <QtWidgets/QScrollBar>
#include <QtWidgets/QStatusBar>
#include <QtWidgets/QTabWidget>
#include <QtWidgets/QTableWidget>
#include <QtWidgets/QToolBar>
#include <QtWidgets/QWidget>

QT_BEGIN_NAMESPACE

class Ui_MainWindow
{
public:
    QWidget *centralWidget;
    QTabWidget *tabWidget;
    QWidget *tab_userinfo;
    QScrollBar *horizontalScrollBar;
    QScrollBar *verticalScrollBar;
    QLabel *label_1;
    QLabel *host_Label;
    QLabel *label_2;
    QLabel *label_3;
    QLabel *label_4;
    QLabel *label_version;
    QLabel *label_cpu;
    QLabel *label_memory;
    QLabel *label_runtime;
    QLabel *label_graph;
    QWidget *tab_function;
    QScrollBar *horizontalScrollBar_2;
    QScrollBar *verticalScrollBar_2;
    QProgressBar *progressBarCpu;
    QProgressBar *progressBarMem;
    QLabel *label;
    QLabel *label_5;
    QWidget *tab_pid;
    QTableWidget *tableWidget;
    QWidget *tab_action;
    QScrollBar *horizontalScrollBar_4;
    QScrollBar *verticalScrollBar_4;
    QLineEdit *lineEdit;
    QPushButton *pushButton_cp;
    QPushButton *pushButton_exit;
    QMenuBar *menuBar;
    QToolBar *mainToolBar;
    QStatusBar *statusBar;

    void setupUi(QMainWindow *MainWindow)
    {
        if (MainWindow->objectName().isEmpty())
            MainWindow->setObjectName(QStringLiteral("MainWindow"));
        MainWindow->resize(680, 480);
        centralWidget = new QWidget(MainWindow);
        centralWidget->setObjectName(QStringLiteral("centralWidget"));
        tabWidget = new QTabWidget(centralWidget);
        tabWidget->setObjectName(QStringLiteral("tabWidget"));
        tabWidget->setGeometry(QRect(0, 0, 681, 451));
        tabWidget->setMaximumSize(QSize(16777215, 16777215));
        tabWidget->setStyleSheet(QStringLiteral(""));
        tabWidget->setTabPosition(QTabWidget::North);
        tabWidget->setTabShape(QTabWidget::Rounded);
        tabWidget->setIconSize(QSize(64, 20));
        tabWidget->setElideMode(Qt::ElideMiddle);
        tabWidget->setUsesScrollButtons(true);
        tabWidget->setDocumentMode(true);
        tabWidget->setTabsClosable(false);
        tabWidget->setMovable(false);
        tabWidget->setTabBarAutoHide(false);
        tab_userinfo = new QWidget();
        tab_userinfo->setObjectName(QStringLiteral("tab_userinfo"));
        horizontalScrollBar = new QScrollBar(tab_userinfo);
        horizontalScrollBar->setObjectName(QStringLiteral("horizontalScrollBar"));
        horizontalScrollBar->setGeometry(QRect(0, 370, 661, 16));
        horizontalScrollBar->setOrientation(Qt::Horizontal);
        verticalScrollBar = new QScrollBar(tab_userinfo);
        verticalScrollBar->setObjectName(QStringLiteral("verticalScrollBar"));
        verticalScrollBar->setGeometry(QRect(660, 0, 16, 371));
        verticalScrollBar->setOrientation(Qt::Vertical);
        label_1 = new QLabel(tab_userinfo);
        label_1->setObjectName(QStringLiteral("label_1"));
        label_1->setGeometry(QRect(70, 280, 531, 20));
        host_Label = new QLabel(tab_userinfo);
        host_Label->setObjectName(QStringLiteral("host_Label"));
        host_Label->setGeometry(QRect(140, 240, 341, 17));
        label_2 = new QLabel(tab_userinfo);
        label_2->setObjectName(QStringLiteral("label_2"));
        label_2->setGeometry(QRect(70, 200, 531, 20));
        label_3 = new QLabel(tab_userinfo);
        label_3->setObjectName(QStringLiteral("label_3"));
        label_3->setGeometry(QRect(70, 40, 301, 20));
        label_4 = new QLabel(tab_userinfo);
        label_4->setObjectName(QStringLiteral("label_4"));
        label_4->setGeometry(QRect(70, 110, 531, 20));
        label_version = new QLabel(tab_userinfo);
        label_version->setObjectName(QStringLiteral("label_version"));
        label_version->setGeometry(QRect(140, 70, 221, 17));
        label_cpu = new QLabel(tab_userinfo);
        label_cpu->setObjectName(QStringLiteral("label_cpu"));
        label_cpu->setGeometry(QRect(140, 140, 351, 17));
        label_memory = new QLabel(tab_userinfo);
        label_memory->setObjectName(QStringLiteral("label_memory"));
        label_memory->setGeometry(QRect(140, 170, 141, 17));
        label_runtime = new QLabel(tab_userinfo);
        label_runtime->setObjectName(QStringLiteral("label_runtime"));
        label_runtime->setGeometry(QRect(140, 320, 271, 17));
        label_graph = new QLabel(tab_userinfo);
        label_graph->setObjectName(QStringLiteral("label_graph"));
        label_graph->setGeometry(QRect(420, 10, 191, 101));
        tabWidget->addTab(tab_userinfo, QString());
        tab_function = new QWidget();
        tab_function->setObjectName(QStringLiteral("tab_function"));
        tab_function->setEnabled(true);
        horizontalScrollBar_2 = new QScrollBar(tab_function);
        horizontalScrollBar_2->setObjectName(QStringLiteral("horizontalScrollBar_2"));
        horizontalScrollBar_2->setGeometry(QRect(0, 370, 661, 16));
        horizontalScrollBar_2->setOrientation(Qt::Horizontal);
        verticalScrollBar_2 = new QScrollBar(tab_function);
        verticalScrollBar_2->setObjectName(QStringLiteral("verticalScrollBar_2"));
        verticalScrollBar_2->setGeometry(QRect(660, 0, 16, 371));
        verticalScrollBar_2->setOrientation(Qt::Vertical);
        progressBarCpu = new QProgressBar(tab_function);
        progressBarCpu->setObjectName(QStringLiteral("progressBarCpu"));
        progressBarCpu->setGeometry(QRect(120, 130, 118, 23));
        progressBarCpu->setValue(24);
        progressBarMem = new QProgressBar(tab_function);
        progressBarMem->setObjectName(QStringLiteral("progressBarMem"));
        progressBarMem->setGeometry(QRect(390, 130, 118, 23));
        progressBarMem->setValue(24);
        label = new QLabel(tab_function);
        label->setObjectName(QStringLiteral("label"));
        label->setGeometry(QRect(140, 200, 65, 17));
        label_5 = new QLabel(tab_function);
        label_5->setObjectName(QStringLiteral("label_5"));
        label_5->setGeometry(QRect(400, 200, 101, 17));
        tabWidget->addTab(tab_function, QString());
        tab_pid = new QWidget();
        tab_pid->setObjectName(QStringLiteral("tab_pid"));
        tableWidget = new QTableWidget(tab_pid);
        tableWidget->setObjectName(QStringLiteral("tableWidget"));
        tableWidget->setGeometry(QRect(0, 0, 681, 381));
        tableWidget->setVerticalScrollBarPolicy(Qt::ScrollBarAlwaysOn);
        tableWidget->setHorizontalScrollBarPolicy(Qt::ScrollBarAlwaysOn);
        tableWidget->setColumnCount(0);
        tableWidget->horizontalHeader()->setDefaultSectionSize(132);
        tabWidget->addTab(tab_pid, QString());
        tab_action = new QWidget();
        tab_action->setObjectName(QStringLiteral("tab_action"));
        tab_action->setMaximumSize(QSize(16777214, 16777214));
        tab_action->setContextMenuPolicy(Qt::CustomContextMenu);
        horizontalScrollBar_4 = new QScrollBar(tab_action);
        horizontalScrollBar_4->setObjectName(QStringLiteral("horizontalScrollBar_4"));
        horizontalScrollBar_4->setGeometry(QRect(0, 370, 661, 16));
        horizontalScrollBar_4->setOrientation(Qt::Horizontal);
        verticalScrollBar_4 = new QScrollBar(tab_action);
        verticalScrollBar_4->setObjectName(QStringLiteral("verticalScrollBar_4"));
        verticalScrollBar_4->setGeometry(QRect(660, 0, 16, 371));
        verticalScrollBar_4->setOrientation(Qt::Vertical);
        lineEdit = new QLineEdit(tab_action);
        lineEdit->setObjectName(QStringLiteral("lineEdit"));
        lineEdit->setGeometry(QRect(120, 70, 261, 29));
        pushButton_cp = new QPushButton(tab_action);
        pushButton_cp->setObjectName(QStringLiteral("pushButton_cp"));
        pushButton_cp->setGeometry(QRect(450, 70, 98, 27));
        pushButton_exit = new QPushButton(tab_action);
        pushButton_exit->setObjectName(QStringLiteral("pushButton_exit"));
        pushButton_exit->setGeometry(QRect(190, 270, 291, 27));
        pushButton_exit->setAutoDefault(false);
        pushButton_exit->setFlat(false);
        tabWidget->addTab(tab_action, QString());
        MainWindow->setCentralWidget(centralWidget);
        menuBar = new QMenuBar(MainWindow);
        menuBar->setObjectName(QStringLiteral("menuBar"));
        menuBar->setGeometry(QRect(0, 0, 680, 29));
        MainWindow->setMenuBar(menuBar);
        mainToolBar = new QToolBar(MainWindow);
        mainToolBar->setObjectName(QStringLiteral("mainToolBar"));
        MainWindow->addToolBar(Qt::TopToolBarArea, mainToolBar);
        statusBar = new QStatusBar(MainWindow);
        statusBar->setObjectName(QStringLiteral("statusBar"));
        MainWindow->setStatusBar(statusBar);

        retranslateUi(MainWindow);

        tabWidget->setCurrentIndex(0);
        pushButton_exit->setDefault(false);


        QMetaObject::connectSlotsByName(MainWindow);
    } // setupUi

    void retranslateUi(QMainWindow *MainWindow)
    {
        MainWindow->setWindowTitle(QApplication::translate("MainWindow", "MainWindow", 0));
        label_1->setText(QApplication::translate("MainWindow", "\345\220\257\345\212\250\346\227\266\351\227\264---------------------------------------------------------------------------------------------------------", 0));
        host_Label->setText(QString());
        label_2->setText(QApplication::translate("MainWindow", "\344\270\273\346\234\272\345\220\215-----------------------------------------------------------------------------------------------------------", 0));
        label_3->setText(QApplication::translate("MainWindow", "\347\211\210\346\234\254--------------------------------------------------------------", 0));
        label_4->setText(QApplication::translate("MainWindow", "\347\263\273\347\273\237---------------------------------------------------------------------------------------------------------------", 0));
        label_version->setText(QString());
        label_cpu->setText(QString());
        label_memory->setText(QString());
        label_runtime->setText(QString());
        label_graph->setText(QString());
        tabWidget->setTabText(tabWidget->indexOf(tab_userinfo), QApplication::translate("MainWindow", "\347\224\250\346\210\267", 0));
        label->setText(QApplication::translate("MainWindow", "Cpu Rate", 0));
        label_5->setText(QApplication::translate("MainWindow", "Memrory Rate", 0));
        tabWidget->setTabText(tabWidget->indexOf(tab_function), QApplication::translate("MainWindow", "\346\200\247\350\203\275", 0));
        tabWidget->setTabText(tabWidget->indexOf(tab_pid), QApplication::translate("MainWindow", "\350\277\233\347\250\213", 0));
        pushButton_cp->setText(QApplication::translate("MainWindow", "start", 0));
        pushButton_exit->setText(QApplication::translate("MainWindow", "EXIT", 0));
        tabWidget->setTabText(tabWidget->indexOf(tab_action), QApplication::translate("MainWindow", "UserAction", 0));
    } // retranslateUi

};

namespace Ui {
    class MainWindow: public Ui_MainWindow {};
} // namespace Ui

QT_END_NAMESPACE

#endif // UI_MAINWINDOW_H
