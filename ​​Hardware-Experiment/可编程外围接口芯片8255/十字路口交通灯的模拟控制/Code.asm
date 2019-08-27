;Author:YXP
;CSDN:yxp189
;Email:yxp189@protonmail.com
;如有问题，欢迎和我联系~
;转载请标明出处~


        DATA  SEGMENT
      IOPORT  EQU       0D100H-0280H
     IO8255A  EQU       IOPORT+28AH
     IO8255B  EQU       IOPORT+28BH
      PORTC1  DB        24H,44H,04H,44H,04H,44H,04H         ;六个灯可能
              DB        81H,82H,80H,82H,80H,82H,80H         ;的状态数据
              DB        0FFH        ;结束标志
        DATA  ENDS
        CODE  SEGMENT
              ASSUME    CS:CODE,DS:DATA
      START:
              MOV       AX,DATA
              MOV       DS,AX
              MOV       DX,IO8255B
              MOV       AL,90H
              OUT       DX,AL       ;设置8255为C口输出
              MOV       DX,IO8255A
      RE_ON:  MOV       BX,0
         ON:  MOV       AL,PORTC1[BX]
              CMP       AL,0FFH
              JZ        RE_ON
              OUT       DX,AL       ;点亮相应的灯
              INC       BX
              MOV       CX,20       ;参数赋初值
              TEST      AL,21H      ;是否有绿灯亮
              JZ        DE1         ;没有,短延时
              MOV       CX,2000     ;有,长延时
        DE1:  MOV       DI,9000     ;di赋初值5000
        DE0:  DEC       DI          ;减1计数
              JNZ       DE0         ;di不为0
              LOOP      DE1
              PUSH      DX
              MOV       AH,06H
              MOV       DL,0FFH
              INT       21H
              POP       DX
              JZ        ON          ;没有,转到on
       EXIT:  MOV       AH,4CH      ;返回
              INT       21H
        CODE  ENDS
              END       START
