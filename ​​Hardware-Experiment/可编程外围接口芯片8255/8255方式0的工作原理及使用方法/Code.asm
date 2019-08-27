;Author:YXP
;CSDN:yxp189
;Email:yxp189@protonmail.com
;如有问题，欢迎和我联系~
;转载请标明出处~

      IOPORT  EQU       0D100H-0280H
     IO8255A  EQU       IOPORT+288H
     IO8255B  EQU       IOPORT+28BH
     IO8255C  EQU       IOPORT+28AH
        CODE  SEGMENT
              ASSUME    CS:CODE
      START:  MOV       DX,IO8255B  ;设8255为C口输入,A口输出
              MOV       AL,8BH
              OUT       DX,AL
      INOUT:  MOV       DX,IO8255C  ;从C口输入一数据
              IN        AL,DX
              MOV       DX,IO8255A  ;从A口输出刚才自C口
              OUT       DX,AL       ;所输入的数据
              MOV       DL,0FFH     ;判断是否有按键
              MOV       AH,06H
              INT       21H
              JZ        INOUT       ;若无,则继续自C口输入,A口输出
              MOV       AH,4CH      ;否则返回DOS
              INT       21H
        CODE  ENDS
              END       START
