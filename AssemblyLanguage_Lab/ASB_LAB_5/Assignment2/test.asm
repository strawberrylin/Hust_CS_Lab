.386
.model flat, c
.code
public dif
dif		proc	par1:dword,par2:dword
			    mov		ecx, 1000
				mov		edi, par1;
		LOAPI:
				mov		esi, par2
				mov		edx, 12
		LOAPJ:
				  mov		al, byte ptr[esi]
				  mov		bl, byte ptr[edi]
				  cmp		al, bl
				  jnz		NEXT
				  cmp		al, 0
				  jz		FIGURE
				  dec		edx
				  inc		edi
				  inc		esi
				  jmp		LOAPJ
		NEXT:
				dec		ecx
				jz		REINPUT
				add		edx, 8
				add		edi, edx
				jmp		LOAPI
		FIGURE:
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
		REINPUT:
				ret
				dif endp 
end 