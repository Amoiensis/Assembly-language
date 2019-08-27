;Author:YXP
;CSDN:yxp189
;Email:yxp189@protonmail.com
;如有问题，欢迎和我联系~
;转载请标明出处~

STACKS  SEGMENT   STACK     
              DW        128 DUP(?)  
      STACKS  ENDS
       DATAS  SEGMENT            
      STORE1  DB        'Hello'
      STORE2  DB        'Hello'
       COUNT  EQU       5
          W1  DB        'Please type in the first:' ,0DH,0AH,'$'
          W2  DB        'Next:'  ,0DH,0AH,'$'
     OUTPUT1  DB        'MATCH' ,0DH,0AH,'$'
     OUTPUT2  DB        'NO MATCH'  ,0DH,0AH,'$'
        
       DATAS  ENDS
       CODES  SEGMENT  
              ASSUME    CS:CODES,DS:DATAS,ES:DATAS
      START:  MOV       AX,DATAS  
              MOV       DS,AX

    PRINTW1:  MOV       AH,09H
              MOV       DX,OFFSET W1
              INT       21H
              
              CLD
              MOV       CX,COUNT
              LEA       SI,STORE1
              LEA       DI,STORE2
              
         OP:
              REPE      CMPSB 
              JNZ       PRINTNF
            
     PRINTF:
              MOV       AH,09H
              MOV       DX,OFFSET OUTPUT1
              INT       21H
              JMP       ENDD
    PRINTNF:
              MOV       AH,09H
              MOV       DX,OFFSET OUTPUT2
              INT       21H
              JMP       ENDD
       ENDD:
              MOV       AX,4C00H  
              INT       21H
       CODES  ENDS
              END       START
