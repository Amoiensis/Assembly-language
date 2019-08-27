首页
博客
学院
下载
论坛
APP
问答
商城
活动
VIP会员

专题
招聘
ITeye
GitChat
图文课
疯狂Python精讲
写博客 消息

客服

Markdown编辑器
富文本编辑器
查看主页
内容
文章管理
评论管理
分类专栏
博客搬家
收益中心
数据
百度热搜词条
自定义百度统计
设置
博客设置
自定义域名
博客模块管理
 
QQ客服

 
【微机原理 实验】 ASCII码表示的十进制数、二进制数和BCD的互换编程实验（含汇编代码）
 46/100

文章标签：
汇编语言
微机原理
实验
添加标签
最多添加5个标签

分类专栏：
汇编语言
微机原理
汇编语言-微机原理与接口技术-实验
最多添加3个标签

资源信息：
请填写资源链接
 上传资源
文章类型：
 *
 申请原创将启用（Creative Commons ）版权模板，如果不是原创文章，请选择转载或翻译
发布形式：
  

;Author:YXP
;CSDN:yxp189
;Email:yxp189@protonmail.com
;如有问题，欢迎和我联系~
;转载请标明出处~

 STACKS  SEGMENT   STACK   
              DW        128 DUP(?)
      STACKS  ENDS
       DATAS  SEGMENT         
        NUM1  DW        5  DUP(0)
        NUM2  DW        1  DUP(0)
        NUM3  DW        1  DUP(0)
       DATAS  ENDS
       CODES  SEGMENT   
              ASSUME    CS:CODES,DS:DATAS
      START:  MOV       AX,DATAS 
              MOV       DS,AX 
              MOV       NUM3,10
              MOV       CX,5
              MOV       SI,OFFSET NUM1
      READ1:
              MOV       AH,01H
              INT       21H
              MOV       DL,AL
              AND       DL,0FH
              AND       DH,00H
              MOV       [SI],DX
              INC       SI
              INC       SI
              LOOP      READ1
              
              CLC
              MOV       CX,5
              MOV       SI,OFFSET NUM1
         OP:
              MOV       AX,NUM2
              MUL       NUM3
              MOV       BX,AX
              MOV       AX,[SI]
              ADC       AX,BX
              MOV       NUM2,AX
              INC       SI
              INC       SI
              LOOP      OP

              MOV       AX,NUM2
              DIV       NUM3
              MOV       NUM2,AX
              
              MOV       AX,4C00H 
              INT       21H
       CODES  ENDS
              END       START

 
