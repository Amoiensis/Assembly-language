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
         SUM  DW        2  DUP(0)
       DATAS  ENDS
       CODES  SEGMENT           
              ASSUME    CS:CODES,DS:DATAS
      START:  MOV       AX,DATAS   
              MOV       DS,AX
              MOV       NUM1,0901H
              
              MOV       DX,0108H
              MOV       AX,0105H

              
              MOV       CX,NUM1
              IDIV      CX
              
              MOV       [SUM],AX
              MOV       [SUM+2],DX
              MOV       AX,4C00H   
              INT       21H
       CODES  ENDS
              END       START
