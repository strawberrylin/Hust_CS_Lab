/*************************************************************************
> File Name: main.c
> Author: Strawberrylin 
> Github: https://github.com/strawberrylin 
> Created Time: 2017年03月03日 星期五 10时07分15秒
************************************************************************/

#include "linux/kernel.h"
#include "linux/module.h"
#include "linux/fs.h"
#include "linux/init.h"
#include "linux/types.h"
#include "linux/errno.h"
#include "linux/uaccess.h"

#define MAX_SIZE 1024

MODULE_LICENSE("GPL");
static int my_open(struct inode *inode,struct file *file);
static int my_release(struct inode *inode,struct file *file);
static ssize_t my_read(struct file *file,char __user *user,size_t size, loff_t *lofff);
static ssize_t my_write(struct file *file,const char __user *user,size_t size, loff_t *loff);

char message[MAX_SIZE];

int device_num ;

char *devName = "mydrive";
static const struct file_operations pStruct = {
    .owner = THIS_MODULE,
    .read = my_read,
    .write = my_write,
    .open = my_open,
    .release = my_release
};
int init_module(){
    int ret;

    ret = register_chrdev(0,devName,&pStruct);
    if(ret < 0){
        printk("failed to register_chrdev.\n");
        return -1;
    }
    else{
        printk("the drive has been registered!\n");
        printk("id : %d\n",ret);
        device_num = ret;
        
        return 0;
    }
}

void cleanup_module(){
    unregister_chrdev(device_num,devName);
    printk("unregister successful\n");
}

static int my_open(struct inode *inode,struct file *file){
    printk("open the device OK!\n");
    try_module_get(THIS_MODULE);
    return 0;
}

static int my_release(struct inode *inode,struct file *file){
    printk("Device released!\n");
    module_put(THIS_MODULE);
    return 0;
}

static ssize_t my_read(struct file *file, char __user *user, size_t t,loff_t *f){
    if(copy_to_user(user,message,sizeof(message))){
        return -2;
    }
    return sizeof(message);
}

static ssize_t my_write(struct file *file,const char __user *user,size_t t, loff_t *f){
    if(copy_from_user(message,user,sizeof(message))){
        return -3;
    }
    return sizeof(message);
}

