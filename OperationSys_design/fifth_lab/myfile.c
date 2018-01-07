/*************************************************************************
> File Name: myfile.c
> Author: Strawberrylin 
> Github: https://github.com/strawberrylin 
> Created Time: 2017年03月09日 星期四 10时56分05秒
************************************************************************/

#include "filesys.h"

int main(){
    struct USER usertable[MAX_USER]; //10个用户的存储表

    int userid;
    int choose;
    int ret;
    while(1){
        printf("\n\n\n\n\t\tlogin[1]\t\t\tsignup[2]\n");
        scanf("%d",&choose);getchar();
        switch(choose){
            case 1:ret = ulogin(usertable,&userid);break;
            case 2:uregister(usertable);break;
            case 0:return 0;break;
        }
        if(ret){
            initial(&usertable[userid]);
            while(1){
                printf("=======================================================================\n\n\n");
                printf("\t\tcreat[1]\t\t\tmove[2]\n\n\n");
                printf("\t\tdelete[3]\t\t\tshow[4]\n");
                scanf("%d",&choose);
                switch(choose){
                    case 1: creatfile(&usertable[userid]);break;
                    case 2: umove(&usertable[userid]);break;
                    case 3: udelete(&usertable[userid]);break;
                    case 4: show(&usertable[userid]);break;
                }
                if(choose == 0){
                    system("clear");
                    break;

                }
            }
        }
    }
    return 0;  
}

void uregister(struct USER *user){
    int i;
    char name[20];
    printf("Name :");
    scanf("%s",name);getchar();
    for(i = 0;i < MAX_USER; i++){
        if(!strcmp(user[i].username,name)){
            printf("User Existed\n");
            break;
        }
        if(!user[i].ifsign){
            strcpy(user[i].username,name);
            user[i].userid = i;
            user[i].ifsign = 1;
            break;
        }
    }
    if(i == MAX_USER){
        printf("No User Space\n");
    }
    return;
}
int  ulogin(struct USER *user,int *cid){
    int i;
    char name[20];
    printf("Name :");
    scanf("%s",name);getchar();
    for(i = 0;i < MAX_USER; i++){
        if(!strcmp(user[i].username,name)){
            *cid = i;
            system("clear");
            printf("Hello,welcome to the file system!\n");
            break;
        }
    }
    if(i == MAX_USER){
        printf("No User Exited\n");
        return 0;
    }   
    return 1;
}

void creatfile(struct USER *user){
    int i;
    char filename[20];
    int filetype;
    int dirid;
    printf("New File Name:");
    scanf("%s",filename);getchar();
    printf("New File Type :");
    scanf("%d",&filetype);getchar();
    printf("which dir:");
    scanf("%d",&dirid);
    if((getdirid(user,dirid))==-1){//检测是否有对应文件夹
        printf("No such dir\n");
        return;
    }
    if((getdirfile(user,filename,dirid)) == -1){//检测文件夹下是否有同名文件
        printf("alread existed file\n");
        return;
    }
    for(i = 0;i < MAX_FCB;i ++){//满足创建条件
        if(user->fcb[i].filename == NULL) {
            user->fcb[i].filename = (char *)malloc(sizeof(char)*20);
            strcpy(user->fcb[i].filename,filename);
            user->fcb[i].fileinode.filetype = filetype;
            user->fcb[i].fileinode.fileid = i;
            user->fcb[i].fileinode.parent = dirid;
            user->fcb[i].fileinode.fileaddr = (user->userid) * 1024 + i;
            user->fcb[i].fileinode.filelength = 0;
            break;
        }
    }
}

void initial(struct USER *user){//初始化 打开一个文件作为根目录
    int i ;
    user->fcb[0].filename = (char *)malloc(sizeof(char)*20);
    strcpy(user->fcb[0].filename,"root");
    user->fcb[0].fileinode.filetype = 0;
    user->fcb[0].fileinode.fileid = user->userid;
    user->fcb[0].fileinode.fileaddr = (user->userid) * 1024;
    user->fcb[0].fileinode.filelength = 0;
    for(i=1;i<MAX_FCB;i++){
        user->fcb[i].fileinode.fileid = -1;
    }
}


