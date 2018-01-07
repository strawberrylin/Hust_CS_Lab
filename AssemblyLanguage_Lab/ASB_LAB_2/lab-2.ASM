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
STU 	DB 	'ZHANGSAN_A',100,90,90,0
		DB  'ZHANGSAN_B',80,70,60,0
		DB 	'ZHANGSAN_C',0,10,40,0
BUF1 	DB 	'Input Student Name:$'
BUF2 	DB 	'No This Student...$'
BUF3    DB  'ENTER Y TO EXIT OR N GO ON:$'

DATA 	ENDS


CODE 	SEGMENT		USE16
		ASSUME CS:CODE,DS:DATA,SS:STACK

START: 	
		MOV 	AX, DATA
		MOV 	DS, AX
		MOV 	CX, 3H
		LEA 	DX, BUF1
		MOV 	AH, 9 		;9TH FUNCTION CALLS
		INT 	21H
		LEA 	DX, BUF 	;INPUT STUDENT NAME
		MOV 	AH, 10		;10TH FUNCTION CALLS
		INT 	21H
		MOV 	DL, 0AH
		MOV 	AH, 2
		INT 	21H
		LEA 	DI, STU
		
LOAPI:	
		LEA 	SI, BUF+2
		MOV 	DX, 10
LOAPJ:
		MOV 	AL, [SI]
		MOV 	BL, [DI]
		CMP 	AL, BL
		JNZ 	NEXT
		DEC  	DX
		JZ 		FIGURE
		INC 	DI
		INC 	SI
		JMP 	LOAPJ
NEXT:   
		DEC 	CX
		JZ 		REINPUT
		ADD 	DX, 4
		ADD 	DI, DX
		JMP     LOAPI

FIGURE:
		MOV 	AL, [DI+1]
		MOV 	AH, 0
		ADD 	AX, AX
		ADD 	AX, AX
		MOV 	DL, [DI+2]
		MOV 	DH, 0
		ADD 	AX, DX
		ADD 	AX, DX
		MOV		DL, [DI+3]
		MOV 	DH, 0
		ADD 	AX, DX
		MOV 	BL,	7
		DIV 	BL
		MOV 	[DI+4], AL
		JMP 	COMPARE
COMPARE:
		MOV 	AL, [DI+4]
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
