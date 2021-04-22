## MySql初识

JavaEE：企业级java开发	Web

前端(页面：展示，数据！)

后台(连接点：连接数据库 JDBC, 连接前端(控制，控制视图跳转，和给前端传递数据))

数据库 (存数据，txt, excel, word)



> 趋势

1、岗位需求

2、大数据时代，数据变现(得数据者得天下)

3、被迫需求(存数据)

**==4、数据库是所有软件体系中最核心得存在==** DBA



> 什么是数据库

数据库 (DB， DataBase)

概念：数据仓库, **软件** ，安装在操作系统(windows, linux, mac.....)之上！SQL， 可以存储大量得数据

作用：存储数据，管理数据  类似于(Excel)



> 数据库分类

- **关系型数据库**：(SQL)
    - MySQL, Oracle, Sql Server, DB2, SQLlite
    - 通过表和表之间，行和列之间得关系，进行数据的存储，   学员信息表，考勤表

- **非关系型数据库**: (NoSQL) Not Only SQL
    - Redis, MongDB
    - 非关系型数据库，对象存储，通过对象的自身的属性来决定
    
- ==DBMS(数据库管理系统)== 

    ![image-20210422234913340](https://img2020.cnblogs.com/blog/2213660/202104/2213660-20210422234914476-450346533.png) 

    - 数据库的管理软件，科学有效的管理我们的数据，维护和获取数据；
    - MySQL，数据库管理系统！



> MySQL简介

MySQL是一个 **关系型数据库管理系统** 

开源的数据库软件

体积小、速度快、总体拥有成本低

中小型网站使用

官网：www.mysql.com



- 安装建议：
    1. 尽量不要使用 exe 
    2. 尽可能使用压缩包安装



> 安装MySQL

1、 解压到指定目录

2、 添加环境变量: 将 *mysql安装文件夹下面的bin文件夹* 添加到环境变量中

3、 在 *mysql安装文件夹下面新建 ==my.ini== 文件* 

4、 编辑 ==my.ini== 文件

```bash
[mysqld]
# 路径注意使用反斜杠 / 或者 双杠 \\
basedir=[安装目录]
datadir=[安装目录]/data/	# 不要手动新建，会自动生成data文件夹
```

5、 ==启动管理员模式下的CMD,运行所有的命令== 

6、 进入mysql **bin** 目录，然后输入 `mysqld --install` 安装mysql

7、 再输入 `mysqld --initialize-insecure --console` 初始化数据文件

8、 输入 `net start mysql` 启动mysql服务

![image-20210423003244524](https://img2020.cnblogs.com/blog/2213660/202104/2213660-20210423003245110-1593826814.png) 

9、 输入 `*mysqladmin -uroot -p password 123456` 修改密码为123456

9、 输入 `mysql -u root -p123456` 进去mysql

![image-20210423012447845](https://img2020.cnblogs.com/blog/2213660/202104/2213660-20210423012450977-147098965.png)

11、 输入exit退出mysql

12、 输入 `net stop mysql` 停止mysql服务

**==清空mysql服务==** (卸载mysql才需要使用) **==慎用==** 

```
sc delete mysql
```

