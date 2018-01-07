;main source code
;@author strawberrylin
name    first
extern  Sort:far,Print:far
public store,num,TIPS
.386
;宏定义9号功能
write   macro   a
        lea     dx, a
        mov     ah, 9
        int     21h
        endm
read    macro   b
        lea     dx, b
        mov     ah, 10
        int     21h
        endm
data    segment     use16 para public 'data1'
bufc    db  '1:Input the name and score',0ah,0dh,
            '2:Figure the sum and the average score',0ah,0dh,
            '3:Sort the score',0ah,0dh,
            '4:Output the score from high to low',0ah,0dh,
            '5:Exit...',0ah,0dh,
            'Enter your choose:','$'
buft2   db  0ah,0dh,'Input name:$'
buft3   db  0ah,0dh,'Input chinese score:$'
buft4   db  0ah,0dh,'Input math score:$'
buft5   db  0ah,0dh,'Input english score:$'
buf     db  20
        db  ?
        db  20 dup(0)
num     dw  0
store   db  200 dup(0)
TIPS    db 0ah,0dh,'INFORMATIONS AS　FOLLOWS:',0ah,0dh,'$'   ;信息输出提示语
PRJE    DB 0ah,0dh,'PROJECT IS GOING TO EXIT!PRESS ANY KEY TO EXIT!$'   ;结束提示语
data    ends

stack   segment     use16  para stack 'stack'
        db  200     dup(0)
stack   ends

code    segment     use16   para  public    'code'
        assume  ds:data,cs:code,ss:stack
start:
    mov     ax,     data
    mov     ds,     ax
    lea     di,     store       ; 信息储存位置
    mov     cx,     0           ; 学生数
show:
    write   bufc
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
    cmp     al, '5'
    jz      function5
    jmp     show
function1:
        call    far ptr     INFOIN
        jmp     show
function2:
        call    AVG
        jmp     show
function3:
        call    far ptr     Sort
        jmp     show
function4:
        call    far ptr     Print
        jmp     show
function5:
        write   PRJE
        mov ah,1
        int 21h
    mov     ah, 4ch
    int     21h
code    ends
;子程序名：AVG
;功能：计算平均成绩
;入口参数：储存学生信息的内存地址 store
;出口参数：无
procg   segment     use16
        assume      cs:procg
AVG     proc        far
    push    si
    push    cx
    push    dx
    push    ax
    mov     cx, num
    mov     ax, 0
    lea     si,store
    add      si, 10
fig:
    mov     bl, [si]
    mov     bh, 0
    add     ax, bx
    mov     bl, [si+1]
    mov     bh, 0
    add     ax, bx
    mov     bl, [si+2]
    add     ax, bx
    mov     dh, 0
    mov     dl, 3
    div     dl
    mov     [si+3], al
    add     si, 16
    dec     cx
    jnz     fig
    pop     ax
    pop     dx
    pop     cx
    pop     si
    ret
AVG     endp
procg   ends
;子程序名：INFOIN
;功能：录入学生信息
;入口参数：储存学生信息的内存地址的di
;出口参数：无
proce    segment     use16
        assume  cs:proce
INFOIN       proc    far
    inc     cx
    mov     num,cx
    push    dx
    push    ax
    push    cx
    push    si
    write   buft2
    read    buf
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
    mov     byte ptr [di], '$'
    mov     cl, buf+1
    mov     ch, 0
    add     di, 10
    sub     di, cx
    write   buft3
    call    GSCORE
    write   buft4
    call    GSCORE
    write   buft5
    call    GSCORE
    inc     di
    mov     byte ptr [di], 0ah      ;在平均成绩后加入'0ah' '0dh' '$'
    inc     di
    mov     byte ptr [di], 0dh      ;
    inc     di
    mov     byte ptr [di],'$'        ;输出
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
    read    buf
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
proce   ends
	end start
