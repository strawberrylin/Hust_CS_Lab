/*************************************************************************
	> File Name: lab4_main.c
	> Author: Strawberrylin 
	> Github: https://github.com/strawberrylin 
	> Created Time: 2016年12月21日 星期三 18时58分29秒
 ************************************************************************/

#include<stdio.h>
#include<string.h>
#include<stdlib.h>
#include<unistd.h>
#include<sys/stat.h>
#include<sys/types.h>
#include<dirent.h>

void printDir(char *dir,int depth){
    DIR *dp;
    struct dirent *entry;
    struct stat statbuf;
    if((dp = opendir(dir))==NULL){
        printf("Error\n");
        exit(0);
    }
    //strcpy(dir,"") I//
    while((entry = readdir(dp))!=NULL){
        lstat(entry->d_name,&statbuf);
        if(entry->d_type == 4){
            if((strcmp(entry->d_name,"."))&&(strcmp(entry->d_name,".."))){
                printf("%-15s",entry->d_name);
                if(statbuf.st_mode&S_IRUSR)printf("r");
                else printf("-");
                if(statbuf.st_mode&S_IWUSR)printf("w");
                else printf("-");
                if(statbuf.st_mode&S_IXUSR)printf("x");
                else printf("-");
                if(statbuf.st_mode&S_IRGRP)printf("r");
                else printf("-");
                if(statbuf.st_mode&S_IWGRP)printf("w");
                else printf("-");
                if(statbuf.st_mode&S_IXGRP)printf("x");
                else printf("-");
                if(statbuf.st_mode&S_IROTH)printf("r");
                else printf("-");
                if(statbuf.st_mode&S_IWOTH)printf("w");
                else printf("-");
                if(statbuf.st_mode&S_IXOTH)printf("x");
                else printf("-");
                char *temp = (char *)malloc(sizeof(char) * 100);
                printf("\t%d\t%ld\n",depth,statbuf.st_size);
                strcat(temp,dir);
                strcat(temp,entry->d_name);
                strcat(temp,"/");
                printDir(temp ,depth + 4);
            }
        }
        else{
                printf("%-15s\t",entry->d_name);
                if(statbuf.st_mode&S_IRUSR)printf("r");
                else printf("-");
                if(statbuf.st_mode&S_IWUSR)printf("w");
                else printf("-");
                if(statbuf.st_mode&S_IXUSR)printf("x");
                else printf("-");
                if(statbuf.st_mode&S_IRGRP)printf("r");
                else printf("-");
                if(statbuf.st_mode&S_IWGRP)printf("w");
                else printf("-");
                if(statbuf.st_mode&S_IXGRP)printf("x");
                else printf("-");
                if(statbuf.st_mode&S_IROTH)printf("r");
                else printf("-");
                if(statbuf.st_mode&S_IWOTH)printf("w");
                else printf("-");
                if(statbuf.st_mode&S_IXOTH)printf("x");
                else printf("-");
            printf("\t%d\t%ld\n",depth,statbuf.st_size);
        }
    }
    closedir(dp);
}

int main(){
    printDir("/home/strawberrylin/Gitrepository/OperationSystem_lab/forth_lab/",0);
    return 0;
}
