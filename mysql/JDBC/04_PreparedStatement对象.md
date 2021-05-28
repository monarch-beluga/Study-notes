## PreparedStatement对象

PerparedStatement 可以防止SQL注入，效率更好！

> 增

```java
import Com.Monarch.utils.JdbcUtils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.MessageFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class TestInsert {
    public static void main(String[] args) throws SQLException, ParseException {
        Connection conn = JdbcUtils.getConnection();
        String sql = "insert into users(id, name, password, email, birthday)" +
                " VALUES (?, ?, ?, ?, ?)";                  // 问号为占位符
        PreparedStatement pst = conn.prepareStatement(sql);            // 预编译SQL

        // 手动给参数赋值
        pst.setInt(1, 4);
        pst.setString(2, "zhangsan");
        pst.setString(3, "123");
        pst.setString(4, "21548724@qq.com");
        // 注意点：java.util里的Date与sql中的有区别
        // new java.sql.Date(new java.util.Date().getTime())
        // 先用java.util.Date().getTime()获得时间戳，然后再转化为sql中的Date
        Date date = new SimpleDateFormat("yyyy-MM-dd").parse("2020-01-02");
        pst.setDate(5, new java.sql.Date(date.getTime()));

        int i = pst.executeUpdate();
        if (i > 0)
            System.out.println(MessageFormat.format("插入{0}条数据", i));
        JdbcUtils.release(conn, pst);                    // 释放资源
    }
}
```

- **PreparedStatement** 继承于 **Statement** ，它用预编译再传参的形式，规避了sql注入的漏洞
    - 预编译：先写好sql语句，然后将其中的一些字段的值用问号占位符进行占位
    - 传参：通过 **.setInt** 等方法来进行填补占位符
- .set[类型]: 第一个参数为上述占位符的位置，从1开始，第二个参数为值



> 删

```java
import Com.Monarch.utils.JdbcUtils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.MessageFormat;
import java.text.ParseException;

public class TestDelete {
    public static void main(String[] args) throws SQLException, ParseException {
        Connection conn = JdbcUtils.getConnection();
        String sql = "delete from users where id=?";
        PreparedStatement pst = conn.prepareStatement(sql);            // 预编译SQL

        pst.setInt(1, 4);

        int i = pst.executeUpdate();
        if (i > 0)
            System.out.println(MessageFormat.format("删除{0}条数据", i));
        JdbcUtils.release(conn, pst);                    // 释放资源
    }
}
```



> 改

```java
import Com.Monarch.utils.JdbcUtils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.MessageFormat;
import java.text.ParseException;

public class TestUpdate {
    public static void main(String[] args) throws SQLException, ParseException {
        Connection conn = JdbcUtils.getConnection();
        String sql = "update users set name = ? where id=?";
        PreparedStatement pst = conn.prepareStatement(sql);            // 预编译SQL

        pst.setString(1, "白鲸");
        pst.setInt(2, 1);

        int i = pst.executeUpdate();
        if (i > 0)
            System.out.println(MessageFormat.format("更新{0}条数据", i));
        JdbcUtils.release(conn, pst);                    // 释放资源
    }
}
```



> 查

```java
import Com.Monarch.utils.JdbcUtils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;

public class TestSelect {
    public static void main(String[] args) throws SQLException, ParseException {
        Connection conn = JdbcUtils.getConnection();
        String sql = "select *  from users where id=?";
        PreparedStatement pst = conn.prepareStatement(sql);            // 预编译SQL

        pst.setInt(1, 1);

        ResultSet rs = pst.executeQuery();
        while (rs.next()){
            System.out.println(rs.getString("name"));
        }
        JdbcUtils.release(conn, pst);                    // 释放资源
    }
}
```



> 防止SQL注入

```java
public static void loginP(String username, String password) throws SQLException {
    Connection conn = JdbcUtils.getConnection();
    String sql = "select *  from users where name=? and password=?";
    PreparedStatement pst = conn.prepareStatement(sql);            // 预编译SQL

    pst.setString(1, username);
    pst.setString(2, password);

    ResultSet rs = pst.executeQuery();
    while (rs.next()){
        System.out.println(rs.getString("name"));
        System.out.println(rs.getString("password"));
    }
    JdbcUtils.release(conn, pst, rs);                    // 释放资源
}
```

原理：把传递进来的参数当做字符，假设其中存在转义字符，会被直接转义