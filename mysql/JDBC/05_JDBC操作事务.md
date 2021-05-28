## JDBC操作事务

==要么都成功，要么都失败==

#### 所用数据库表

```sql
/*创建账户表*/
create table account(
    id int primary key auto_increment,
    name varchar(40),
    money float
);

-- 插入测试数据
insert into account(name, money)
values ('A', 1000), ('B', 1000), ('C', 1000);
```



#### 代码实现

```java
import Com.Monarch.utils.JdbcUtils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class Test1 {
    public static void main(String[] args) throws SQLException {
        Connection conn = JdbcUtils.getConnection();
        // 关闭自动提交，开启事务
        conn.setAutoCommit(false);

        // 事务内容
        String sql1 = "update account set money = money-100 where name = 'A'";
        PreparedStatement pst = conn.prepareStatement(sql1);
        int i = pst.executeUpdate();
        System.out.println(i);

        String sql2 = "update account set money = money+100 where name = 'B'";
        pst = conn.prepareStatement(sql2);
        pst.executeUpdate();

        // 业务完毕，提交事务
        conn.commit();
        System.out.println("成功！！");

        JdbcUtils.release(conn, pst);
    }
}
```

- **conn.setAutoCommit(false);** ：关闭自动提交
- **conn.commit();** ：提交事务
- 原理：事务内容期间发生错误，则后续内容无法进行，也就不能执行事务提交语句，也就相当于回滚操作
- 即，当程序执行完毕时，事务没有提交就相当于回滚了事务





