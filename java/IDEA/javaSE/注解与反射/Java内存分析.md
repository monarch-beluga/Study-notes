## Java内存分析

![image-20210130200513775](https://img2020.cnblogs.com/blog/2213660/202101/2213660-20210130200517206-1136217169.png)

### Java内存

分为 **方法区，栈，堆** 

#### 堆

- 存放new的对象和数组

- 可以被所有的线程共享，不会存放别的对象引用

#### 栈

- 存放基本变量类型(会包含这个基本类型的具体数值)
- 引用对象的变量(会存放这个引用在堆里面的具体地址)

#### 方法区

- 可以被所有的线程共享
- 包含了所有的 **class** 和 **static** 变量



### 类加载的过程

![image-20210130202032922](https://img2020.cnblogs.com/blog/2213660/202101/2213660-20210130202035720-949852159.png)

- 当程序主动使用某个类时，如果该类还未被加载到内存中，则系统会通过如上三个步骤来对该类进行初始化

- **加载** ：将 **class** 文件字节码内容加载到内存中，并将这些静态数据转换成方法区的运行时数据结构，然后生成一个代表这个类的 **java.lang.Class** 对象
- **链接** ：将 **Java** 类的二进制代码合并到 **JVM** 的运行状态之中的过程
    - **验证** ：确保加载的类信息符合 **JVM** 规范，没有安全方面的问题
    - **准确** ：正式为类变量(static)分配内存并设置类变量默认初始值的阶段，这些内存都将在方法区中进行分配。
    - **解析** ：虚拟机常量池内的符号引用(常量名)替换为直接引用(地址)的过程
- **初始化** ：
    - 执行类构造器\<clinit>()方法的过程。类构造器\<clinit>()方法是由编译期自动收集类中所有类变量的赋值动作和静态代码块中的语句合并产生的。(类构造器时构造类信息的，不是构造该类对象的构造器)。
    - 当初始化一个类的时候，如果发现其父类还没有进行初始化，则需要先触发其父类的初始化
    - 虚拟机会保证一个类的\<clinit>()方法在多线程环境中被正确加锁和同步

```java
public class ClassLoading {
    public static void main(String[] args) {
        A a = new A();
        System.out.println(A.m);


        /*
        1. 加载到内存，会产生一个类对应Class对象
        2. 链接，链接结束后 m = 0
        3. 初始化
            <clinit>(){
                        System.out.println("A类静态代码块初始化");
                        m = 300;
                        m = 100;
            }
         4. 最终 m = 100
         */
    }
}

class A{
    static {
        System.out.println("A类静态代码块初始化");
        m = 300;
    }

    static int m = 100;

    public A(){
        System.out.println("A类的无参构造初始化");
    }
}
```

![image-20210130204257128](https://img2020.cnblogs.com/blog/2213660/202101/2213660-20210130204259510-1784610079.png)



### 类的初始化

- 类的主动引用(一定会发生类的初始化)
    - 当虚拟机启动，先初始化main方法所在的类
    - new一个类的对象
    - 调用类的静态成员(除了final常量)和静态方法
    - 使用java.lang.reflect包的方法对类进行反射调用
    - 当初始化一个类，如果其父类没有被初始化，则先会初始化它的父类
- 类的被动引用(不会发生类的初始化)
    - 当访问一个静态域时，只有真正声明这个域的类才会被初始化。如：当通过子类引用父类的静态变量，不会导致子类初始化
    - 通过数组定义类引用，不会触发此类的初始化
    - 引用常量不会触发此类的初始化(常量在链接阶段就存入调用类的常量池中了)

```java
public class ClassInitialization {
    static {
        System.out.println("Main类被加载");
    }
    public static void main(String[] args) throws ClassNotFoundException {
        // 会产生类的引用的方法
        // 1. 主动引用
        // Son son = new Son();
        // 2. 反射
        // Class.forName("Com.Monarch.Reflection.Son");

        // 不会产生类的引用的方法
        // 1. 父类的静态域
        // System.out.println(Son.b);
        // 2. 数组
        // Son[] array = new Son[5];
        // 3. 常量
        System.out.println(Son.M);

    }
}

class Father{
    static int b = 2;

    static {
        System.out.println("父类被加载");
    }
}

class Son extends Father{
    static {
        System.out.println("子类被加载");
        m = 300;
    }
    static int m = 100;
    static final int M = 1;
}
```



### 类加载器的作用

- **类加载的作用** ：将 **class** 文件字节码内容加载到内存中，并将这些静态数据转换成方法区的运行时数据结构，然后在堆中生成一个代表这个类的 **java.lang.Class** 对象，作为方法区中类数据的访问入口
- **类缓存** ：标准的 **JavaSE** 类加载器可以按要求查找类，但一旦某个类被加载到类加载器中，它将维持加载(缓存)一段时间。不过 **JVM** 垃圾回收机制可以回收这些 **Class** 对象

![image-20210204112236262](https://img2020.cnblogs.com/blog/2213660/202102/2213660-20210204112237564-45191616.png)

- 类加载器作用是把类(class)装载进内存的。 JVM 规范定义了如下类型的类的加载器。

![image-20210204112533696](https://img2020.cnblogs.com/blog/2213660/202102/2213660-20210204112534748-445091962.png)

```
package Com.Monarch.Reflection;

public class LoaderClass {
    public static void main(String[] args) throws ClassNotFoundException {

        // 获取系统类的加载器
        ClassLoader systemClassLoader = ClassLoader.getSystemClassLoader();
        System.out.println(systemClassLoader);

        // 获取系统类加载器的父类加载器--> 扩展类加载器
        ClassLoader parent = systemClassLoader.getParent();
        System.out.println(parent);

        // 获取扩展类加载器的父类加载器--> 根加载器(C/C++)
        ClassLoader parent1 = parent.getParent();
        System.out.println(parent1);

        // 测试当前类是那个加载器加载的
        ClassLoader classLoader = Class.forName("Com.Monarch.Reflection.LoaderClass").getClassLoader();
        System.out.println(classLoader);

        // 测试 JDK 内置类是谁加载的
        classLoader = Class.forName("java.lang.Object").getClassLoader();
        System.out.println(classLoader);

        // 如何获得系统类加载器可以加载的路径
        System.out.println(System.getProperty("java.class.path"));
        /*
        E:\java\jdk8\jre\lib\charsets.jar;
        E:\java\jdk8\jre\lib\deploy.jar;
        E:\java\jdk8\jre\lib\ext\access-bridge-64.jar;
        E:\java\jdk8\jre\lib\ext\cldrdata.jar;
        E:\java\jdk8\jre\lib\ext\dnsns.jar;
        E:\java\jdk8\jre\lib\ext\jaccess.jar;
        E:\java\jdk8\jre\lib\ext\jfxrt.jar;
        E:\java\jdk8\jre\lib\ext\localedata.jar;
        E:\java\jdk8\jre\lib\ext\nashorn.jar;
        E:\java\jdk8\jre\lib\ext\sunec.jar;
        E:\java\jdk8\jre\lib\ext\sunjce_provider.jar;
        E:\java\jdk8\jre\lib\ext\sunmscapi.jar;
        E:\java\jdk8\jre\lib\ext\sunpkcs11.jar;
        E:\java\jdk8\jre\lib\ext\zipfs.jar;
        E:\java\jdk8\jre\lib\javaws.jar;
        E:\java\jdk8\jre\lib\jce.jar;
        E:\java\jdk8\jre\lib\jfr.jar;
        E:\java\jdk8\jre\lib\jfxswt.jar;
        E:\java\jdk8\jre\lib\jsse.jar;
        E:\java\jdk8\jre\lib\management-agent.jar;
        E:\java\jdk8\jre\lib\plugin.jar;
        E:\java\jdk8\jre\lib\resources.jar;
        E:\java\jdk8\jre\lib\rt.jar;
        E:\study\java\IntelliJ_IDEA\project\javaSE\out\production\注解与反射;
        E:\study\java\IntelliJ_IDEA\lib\idea_rt.jar
         */
    }
}
```

![image-20210204114808415](https://img2020.cnblogs.com/blog/2213660/202102/2213660-20210204114810000-1401083564.png)