#include<stdlib.h>
#include<stdio.h>
#include<string.h>
struct stuinfo {
	char name[12];		//储存姓名
	short score[4];		//储存成绩
};
int main() {
	struct stuinfo info[1000];
	char	strn[12];		//输入的姓名
	int		i, j;				//计数器
	short	label;			//标记变量
	char	op;
	//初始化学生表信息
	for (i = 0; i < 997; i++) {
		strcpy_s(info[i].name, 12, "aaaaaaaa_a");
		memset(info[i].score, 0, 8);
	}
	//初始化三个学生信息用于测试
	strcpy_s(info[997].name, 12, "zhangsan_a");
	info[997].score[0] = 86; info[997].score[1] = 82; info[997].score[2] = 88; info[997].score[3] = 0;
	
	strcpy_s(info[998].name, 12, "zhangsan_b");
	info[998].score[0] = 48; info[998].score[1] = 79; info[998].score[2] = 46; info[998].score[3] = 0;
	
	strcpy_s(info[999].name, 12, "zhangsan_c");
	info[999].score[0] = 96; info[999].score[1] = 92; info[999].score[2] = 98; info[999].score[3] = 0;
	do{
		printf("Inlut the name of the student:");
		gets_s(strn, 12);
		_asm {
				mov		ecx, 1000
				lea		edi, info[0];
		LOAPI:
				lea		esi, strn
				mov		edx, 12
		LOAPJ :
				  mov		al, byte ptr[esi]
				  mov		bl, byte ptr[edi]
				  cmp		al, bl
				  jnz		NEXT
				  cmp		al, '\0'
				  jz		FIGURE
				  dec		edx
				  inc		edi
				  inc		esi
				  jmp		LOAPJ
		NEXT :
				dec		ecx
				jz		REINPUT
				add		edx, 8
				add		edi, edx
				jmp		LOAPI
		FIGURE :
				add		edi, edx
				mov		al, byte ptr[edi]
				mov		ah, 0
				add		ax, ax
				add		ax, ax
				mov		dl, byte ptr[edi + 2]
				mov		dh, 0
				add		ax, dx
				add		ax, dx
				mov		dl, byte ptr[edi + 4]
				mov		dh, 0
				add		ax, dx
				mov		bl, 7
				div		bl
				mov		ah, 0
				mov		word ptr[edi + 6], ax
		}
		for (i = 0; i < 1000; i++){
			if (!strcmp(info[i].name, strn)){
				printf("%s\t", info[i].name);
				for (j = 0; j < 4; j++){
					printf("%d\t", info[i].score[j]);
				}
				printf("\n");
			}
		}
		_asm{
			REINPUT:
		}
		printf("Input Y to exit,N continue...");
		op = getchar(); getchar();
	} while (op == 'Y' || op == 'y');
	for (i = 0; i < 1000; i++) {
		printf("%s\t", info[i].name);
		for (j = 0; j < 4; j++){
			printf("%d\t", info[i].score[j]);
		}
		printf("\n");
	}
	getchar();
	return 0;
}