;lab-2
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
;对密码和密码长度加密
PASWORD DB 	7 XOR  'C','W' XOR 'W','a' XOR 'W','n' XOR 'W',
						'g' XOR 'W','l' XOR 'W','i' XOR 'W','n' XOR 'W'
STU 	DB 	'W' XOR 'W','A' XOR 'W','N' XOR 'W','G' XOR 'W',
						'L' XOR 'W','I' XOR 'W','N' XOR 'W',0 XOR 'W',
						2 DUP(0),100 XOR 'W',90 XOR 'W',90 XOR 'W',0
		DB  'Z' XOR 'W','H' XOR 'W','A' XOR 'W','N' XOR 'W',
						'G' XOR 'W','S' XOR 'W','A' XOR 'W','N' XOR 'W',
						0 XOR 'W',0,80 XOR 'W',70 XOR 'W',60 XOR 'W',0
		DB 	'L' XOR 'W','I' XOR 'W','S' XOR 'W','I' XOR 'W',0 XOR 'W',
						5 DUP(0),0 XOR 'W',10 XOR 'W',40 XOR 'W',0
BUF1 	DB 	'Input Student Name:',0AH,0DH,'$'
BUF2 	DB 	'No This Student...',0AH,0DH,'$'
BUF3    DB  'ENTER Y TO EXIT OR N GO ON:',0AH,0DH,'$'
BUF4 	DB 	'Input the password:',0AH,0DH,'$'

DATA 	ENDS


CODE 	SEGMENT		USE16
		ASSUME CS:CODE,DS:DATA,SS:STACK

START: 	
		MOV 	AX, DATA
		MOV 	DS, AX
		LEA 	DX, BUF4
		MOV 	AH, 9 		;9TH FUNCTION CALLS
		INT 	21H
		LEA 	DX, BUF 	;INPUT STUDENT NAME
		MOV 	AH, 10		;10TH FUNCTION CALLS
		INT 	21H
		cli                       ;计时反跟踪开始 
        mov  ah,2ch 
        int  21h
        push dx                   ;保存获取的秒和百分秒
		LEA 	DI, PASWORD
		LEA 	SI, BUF+2
		MOV 	AL, BUF+1
		MOV 	AH, 0
CMPPASWL:
		MOV 	CL, PASWORD
		XOR 	CL, 'C'
		MOV 	CH, 0
		CMP 	AX,	CX
		JNZ 	EXIT
		mov  ah,2ch                 ;获取第二次秒与百分秒
        int  21h
        sti
        cmp  dx,[esp]               ;计时是否相同
        pop  dx
        JZ  	CMPPASWN
        JMP 	EXIT
        MOV 	DL, 0AH				;冗余代码
		MOV 	AH, 2
		INT 	21H
		MOV 	DL, 0DH
		MOV 	AH, 2
		INT 	21H
CMPPASWN:
		MOV 	CL, PASWORD
		XOR 	CL, 'C'
		MOV 	CH, 0
		MOV 	DX, CX
		JMP 	CMPPASW
		MOV 	DL, 0AH		;冗余代码
		MOV 	AH, 2
		INT 	21H
		MOV 	DL, 0DH
		MOV 	AH, 2
		INT 	21H
CMPPASW:
		MOV 	AL, [SI]
		MOV 	BL, 1[DI]
		XOR 	BL, 'W'
		CMP 	AL, BL
		JNZ 	EXIT
		DEC  	DX
		JZ 		INSYS
		INC 	DI
		INC 	SI
		JMP 	CMPPASW
		MOV 	DL, 0AH		;冗余代码
		MOV 	AH, 2
		INT 	21H
		MOV 	DL, 0DH
		MOV 	AH, 2
		INT 	21H
INSYS:
		MOV 	CX, 3H
		LEA 	DX, BUF1
		MOV 	AH, 9 		;9TH FUNCTION CALLS
		INT 	21H
		LEA 	DX, BUF 	;INPUT STUDENT NAME
		MOV 	AH, 10		;10TH FUNCTION CALLS
		INT 	21H
		LEA 	DI, STU
		MOV 	DL, 0AH
		MOV 	AH, 2
		INT 	21H
		MOV 	DL, 0DH
		MOV 	AH, 2
		INT 	21H
LOAPI:	
		LEA 	SI, BUF+2
		MOV 	AL, BUF+1
		MOV 	AH, 0
		MOV 	BX, AX
		MOV 	AL, 0
		MOV 	[SI+BX], AH
		MOV 	BX, 0
LOAPJ:
		MOV 	AL, [BX+SI]
		MOV 	DL, [BX+DI]
		XOR 	DL, 'W'
		CMP 	AL, DL
		JNZ 	NEXT
		CMP 	DL, 0
		JZ 		FIGURE
		INC 	BX
		JMP 	LOAPJ
NEXT:   
		DEC 	CX
		JZ 		REINPUT
		ADD 	DI, 14
		JMP     LOAPI

FIGURE:
		MOV 	AL, [DI+10]
		MOV 	AH, 0
		XOR 	AL, 'W'
		ADD 	AX, AX
		ADD 	AX, AX
		MOV 	DL, [DI+11]
		MOV 	DH, 0
		XOR 	DL, 'W'
		ADD 	AX, DX
		ADD 	AX, DX
		MOV		DL, [DI+12]
		MOV 	DH, 0
		XOR 	DL, 'W'
		ADD 	AX, DX
		MOV 	BL,	7
		DIV 	BL
		MOV 	[DI+13], AL
		JMP 	COMPARE
COMPARE:
		MOV 	AL, [DI+13]
		CMP 	AL, 90 
		JGE 	A
		CMP 	AL, 80 
		JGE 	B
		CMP 	AL, 70 
		JGE 	E
		CMP 	AL, 60 
		JGE 	D
		CMP 	AL, 50 
		JL 	F

A:
		MOV 	DL, 41H
		MOV 	AH, 2
		INT 	21H
        MOV 	DL, 0AH
        INT     21H
        JMP     EXIT
B:		
		MOV 	DL, 42H
		MOV 	AH, 2
		INT 	21H
        MOV     DL, 0AH
        INT     21H
        JMP     EXIT
E:		
		MOV 	DL, 43H
		MOV 	AH, 2
		INT 	21H
        MOV     DL, 0AH
        INT     21H
        JMP     EXIT

D:
		MOV 	DL, 44H
		MOV 	AH, 2
		INT 	21H
        MOV     DL, 0AH
        INT     21H
        JMP     EXIT

F:
		MOV 	DL, 46H
		MOV 	AH, 2
		INT 	21H
        MOV     DL, 0AH
        INT     21H
        JMP     EXIT
REINPUT:
		LEA 	DX, BUF2
		MOV 	AH, 9
		INT 	21H
		JMP 	START
EXIT:
		LEA 	DX, BUF3
		MOV 	AH, 9 		;9TH FUNCTION CALLS
		INT 	21H
		LEA 	DX, BUF 	;INPUT STUDENT NAME
        MOV     AH, 10
        int     21H
        LEA     SI, BUF+2
        MOV     AL, [SI]
        CMP     AL, 'Y'
        JNZ     START
        MOV     AH, 4CH
        INT     21H
CODE 	ENDS
		END START
