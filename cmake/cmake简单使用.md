## cmake简单使用

1、创建一个test文件夹，然后在test文件夹里创建两个名为src和build的文件夹

![image-20221230170111304](https://img2023.cnblogs.com/blog/2213660/202212/2213660-20221230170111870-602003656.png)

2、在src中创建一个C\C++文件

```c++
#include<iostream>
using namespace std;

int main()
{
    cout << " Hello World!!!" << endl;
    return 0;
}
```

这里创建了一个Hello World 程序，文件名称为temp.cc

3、在src中创建一个名为 CMakeLists.txt的文件

```cmake
cmake_minimum_required(VERSION 3.25)

# 设置项目的名称, 项目名称即后面生成的可执行文件的名称
project(Hello)

# 添加程序文件
add_executable(Hello temp.cc)

```

4、在build目录下打开cmd,然后输入指令`cmake -G "MinGW Makefiles" ../src`,其中`MinGw Makefiles` 是因为我使用的是MinGw提供的gcc/g++来编译的，执行结果如下

![image-20221230170733601](https://img2023.cnblogs.com/blog/2213660/202212/2213660-20221230170733729-95642413.png)

其中圈起来的部分为gcc编译器，执行后build文件夹会产生中间文件

![image-20221230170912241](https://img2023.cnblogs.com/blog/2213660/202212/2213660-20221230170912362-938668674.png)

5、然后再在cmd中执行命令`cmake --build ./` 来生成可执行文件,其中的`./` 指在当前目录下生成可执行文件，执行结果如下：

![image-20221230171519592](https://img2023.cnblogs.com/blog/2213660/202212/2213660-20221230171519610-1929131161.png)

然后在build文件夹下会产生可执行Hello.exe

![image-20221230171629984](https://img2023.cnblogs.com/blog/2213660/202212/2213660-20221230171630038-229095625.png)

