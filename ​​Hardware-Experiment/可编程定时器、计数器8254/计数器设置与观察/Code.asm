;Author:YXP
;CSDN:yxp189
;Email:yxp189@protonmail.com
;如有问题，欢迎和我联系~
;转载请标明出处~

              ASSUME    CS:CODE
        CODE  SEGMENT
        KZDK  EQU       283H        ;控制寄存器地址
              JSQDK0    EQU 280H    ;计数器通道0地址
              JSQDK1    EQU 281H    ;计数器通道1地址
 
      START:
              MOV       DX, KZDK    ;8254控制端口
              MOV       AL, 00110100B           ;控制字
              OUT       DX, AL      ;给8254控制端口写入控制字
 
              MOV       DX, JSQDK0  ;计数器0地址
              MOV       AX, 1000    ;频率
              OUT       DX, AL
              MOV       AL, AH
              OUT       DX, AL      ;分两次输出频率到计数器0端口
 
              MOV       DX, KZDK    ;8254的控制端口
              MOV       AL, 01110110B           ;控制字
              OUT       DX, AL      ;给8254的控制端口写入控制字
 
              MOV       DX, JSQDK1  ;计数器通道1地址
              MOV       AX, 1000
              OUT       DX, AL
              MOV       AL, AH
              OUT       DX, AL      ;输出频率到计数器1端口
 
              ENDS      CODE
              END       START
