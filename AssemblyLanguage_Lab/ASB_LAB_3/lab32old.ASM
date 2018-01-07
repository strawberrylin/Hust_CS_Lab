;lab-3 将字符串比较的内循环改为字符串比较指令
;source code
;@author Strawberrylin

.386
STACK 	SEGMENT 	USE16 	STACK
	DB 		200 DUP(0)
STACK 	ENDS

DATA 	SEGMENT 	USE16 
BUF 	DB 	15
		DB  ?
		DB 	15 DUP(0)

STU     DB 997 DUP('zhangsan_x',0,0,0,0)
        DB 	'ZHANGSAN_A',100,90,90,0
		DB  'ZHANGSAN_B',80,70,60,0
		DB 	'ZHANGSAN_C',0,10,40,0
BUF1 	DB 	'Input Student Name:$'
BUF2 	DB 	'No This Student...$'

DATA 	ENDS


CODE 	SEGMENT		USE16
ASSUME CS:CODE,DS:DATA,SS:STACK,ES:DATA

START: 	
		MOV 	AX, DATA
		MOV 	DS, AX
        MOV     ES, AX
        LEA 	DX, BUF1
		MOV 	AH, 9 		;9TH FUNCTION CALLS
		INT 	21H
		LEA 	DX, BUF 	;INPUT STUDENT NAME
		MOV 	AH, 10		;10TH FUNCTION CALLS
		INT 	21H
        MOV     EBP, 100000
        MOV     AX, 0
        CALL    TIMER
LOAP:
        LEA     DI, STU
        MOV 	DX, 1000	
LOAPI:	
        JMP     FIGURE
CON:
		LEA 	SI, BUF+2
        MOV     CX, 10
        REPZ    CMPSB
        JNE     NEXT
        JMP     EXIT
NEXT:   
		DEC 	DX
		JZ 		REINPUT
		ADD 	CX, 4
		ADD 	DI, CX
		JMP     LOAPI

FIGURE:
		MOV 	AL, [DI+10]
		AND 	AH, 0H
	    SAL     AX, 2
		MOV 	BL, [DI+11]
		AND 	BH, 0H
		SAL     BX, 1
        ADD     AX, BX
	    MOV		BL, [DI+12]
		MOV 	BH, 0
		ADD 	AX, BX
        MOV     BH, 0
		MOV 	BL,	7
		DIV 	BL
		MOV 	[DI+13], AL
		JMP 	CON
REINPUT:
		LEA 	DX, BUF2
		MOV 	AH, 9
		INT 	21H
		JMP 	START
EXIT:
        DEC     EBP
        JNZ     LOAP
        MOV     AX, 1
        CALL    TIMER
        MOV     AH, 4CH
        INT     21H

;时间计数器(ms),在屏幕上显示程序的执行时间(ms)
;使用方法:
;	   MOV  AX, 0	;表示开始计时
;	   CALL TIMER
;	   ... ...	;需要计时的程序
;	   MOV  AX, 1	
;	   CALL TIMER	;终止计时并显示计时结果(ms)
;输出: 改变了AX和状态寄存器
TIMER	PROC
	PUSH  DX
	PUSH  CX
	PUSH  BX
	MOV   BX, AX
	MOV   AH, 2CH
	INT   21H	     ;CH=hour(0-23),CL=minute(0-59),DH=second(0-59),DL=centisecond(0-100)
	MOV   AL, DH
	MOV   AH, 0
	IMUL  AX,AX,1000
	MOV   DH, 0
	IMUL  DX,DX,10
	ADD   AX, DX
	CMP   BX, 0
	JNZ   _T1
	MOV   CS:_TS, AX
_T0:	POP   BX
	POP   CX
	POP   DX
	RET
_T1:	SUB   AX, CS:_TS
	JNC   _T2
	ADD   AX, 60000
_T2:	MOV   CX, 0
	MOV   BX, 10
_T3:	MOV   DX, 0
	DIV   BX
	PUSH  DX
	INC   CX
	CMP   AX, 0
	JNZ   _T3
	MOV   BX, 0
_T4:	POP   AX
	ADD   AL, '0'
	MOV   CS:_TMSG[BX], AL
	INC   BX
	LOOP  _T4
	PUSH  DS
	MOV   CS:_TMSG[BX+0], 0AH
	MOV   CS:_TMSG[BX+1], 0DH
	MOV   CS:_TMSG[BX+2], '$'
	LEA   DX, _TS+2
	PUSH  CS
	POP   DS
	MOV   AH, 9
	INT   21H
	POP   DS
	JMP   _T0
_TS	DW    ?
 	DB    'Time elapsed in ms is '
_TMSG	DB    12 DUP(0)
TIMER   ENDP
CODE 	ENDS
		END START
