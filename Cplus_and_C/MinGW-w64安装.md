# MinGW-w64安装

> Mingw-w64是自由及开放源代码软件开发环境，用于创建Microsoft Windows应用程序。从2005–2008从MinGW(Minimalist GNU for Windows)分枝出来。
>
> Mingw-w64包括对GCC、GNU Binutils的Windows版本的移植（汇编器、链接器、库文件管理器），一套自由可分发的Windows特定的头文件与静态导入库以使用Windows API，一个 Windows本地版本的GNU的调试器，以及其它多种工具。
>
> Mingw-w64可运行于本地Microsoft Windows平台，"cross-native"在MSYS2或Cygwin。Mingw-w64能生成32-或64-位可执行程序，运行于i686-w64-mingw32或x86_64-w64-mingw32目标平台。

#### 1. 安装

我们可以从[https://sourceforge.net/projects/mingw-w64/files/](https://sourceforge.net/projects/mingw-w64/files/) 下载安装工具

[MinGW-W64-install.exe](https://sourceforge.net/projects/mingw-w64/files/Toolchains targetting Win32/Personal Builds/mingw-builds/installer/mingw-w64-install.exe) 然后再在线安装，或者下载离线包(较快)

![image-20230316221901783](https://img2023.cnblogs.com/blog/2213660/202303/2213660-20230316221902892-333882483.png) 

这里我选择的是下载离线包

下载之后解压到指定文件夹

![image-20210413192029299](https://img2020.cnblogs.com/blog/2213660/202104/2213660-20210413192029843-988383343.png) 



#### 2. 设置环境变量

**此电脑 -> 属性 -> 高级系统设置 -> 环境变量** 的 **用户变量** 中的 **Path** 中添加mingw64/bin

![image-20210413193417981](https://img2020.cnblogs.com/blog/2213660/202104/2213660-20210413193418547-1937395669.png) 

如，我的路径是 **E:\Study\MinGM-w64-gcc-g++\bin** ，注意定位到 `bin` 文件夹：

![image-20210413193615770](https://img2020.cnblogs.com/blog/2213660/202104/2213660-20210413193616296-422077037.png) 

点击确定



#### 3. 检验安装是否成功

打开 **命令行(cmd.exe)** ,输入

```shell
gcc -v
```

输出以下内容说明安装成功

![image-20210413194028688](https://img2020.cnblogs.com/blog/2213660/202104/2213660-20210413194029560-729284129.png) 

