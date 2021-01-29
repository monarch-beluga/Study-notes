## URL

统一资源定位符：定位资源

---

```
协议：//ip地址：端口/项目名/资源
```

```java
import java.net.MalformedURLException;
import java.net.URL;

public class TestURL1 {
    public static void main(String[] args) throws MalformedURLException {
        URL url = new URL("http://localhost:8080/helloworld/index.jsp?username=Monarch&password=123");
        System.out.println(url.getProtocol());  // 协议
        System.out.println(url.getHost());  // 主机ip
        System.out.println(url.getPort());  // 端口
        System.out.println(url.getPath());  // 文件
        System.out.println(url.getFile());  // 全路径
        System.out.println(url.getQuery()); // 参数
    }
```

- **getProtocol()** ：获取协议



### 获取网络资源

```java
import javax.net.ssl.HttpsURLConnection;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URL;

public class TestRUL3 {
    public static void main(String[] args) throws IOException {
        URL url = new URL("https://m801.music.126.net/20201217221938/c57b7685c977ee11518b49a492e83b33/jdyyaac/obj/w5rDlsOJwrLDjj7CmsOj/5286158199/9170/d14e/9c9b/2c71d6ffd1365c412b71db7b27ae3dd7.m4a");

        HttpsURLConnection urlConnection = (HttpsURLConnection) url.openConnection();

        InputStream is = urlConnection.getInputStream();

        FileOutputStream fos = new FileOutputStream("网络编程/像一道光.m4a");

        byte[] buffer = new byte[1024];
        int len;
        while ((len = is.read(buffer)) != -1){
            fos.write(buffer, 0, len);
        }

        fos.close();
        is.close();
        urlConnection.disconnect();
    }
}
```

- **HttpsURLConnection** ：访问HTTPS协议的URL类
- **disconnect()** ：关闭上述类