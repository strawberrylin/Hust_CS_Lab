.386
.model   flat,stdcall
option   casemap:none

WinMain  proto :DWORD,:DWORD,:DWORD,:DWORD
WndProc  proto :DWORD,:DWORD,:DWORD,:DWORD
Display  proto :DWORD
Clear    proto :DWORD
Averagef proto
Radix    proto

include      ex8.INC

include      windows.inc
include      user32.inc
include      kernel32.inc
include      gdi32.inc
include      shell32.inc

includelib   user32.lib
includelib   kernel32.lib
includelib   gdi32.lib
includelib   shell32.lib

student	     struct
	     myname   db  10 dup(0)
	     chinese  db  0
	     math     db  0
	     english  db  0
	     average  db  0
	     grade    db  0
student      ends

.data
ClassName    db       'TryWinClass',0
AppName      db       'Our First Window',0
MenuName     db       'MyMenu',0
DlgName	     db       'MyDialog',0
AboutMsg     db       'I am strawberylin',0
hInstance    dd       0
CommandLine  dd       0
buf	     student  <'Zhangsan_a',40,50,60,0,' '>
	     student  <'Zhangsan_b',96,98,90,0,' '>
	     student  <'Zhangsan_c',50,60,70,0,' '>
	     student  <'Zhangsan_d',60,70,80,0,' '>
	     student  <'WangLin   ',90,80,70,0,' '>
msg_name     db       'name',0
msg_chinese  db       'chinese',0
msg_math     db       'math',0
msg_english  db       'english',0
msg_average  db       'average',0
msg_grade    db       'grade',0
chinese	     db       '40','96','50','60','90'
math	     db       '50','98','60','70','80'
english	     db       '60','90','70','80','70'
average	     db       '  ','  ','  ','  ','  '
boolHasPaint db         0
.code
Start:	     invoke GetModuleHandle,NULL
	     mov    hInstance,eax
	     invoke GetCommandLine
	     mov    CommandLine,eax
	     invoke WinMain,hInstance,NULL,CommandLine,SW_SHOWDEFAULT
	     invoke ExitProcess,eax
	     ;;
WinMain      proc   hInst:DWORD,hPrevInst:DWORD,CmdLine:DWORD,CmdShow:DWORD
	     LOCAL  wc:WNDCLASSEX
	     LOCAL  msg:MSG
	     LOCAL  hWnd:HWND
        
             invoke RtlZeroMemory,addr wc,sizeof wc
	     mov    wc.cbSize,SIZEOF WNDCLASSEX
	     mov    wc.style, CS_HREDRAW or CS_VREDRAW
	     mov    wc.lpfnWndProc, offset WndProc
	     mov    wc.cbClsExtra,NULL
	     mov    wc.cbWndExtra,NULL
	     push   hInst
	     pop    wc.hInstance
	     mov    wc.hbrBackground,COLOR_WINDOW+1
	     mov    wc.lpszMenuName, offset MenuName
	     mov    wc.lpszClassName,offset ClassName
	     invoke LoadIcon,NULL,IDI_APPLICATION
	     mov    wc.hIcon,eax
	     mov    wc.hIconSm,0
	     invoke LoadCursor,NULL,IDC_ARROW
	     mov    wc.hCursor,eax
	     invoke RegisterClassEx, addr wc
	     INVOKE CreateWindowEx,NULL,addr ClassName,addr AppName,\
                    WS_OVERLAPPEDWINDOW,CW_USEDEFAULT,\
                    CW_USEDEFAULT,CW_USEDEFAULT,CW_USEDEFAULT,NULL,NULL,\
                    hInst,NULL
	     mov    hWnd,eax
	     INVOKE ShowWindow,hWnd,SW_SHOWNORMAL
	     INVOKE UpdateWindow,hWnd
	     ;;
MsgLoop:     INVOKE GetMessage,addr msg,NULL,0,0
             cmp    EAX,0
             je     ExitLoop
             INVOKE TranslateMessage,addr msg
             INVOKE DispatchMessage,addr msg
	     jmp    MsgLoop 
ExitLoop:    mov    eax,msg.wParam
	     ret
WinMain      endp

