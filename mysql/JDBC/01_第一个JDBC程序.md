## 第一个JDBC程序

#### 创建测试数据库

```sql
create database jdbcStudy character set utf8 collate utf8_general_ci;

use jdbcStudy;

create table users(
	id int primary key,
    name varchar(40),
    password varchar(40),
    email varchar(60),
    birthday date
);

insert into users(id, name, password, email, birthday)
values
('1','zhangsan','123456','zs@sina.com','1980-12-04'),
('2','lisi','123456','lisi@sina.com','1981-12-04'),
('3','wangwu','123456','wangwu@sina.com','1979-12-04');
```



#### 导入驱动

下载地址：https://dev.mysql.com/downloads/connector/j/

![image-20210516141237385](https://img2020.cnblogs.com/blog/2213660/202105/2213660-20210516141238655-1320826211.png) 

解压后

![image-20210516141322115](https://img2020.cnblogs.com/blog/2213660/202105/2213660-20210516141323301-1762932816.png) 

在idea的项目中新建一个 `lib` 文件夹，然后将该文件夹添加到库中，接着将上述文件复制到 `lib` 文件夹下，导入成功

![image-20210516141547286](https://img2020.cnblogs.com/blog/2213660/202105/2213660-20210516141548471-160041096.png) 



#### 第一个程序

```java
import java.sql.*;

// 第一个JDBC程序
public class JdbcFirst {
    public static void main(String[] args) throws ClassNotFoundException, SQLException {
        // 1. 加载驱动
        Class.forName("com.mysql.cj.jdbc.Driver");         // 固定写法，加载驱动

        // 2. 用户信息和url
        String url = "jdbc:mysql://localhost:3306/jdbcStudy?userUnicode=true&characterEncoding=utf8&useSSL=true";
        String username = "root";
        String password = "123456";

        // 3. 连接成功，数据库对象
        Connection connection = DriverManager.getConnection(url, username, password);

        // 4. 获取执行sql的对象
        Statement statement = connection.createStatement();

        // 5. 执行sql的对象去执行sql，可能存在结果，查看返回结果
        // statement.executeQuery("use jdbcStudy;");        // 使用指定数据库
        String sql = "select * from users";
        ResultSet resultSet = statement.executeQuery(sql);  // 返回结果集,结果集中封装了我们全部的查询出来的结果

        System.out.println("id\tname\tpassword\temail\tbirthday");
        while (resultSet.next()){
            System.out.print(resultSet.getObject("id")+"\t");
            System.out.print(resultSet.getObject("name")+"\t");
            System.out.print(resultSet.getObject("password")+"\t");
            System.out.print(resultSet.getObject("email")+"\t");
            System.out.println(resultSet.getObject("birthday"));
        }

        // 6. 释放连接
        resultSet.close();
        statement.close();
        connection.close();
    }
```

![image-20210516141722632](https://img2020.cnblogs.com/blog/2213660/202105/2213660-20210516141723867-413520227.png) 



#### 使用步骤

1. **加载驱动** 

    ```java
    // MySQL 8.0版本之后
    Class.forName("com.mysql.cj.jdbc.Driver");	// 利用反射的原理
    // MySQL 8.0之前
    Class.forName("com.mysql.jdbc.Driver")
    ```

2. 用户信息和url

    ```java
    String url = "jdbc:mysql://localhost:3306/jdbcStudy?userUnicode=true&characterEncoding=utf8&useSSL=true";
    String username = "root";
    String password = "123456";
    ```

    - url: `jdbc:驱动名://主机:端口/[数据库名]?参数设置` ，数据库可写可不写，如果不写，下面需要执行一行使用数据库的sql语句
        - mysql端口号默认3306
        - userUnicode：是否使用Unicode编码
        - characterEncoding：设置字符编码
        - useSSL：与服务器进行通信时使用SSL(加密)

3. 获取数据库驱动对象Connection

    ```java
    Connection connection = DriverManager.getConnection(url, username, password);
    
    // connection代表数据库，可以执行数据库执行的东西，如提交和回滚
    // connection.commit();			// 提交
    // connection.rollback();		// 回滚
    // connection.setAutoCommit();	// 设置自动提交
    ```

4. 获取执行sql语句的对象Statement

    ```java
    Statement statement = connection.createStatement();
    ```

5. 用Statement去执行sql语句

    - **Statement.execute()**: 执行所有的sql，但效率相对低一点
    - **Statement.executeQuery()**: 执行DQL查询语句，返回一个ResultSet可迭代对象
    - **Statement.executeUpdate()**: 执行DML语句(insert、delete、update)增删改数据，返回一个受影响的行数(int)。不常使用：DDL语句(create、drop、alter)增删改表和库，没有返回结果
    - **Statement.executeBatch()**: 执行多个sql语句

6. 遍历ResultSet对象，获取数据

    ```java
    while (resultSet.next()){
        System.out.print(resultSet.getObject("id")+"\t");
        System.out.print(resultSet.getObject("name")+"\t");
        System.out.print(resultSet.getObject("password")+"\t");
        System.out.print(resultSet.getObject("email")+"\t");
        System.out.println(resultSet.getObject("birthday"));
    }
    ```

    - 获取数据

        ```java
        resultSet.getObject();		// 在不知道列的类型的情况下用
        // 如果知道列的类型就使用指定的类型
        resultSet.getInt();
        resultSet.getString();
        resultSet.getFloat();
        resultSet.getDate();
        ```

    - 遍历: 指针移动

        ```java
        resultSet.next();			// 移动到下一行
        resultSet.previous();		// 移动到上一行
        resultSet.beforeFirst();	// 移动到第一行
        resultSet.afterLast();		// 移动到最后一行
        resultSet.absolute(row);	// 移动到指定行
        ```

7. 释放资源

    ```java
    resultSet.close();
    statement.close();
    connection.close();
    ```



