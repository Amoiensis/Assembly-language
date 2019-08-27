;Author:YXP
;CSDN:yxp189
;Email:yxp189@protonmail.com
;如有问题，欢迎和我联系~
;转载请标明出处~

STACKS  SEGMENT
DW        128  DUP(0)
      STACKS  ENDS

       DATAS  SEGMENT
        PKEY  DB        13,10,"INPUT ANY KEY TO CLEAR THE SCREEN.$"
       DATAS  ENDS

       CODES  SEGMENT
START:
        MOV       AX, DATAS
        MOV       DS, AX

        LEA       DX, PKEY
        MOV       AH, 9
        INT       21H         ; output string at ds:dx

        MOV       AH, 01H
        INT       21H

; clear the screen   
        MOV       AX,0007H    ;
        INT       10H

; set cursor     
        MOV       AH, 2H
        MOV       BH, 0
        MOV       DH, 05H
        MOV       DL, 06H
        INT       10H

        MOV       AH, 01H
        INT       21H

; set cursor
        MOV       AH, 2H
        MOV       BH, 0
        MOV       DH, 08H
        MOV       DL, 09H
        INT       10H

        MOV       AH, 01H
        INT       21H

        MOV       AH, 4CH   ; exit to operating system.
        INT       21H

       CODES  ENDS
END START
