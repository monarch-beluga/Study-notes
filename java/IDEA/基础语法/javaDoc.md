## javaDoc

**将java信息生成一个API文档** 

#### 参数信息

1. **@author  作者名** 

2. **@version  版本** 

3. **@since  指明需要最早使用的jdk版本** 

4. **@param  参数名** 

5. **@return  返回值情况** 

6. **@throws  异常抛出情况** 

    ![image-20201121214614204](https://img2020.cnblogs.com/blog/2213660/202011/2213660-20201121214615044-355906346.png)



#### 使用命令行生成API文档

- 设置编码格式

    ```bash
    javadoc -encoding UTF-8
    ```

- 生成文档

    ```bash
    javadoc -encoding UTF-8 -charset UTF-8 Doc.java
    ```

    ![image-20201121214954253](https://img2020.cnblogs.com/blog/2213660/202011/2213660-20201121214954711-272607743.png)

    ![image-20201121215016861](https://img2020.cnblogs.com/blog/2213660/202011/2213660-20201121215017336-869625259.png)

    ![image-20201121215109358](https://img2020.cnblogs.com/blog/2213660/202011/2213660-20201121215109822-784600934.png)

- 文档详情，点击index.html

    ![image-20201121215152588](https://img2020.cnblogs.com/blog/2213660/202011/2213660-20201121215153091-761475129.png)

- 点击Doc

    ![image-20201121215217559](https://img2020.cnblogs.com/blog/2213660/202011/2213660-20201121215218027-43446806.png)

    

### 使用IDEA生成javaDoc

#### 第一步：在工具栏中找到 Tool，然后再子菜单中找到 Generate JavaDoc。

![img](https:////upload-images.jianshu.io/upload_images/10075543-65dcfd5f70b12e2b.png?imageMogr2/auto-orient/strip|imageView2/2/w/333/format/webp)

#### 第二步：在生成文档上进行配置。

配置的简单介绍：

![img](https:////upload-images.jianshu.io/upload_images/10075543-2ac54ec18f7e7e15.png?imageMogr2/auto-orient/strip|imageView2/2/w/621/format/webp)

参数说明

1. Whole  project:整个项目都生成文档

2. Custom  scope  自定义范围。如下：

    （1） project files  项目文件，

    （2）project production files  项目产品文件，

    （3）project test files  项目的测试文件，  未知范围，class  hierarchy  类层

3. include  test source  包含测试目录

4. include  JDK and  …  包含jdk和其他的第三方jar

5. link  to  JDK documentation…链接到JDK api

6. output  directy  生成的文档存放的位置

    （1）private、package、protected、public  生成文档的级别（类和方法）

    （2）右边的Generate…是选择生成的文档包含的内容，层级树、导航、索引..

    （3）再右边是生成的文档包含的内容信息，作者版本等信息

7. Locale  语言类型,zh-CN

8. Other  command line arguments  其他参数

9. Maximum  heep…  最大堆栈

我这里的配置如下：

![image-20201121220323817](https://img2020.cnblogs.com/blog/2213660/202011/2213660-20201121220324397-1921905473.png)

- 结果

    ![image-20201121220428421](https://img2020.cnblogs.com/blog/2213660/202011/2213660-20201121220428912-162538590.png)

    