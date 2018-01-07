;function3&function4 code
;@author: Lancyi
name    second
extern  num:word,store:byte,TIPS:byte
public Sort,Print
.386
data    segment     use16   para public 'data1'
data    ends

stack   segment     use16   para stack  'stack'
        db  200 dup(0)
stack   ends

code    segment     use16   para public 'code'
        assume  ds:data,cs:code,ss:stack
code ends
;子程序名：Sort
;功能：按平均分成绩由高到低进行排序
;入口参数：储存学生信息的内存地址，即store,学生数cx
;出口参数： 无
procd   segment     use16
        assume      cs:procd
Sort    PROC    FAR
        PUSH AX
        PUSH DX
        PUSH DI
        PUSH CX
        MOV CX, num
LOAP0:
        LEA DI,store
        MOV DX, CX
LOAP1:
        ADD DI,13           ;获取当前学生平均成绩
        MOV BL,16[DI]       ;下一学生平均成绩（每个学生占14个字节），加上0AH0DH共16个
        CMP BL,[DI]         ;若当前学生平均成绩小于下一学生平均成绩则交换
        JB  IAE
        PUSH CX
        MOV CL,14
LOAP2:
        MOV CH,[DI]
        XCHG CH,16[DI]
        MOV [DI], CH
        DEC DI
        DEC CL
        JNE LOAP2
        ADD DI,16
        POP CX
IAE:                        ;获取下一学生的信息
        ADD DI,3
        DEC DX
        CMP DX,1
        JNE LOAP1           ;内层循环
        DEC CX
        CMP CX,1            ;外层循环
        JNE LOAP0
        POP CX
        POP DI
        POP DX
        POP AX
        RET
Sort    ENDP
procd   ends

;子程序名：Print
;功能：按平均分成绩由高到低将学生信息打印
;入口参数：储存学生信息的内存地址，即store
;出口参数： 无
procf   segment     use16
        assume   cs:procf
Print   PROC    FAR
        push    si
        push    cx
        push    dx
        push    ax
        push    bx
        mov     bx, num
        lea     dx, TIPS
        mov     ah, 9
        int     21H
        lea     si, store
loapx:
        mov     cx, 4
        mov     dx, si
        MOV     AH, 9
        INT     21H
        add     si, 10
loapy:
        mov     al, [si]
        mov     ah, 0
        mov     dx, 0
        push    bx
        mov     bl, 10
        div     bl
        mov     bx, ax
        add     bl, 30h
        add     bh, 30h
        mov     dl, bl
        mov     ah, 2
        int     21h
        mov     dl, bh
        mov     ah, 2
        int     21h
        pop     bx
        inc     si
        dec     cx
        jnz     loapy
        inc     si
        inc     si
        dec     bx
        jnz     loapx
        pop     bx
        pop     ax
        pop     dx
        pop     cx
        pop     si
        RET
Print   ENDP
procf  ends
         end    
