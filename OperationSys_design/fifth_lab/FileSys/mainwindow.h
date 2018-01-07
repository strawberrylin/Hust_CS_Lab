#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QMainWindow>
#include <string.h>
#define MAX_USER 10
namespace Ui {
class MainWindow;
}

class MainWindow : public QMainWindow
{
    Q_OBJECT
    struct INODE{
        int fileid;
        int filetyoe;
        int fileaddr;
        int filelength;
    };
    struct FCB{
        char username[20];
        struct INODE filenode;
    };
    struct USER{
        char username[20];
        int userid;
        struct FCB *fcb;
        int ifsign;
    }user[MAX_USER];

public:
    explicit MainWindow(QWidget *parent = 0);
    ~MainWindow();

private:
    Ui::MainWindow *ui;
private slots:
    void uregister();
    //void ulogin();
};

#endif // MAINWINDOW_H
