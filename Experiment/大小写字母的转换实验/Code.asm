;Author:YXP
;CSDN:yxp189
;Email:yxp189@protonmail.com
;如有问题，欢迎和我联系~
;转载请标明出处~

      STACKS  SEGMENT
              DB        128 DUP(?)
      STACKS  ENDS

       DATAS  SEGMENT
          S1  DB        0DH,0AH,'Please input string:','$'
          S2  DB        0DH,0AH,'Result:','$'
      STRING  DB        100 DUP(?),'$'
       DATAS  ENDS

       CODES  SEGMENT
              ASSUME    CS:CODES,DS:DATAS
      START:
              MOV       AX,DATAS
              MOV       DS,AX

              MOV       SI,OFFSET STRING

              MOV       DX,OFFSET S1            ;输出s1
              MOV       AH,9H
              INT       21H

      INPUT:                        ;INPUT输入并显示
              MOV       AH,1H
              INT       21H
              CMP       AL,0DH      ;以回车作为结束标志
              JE        L
              MOV       [SI],AL
              INC       SI
              JMP       INPUT
          L:
              MOV       SI,OFFSET STRING
    COMPARE:
              MOV       AL,[SI]
              CMP       AL,61H      ;与a的ASCII码比较
              JB        SHOW        ;小于a，进位标志CF=0，跳转
              CMP       AL,7AH      ;与z的ASCII码比较
              JA        SHOW        ;大于z，跳转
              SUB       AL,20H      ;将小写转换为大写
              MOV       [SI],AL

       SHOW:
              INC       SI
              LOOP      COMPARE

              MOV       DX,OFFSET S2            ;输出s2
              MOV       AH,9H
              INT       21H

              MOV       DX,OFFSET STRING        ;显示已经转化成功的字符串
              MOV       AH,9H
              INT       21H

              MOV       AH,4CH
              INT       21H
       CODES  ENDS
              END       START