WndProc      proc   hWnd:DWORD,uMsg:DWORD,wParam:DWORD,lParam:DWORD
	     LOCAL  hdc:HDC
         LOCAL  ps:PAINTSTRUCT
     .IF     uMsg == WM_DESTROY
	     invoke PostQuitMessage,NULL
     .ELSEIF uMsg == WM_KEYDOWN
	    .IF     wParam == VK_F1
             invoke MessageBox,hWnd,addr AboutMsg,addr AppName,0;
	    .ENDIF
     .ELSEIF uMsg == WM_COMMAND
	    .IF     wParam == IDM_FILE_EXIT
		    invoke SendMessage,hWnd,WM_CLOSE,0,0
	    .ELSEIF wParam == IDM_FILE_LIST
		    invoke Display,hWnd
            mov boolHasPaint, 1
		.ELSEIF     wParam == IDM_ACTION_AVERAGE
		    invoke Averagef
            invoke Display,hWnd
            mov boolHasPaint, 1
		.ELSEIF     wParam == IDM_ACTION_SORT
		    invoke SendMessage,hWnd,WM_CLOSE,0,0
	    .ELSEIF wParam == IDM_HELP_ABOUT
		    invoke MessageBox,hWnd,addr AboutMsg,addr AppName,0
	    .ENDIF
     .ELSEIF uMsg == WM_PAINT
            invoke BeginPaint,hWnd,addr ps
                .IF boolHasPaint == 1
                    invoke Display,hWnd
                .ENDIF
            invoke EndPaint,hWnd,addr ps
     .ELSE
             invoke DefWindowProc,hWnd,uMsg,wParam,lParam
             ret
     .ENDIF
  	     	 xor    eax,eax
	     	 ret
WndProc      endp

Display      proc   hWnd:DWORD
             XX     equ  10
             YY     equ  10
	         XX_GAP equ  100
	         YY_GAP equ  30
             LOCAL  hdc:HDC
             invoke GetDC,hWnd
             mov    hdc,eax
             invoke TextOut,hdc,XX+0*XX_GAP,YY+0*YY_GAP,offset msg_name,4
             invoke TextOut,hdc,XX+1*XX_GAP,YY+0*YY_GAP,offset msg_chinese,7
             invoke TextOut,hdc,XX+2*XX_GAP,YY+0*YY_GAP,offset msg_math,4
             invoke TextOut,hdc,XX+3*XX_GAP,YY+0*YY_GAP,offset msg_english,7
             invoke TextOut,hdc,XX+4*XX_GAP,YY+0*YY_GAP,offset msg_average,7
             invoke TextOut,hdc,XX+5*XX_GAP,YY+0*YY_GAP,offset msg_grade,5
             ;;
			 invoke TextOut,hdc,XX+0*XX_GAP,YY+1*YY_GAP,offset buf[0*15].myname,10
             invoke TextOut,hdc,XX+1*XX_GAP,YY+1*YY_GAP,offset chinese+0,2
             invoke TextOut,hdc,XX+2*XX_GAP,YY+1*YY_GAP,offset math+0,   2
             invoke TextOut,hdc,XX+3*XX_GAP,YY+1*YY_GAP,offset english+0,2
             invoke TextOut,hdc,XX+4*XX_GAP,YY+1*YY_GAP,offset average+0,2
             invoke TextOut,hdc,XX+5*XX_GAP,YY+1*YY_GAP,offset buf[0*15].grade,1

             invoke TextOut,hdc,XX+0*XX_GAP,YY+2*YY_GAP,offset buf[1*15].myname,10
             invoke TextOut,hdc,XX+1*XX_GAP,YY+2*YY_GAP,offset chinese+2,2
             invoke TextOut,hdc,XX+2*XX_GAP,YY+2*YY_GAP,offset math+2,   2
             invoke TextOut,hdc,XX+3*XX_GAP,YY+2*YY_GAP,offset english+2,2
             invoke TextOut,hdc,XX+4*XX_GAP,YY+2*YY_GAP,offset average+2,2
             invoke TextOut,hdc,XX+5*XX_GAP,YY+2*YY_GAP,offset buf[1*15].grade,1

             invoke TextOut,hdc,XX+0*XX_GAP,YY+3*YY_GAP,offset buf[2*15].myname,10
             invoke TextOut,hdc,XX+1*XX_GAP,YY+3*YY_GAP,offset chinese+4,2
             invoke TextOut,hdc,XX+2*XX_GAP,YY+3*YY_GAP,offset math+4,   2
             invoke TextOut,hdc,XX+3*XX_GAP,YY+3*YY_GAP,offset english+4,2
             invoke TextOut,hdc,XX+4*XX_GAP,YY+3*YY_GAP,offset average+4,2
             invoke TextOut,hdc,XX+5*XX_GAP,YY+3*YY_GAP,offset buf[2*15].grade,1

             invoke TextOut,hdc,XX+0*XX_GAP,YY+4*YY_GAP,offset buf[3*15].myname,10
             invoke TextOut,hdc,XX+1*XX_GAP,YY+4*YY_GAP,offset chinese+6,2
             invoke TextOut,hdc,XX+2*XX_GAP,YY+4*YY_GAP,offset math+6,   2
             invoke TextOut,hdc,XX+3*XX_GAP,YY+4*YY_GAP,offset english+6,2
             invoke TextOut,hdc,XX+4*XX_GAP,YY+4*YY_GAP,offset average+6,2
             invoke TextOut,hdc,XX+5*XX_GAP,YY+4*YY_GAP,offset buf[3*15].grade,1

             invoke TextOut,hdc,XX+0*XX_GAP,YY+5*YY_GAP,offset buf[4*15].myname,10
             invoke TextOut,hdc,XX+1*XX_GAP,YY+5*YY_GAP,offset chinese+8,2
             invoke TextOut,hdc,XX+2*XX_GAP,YY+5*YY_GAP,offset math+8,   2
             invoke TextOut,hdc,XX+3*XX_GAP,YY+5*YY_GAP,offset english+8,2
             invoke TextOut,hdc,XX+4*XX_GAP,YY+5*YY_GAP,offset average+8,2
             invoke TextOut,hdc,XX+5*XX_GAP,YY+5*YY_GAP,offset buf[4*15].grade,1
             ret
