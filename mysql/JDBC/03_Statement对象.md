## Statement对象

==JDBC中的Statement对象用于向数据库发送SQL语句，想完成对数据库的增删改查，只需要通过这个对象向数据库发送增删改查语句即可==



> crud操作-create

使用executeUpdate(String sql)方法完成数据插入操作：

```java
Statement statement = connection.createStatement();
String sql = "insert into table(...) values (...)";
int num = statement.executeUpdate(sql);
if (num > 0)
    System.out.println("插入成功！！");
```



> crud操作-read

使用executeQuery(String sql)方法完成数据查询操作：

```java
Statement statement = connection.createStatement();
String sql = "select ... from table";
ResultSet resultSet = statement.executeQuery(sql);
while(resultSet.next()){
    // 获取数据
}
```



> crud操作-update

使用executeUpdate(String sql)方法完成数据更新操作：

```java
Statement statement = connection.createStatement();
String sql = "update table set ... where ...";
int num = statement.executeUpdate(sql);
if (num > 0)
    System.out.println("更新成功！！");
```



> crud操作-delete

使用executeUpdate(String sql)方法完成数据删除操作：

```java
Statement statement = connection.createStatement();
String sql = "delete from table where ...";
int num = statement.executeUpdate(sql);
if (num > 0)
    System.out.println("删除成功！！");
```



### 代码实现

> 增删改  `executeUpdate` 

- 增

```java
import Com.Monarch.utils.JdbcUtils;				// 封装的工具类

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.MessageFormat;

public class TestInsert {
    public static void main(String[] args) throws SQLException {
        Connection conn = JdbcUtils.getConnection();    // 获取连接
        Statement st = conn.createStatement();          // 获取SQL的执行对象
        String sql = "insert into users(id, name, password, email, birthday)" +
                " VALUES (4, 'monarch', '123456', '32165487@qq.com', '2021-01-01')";
        int i = st.executeUpdate(sql);
        if (i > 0)
            System.out.println(MessageFormat.format("插入{0}条数据", i));
        JdbcUtils.release(conn, st);				// 释放资源
    }
}
```

- 删

```java
import Com.Monarch.utils.JdbcUtils;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.MessageFormat;

public class TestDelete {
    public static void main(String[] args) throws SQLException {
        Connection conn = JdbcUtils.getConnection();    // 获取连接
        Statement st = conn.createStatement();          // 获取SQL的执行对象
        String sql = "delete from users where id=4";
        int i = st.executeUpdate(sql);
        if (i > 0)
            System.out.println(MessageFormat.format("删除{0}条数据", i));
        JdbcUtils.release(conn, st);			// 释放资源
    }
}
```

- 改

```java
import Com.Monarch.utils.JdbcUtils;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.MessageFormat;

public class TestUpdate {
    public static void main(String[] args) throws SQLException {
        Connection conn = JdbcUtils.getConnection();    // 获取连接
        Statement st = conn.createStatement();          // 获取SQL的执行对象
        String sql = "update users set name = 'monarch', email = '12324578@qq.com' where id = 1";
        int i = st.executeUpdate(sql);
        if (i > 0)
            System.out.println(MessageFormat.format("更新{0}条数据", i));
        JdbcUtils.release(conn, st);                    // 释放资源
    }
}
```



> 查    `executeQuery` 

```java
import Com.Monarch.utils.JdbcUtils;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class TestSelect {
    public static void main(String[] args) throws SQLException {
        Connection conn = JdbcUtils.getConnection();    // 获取连接
        Statement st = conn.createStatement();          // 获取SQL的执行对象

        String sql = "select * from users where id = 1";
        ResultSet rs = st.executeQuery(sql);
        while (rs.next()){
            System.out.println(rs.getString("name"));
        }

        JdbcUtils.release(conn, st, rs);                    // 释放资源
    }
}
```



> SQL注入

SQL注入即是指web应用程序对用户输入数据的合法性没有判断或过滤不严，攻击者可以在web应用程序中事先定义好的查询语句的结尾上添加额外的SQL语句，在管理员不知情的情况下实现非法操作，以此来实现欺骗数据库服务器执行非授权的任意查询，从而进一步得到相应的数据信息。

```java
import Com.Monarch.utils.JdbcUtils;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class SqlInjection {
    public static void main(String[] args) throws SQLException {
        login("'or '1 = 1", "' or ' 1 = 1");
    }

    public static void login(String username, String password) throws SQLException {
        Connection conn = JdbcUtils.getConnection();
        Statement st = conn.createStatement();

        String sql = "select * from users where name='"+username+"' and password='"+password+"'";
        ResultSet rs = st.executeQuery(sql);
        while (rs.next()){
            System.out.println(rs.getString("name"));
            System.out.println(rs.getString("password"));
        }

        JdbcUtils.release(conn, st, rs);
    }
}
```

![image-20210518232259876](https://img2020.cnblogs.com/blog/2213660/202105/2213660-20210518232300711-1713023161.png) 

**获得了所有的用户信息**

所以 **Statement** 是不安全的，在java中有另外一个叫 **PreparedStatement** 的类可以屏蔽这些漏洞

