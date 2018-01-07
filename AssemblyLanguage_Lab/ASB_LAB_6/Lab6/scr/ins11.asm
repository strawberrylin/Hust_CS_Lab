.386
data segment use16

data ends

stack segment use16 stack
	db 200 dup(0)
stack ends

code segment use16
 	assume cs:code,ds:data,ss:stack
start:
 	mov ax, data
	mov ds, ax
	mov ax, 3510h
	int 21h
	mov ah, 4ch
	int 21h
code ends	
	end start