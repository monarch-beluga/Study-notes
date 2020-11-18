## 代码编写

1. 新建一个Hello.java的文件

2. 在文本编辑器：记事本、notepad++、Sublime中编辑代码

    ```java
    public class Hello
    {
    	public static void main(String[] args)
    	{
    		System.out.print("Hello, Word!");
    	}
    }
    ```

3. 然后在终端中运行



## 代码运行

1. 打开终端

2. 进入代码文件Hello.java的目录中

3. 输入 **javac Hello.java** 编译java代码，如果无报错运行如下：

    ![image-20201114221018718](https://img2020.cnblogs.com/blog/2213660/202011/2213660-20201114221020113-1093236322.png)

4. 且目录中会多出一个叫 Hello.class 的可执行文件，然后再在终端中输入**java Hello** 就会出现运行结果：

    ![image-20201114221251429](https://img2020.cnblogs.com/blog/2213660/202011/2213660-20201114221252858-808866709.png)

**恭喜第一个代码完成！！！！**

**成功踏出了第一步**



## 注意事项

1.  每个单词的大小不能出错， **java的大小写是最敏感的**
2.  尽量使用**英文**
3. **文件名**和**类名**必须一致
4.  注意标点符号等都必须使用**英文**



## 原理

1. 先用 **public class Hello** 新建一个类，类名与文件名一致

2. 然后建立一个 **main()** 函数，这个是必须的

3. main()函数里面编写java代码

4. **System.out.print("Hello, Word!");** 将Hello, Word! 打印到终端

    **System.out.print()** 打印函数

