.386
code segment use16
		assume cs:code,ss:stack
OLD_INT DW ?,?
;新中断处理程序
NEW01H:	cmp al, 'a'
		je newb
		cmp al, 'A'
		je newb
		cmp al, 'b'
		je newa
		cmp al, 'B'
		je newa
		jmp dword ptr OLD_INT
newa: 	push bp
		mov bp, sp
		mov dl, 42h
		mov ah, 2
		int 21h
		pop bp
		iret
newb:	push bp
		mov bp, sp
		mov dl, 41h
		mov ah, 2
		int 21h
		pop bp
		iret
;初始化（安装新中断矢量并常驻内存）程序
start:  xor ax, ax
		mov ds, ax
		mov ax, ds:[21h*4]
		mov OLD_INT, AX
		MOV AX, ds:[21h*4+2]
		mov OLD_INT+2, ax
		CLI
		mov word ptr ds:[21h*4], offset NEW01H
		mov ds:[01h*4+2], cs
		STI
		mov dx, offset 	start+15
		mov cl, 4
		shr dx, cl
		add dx, 10h
		mov al, 0
		mov ah, 31h
		int 21h
code 	ends

stack segment use16 stack
	db 200 dup(0)
stack ends
   
    end start