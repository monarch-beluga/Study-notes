## String

一般将 **String** 当做数据类型来使用

**Ctrl+P** : 查看方法参数信息

### 对象创建

```java
public class Create {
    public static void main(String[] args) {
        String name = "Monarch";
        System.out.println(name);
        String s = new String();
        System.out.println(s);
        byte[] b = {97,98,99};
        String s1 = new String(b);
        System.out.println(s1);
        String s2 = new String(b, 1, 2);
        System.out.println(s2);
        char[] chars = {'a','b','c','d'};
        String s3 = new String(chars);
        System.out.println(s3);
        String s4 = new String(chars, 1, 2);
        System.out.println(s4);
    }
}
```

![image-20201129205321585](https://img2020.cnblogs.com/blog/2213660/202011/2213660-20201129205322775-520497139.png) 

- 直接定义String类型的变量
- 构造方法
    - 空参构造：构造的结果是一个空字符
    - 有参构造：有许多重载方法



### 常用方法

**.var** 自动确定并创建数据类型

- **split()** : 以指定分隔符来分割字符串，返回值为一个 String类数组

    ```java
    public class SplitMethod {
        public static void main(String[] args) {
            String s = "monarch+男+15";
            String[] strs = s.split("\\+");
            for (String str : strs) {
                System.out.println(str);
            }
            System.out.println(s);
        }
    }
    ```

    ![image-20201129211452329](https://img2020.cnblogs.com/blog/2213660/202011/2213660-20201129211453545-1198649707.png)

    分隔符实际上为一个正则表达式，所以当遇到 **.  ?  *  +** 等在正则中有特殊含义的字符时，在其前面加 **\\\\** 来进行转义，从而规避错误

- **toCharArray()** ：将字符串转化为一个 char类型的数组

    ```java
    public class ToCharArrayMethod {
        public static void main(String[] args) {
            String s = "abcd";
            char[] chars = s.toCharArray();
            for (char aChar : chars) {
                System.out.print(aChar + "\t");
            }
            System.out.println();
            System.out.println(s);
        }
    }
    ```

    ![image-20201129211916569](https://img2020.cnblogs.com/blog/2213660/202011/2213660-20201129211917700-975145822.png)

- **getBytes()** ：将字符串转化为 byte数组

    ```java
    public class GetBytesMethod {
        public static void main(String[] args) {
            String s = "abcd";
            byte[] bytes = s.getBytes();
            for (byte aByte : bytes) {
                System.out.print(aByte + "\t");
            }
            System.out.println();
            System.out.println(s);
        }
    }
    ```

    ![image-20201129213014380](https://img2020.cnblogs.com/blog/2213660/202011/2213660-20201129213015609-1897191245.png)

- **substring()** : 按索引截取字符

    ```java
    public class SubstringMethod {
        public static void main(String[] args) {
            String s = "abcd";
            String s1 = s.substring(1);
            System.out.println(s1);
            String s2 = s.substring(1, 3);
            System.out.println(s2);
            System.out.println(s);
        }
    }
    ```

    ![image-20201129214127799](https://img2020.cnblogs.com/blog/2213660/202011/2213660-20201129214129020-1588663760.png)

- **equals()** ：比较字符串是否相同，可以直接用 **==** 

    ```java
    public class EqualsMethod {
        public static void main(String[] args) {
            String s = "张三";
            String s1 = "张三";
            String s2 = "李四";
            System.out.println(s.equals(s1));
            System.out.println(s == s1);
            System.out.println(s.equals(s2));
            System.out.println(s == s2);
        }
    }
    ```

    ![image-20201129214842137](https://img2020.cnblogs.com/blog/2213660/202011/2213660-20201129214843343-79703231.png)



**一个字符串创建后，无论怎么使用都不会改变内容，每一次赋值都是创建一个新的字符串** 

**字符串的效果相当于是一个char[]字符数组，但最底层其实是一个byte[]字节数组** 



### 添加方法

- **contains()**  : 判断字符串是否包含某一字符串
- **endsWith()** ：判断字符串是否为某一字符串结尾
- **starsWith()** : 判断字符串是否为某一字符串开头