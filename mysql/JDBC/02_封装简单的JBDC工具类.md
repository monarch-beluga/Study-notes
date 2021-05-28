## 封装简单的JDBC工具类

### 配置文件(.properties文件)使用

- 在src目录下新建一个 `db.properties` 配置文件，文件里记录数据库配置信息

    ```properties
    # 驱动
    driver = com.mysql.cj.jdbc.Driver
    # 数据库url
    url = jdbc:mysql://localhost:3306/?userUnicode=true&characterEncoding=utf8&useSSL=true
    # 用户信息
    username = root
    password = 123456
    ```

- 获取配置文件流

    ```java
    // 1. 使用FileInputStream类获取文件流
    InputStream in = new FileInputStream("src/db.properties");
    // 2. 使用class.getClassLoader().getResourceAsStream()获取文件流
    InputStream in = JdbcUtils.class.getClassLoader().getResourceAsStream("db.properties");
    // 3. 使用class.getResourceAsStream()获取文件流
    InputStream in = JdbcUtils.class.getResourceAsStream("/db.properties");
    ```

    - FileInputStream检索的相对路径为项目所在路径
    - class.getClassLoader().getResourceAsStream()检索的相对路径为src文件夹下路径
    - class.getResourceAsStream()检索的相对路径为当前类的所在文件夹，上述'/'表示ClassPath的根目录即src文件夹下
    - 这里我们选择第三中方式

- 读取配置文件流中的数据

    ```java
    // InputStreamReader inr = new InputStreamReader(in, "UTF_8");  // 转换编码
    Properties properties = new Properties();
    // properties.load(inr);
    properties.load(in);
    String driver = properties.getProperty("driver");
    String url = properties.getProperty("url");
    String username = properties.getProperty("username");
    String password = properties.getProperty("password");
    ```

    - InputStreamReader来转换编码
    - Properties.load()来读取流
    - Properties.getProperty()获取配置文件中的键值



### 封装

```java
import java.io.InputStream;
import java.sql.*;
import java.util.Properties;

public class JdbcUtils {
    private static String url;
    private static String username;
    private static String password;

    static {
        // 获取配置信息
        InputStream in = JdbcUtils.class.getResourceAsStream("/db.properties");
        try {
            // InputStreamReader inr = new InputStreamReader(in, "UTF_8");  // 转换编码
            Properties properties = new Properties();
            // properties.load(inr);
            properties.load(in);
            String driver = properties.getProperty("driver");
            url = properties.getProperty("url");
            username = properties.getProperty("username");
            password = properties.getProperty("password");

            // 1. 驱动激活
            Class.forName(driver);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

     // 获取数据库对象
    public static Connection getConnection() throws SQLException {
        return DriverManager.getConnection(url, username, password);
    }

    // 资源释放
    public static void release(Connection conn, Statement st, ResultSet rs){
        try {
            if (rs != null)
                rs.close();
            if (st != null)
                st.close();
            if (conn != null)
                conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    // 资源释放多态
    public static void release(Connection conn, Statement st){
        try {
            if (st != null)
                st.close();
            if (conn != null)
                conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
```

- 获取配置信息

- 导入驱动：Class.forName(driver);

- 编写两个方法来获取数据库对像与资源释放

    ```java
    // 获取数据库对象
    public static Connection getConnection() throws SQLException {
        return DriverManager.getConnection(url, username, password);
    }
    
    // 资源释放
    public static void release(Connection conn, Statement st, ResultSet rs){
        try {
            if (rs != null)
                rs.close();
            if (st != null)
                st.close();
            if (conn != null)
                conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    // 资源释放多态
    public static void release(Connection conn, Statement st){
        try {
            if (st != null)
                st.close();
            if (conn != null)
                conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    ```



#### 