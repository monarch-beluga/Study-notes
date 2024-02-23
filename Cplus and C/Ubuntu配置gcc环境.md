## Ubuntu配置gcc环境

```shell
sudo apt install build-essential
```

可以安装gcc，g++，make等一系列编译需要的软件

安装完成后

```shell
# 查看gcc是否安装完成
gcc --version
# 查看g++是否安装完成
g++ --version
# 查看gdb是否安装完成
gdb --version
```

![image-20240222125815757](https://img2023.cnblogs.com/blog/2213660/202402/2213660-20240222125817537-2008350048.png)



#### 配置gcc第三方库环境变量

使用vim 打开 /etc/profile

```shell
sudo vim /etc/profile
```

然后在文件最后面添加如下语句

```shell
# 路径可自定义
GCC_PACKAGE_HOME=/usr/gcc

# 将第三方库可执行文件添加到系统PATH
export PATH=$PATH:${GCC_PACKAGE_HOME}/bin
# 将第三方库头文件添加到gcc默认查找头文件路径
export C_INCLUDE_PATH=$C_INCLUDE_PATH:${GCC_PACKAGE_HOME}/include
# 将第三方库头文件添加到g++默认查找头文件路径
export CPLUS_INCLUDE_PATH=$CPLUS_INCLUDE_PATH:${GCC_PACKAGE_HOME}/include
# 将第三方库动态库添加到g++和gcc默认查找动态库路径
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:${GCC_PACKAGE_HOME}/lib
# 将第三方库静态库添加到g++和gcc默认查找静态库路径
export LIBRARY_PATH=$LIBRARY_PATH:${GCC_PACKAGE_HOME}/lib
```

执行配置文件

```shell
source /etc/profile
```

切换到 /usr路径，然后将刚刚配置的路径文件夹都建立

```shell
# 切换到/usr路径
cd /usr
# 新建gcc文件夹，这里的路径和上面自定义的路径有关
mkdir gcc
# 进入gcc目录
cd gcc
# 创建bin,lib,include文件夹
mkdir bin
mkdir lib
mkdir include
# 创建 package文件夹用来防止第三方库的其他文件
mkdir package
# 查看文件
ls
```

![image-20240222130945350](https://img2023.cnblogs.com/blog/2213660/202402/2213660-20240222130946472-1970807696.png)

