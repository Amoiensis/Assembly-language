;Author:YXP
;CSDN:yxp189
;Email:yxp189@protonmail.com
;如有问题，欢迎和我联系~
;转载请标明出处~

        DATA  SEGMENT
      IOPORT  EQU       0D100H-280H
     IO8255A  EQU       IOPORT+28AH
     IO8255B  EQU       IOPORT+28BH
     IO8255C  EQU       IOPORT+288H
         LED  DB        3FH,06H,5BH,4FH,66H,6DH,7DH,07H,7FH,6FH
     BUFFER1  DB        0,0
          BZ  DW
        DATA  ENDS
        CODE  SEGMENT
              ASSUME    CS:CODE,DS:DATA
      START:  MOV       AX,DATA
              MOV       DS,AX
              MOV       DX,IO8255B  ;
              MOV       AL,80H
              OUT       DX,AL
              MOV       DI,OFFSET BUFFER1
;loop1:    mov cx,0300h         
      LOOP1:  MOV       CX,0FFFH

      LOOP2:  MOV       BH,02
        LLL:  MOV       BYTE PTR BZ,BH
              PUSH      DI
              DEC       DI
              ADD       DI, BZ
              MOV       BL,[DI]  
              POP       DI
              MOV       BH,0
              MOV       SI,OFFSET LED
              ADD       SI,BX
              MOV       AL,BYTE PTR [SI]
              MOV       DX,IO8255C
              OUT       DX,AL
              MOV       AL,BYTE PTR BZ
              MOV       DX,IO8255A
              OUT       DX,AL
              PUSH      CX
              MOV       CX,10000
      DELAY:  LOOP      DELAY       
              POP       CX

              MOV       AL,00H
              OUT       DX,AL
    
              MOV       BH,BYTE PTR BZ
              SHR       BH,1
              JNZ       LLL
              LOOP      LOOP2
              MOV       AX,WORD PTR [DI]
              CMP       AH,09
              JNZ       SET
              CMP       AL,09
              JNZ       SET
              MOV       AX,0000
              MOV       [DI],AL
              MOV       [DI+1],AH
              JMP       LOOP1
        SET:  MOV       AH,01
              INT       16H
              JNE       EXIT        
              MOV       AX,WORD PTR [DI]
              INC       AL
              AAA
              MOV       [DI],AL
              MOV       [DI+1],AH
              JMP       LOOP1
       EXIT:  MOV       DX,IO8255A
              MOV       AL,0
              OUT       DX,AL
              MOV       AH,4CH    
              INT       21H
        CODE  ENDS
              END       START
