;Author:YXP
;CSDN:yxp189
;Email:yxp189@protonmail.com
;如有问题，欢迎和我联系~
;转载请标明出处~

      IOPORT  EQU       0D100H-0280H
       LS273  EQU       IOPORT+2A8H
        CODE  SEGMENT
              ASSUME    CS:CODE
      START:
              MOV       AH,2        ;回车符
              MOV       DL,0DH
              INT       21H
              MOV       AH,1        ;等待键盘输入
              INT       21H
              CMP       AL,27       ;判断是否为ESC键
              JE        EXIT        ;若是则退出
              MOV       DX,LS273    ;若不是,从2A8H输出其ASCII码
              OUT       DX,AL
              JMP       START       ;转start
       EXIT:  MOV       AH,4CH      ;返回
              INT       21H
        CODE  ENDS
              END       START