Display      endp
Averagef     proc
			push    edi
            push    esi
    		push    ecx
    		push    edx
    		push    eax
            push    ebx
    		mov     ecx, 5
            lea     esi, average
   			lea     edi, buf
figure:
    		mov     eax, 0
            mov     edx, 0
    		mov     dl, [edi+10]
            add     edx, edx
            add     edx, edx
    		add     eax, edx
            mov     edx, 0
    		mov     dl, [edi+11]
    		
    		add     edx, edx
            add     eax, edx
            mov     edx, 0
    		mov     dl, [edi+12]
    		add     eax, edx
    		xor     edx, edx
    		mov     ebx, 7
    		div     ebx
    		mov     [edi+13], al
            .IF    al >= 90
                   mov  bl, 41h
                   mov  [edi+14], bl
            .ELSEIF al >=80
                   mov  bl, 42h
                   mov  [edi+14], bl
            .ELSEIF al >=70
                   mov  bl, 43h
                   mov  [edi+14], bl
            .ELSEIF al >=60
                   mov  bl, 44h
                   mov  [edi+14], bl
            .ELSE  
                   mov  bl, 45h
                   mov  [edi+14], bl
            .ENDIF
            call    Radix
    		add     edi, 15
    		dec     ecx
    		jnz     figure
            pop     ebx
    		pop     eax
    		pop     edx
    		pop     ecx
    		pop     esi
            pop     edi
    		ret
Averagef 	 endp
Radix     	 proc
             push    ecx
	    	 push    ebx
             push    edx
	    	 mov     ebx, 10
             xor     cx, cx          
radix_loop1:
             xor     edx, edx
             div     ebx
             push    dx              
             inc     cx             
             or      eax, eax
             jnz     radix_loop1   
radix_loop2:                     
             pop     ax
             cmp     al, 10
             jb      radix_l1
             add     al, 7
radix_l1:
             add     al, 30h
	    	 mov     [esi], al
             inc     esi
             loop    radix_loop2   
             pop     edx
	    	 pop     ebx
             pop     ecx
             ret
Radix     endp
             end  Start
