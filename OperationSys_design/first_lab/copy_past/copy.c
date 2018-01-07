/*************************************************************************
> File Name: copy.c
> Author: Strawberrylin 
> Github: https://github.com/strawberrylin 
> Created Time: 2017年03月01日 星期三 19时14分25秒
************************************************************************/

#include<stdio.h>
#include <stdlib.h>

int main(int argc,char *argv[]){
    FILE *fp1,*fp2;
    char ch;
    if((fp1=fopen(argv[1],"r"))==NULL) {
        printf("file open error\n");
        exit(-1);
    }   
    if((fp2=fopen(argv[2],"w+"))==NULL) {
        printf("file open error\n");
        exit(-1);
    }
    while(fread(&ch,sizeof(char),1,fp1)){
        if(ch != EOF){
            fwrite(&ch,sizeof(char),1,fp2);
        }
        else break;
    }
    fclose(fp1);
    fclose(fp2);
    return 0;

}
