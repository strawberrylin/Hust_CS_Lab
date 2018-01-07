/*************************************************************************
	> File Name: filesys.h
	> Author: Strawberrylin 
	> Github: https://github.com/strawberrylin 
	> Created Time: 2017年03月09日 星期四 10时21分56秒
 ************************************************************************/

#ifndef _FILESYS_H
#define _FILESYS_H

#include <stdlib.h>
#include <stdio.h>
#include <string.h>

#define MAX_FCB 16
#define MAX_USER 10

struct INODE{
    int fileid;     //文件标志号
    int filetype; //文件类型 普通文件 目录文件
    int fileaddr;       //文件所在磁盘号
    int filelength;     //文件长度
    int parent;        //文件所属的文件磁盘号
};

struct FCB {
    char *filename;   //文件名
    struct INODE fileinode;   //文件i节点
};

struct USER{
    char username[20]; //用户名
    int userid;      //用户id
    struct FCB fcb[MAX_FCB]; //指向FCB目录结构的指针
    int ifsign;     //是否有用户
};

void uregister(struct USER *user); //用户注册
int ulogin(struct USER *user,int *cid);
void umove(struct USER *user);
void udelete(struct USER *user);

void initial(struct USER *user);
void creatfile(struct USER *user);
int getdirid(struct USER *user,int dirid);
int getdirfile(struct USER *user,char *filename,int dirid);

void show(struct USER *user);
#endif
