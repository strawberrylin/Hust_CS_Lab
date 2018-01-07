.386
data segment use16
data ends

stack segment use16 stack
	db 200 dup(0)
stack ends

code segment use16
 	assume cs:code,ds:data,ss:stack
start:
	mov ax, 0
	mov ds, ax
	mov ax, ds:[10h*4]
	mov es, ds:[10h*4+2]
	mov ah, 4ch
	int 21h
code ends	
	end start