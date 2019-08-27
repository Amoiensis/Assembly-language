;Author:YXP
;CSDN:yxp189
;Email:yxp189@protonmail.com
;如有问题，欢迎和我联系~
;转载请标明出处~

         NUM  DB        50 DUP(0)
           N  DB        0
          S1  DB        0DH,0AH,'PLEASE ENTER THE NUMBER:','$'
          S2  DB        0AH,'N!=','$'
        BUFF  DB        50,0,50 DUP('$')
       DATAS  ENDS

       CODES  SEGMENT
              ASSUME    CS:CODES,DS:DATAS
      START:
              MOV       AX,DATAS
              MOV       DS,AX、

              MOV       DX,OFFSET S1
              MOV       AH,09H
              INT       21H

              CALL      INPUT       ;输入后转换成数字
              MOV       N,AL        ;N!

              MOV       DX,OFFSET S2
              MOV       AH,09H
              INT       21H

              LEA       SI,NUM
              MOV       AX,1
              MOV       [SI],AX
              XOR       AX,AX
              XOR       BX,BX
              XOR       DX,DX
       NEXT:
              MOV       CX,40
              LEA       SI,NUM
          G:
              MOV       AL,[SI]     ;循环做N次乘法
              MOV       BL,N
              MUL       BL
              ADD       AL,DL
              MOV       BL,0AH
              DIV       BL
              MOV       [SI],AH
              MOV       DL,AL
              INC       SI
              LOOP      G
              DEC       N
              CMP       N,1
              JA        NEXT

              MOV       SI,40
          K:  MOV       AL,NUM[SI]
              CMP       AL,0
              JA        E
              DEC       SI
              JMP       K
          E:  MOV       DL,NUM[SI]
              ADD       DL,30H
              MOV       AH,02H
              INT       21H
              DEC       SI
              CMP       SI,-1
              JG        E

              MOV       AH,4CH
              INT       21H

       INPUT  PROC      NEAR
              MOV       DX,OFFSET BUFF
              MOV       AH,0AH
              INT       21H

              MOV       SI,OFFSET BUFF+2
              MOV       CL,BUFF+1
              XOR       DX,DX
              XOR       AX,AX

         L1:  MOV       BL,0AH
              MUL       BL
              MOV       DL,[SI]
              SUB       DL,30H
              ADD       AL,DL
              INC       SI
              LOOP      L1
              RET
       INPUT  ENDP

       CODES  ENDS
              END       START
