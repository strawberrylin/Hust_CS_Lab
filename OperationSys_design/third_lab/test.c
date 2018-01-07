#include <sys/types.h>
#include <sys/stat.h>
#include <stdlib.h>
#include <string.h>
#include <stdio.h>
#include <fcntl.h>
#include <unistd.h>
#define MAX_SIZE 1024

int main(void)
{
	int ret; 		
	char buf[MAX_SIZE];	//缓冲区
	char buf_in[MAX_SIZE];	//要写入的信息

	char device[50] = "/dev/mydevice";

	ret = open(device, O_RDWR | O_NONBLOCK);

	if (ret != -1)
	{
		//读初始信息
		read(ret, buf, sizeof(buf));
		printf("%s\n", buf);

		//写信息
		printf("input :");
		gets(buf_in);
		write(ret, buf_in, sizeof(buf_in));

		//读刚才写的信息
		read(ret, buf, sizeof(buf));
		printf("device Message: %s\n", buf);
		close(ret);
		return 0;
	}
	else
	{
		printf("Device open failed\n");
		return -1;
	}
}
