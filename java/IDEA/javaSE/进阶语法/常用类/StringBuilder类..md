## StringBuilder

用来进行字符串拼接，普通的用 **+** 来拼接字符串会导致许多的内存占用

### 创建对象

```java
public class Create {
    public static void main(String[] args) {
        StringBuilder stringBuilder = new StringBuilder("monarch");
        System.out.println(stringBuilder);
        StringBuilder stringBuilder1 = new StringBuilder();
        System.out.println(stringBuilder1);
    }
}
```

![image-20201130112800568](https://img2020.cnblogs.com/blog/2213660/202011/2213660-20201130112802518-1459993123.png)

- 有参构造和空参构造



### 常用方法

```java
public class Method {
    public static void main(String[] args) {
        StringBuilder stringBuilder = new StringBuilder();
        StringBuilder stringBuilder1 = new StringBuilder();
        stringBuilder.append("monarch,");
        stringBuilder.append(15);
        stringBuilder.append(",男");
        System.out.println(stringBuilder);
        stringBuilder.reverse();
        System.out.println(stringBuilder);
        String s = stringBuilder.toString();
        System.out.println(s);
        System.out.println("=================");
        stringBuilder1.append(21).append(12).append(32);
        System.out.println(stringBuilder1);
    }
}
```

![image-20201130113952689](https://img2020.cnblogs.com/blog/2213660/202011/2213660-20201130113954612-58716540.png)

- **append()** : 拼接字符
- **reverse()** : 反转字符串
- **toString()** ：将 **StringBuilder** 对象转换为 **String** 对象

