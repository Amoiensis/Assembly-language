;Author:YXP
;CSDN:yxp189
;Email:yxp189@protonmail.com
;如有问题，欢迎和我联系~
;转载请标明出处~
 
STACKS  SEGMENT   STACK     
              DW        128 DUP(?)  ;注意这里只有128个字节
      STACKS  ENDS
       DATAS  SEGMENT     
        NUM1  DB        5  DUP(0)
        NUM2  DW        1  DUP(0)
        NUM3  DW        1  DUP(0)
       DATAS  ENDS
       CODES  SEGMENT   
              ASSUME    CS:CODES,DS:DATAS
      START:  MOV       AX,DATAS  
              MOV       DS,AX
              MOV       CX,4
              MOV       BX,1
              MOV       SI,OFFSET NUM1
      READ1:
              MOV       AH,01H
              INT       21H
              MOV       DL,AL
              AND       DL,0FH
              TEST      CX,0001H
              JZ        AD
              
              OR        [BX][SI],DL
              ;INC       SI
              DEC       BX
              LOOP      READ1
              
              JMP       OUTOP
         AD:
              OR        [BX][SI],DL
              SHL       BYTE PTR[BX][SI],4
              LOOP      READ1        
      OUTOP:
              CLC        
              MOV       CX,4
              MOV       SI,OFFSET NUM1
       POUT:  MOV       AH,02H
              MOV       DL,[SI]              
              TEST      CX,0001H
              JZ        YIWEI
              AND       DL,0FH
              OR        DL,30H
              INC       SI
              INT       21H
              LOOP      POUT              
              JMP       ENDD              
      YIWEI:  AND       DL,0FH
              OR        DL,30H
              SHR       BYTE PTR[SI],4
              INT       21H
              LOOP      POUT             
              
       ENDD:
              MOV       AX,4C00H    ;退出程序
              INT       21H
       CODES  ENDS
              END       START
