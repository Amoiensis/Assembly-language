;Author:YXP
;CSDN:yxp189
;Email:yxp189@protonmail.com
;如有问题，欢迎和我联系~
;转载请标明出处~

      IOPORT  EQU       0CC00H-280H
       A8255  EQU       IOPORT+288H ;8255端口,a口  段码
       B8255  EQU       IOPORT+289H ;8255端口,b口 位码
       C8255  EQU       IOPORT+28AH ;8255端口,c口 键盘
       K8255  EQU       IOPORT+28BH ;8255端口,控制口
        DATA  SEGMENT
      TABLE1  DW        0770H,0B70H,0D70H,0E70H,07B0H,0BB0H,0DB0H,0EB0H
              DW        07D0H,0BD0H,0DD0H,0ED0H,07E0H,0BE0H,0DE0H,0EE0H ;键盘扫描码表
         LED  DB        3FH,06H,5BH,4FH,66H,6DH,7DH,07H,7FH,6FH,77H,7CH
              DB        39H,5EH,79H,71H,0FFH    ;LED段码表，0,1,2,3,4,5,6,7,8,9,a,b,c,d,e,f
        CHAR  DB        '0123456789ABCDEF'      ;字符表
      KEY_IN  DB        'G'
       CHAR1  DB        0FFH
         MES  DB        0AH,0DH
              DB        'PLAY ANY KEY IN THE SMALL KEYBOARD! ',0AH,0DH
              DB        'IT WILL BE ON THE SCREEN AND LED ! END WITH F or ANY KEY',0AH,0DH,'$'
        DATA  ENDS
      STACKS  SEGMENT   STACK       ;堆栈空间
              DB        100 DUP (?)

      STACKS  ENDS
        CODE  SEGMENT
              ASSUME    CS:CODE,DS:DATA,SS:STACKS,ES:DATA
      START:
              CLI
              MOV       AX,DATA
              MOV       DS,AX
              MOV       ES,AX
              MOV       AX,STACKS
              MOV       SS,AX
              MOV       DX,OFFSET MES           ;显示提示信息
              MOV       AH,09
              INT       21H
         KY:  CALL      KEY         ;调键盘扫描子程序，得到一个字符
              CALL      DISPLY      ;调显示子程序，显示得到的字符
              MOV       AH,1
              INT       16H
              JNZ       EXIT        ;按任意键退出
              MOV       DL,BYTE PTR KEY_IN
              CMP       DL,'F'
              JNZ       KY
       EXIT:  MOV       AX,4C00H    ;如果是"F"键则退出
              INT       21H         ;退出
         KEY  PROC      NEAR
   KEY_LOOP:  MOV       DX,K8255
              MOV       AL,81H
              OUT       DX,AL
              MOV       DX,C8255
              MOV       AL,0FH
              OUT       DX,AL
              IN        AL,DX       ;读行扫描值
              AND       AL,0FH
              CMP       AL,0FH
              JZ        KEY1        ;未发现有键按下则转
              CALL      DELAY       ;延时
              MOV       AH,AL
              MOV       DX,K8255
              MOV       AL,88H
              OUT       DX,AL
              MOV       DX,C8255
              MOV       AL,AH
              OR        AL,0F0H
              OUT       DX,AL
              IN        AL,DX       ;读列扫描值
              AND       AL,0F0H
              CMP       AL,0F0H
              JZ        KEY1        ;未发现有键按下则转
    
              MOV       SI,OFFSET TABLE1        ;键盘扫描码表首址
              MOV       DI,OFFSET CHAR          ;字符表首址
              MOV       CX,16       ;待查表的表大小
 KEY_TONEXT:
              CMP       AX,[SI]
              JZ        KEY_FINDKEY
              DEC       CX
              JZ        KEY1        ;未找到对应扫描码
              ADD       SI,2
              INC       DI
              JMP       KEY_TONEXT
            KEY_FINDKEY:
              MOV       DL,[DI]
              MOV       AH,02
              INT       21H         ;显示查找到的键盘码
              MOV       BYTE PTR KEY_IN,DL
 KEY_WAITUP:
              MOV       DX,K8255
              MOV       AL,81H
              OUT       DX,AL
              MOV       DX,C8255
              MOV       AL,0FH
              OUT       DX,AL
              IN        AL,DX       ;读行扫描值
              AND       AL,0FH
              CMP       AL,0FH
              JNZ       KEY_WAITUP  ;按键未抬起转
              CALL      DELAY       ;等待
       KEY1:  RET
         KEY  ENDP
       DELAY  PROC      NEAR
              PUSH      AX          ;延时 50ms--100ms
              PUSHF
              MOV       AH,0
              INT       1AH
              MOV       BX,DX
     DELAY1:
              MOV       AH,0
              INT       1AH
              CMP       BX,DX
              JZ        DELAY1
              MOV       BX,DX
     DELAY2:
              MOV       AH,0
              INT       1AH
              CMP       BX,DX
              JZ        DELAY2
              POPF
              POP       AX
              RET
       DELAY  ENDP
      DISPLY  PROC      NEAR
              PUSH      AX
              MOV       BX,OFFSET LED
              MOV       AL,BYTE PTR KEY_IN
              SUB       AL,30H
              CMP       AL,09H
              JNG       DIS2
              SUB       AL,07H
       DIS2:  XLAT
              MOV       DX,A8255
              OUT       DX,AL       ;输出显示数据，段码
              MOV       AL,0FFH
              MOV       DX,B8255
              MOV       CX,0006     ;段码显示,6位
    DISPLY1:
              OUT       DX,AL       ;输出显示数据，位码，打开显示
              PUSH      CX
              MOV       CX,0A000H   ;显示时间延迟
           DISPLY_DELAY:
              LOOP      DISPLY_DELAY
              POP       CX
              LOOP      DISPLY1
              POP       AX
              RET
      DISPLY  ENDP
        CODE  ENDS
              END       START
