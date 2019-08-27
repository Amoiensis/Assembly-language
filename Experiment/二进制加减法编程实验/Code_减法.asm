;Author:YXP
;CSDN:yxp189
;Email:yxp189@protonmail.com
;如有问题，欢迎和我联系~
;转载请标明出处~

STACKS  SEGMENT   STACK  
              DW        128 DUP(?)  
      STACKS  ENDS
       DATAS  SEGMENT            
        NUM1  DW        2  DUP(0)
        NUM2  DW        1  DUP(0)
         SUM  DW        2  DUP(0)
       DATAS  ENDS
       CODES  SEGMENT  
              ASSUME    CS:CODES,DS:DATAS
      START:  MOV      AX,DATAS
              MOV       DS,AX

              MOV      AX,0000H
              MOV     [NUM1],AX
              MOV     AX,0304H
              MOV   [NUM1+2],AX
              
              MOV       AX,5F01H
              MOV     [NUM2],AX
              
              MOV     AX,[NUM1]
              SBB       AX,[NUM2]
              MOV       [SUM],AX
              
              MOV   AX,[NUM1+2]
              SBB       AX,0
              MOV    [SUM+2],AX
              
              MOV      AX,4C00H  
              INT       21H
       CODES  ENDS
              END       START
