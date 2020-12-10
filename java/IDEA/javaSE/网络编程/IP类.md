## IP类

java.net 包下面全是关于网络编程的类

其中 **InetAddress** 是关于 **IP** 的类

#### 用处

- 唯一定位一台网络上计算机

- 127.0.0.1 ：表示本机 **IP**  名称为 **localhost** 

- 分类

    - 通过 **IP** 地址分类：**IPv4 / IPv6**

        - **IPv4** : 如 127.0.0.1， 由四个字节组成，每一个字节由 **0-255** ，总共有 42亿多个，北美30亿，亚洲4亿，2011年用尽

        - **IPv6** ：128位，8个无符号整数 如

            ```
            2001:0bb2:aaaa:0015:0000:0000:1aaa:1312
            // 压缩
            fe80:0000:0000:0000:a56d:aefc:bc06:
            fe80::a56d:aefc:bc06:ba6%14
            ```

    - **公网（互联网）- 私网（局域网）** 

        - ABCD类地址
        - 192.168.xx.xx，专门给组织内部使用的

- 域名：记忆IP问题！



```java
import java.net.InetAddress;
import java.net.UnknownHostException;

public class TextInetAddress {
    public static void main(String[] args) {
        try {
            InetAddress inetAddress1 = InetAddress.getByName("127.0.0.1");
            System.out.println(inetAddress1);
            InetAddress inetAddress2 = InetAddress.getByName("localhost");
            System.out.println(inetAddress2);
            InetAddress inetAddress4 = InetAddress.getLocalHost();
            System.out.println(inetAddress4);

            InetAddress inetAddress3 = InetAddress.getByName("www.baidu.com");
            System.out.println(inetAddress3);

            System.out.println(inetAddress3.getCanonicalHostName());
            System.out.println(inetAddress3.getHostAddress());
            System.out.println(inetAddress3.getHostName());
        } catch (UnknownHostException e) {
            e.printStackTrace();
        }
    }
}
```

- **InetAddress** : 关于 **IP** 的类
- **getByName()** ：根据 **域名** 获取 **ip** ，当域名为本地计算机名时，可以获取本地 **ip** ，当域名为 **localhost** 时，获得 **127.0.0.1** 
- **getLocalHost()** ：获取本地ip
- **getCanonicalHostName()** ：获取规范名 **ip** 
- **getHostAddress** ：获取 **ip** 
- **getHostName()** ：获取主机名