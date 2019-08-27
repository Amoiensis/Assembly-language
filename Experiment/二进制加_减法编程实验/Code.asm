;author:YXP
;CSDN:yxp189
;e-mail:yxp189@protonmail.com
;如有问题，欢迎和我联系~
;转载请标明出处~

STACKS  SEGMENT   STACK    
              DW        128 DUP(?)  
      STACKS  ENDS
       DATAS  SEGMENT              
        NUM1  DW        2  DUP(0)
        NUM2  DW        2  DUP(0)
         SUM  DW        3  DUP(0)
       DATAS  ENDS
       CODES  SEGMENT              
              ASSUME    CS:CODES,DS:DATAS
      START:  MOV       AX,DATAS    
              MOV       DS,AX

              MOV       AX,0201H
              MOV       [NUM1],AX
              MOV       AX,0304H
              MOV       [NUM1+2],AX
              
              MOV       AX,0FF01H
              MOV       [NUM2],AX
              MOV       AX,0FFFFH
              MOV       [NUM2+2],AX
              
              MOV       AX,[NUM1]
              ADC       AX,[NUM2]
              MOV       [SUM],AX
              
              MOV       AX,[NUM1+2]
              ADC       AX,[NUM2+2]
              MOV       [SUM+2],AX

              MOV       AX,0
              ADC       AX,0
              MOV       [SUM+4],AX
              
              MOV       AX,4C00H    
              INT       21H
       CODES  ENDS
              END       START
