## Scanner对象

**用Scanner类获取用户的输入** 

#### 基本语法

```java
Scanner s = new Scanner(System.in)
```

**通过Scanner类的next()与nextLine方法获取输入的字符串，在读取前我们一般需要使用hasNext()与 hasNexLine()判断是否还有输入的数据** 



#### 简单使用next()接收输入

```java
package com.Monarch.ProcessControl;

import java.util.Scanner;

public class Interactive {
    public static void main(String[] args) {

        Scanner scanner = new Scanner(System.in);

        System.out.println("使用next方式接收：");

        if (scanner.hasNext()){
            String str = scanner.next();
            System.out.println("输入的内容为："+str);
        }

        scanner.close();
    }
}
```

![image-20201121223033122](https://img2020.cnblogs.com/blog/2213660/202011/2213660-20201121223033680-1424915324.png)

- 导入Scanner类

    ```java
    import java.util.Scanner;
    ```

-  创建一个扫描器对象，用于接收键盘数据

    ```java
    Scanner scanner = new Scanner(System.in);
    ```

-  判断用户有没有输入字符串，使用next方式接收

    ```java
    if (scanner.hasNext()){
        String str = scanner.next();
        System.out.println("输入的内容为："+str);
    }
    ```

-  关闭Scanner对象，凡是属于IO流的类如果不关闭会一直占用资源

    ```java
    scanner.close();
    ```



#### 简单使用nextLine接收输入

```java
package com.Monarch.ProcessControl.Scanner;

import java.util.Scanner;

public class InteractiveNextLine {
    public static void main(String[] args) {

        Scanner scanner = new Scanner(System.in);

        System.out.println("使用nextLine方式接收：");

        if (scanner.hasNext()){
            String str = scanner.nextLine();
            System.out.println("输入的内容为："+str);
        }

        scanner.close();
    }
}
```

![image-20201121223240938](https://img2020.cnblogs.com/blog/2213660/202011/2213660-20201121223241462-500141773.png)

- 其他地方都一样

- 使用nextLine接收

    ```java
    String str = scanner.nextLine();
    ```



### 两者的区别

- **next():** 
    - 一定要读取到有效字符后才可以结束输入
    - 对输入有效字符之前遇到的空白，next()方法会自动将其去掉
    - 只有输入有效字符后才将其后面输入的空白作为分隔符或者结束符
    - next() **不能得到** 带有 **空格** 的字符串
- **nextLine():** 
    - 以Enter为结束符，也就是说 **nextLine()** 方法返回的是输入回车之前的所有字符
    - 可以获得空白



#### 常见用法

```java
package com.Monarch.ProcessControl.Scanner;

import java.util.Scanner;

public class InteractiveOrdinary {
    public static void main(String[] args) {

        Scanner scanner = new Scanner(System.in);

        System.out.println("请输入数据：");
        String str = scanner.nextLine();
        System.out.println("输入的内容为："+str);
        System.out.println("================");

        int i = 0;
        System.out.println("请输入整数数据：");
        if (scanner.hasNextInt()){
            i = scanner.nextInt();
            System.out.println("整数数据："+i);
        }
        else{
            System.out.println("输入的不是整数数据");
        }
        System.out.println("================");

        float f = 0.0f;
        System.out.println("请输入小数：");
        if (scanner.hasNextFloat()){
            f = scanner.nextFloat();
            System.out.println("小数数据："+f);
        }
        else{
            System.out.println("输入的不是小数数据");
        }
        System.out.println("================");

        scanner.close();
    }
}

```

![image-20201121230118997](https://img2020.cnblogs.com/blog/2213660/202011/2213660-20201121230119593-792311442.png)

- **nextLine()** 获取字符串
- **nextInt** 获取整数
- **nextFloat** 获取浮点型
- **next** + **数据类型的首字母大写** 就是获取该类型数据
- **hasnext** + **数据类型的首字母大写** 判断是否有该类型输入，返回布尔值



### 实例

```java
package com.Monarch.ProcessControl.Scanner;

import java.util.Scanner;

public class ScannerInstance {
    public static void main(String[] args) {
        // 可以输入多个数字，并求出总和与平均数
        // 每输入一个数字用回车确认，通过输入非数字来结束输入并输出执行结果
        Scanner scanner = new Scanner(System.in);

        double sum = 0;
        int m = 0;

        // 通过循环来实现持续和结束输出
        // 用scanner.hasNextDouble()来判断是否有数值的输入
        System.out.println("请输入数值：");
        while (scanner.hasNextDouble()){
            double x = scanner.nextDouble();
            m++;
            sum += x;
            System.out.println("你输入了第"+m+"个数据，然后当前结果sum="+sum+",平均数为："+sum/m);
        }

        System.out.println(m + "个数的和为：" + sum);
        System.out.println(m + "个数的平均数是：" + sum/m);

        scanner.close();
    }
}
```

![image-20201121232208393](https://img2020.cnblogs.com/blog/2213660/202011/2213660-20201121232208800-1659840356.png)

