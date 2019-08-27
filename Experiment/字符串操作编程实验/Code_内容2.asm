;Author:YXP
;CSDN:yxp189
;Email:yxp189@protonmail.com
;如有问题，欢迎和我联系~
;转载请标明出处~

STACKS  SEGMENT   STACK     
              DW        128 DUP(?)
      STACKS  ENDS
       DATAS  SEGMENT    
   STORE  DB        'Helllo',0DH,0AH,'$'
         SCH  DB        1 DUP(0)
       COUNT  EQU       6
         NUM  DB        1 DUP(0)
          W1  DB        ' Times=:' ,0DH,0AH,'$'
        
       DATAS  ENDS
       CODES  SEGMENT          
              ASSUME    CS:CODES,DS:DATAS,ES:DATAS
      START:  MOV       AX,DATAS 
              MOV       DS,AX 
    PRINTW1:  MOV       AH,09H
              MOV       DX,OFFSET STORE
              INT       21H
    
       READ:  MOV       AH,01H
              INT       21H
              MOV       SCH,AL

              MOV       CX,COUNT
              LEA       SI,STORE
              CLD
         OP:
              LODSB
              CMP       AL,SCH
              JNZ       NONO
              INC       NUM
       NONO:  LOOP      OP
              
      PRINT:  MOV       AH,09H
              MOV       DX,OFFSET W1
              INT       21H
              
              MOV       AH,02H
              MOV       DL, NUM
              OR        DL,30H
              INT       21H       ENDD:
              MOV       AX,4C00H   
              INT       21H
       CODES  ENDS
              END       START
