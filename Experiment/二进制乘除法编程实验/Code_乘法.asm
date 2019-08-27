;Author:YXP
;CSDN:yxp189
;Email:yxp189@protonmail.com
;如有问题，欢迎和我联系~
;转载请标明出处~

STACKS  SEGMENT   STACK  
              DW        128 DUP(?)  
      STACKS  ENDS
       DATAS  SEGMENT   
        NUM1  DW        1  DUP(0)
        NUM2  DW        2  DUP(0)
         SUM  DW        2  DUP(0)
       DATAS  ENDS
       CODES  SEGMENT 
              ASSUME    CS:CODES,DS:DATAS
      START:  MOV       AX,DATAS  
              MOV       DS,AX
              MOV       NUM1,1050H
              MOV       NUM2,2030H
              MOV       AX,NUM1
              MOV       CX,NUM2
              MUL       CX
             MOV       SI,OFFSET SUM
              MOV       [SI],AX
              MOV       [SI+2],DX
              
              MOV       CX,6
              MOV       SI,OFFSET SUM
              MOV       BX,5
       OUT2:  MOV       AH,02H
              MOV       DL,[BX][SI]
              OR        DL,30H
              INT       21H
              DEC       BX
              LOOP      OUT2
              
              MOV       AX,4C00H  
              INT       21H
       CODES  ENDS
              END       START
