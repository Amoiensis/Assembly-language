;Author:YXP
;CSDN:yxp189
;Email:yxp189@protonmail.com
;如有问题，欢迎和我联系~
;转载请标明出处~

      IOPORT  EQU       0D100H-0280H
     IO8253A  EQU       IOPORT+283H
     IO8253B  EQU       IOPORT+280H
        CODE  SEGMENT
              ASSUME    CS:CODE
      START:  MOV       AL,14H      ;设置8253通道0为工作方式2,二进制计数
              MOV       DX,IO8253A
              OUT       DX,AL
              MOV       DX,IO8253B  ;送计数初值为0FH
              MOV       AL,0FH
              OUT       DX,AL
        LLL:  IN        AL,DX       ;读计数初值
              CALL      DISP        ;调显示子程序
              PUSH      DX
              MOV       AH,06H
              MOV       DL,0FFH
              INT       21H
              POP       DX
              JZ        LLL
              MOV       AH,4CH      ;退出
              INT       21H
        DISP  PROC      NEAR        ;显示子程序
              PUSH      DX
              AND       AL,0FH      ;首先取低四位
              MOV       DL,AL
              CMP       DL,9        ;判断是否<=9
              JLE       NUM         ;若是则为'0'-'9',ASCII码加30H
              ADD       DL,7        ;否则为'A'-'F',ASCII码加37H
        NUM:  ADD       DL,30H
              MOV       AH,02H      ;显示
              INT       21H
              MOV       DL,0DH      ;加回车符
              INT       21H
              POP       DX
              RET                   ;子程序返回
        DISP  ENDP
        CODE  ENDS
              END       START
