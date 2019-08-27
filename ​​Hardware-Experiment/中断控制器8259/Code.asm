;Author:YXP
;CSDN:yxp189
;Email:yxp189@protonmail.com
;如有问题，欢迎和我联系~
;转载请标明出处~

      IOPORT  EQU       0D100H-0280H
     I8259_1  EQU       IOPORT+2B0H ;8259的ICW1端口地址
     I8259_2  EQU       IOPORT+2B1H ;8259的ICW2端口地址
     I8259_3  EQU       IOPORT+2B1H ;8259的ICW3端口地址
     I8259_4  EQU       IOPORT+2B1H ;8259的ICW4端口地址
     O8259_1  EQU       IOPORT+2B1H ;8259的OCW1端口地址
     O8259_2  EQU       IOPORT+2B0H ;8259的OCW2端口地址
     O8259_3  EQU       IOPORT+2B0H ;8259的OCW3端口地址

        DATA  SEGMENT
 
        MES1  DB        'you can play a key on the keyboard!',0DH,0AH,24H
        MES2  DD        MES1
       MESS1  DB        'Hello! This is interrupt    *  0  *!',0DH,0AH,'$'
       MESS2  DB        'Hello! This is interrupt    *  1  *!',0DH,0AH,'$'
       MESS3  DB        'Hello! This is interrupt    *  2  *!',0DH,0AH,'$'
       MESS4  DB        'Hello! This is interrupt    *  3  *!',0DH,0AH,'$'
       MESS5  DB        'Hello! This is interrupt    *  4  *!',0DH,0AH,'$'
       MESS6  DB        'Hello! This is interrupt    *  5  *!',0DH,0AH,'$'
       MESS7  DB        'Hello! This is interrupt    *  6  *!',0DH,0AH,'$'
       MESS8  DB        'Hello! This is interrupt    *  7  *!',0DH,0AH,'$'
        DATA  ENDS

      STACKS  SEGMENT
              DB        100 DUP(?)
      STACKS  ENDS
      STACK1  SEGMENT   STACK
              DW        256 DUP(?)
      STACK1  ENDS

        CODE  SEGMENT
              ASSUME    CS:CODE,DS:DATA,SS:STACKS,ES:DATA
.386
      START:  MOV       AX,DATA
              MOV       DS,AX
              MOV       ES,AX
              MOV       AX,STACKS
              MOV       SS,AX
  

              MOV       DX,I8259_1  ;初始化8259的ICW1
              MOV       AL,13H      ;边沿触发、单片8259、需要ICW4
              OUT       DX,AL

              MOV       DX,I8259_2  ;初始化8259的ICW4
              MOV       AL,0B0H     ;非自动结束EOI
              OUT       DX,AL
       ;MOV  AL,00H
       ;OUT  DX,AL
              MOV       AL,03H
              OUT       DX,AL

              MOV       DX,O8259_1  ;初始化8259的OCW1
              MOV       AL,00H      ;打开IR0和IR1的屏蔽位
              OUT       DX,AL
              LEA       DX,MES1
              MOV       AH,09
              INT       21H

      QUERY:
              MOV       AH,1        ;判断是否有按键按下
              INT       16H
              JNZ       QUIT        ;有按键则退出

              MOV       DX,O8259_3  ;向8259的OCW3发送查询命令
              MOV       AL,0CH
              OUT       DX,AL


              IN        AL,DX       ;读出查询字
              MOV       AH,AL
              AND       AL,80H
              TEST      AL,80H      ;判断中断是否已响应
              JZ        QUERY       ;没有响应则继续查询
              MOV       AL,AH
              AND       AL,07H
              CMP       AL,00H
              JE        IR0ISR      ;若为IR0请求，跳到IR0处理程序
              CMP       AL,01H
              JE        IR1ISR      ;若为IR1请求，跳到IR1处理程序
              CMP       AL,02H
              JE        IR2ISR
              CMP       AL,03H
              JE        IR3ISR
              CMP       AL,04H
              JE        IR4ISR
              CMP       AL,05H
              JE        IR5ISR
              CMP       AL,06H
              JE        IR6ISR
              CMP       AL,07H
              JE        IR7ISR
              JMP       QUERY

     IR0ISR:  MOV       AX,DATA
              MOV       DS,AX
              MOV       DX,OFFSET MESS1         ;显示提示信息
              MOV       AH,09
              INT       21H
              JMP       EOI

     IR1ISR:  MOV       AX,DATA
              MOV       DS,AX
              MOV       DX,OFFSET MESS2         ;显示提示信息
              MOV       AH,09
              INT       21H
              JMP       EOI

     IR2ISR:  MOV       AX,DATA
              MOV       DS,AX
              MOV       DX,OFFSET MESS3         ;显示提示信息
              MOV       AH,09
              INT       21H
              JMP       EOI
     IR3ISR:  MOV       AX,DATA
              MOV       DS,AX
              MOV       DX,OFFSET MESS4         ;显示提示信息
              MOV       AH,09
              INT       21H
              JMP       EOI
     IR4ISR:  MOV       AX,DATA
              MOV       DS,AX
              MOV       DX,OFFSET MESS5         ;显示提示信息
              MOV       AH,09
              INT       21H
              JMP       EOI
     IR5ISR:  MOV       AX,DATA
              MOV       DS,AX
              MOV       DX,OFFSET MESS6         ;显示提示信息
              MOV       AH,09
              INT       21H
              JMP       EOI
     IR6ISR:  MOV       AX,DATA
              MOV       DS,AX
              MOV       DX,OFFSET MESS7         ;显示提示信息
              MOV       AH,09
              INT       21H
              JMP       EOI
     IR7ISR:  MOV       AX,DATA
              MOV       DS,AX
              MOV       DX,OFFSET MESS8         ;显示提示信息
              MOV       AH,09
              INT       21H

        EOI:
              MOV       DX,O8259_2  ;向8259发送中断结束命令
              MOV       AL,20H
              OUT       DX,AL
              JMP       QUERY
       
       QUIT:  MOV       AX,4C00H    ;结束程序退出
              INT       21H


        CODE  ENDS
              END       START