int getdirid(struct USER *user,int dirid){
    int i;
    for(i = 0;i < MAX_FCB;i ++){
        if((user->fcb[i].fileinode.fileid != -1)&&(user->fcb[i].fileinode.fileid != -2)) {
            if((user->fcb[i].fileinode.filetype == 0)&&(user->fcb[i].fileinode.fileid == dirid))
            return 1;
        }
    }
    return -1;
}


int getdirfile(struct USER *user,char *filename,int dirid){
    int i;
    for(i = 0;i < MAX_FCB;i ++){
        if((user->fcb[i].fileinode.fileid != -1)&&(user->fcb[i].fileinode.fileid != -2)) {
            if(!(strcmp(user->fcb[i].filename,filename))&&(user->fcb[i].fileinode.parent == dirid)){
                return -1;
            }
        }
    }
    return 1;
}
void umove(struct USER *user){
    int i;
    char filename[20];
    int fileid;
    int dirid;
    printf("File Name:");
    scanf("%s",filename);getchar();
    printf("Fileid:");
    scanf("%d",&fileid);getchar();
    printf("to which dir:");
    scanf("%d",&dirid);
    if((getdirid(user,dirid))==-1){
        printf("No such dir\n");
        return;
    }
    if((getdirfile(user,filename,dirid)) == -1){//检测文件夹下是否有同名文件
        printf("alread existed same file\n");
        return;
    }
    for(i = 0;i < MAX_FCB;i ++){
        if((user->fcb[i].fileinode.fileid != -1)&&(user->fcb[i].fileinode.fileid != -2)) {
            if(!(strcmp(user->fcb[i].filename,filename))&&(user->fcb[i].fileinode.fileid == fileid)){
                user->fcb[i].fileinode.parent = dirid;
                return;
            }
        }
    }
    printf("No such file\n");
}

void udelete(struct USER *user){
    int i,j;
    char filename[20];
    int fileid;
    printf("File Name:");
    scanf("%s",filename);getchar();
    printf("Fileid:");
    scanf("%d",&fileid);getchar();
    for(i = 0;i < MAX_FCB;i ++){
        if((user->fcb[i].fileinode.fileid != -1)&&(user->fcb[i].fileinode.fileid != -2)) {
            if(!(strcmp(user->fcb[i].filename,filename))&&(user->fcb[i].fileinode.fileid == fileid)){
                if(user->fcb[i].fileinode.filetype == 0){//目录文件
                    for(j = 0;j < MAX_FCB;j ++){
                        if(user->fcb[j].fileinode.parent == fileid){
                            free(user->fcb[j].filename);
                            user->fcb[j].filename = NULL;
                            user->fcb[j].fileinode.filetype = 0;
                            user->fcb[j].fileinode.fileid = -2;
                            user->fcb[j].fileinode.parent = 0;
                            user->fcb[j].fileinode.fileaddr = 0;
                            user->fcb[j].fileinode.filelength = 0;
                        }
                    }
                }
                free(user->fcb[i].filename);
                user->fcb[i].filename = NULL;
                user->fcb[i].fileinode.filetype = 0;
                user->fcb[i].fileinode.fileid = -2;
                user->fcb[i].fileinode.parent = 0;
                user->fcb[i].fileinode.fileaddr = 0;
                user->fcb[i].fileinode.filelength = 0;
                return;
            }
        }
    }
    printf("No such fire\n");
    return ;
}

void show(struct USER *user){
    int i;
    for(i = 0;i < MAX_USER;i ++){
        if((user->fcb[i].fileinode.fileid!=-1)&&(user->fcb[i].fileinode.fileid!=-2)){
            printf("文件名:%s\n文件类型：%d\n文件主id：%d\n文件父结点id:%d\n文件物理地址:%d\n文件长度:%d\n",user->fcb[i].filename
                                        ,user->fcb[i].fileinode.filetype
                                        ,user->fcb[i].fileinode.fileid
                                        ,user->fcb[i].fileinode.parent
                                        ,user->fcb[i].fileinode.fileaddr
                                        ,user->fcb[i].fileinode.filelength);
        }
    }
}
