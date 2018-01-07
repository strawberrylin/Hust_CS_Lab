;main source code
;@author strawberrylin
.386
data    segment     use16
bufc    db  '1:Input the name and score',0ah,0dh,
            '2:Figure the sum and the average score',0ah,0dh,
            '3:Sort the score',0ah,0dh,
            '4:Output the score from high to low',0ah,0dh,
            'Enter your choose:','$'
buft2   db  0ah,0dh,'Input name:$'
buft3   db  0ah,0dh,'Input chinese score:$'
buft4   db  0ah,0dh,'Input math score:$'
buft5   db  0ah,0dh,'Input english score:$'
buf     db  20
        db  ?
        db  20 dup(0)
store   db  200 dup(0)
sum     dw  0
avr     db  0
data    ends

stack   segment     use16   stack
        db  200     dup(0)
stack   ends

code    segment     use16
        assume  ds:data,cs:code,ss:stack
start:
    mov     ax,     data
    mov     ds,     ax
    lea     di,     store       ; 信息储存位置
    mov     cx,     0           ; 学生数
show:
    lea     dx, bufc
    mov     ah, 9
    int     21h
    mov     ah, 1       ;input choose
    int     21h
    cmp     al, '1'
    jz      function1
    cmp     al, '2'
    jz      function2
    cmp     al, '3'
    jz      function3
    cmp     al, '4'
    jz      function4
    jmp     show
function1:
        call    far ptr     INFOIN
        jmp     show
function2:

function3:

function4:

    mov     ah, 4ch
    int     21h
code    ends
;子程序名：INFOIN
;功能：录入学生信息
;入口参数：储存学生信息的内存地址的di
;出口参数：无
proce    segment     use16
        assume  cs:proce
INFOIN       proc    far
    inc     cx
    push    dx
    push    ax
    push    cx
    push    si
    lea     dx, buft2   ;input name
    mov     ah, 9
    int     21h
    lea     dx, buf
    mov     ah, 10
    int     21h
    mov     cl, buf+1
    mov     ch, 0
    lea     si, buf+2
    begin:
        mov     al, [si]
        mov     [di], al
        inc     si
        inc     di
        dec     cx
        jnz     begin
    mov     cl, buf+1
    mov     ch, 0
    add     di, 10
    sub     di, cx
    lea     dx, buft3   ;input chns
    mov     ah, 9
    int     21h
    call    GSCORE
    lea     dx, buft4   ;Input maths
    mov     ah, 9
    int     21h
    call    GSCORE
    lea     dx, buft5   ;Input engs
    mov     ah, 9
    int     21h
    call    GSCORE
    mov     ax, 0
    mov     dx, 0
    mov     dl, [di-1]
    add     ax,dx
    mov     dl, [di-2]
    add     ax, dx
    mov     dl, [di-3]
    add     ax, dx
    mov     WORD PTR[di], ax
    mov     dx, 0
    mov     dl, 3
    div     dl
    inc     di
    inc     di
    mov     [di], al
    inc     di
    pop     si
    pop     cx
    pop     ax
    pop     dx
    ret
INFOIN   endp 
;子程序名：GSCORE
;功能：得到输入的成绩
;入口参数：储存学生信息的偏移地址di
;出口参数：ax，存储对应的成绩
 GSCORE      proc  
    push    dx
    push    bx
    push    si
    push    cx
    lea     dx, buf
    mov     ah, 10
    int     21h
    mov     cl, buf+1
    lea     si, buf+2
    mov     ax, 0
    loapi:
        mov     bl, [si]
        sub     bl, 30h
        mov     bh, 0
        imul    ax, 10
        add     ax, bx
        inc     si
        dec     cx
        jnz     loapi
    mov     [di], al
    inc     di
    pop     cx
    pop     si
    pop     bx
    pop     dx
    ret
    GSCORE  endp
proce  ends
    end     start
