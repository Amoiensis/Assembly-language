汇编语言 - 微机原理与接口技术
=======================================
Assembly language

Microcomputer principles interfacing technique

---------------------------------------

Author:YXP

Email:yxp189@protonmail.com

Data:2019.08.27

---------------------------------------

CONTENT
---------------------------------------
   （软件）
   
   1. 二进制加、减法编程[实验](https://github.com/Amoiensis/Assembly-language/tree/master/Experiment/%E4%BA%8C%E8%BF%9B%E5%88%B6%E5%8A%A0%E5%87%8F%E6%B3%95%E7%BC%96%E7%A8%8B%E5%AE%9E%E9%AA%8C)
   
   2. 十进制数的BCD加、减法编程[实验](https://github.com/Amoiensis/Assembly-language/tree/master/Experiment/%E5%8D%81%E8%BF%9B%E5%88%B6%E6%95%B0%E7%9A%84BCD%E5%8A%A0%E5%87%8F%E6%B3%95%E7%BC%96%E7%A8%8B%E5%AE%9E%E9%AA%8C)
   
   3. 二进制乘、除法编程[实验](https://github.com/Amoiensis/Assembly-language/tree/master/Experiment/%E4%BA%8C%E8%BF%9B%E5%88%B6%E4%B9%98%E9%99%A4%E6%B3%95%E7%BC%96%E7%A8%8B%E5%AE%9E%E9%AA%8C)
   
   4. ASCII码表示的十进制数、二进制数和BCD的互换编程[实验](https://github.com/Amoiensis/Assembly-language/tree/master/Experiment/ASCII%E7%A0%81%E8%A1%A8%E7%A4%BA%E7%9A%84%E5%8D%81%E8%BF%9B%E5%88%B6%E6%95%B0%E3%80%81%E4%BA%8C%E8%BF%9B%E5%88%B6%E6%95%B0%E5%92%8CBCD%E7%9A%84%E4%BA%92%E6%8D%A2%E7%BC%96%E7%A8%8B%E5%AE%9E%E9%AA%8C)
   
   5. 字符串操作编程[实验](https://github.com/Amoiensis/Assembly-language/tree/master/Experiment/%E5%AD%97%E7%AC%A6%E4%B8%B2%E6%93%8D%E4%BD%9C%E7%BC%96%E7%A8%8B%E5%AE%9E%E9%AA%8C)
   
   6. 排序[实验](https://github.com/Amoiensis/Assembly-language/tree/master/Experiment/%E6%8E%92%E5%BA%8F%E5%AE%9E%E9%AA%8C)（冒泡排序）
   
   7. 大小写字母的转换[实验](https://github.com/Amoiensis/Assembly-language/tree/master/Experiment/%E5%A4%A7%E5%B0%8F%E5%86%99%E5%AD%97%E6%AF%8D%E7%9A%84%E8%BD%AC%E6%8D%A2%E5%AE%9E%E9%AA%8C)
   
   8. 清屏和设置光标的[实验](https://github.com/Amoiensis/Assembly-language/tree/master/Experiment/%E6%B8%85%E5%B1%8F%E5%92%8C%E8%AE%BE%E7%BD%AE%E5%85%89%E6%A0%87%E7%9A%84%E5%AE%9E%E9%AA%8C)
   
   9. 响铃及接收日期[程序](https://github.com/Amoiensis/Assembly-language/tree/master/Experiment/%E5%93%8D%E9%93%83%E5%8F%8A%E6%8E%A5%E6%94%B6%E6%97%A5%E6%9C%9F%E7%A8%8B%E5%BA%8F)
   
   10. 计算N!的[实验](https://github.com/Amoiensis/Assembly-language/tree/master/Experiment/%E8%AE%A1%E7%AE%97N!%E7%9A%84%E5%AE%9E%E9%AA%8C)

   （硬件）
   
   11. I/O地址译码

	· I/O 触发器、译码器使用[实验](https://github.com/Amoiensis/Assembly-language/tree/master/%E2%80%8B%E2%80%8BHardware-Experiment/IO%E5%9C%B0%E5%9D%80%E8%AF%91%E7%A0%81)
   
   12. 简单并行输入接口

	· 键盘输入二极管ASCALL码输出[实验](https://github.com/Amoiensis/Assembly-language/tree/master/%E2%80%8B%E2%80%8BHardware-Experiment/%E7%AE%80%E5%8D%95%E5%B9%B6%E8%A1%8C%E8%BE%93%E5%85%A5%E6%8E%A5%E5%8F%A3/%E9%94%AE%E7%9B%98%E8%BE%93%E5%85%A5%E4%BA%8C%E6%9E%81%E7%AE%A1ASCALL%E7%A0%81%E8%BE%93%E5%87%BA)

	· 屏显输出开关预置ASCALL码[实验](https://github.com/Amoiensis/Assembly-language/tree/master/%E2%80%8B%E2%80%8BHardware-Experiment/%E7%AE%80%E5%8D%95%E5%B9%B6%E8%A1%8C%E8%BE%93%E5%85%A5%E6%8E%A5%E5%8F%A3/%E5%B1%8F%E6%98%BE%E8%BE%93%E5%87%BA%E5%BC%80%E5%85%B3%E9%A2%84%E7%BD%AEASCALL%E7%A0%81)
   
   13. 中断控制器8259

	· 查询和中断实现指示灯控制与PC显示[实验](https://github.com/Amoiensis/Assembly-language/tree/master/%E2%80%8B%E2%80%8BHardware-Experiment/%E4%B8%AD%E6%96%AD%E6%8E%A7%E5%88%B6%E5%99%A88259)

   14. 可编程定时器/计数器8254

	· 单脉冲计数与观察[实验](https://github.com/Amoiensis/Assembly-language/tree/master/%E2%80%8B%E2%80%8BHardware-Experiment/%E5%8F%AF%E7%BC%96%E7%A8%8B%E5%AE%9A%E6%97%B6%E5%99%A8%E3%80%81%E8%AE%A1%E6%95%B0%E5%99%A88254/%E5%8D%95%E8%84%89%E5%86%B2%E8%AE%A1%E6%95%B0%E4%B8%8E%E8%A7%82%E5%AF%9F)

	· 计数器设置与观察[实验](https://github.com/Amoiensis/Assembly-language/tree/master/%E2%80%8B%E2%80%8BHardware-Experiment/%E5%8F%AF%E7%BC%96%E7%A8%8B%E5%AE%9A%E6%97%B6%E5%99%A8%E3%80%81%E8%AE%A1%E6%95%B0%E5%99%A88254/%E8%AE%A1%E6%95%B0%E5%99%A8%E8%AE%BE%E7%BD%AE%E4%B8%8E%E8%A7%82%E5%AF%9F)

   15. 可编程外围接口芯片8255
	
	· 8255方式0的工作原理及使用方法[实验](https://github.com/Amoiensis/Assembly-language/tree/master/%E2%80%8B%E2%80%8BHardware-Experiment/%E5%8F%AF%E7%BC%96%E7%A8%8B%E5%A4%96%E5%9B%B4%E6%8E%A5%E5%8F%A3%E8%8A%AF%E7%89%878255/8255%E6%96%B9%E5%BC%8F0%E7%9A%84%E5%B7%A5%E4%BD%9C%E5%8E%9F%E7%90%86%E5%8F%8A%E4%BD%BF%E7%94%A8%E6%96%B9%E6%B3%95)

	· 十字路口交通灯的模拟控制[实验](https://github.com/Amoiensis/Assembly-language/tree/master/%E2%80%8B%E2%80%8BHardware-Experiment/%E5%8F%AF%E7%BC%96%E7%A8%8B%E5%A4%96%E5%9B%B4%E6%8E%A5%E5%8F%A3%E8%8A%AF%E7%89%878255/%E5%8D%81%E5%AD%97%E8%B7%AF%E5%8F%A3%E4%BA%A4%E9%80%9A%E7%81%AF%E7%9A%84%E6%A8%A1%E6%8B%9F%E6%8E%A7%E5%88%B6)

	· 数码管上循环显示“0000-0099”[实验](https://github.com/Amoiensis/Assembly-language/tree/master/%E2%80%8B%E2%80%8BHardware-Experiment/%E5%8F%AF%E7%BC%96%E7%A8%8B%E5%A4%96%E5%9B%B4%E6%8E%A5%E5%8F%A3%E8%8A%AF%E7%89%878255/%E6%95%B0%E7%A0%81%E7%AE%A1%E4%B8%8A%E5%BE%AA%E7%8E%AF%E6%98%BE%E7%A4%BA%E2%80%9C0000-0099%E2%80%9D)

	· 键盘输入微机屏显输出[实验](https://github.com/Amoiensis/Assembly-language/tree/master/%E2%80%8B%E2%80%8BHardware-Experiment/%E5%8F%AF%E7%BC%96%E7%A8%8B%E5%A4%96%E5%9B%B4%E6%8E%A5%E5%8F%A3%E8%8A%AF%E7%89%878255/%E9%94%AE%E7%9B%98%E8%BE%93%E5%85%A5%E5%BE%AE%E6%9C%BA%E5%B1%8F%E6%98%BE%E8%BE%93%E5%87%BA)

---------------------------------------
适用课程：微机原理与接口技术（实验） 

选用教材：微型计算机原理与接口技术-中国科学技术大学出版社

学校：Xiamen University（Amoiensis Universitas）

---------------------------------------
Please feel free to contact with me for any questions, thank you!

Please don't spread the files without permission!

未经允许，请勿转载！

---------------------------------------

