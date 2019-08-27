;Author:YXP
;CSDN:yxp189
;Email:yxp189@protonmail.com
;如有问题，欢迎和我联系~
;转载请标明出处~

STACKS  SEGMENT   STACK  
              DW        128 DUP(?)
      STACKS  ENDS
       DATAS  SEGMENT        
        NUM1  DB        5  DUP(0)
        NUM2  DB        4 DUP(0)
         SUM  DB        5  DUP(0)
       DATAS  ENDS
       CODES  SEGMENT       
              ASSUME    CS:CODES,DS:DATAS
      START:  MOV       AX,DATAS   
              MOV       DS,AX             
              MOV       CX,5
          MOV       SI,OFFSET NUM1
              MOV       BX,4
      READ1:  MOV       AH,01H
              INT       21H
              MOV       [BX][SI],AL
              DEC       BX
              LOOP      READ1
              
       OUTM:  MOV       AH,02H
              MOV       DL,2DH
              INT       21H
              
              MOV       CX,4
              MOV       BX,3
              MOV       SI,OFFSET NUM2
      READ2:  MOV       AH,01H
              INT       21H
              MOV       [BX][SI],AL
              DEC       BX
              LOOP      READ2
      
       OUTE:  MOV       AH,02H
              MOV       DL,3DH
              INT       21H
                            
              CLC
              MOV       DI,OFFSET SUM
              MOV       BX,0000H
              MOV       CX,4
         OP:
              MOV       AH,00H
              MOV       SI,OFFSET NUM1
              MOV       AL,[BX][SI]
              MOV       SI,OFFSET NUM2
              MOV       DL,[BX][SI]
              
              SBB       AL,DL
              AAS
              
              MOV       [BX][DI],AL
              INC       BX
              LOOP      OP
              
              MOV       AL,00H
              MOV       SI,OFFSET NUM1
              MOV       DL,[BX][SI]
              SBB       DL,AL
              AAS
              MOV       AL,DL
              MOV       SI,OFFSET SUM
              MOV       [BX][DI],AL
              
              
              MOV       CX,5
              MOV       SI,OFFSET SUM
              MOV       BX,4
       OUT2:  MOV       AH,02H
              MOV       DL,[BX][SI]
              OR        DL,30H
              INT        21H
              DEC       BX
              LOOP      OUT2
                            
              MOV       AX,4C00H   
              INT       21H
       CODES  ENDS
              END       START
