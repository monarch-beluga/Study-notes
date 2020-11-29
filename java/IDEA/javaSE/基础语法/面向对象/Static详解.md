## Static

### 静态方法和属性

- 跟随类一起加载，可以直接用类名调用，所有对象可以共同使用一个静态属性和方法

```java
public class Student {
    private static int age = 13;
    private double score = 99.5;

    public static void run(){
        System.out.println("run");
    }
    public void go(){
        System.out.println("go");
    }

    public static void main(String[] args) {
        Student s1 = new Student();
        System.out.println(Student.age);
        System.out.println(s1.age);
//        System.out.println(Student.score);
        System.out.println(s1.score);
        Student.run();
        s1.run();
//        Student.go();
        s1.go();
    }
}
```

![image-20201128205545161](https://img2020.cnblogs.com/blog/2213660/202011/2213660-20201128205546729-1776264996.png) 



### 静态代码块

- 匿名代码块：无修饰符，无名称，在建立对象时会自动调用，且比构造方法先调用
- 静态代码块：static修饰符，无名称，在类加载时会自动调用，比匿名代码块先调用，且只调用一次(类只会加载一次)

```java
public class Person {
    {
        System.out.println("匿名代码块");
    }
    static {
        System.out.println("静态代码块");
    }

    public Person() {
        System.out.println("构造方法");
    }

    public static void main(String[] args) {
        Person person = new Person();
        System.out.println("=============");
        Person person1 = new Person();
    }
}
```

![image-20201128205945768](https://img2020.cnblogs.com/blog/2213660/202011/2213660-20201128205947213-1547299916.png)



### 静态导入包

**import static 包名.方法名** 

静态导入后的方法和属性可以直接使用，不需要再加上包名

```java
import static java.lang.Math.random;
import static java.lang.Math.PI;

public class Test {
    public static void main(String[] args) {
        // random()产生随机数
        System.out.println(Math.random());
        System.out.println(random());
        System.out.println(Math.PI);
        System.out.println(PI);
    }
}
```

![image-20201128210527046](https://img2020.cnblogs.com/blog/2213660/202011/2213660-20201128210528467-779886468.png)

