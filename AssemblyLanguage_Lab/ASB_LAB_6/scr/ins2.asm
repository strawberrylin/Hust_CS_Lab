.386
code segment use16
	assume cs:code,ss:stack

OLD_INT DW ?,?

;判断INT 16H的功能号：00H和10H
NEW16H: cmp ah, 0h
		je loap0
		cmp ah, 10h
		je loap0
		jmp dword ptr OLD_INT
;比较知道输入的是a还是b
loap0:	pushf
		call dword ptr OLD_INT
		cmp al, 'A'
		je newb
		cmp al, 'a'
		je newb
		cmp al, 'B'
		je newa
		cmp al, 'b'
		je newa
		iret
;输入a转化为b
newa:   mov al, 41h
		iret
;输入b转化为a
newb: 	mov al, 42h
		iret

start:  xor ax, ax
		mov ds, ax
		mov ax, ds:[16h*4]
		mov OLD_INT, ax
		mov ax, ds:[16h*4+2]
		mov OLD_INT+2, ax
		CLI
;传送新的中断矢量表
		mov word ptr ds:[16h*4], offset NEW16H
		mov ds:[16h*4+2], cs
		STI
		mov dx, offset start+15
;驻留内存处理	
		mov cl, 4
		shr dx, cl
		add dx, 10h
;退出码为0
		mov al, 0
		mov ah, 31h
		int 21h
code ends
stack segment stack use16
		db 200 dup(0)
stack ends
		end start
		