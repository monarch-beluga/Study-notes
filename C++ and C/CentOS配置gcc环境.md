## CentOS配置gcc/g++/gdb环境

CentOS 支持使用yum安装，安装软件一般格式为yum install ...，注意安装时使用root用户，并保持联网状态

在终端输入

```sh
yum install gcc
```

一路选择 y进行下载

![image-20240218174224454](https://img2023.cnblogs.com/blog/2213660/202402/2213660-20240218174226537-955169425.png)

输入

```shell
gcc --version
```

测试gcc是否安装成功

![image-20240218174304118](https://img2023.cnblogs.com/blog/2213660/202402/2213660-20240218174305749-896750324.png)

使用

```shell
yum install gcc-c++ 
```

安装g++

![image-20240218174358197](https://img2023.cnblogs.com/blog/2213660/202402/2213660-20240218174400193-645965876.png)

使用

```shell
g++ --version
```

查看g++是否安装成功

![image-20240218174444991](https://img2023.cnblogs.com/blog/2213660/202402/2213660-20240218174446421-1405923837.png)

使用

```shell
yum install gdb
```

安装gdb

并使用

```shell
gdb --version
```

查看gdb是否安装成功

![image-20240218174613350](https://img2023.cnblogs.com/blog/2213660/202402/2213660-20240218174615105-1518553597.png)



环境配置

```shell
# 路径可自定义
GCC_PACKAGE_HOME=/usr/gcc

export PATH=$PATH:${GCC_PACKAGE_HOME}/bin
export C_INCLUDE_PATH=$C_INCLUDE_PATH:${GCC_PACKAGE_HOME}/include
export CPLUS_INCLUDE_PATH=$CPLUS_INCLUDE_PATH:${GCC_PACKAGE_HOME}/include
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:${GCC_PACKAGE_HOME}/lib
export LIBRARY_PATH=$LIBRARY_PATH:${GCC_PACKAGE_HOME}/lib
```

