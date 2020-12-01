## IO流概述

I/O，及输入输出流

- 分类
    - 按数据流向分：
        - 输入流：读取数据
        - 输出流：输出数据
    - 按操作方式分
        - 字节流：以字节为单位来操作数据
            - InputStream：字节输入的顶层抽象类
                - FileInputStream：普通的字节输入流
                - BufferedInputStream：高效的字节输入流（也叫：缓冲字节输入流）
            - OutputStream：字节输出流的顶层抽象类
                - FileOutputStream：普通的字节输出流
                - BufferedOutputStream：高效的字节输出流（也叫：缓冲字节输入流）
        - 字符流：以字符为单位来操作数据
            - Reader：字符输入的顶层抽象类
                - FileReader：普通的字符输入流
                - BufferedReader：高效的字符输入流（也叫：缓冲字符输入流）
            - Writer：字符输出流的顶层抽象类
                - FileWriter：普通的字符输出流
                - BufferedWriter：高效的字符输出流（也叫：缓冲字符输入流）

![image-20201201100739408](https://img2020.cnblogs.com/blog/2213660/202012/2213660-20201201100740931-1857213064.png)

![image-20201201100803126](https://img2020.cnblogs.com/blog/2213660/202012/2213660-20201201100804726-1411003409.png)

