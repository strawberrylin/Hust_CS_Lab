#include "mainwindow.h"
#include "ui_mainwindow.h"

MainWindow::MainWindow(QWidget *parent) :
    QMainWindow(parent),
    ui(new Ui::MainWindow)
{
    ui->setupUi(this);
    connect(ui->signButton,SIGNAL(clicked(bool)),this,SLOT(uregister()));
}

MainWindow::~MainWindow()
{
    delete ui;
}
void MainWindow::uregister(){
    QString mm;
    mm = ui->lineEdit->text();
    QByteArray ba = mm.toLatin1();
    char *name = ba.data();
    for(int i = 0;i < MAX_USER;i ++){

        if(!strcmp(user[i].username,name)){
            ui->out_label->setText("sign failed! user already existed!");
            break;
        }

        if(!user[i].ifsign){
            strcpy(user[i].username,name);
            user[i].ifsign = 1;
            ui->out_label->setText("sign successfully!");
            break;
        }
    }
}

//void MainWindow::ulogin(struct USER *user,char *name, int id){

//}


