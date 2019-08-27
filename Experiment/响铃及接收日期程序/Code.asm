;Author:YXP
;CSDN:yxp189
;Email:yxp189@protonmail.com
;如有问题，欢迎和我联系~
;转载请标明出处~

DATA  SEGMENT
        PKEY  DB'What is the date(mm/dd/yyyy)',3FH,07H,13,10,'$'
        HINT  DB        13,10,13,10,'The date is $'
      STRING  DB        100 DUP(0)  ;存放日期字符串
        DATA  ENDS


       STACK  SEGMENT
              DW        128  DUP(0)
       STACK  ENDS

        CODE  SEGMENT
              ASSUME    CS:CODE, DS:DATA, SS:STACK
      START:
; set segment registers:
              MOV       AX, DATA
              MOV       DS, AX
              MOV       ES, AX

; add your code here

              LEA       DX, PKEY
              MOV       AH, 9
              INT       21H         ; output string at ds:dx

              MOV       AH, 2       ;响铃
              MOV       DL, 7
              INT       21H         ;用02号功能，输出一个BEL（ASCII码值为07H）字符

              MOV       BX, 0

      INPUT:                        ;输入字符串
              MOV       AH, 1
              INT       21H
              MOV       [STRING + BX], AL
              INC       BX
              CMP       AL, 0DH
              JZ        GETLENGTH   ;字符串输入结束，转入getlength处
              JMP       INPUT

  GETLENGTH:
;dec bx
              MOV       [STRING + BX], '$'

    DISPLAY:
              LEA       DX, HINT
              MOV       AH, 9
              INT       21H

              LEA       DX, STRING
              MOV       AH, 9
              INT       21H         ; output string at ds:dx


      P_END:
              MOV       AX, 4C00H   ; exit to operating system.
              INT       21H
        CODE  ENDS

ENDSTART; set entry point and stop the assembler.

 
