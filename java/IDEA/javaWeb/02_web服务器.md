

## Web服务器

### 1、 技术详解

ASP:

- 微软：国内最早流行的就是ASP
- 在HTML中嵌入了VB的脚本，ASP+COM；
- 在ASP开发中，基本一个页面都有几千行的业务代码，页面及其乱
- 维护成本高！
- 大多用C#语言
- IIS

php：

- PHP开发速度很快，功能很强大，跨平台，代码很简单
- 无法承载大访问量的情况 (局限性)

JSP/Serviet:

B/S: 浏览和服务器

C/S: 客户端和服务器

- sun公司主推的B/S架构
- 基于java语言的(所有的大公司，或者一些开源的组件，都是用java写的)
- 可以承载三高问题(高可用，高并发，高性能)带来的影响
- 语法像ASP，ASP-->JSP，加强市场强度



### 2、 web服务器

服务器是一种被动的操作，用来处理用户的一些请求和给用户一些响应信息；

**Tomcat**:

![image-20210604211708870](https://img2020.cnblogs.com/blog/2213660/202106/2213660-20210604211710856-567725982.png)

Tomcat是Apache 软件基金会（Apache Software Foundation）的Jakarta 项目中的一个核心项目，由Apache、Sun 和其他一些公司及个人共同开发而成。由于有了Sun 的参与和支持，最新的Servlet 和JSP 规范总是能在Tomcat 中得到体现，Tomcat 5支持最新的Servlet 2.4 和JSP 2.0 规范。**因为Tomcat 技术先进、性能稳定，而且免费，因而深受Java 爱好者的喜爱并得到了部分软件开发商的认可，成为目前比较流行的Web 应用服务器**。
Tomcat 服务器是一个免费的开放源代码的Web 应用服务器，属于轻量级应用服务器，在中小型系统和并发访问用户不是很多的场合下被普遍使用，是开发和调试JSP 程序的首选。对于一个java初学者来说，它是最佳的选择
Tomcat和IIS等Web服务器一样，具有处理HTML页面的功能，另外它还是一个Servlet和JSP容器，独立的Servlet容器是Tomcat的默认模式。



### 3、 Tomcat安装

1. 下载tomcat：https://tomcat.apache.org/download-90.cgi

    ![image-20210604212803332](https://img2020.cnblogs.com/blog/2213660/202106/2213660-20210604212805174-1215309833.png) 

2. 解压

    ![image-20210604215404668](https://img2020.cnblogs.com/blog/2213660/202106/2213660-20210604215406706-1558802836.png)



### 4、Tomcat使用

#### 启动和关闭

点击 bin目录--> startup.bat 启动tomcat

![image-20210604221000552](https://img2020.cnblogs.com/blog/2213660/202106/2213660-20210604221002044-2011341201.png) 

![image-20210604220950537](https://img2020.cnblogs.com/blog/2213660/202106/2213660-20210604220952543-75790666.png) 

- 点击shutdown.bat 关闭tomcat，或者直接关闭Tomcat窗口

- 访问 **http://127.0.0.1:8080/、 http://localhost:8080/ 或者本机ip:8080** 就可以访问Tomcat搭建的主网站页面

    ![image-20210604221353456](https://img2020.cnblogs.com/blog/2213660/202106/2213660-20210604221354830-1151229449.png) 



#### 配置文件

打开conf --> server.xml

![image-20210606163550116](https://img2020.cnblogs.com/blog/2213660/202106/2213660-20210606163551603-742491626.png) 

修改访问的端口号

![image-20210606163658361](https://img2020.cnblogs.com/blog/2213660/202106/2213660-20210606163659507-1101552344.png) 

修改主机

![image-20210606171035817](https://img2020.cnblogs.com/blog/2213660/202106/2213660-20210606171037141-2063432653.png) 

修改网站根目录

```xml
<!-- 在 </Host> 标签前 添加下述语句 -->
<Context path="" docBase="自定义目录" debug="0" reloadable="true" crossContext="true" />
```

![image-20210606171126246](https://img2020.cnblogs.com/blog/2213660/202106/2213660-20210606171127461-1045248167.png) 

网站根目录必须包含web配置文件

![image-20210606171248963](https://img2020.cnblogs.com/blog/2213660/202106/2213660-20210606171250235-585127975.png)  



#### 配置后台服务

- **JDK8以上的JDK需要先修改bin目录下的service.bat文件** 

    ![image-20210605002630884](https://img2020.cnblogs.com/blog/2213660/202106/2213660-20210605002632525-540674174.png) 
    查找 **:doInstall** 
    ![image-20210605003059187](https://img2020.cnblogs.com/blog/2213660/202106/2213660-20210605003100571-1547928416.png) 
    将这下面以后所有的 **%JRE_HOME%** 改为 **%JAVA_HOME%** 
    ![image-20210605003121596](https://img2020.cnblogs.com/blog/2213660/202106/2213660-20210605003122983-1630696354.png) 
    然后保存退出

- 管理员模式打开cmd，进入到bin目录，运行以下命令

    ```bash
    service.bat install Tomcat
    # 卸载服务
    # service.bat uninstall Tomcat
    ```

    ![image-20210605003631045](https://img2020.cnblogs.com/blog/2213660/202106/2213660-20210605003632645-1542050927.png)

    开启服务

    ```bash
    net start Tomcat
    # 关闭服务
    # net stop Tomcat
    ```

    ![image-20210605003847555](https://img2020.cnblogs.com/blog/2213660/202106/2213660-20210605003848990-1226972210.png) 

    尝试访问 **http://127.0.0.1:8080/、 http://localhost:8080/ 或者本机ip:8080** 

- 配置后台服务自动开启

    打开任务管理器，点击服务

    ![image-20210605004435185](https://img2020.cnblogs.com/blog/2213660/202106/2213660-20210605004436552-1452858613.png) 

    点击打开服务

    ![image-20210605004503657](https://img2020.cnblogs.com/blog/2213660/202106/2213660-20210605004504987-837685475.png) 

    找到以下服务

    ![image-20210605004558586](https://img2020.cnblogs.com/blog/2213660/202106/2213660-20210605004559969-1615332266.png) 

    双击打开，及将启动类型换位自动，然后点击应用

    ![image-20210605004636450](https://img2020.cnblogs.com/blog/2213660/202106/2213660-20210605004637931-1385239583.png) 

    完成配置

    这时Tomcat服务就会自动开启，且不会出现doc窗口



### 网站目录了解

![image-20210606171651770](https://img2020.cnblogs.com/blog/2213660/202106/2213660-20210606171652987-637065525.png) 

ROOT目录位默认加载的网站主页面

我们可以通过文件夹的名称来访问该子网站，如 http://127.0.0.1:8080/docs/ 访问docs

![image-20210606171955248](https://img2020.cnblogs.com/blog/2213660/202106/2213660-20210606171956529-975221069.png) 

每一个文件夹都有一个 **index.*** 文件为默认的该网站的主页面

![image-20210606172202257](https://img2020.cnblogs.com/blog/2213660/202106/2213660-20210606172203537-1444839815.png) 

![image-20210606172220145](https://img2020.cnblogs.com/blog/2213660/202106/2213660-20210606172221334-864117515.png) 

![image-20210606172238964](https://img2020.cnblogs.com/blog/2213660/202106/2213660-20210606172240233-352579602.png) 

每个目录下也都有一个 **WEB-INF** 文件夹，这个文件夹是web配置文件，如果需要新建一个子网站，也需要在新建的目录中添加该文件，如下

![image-20210606172621424](https://img2020.cnblogs.com/blog/2213660/202106/2213660-20210606172622602-627599955.png) 

![image-20210606172647811](https://img2020.cnblogs.com/blog/2213660/202106/2213660-20210606172648998-641303708.png) 

