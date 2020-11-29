## Object

在 **JDK** 的java.lang包下定义了 **Object** 类。

java中所有的类都直接或者间接继承 **Object** 类，所有任意类的对象都可以使用 **Object** 类中定义的方法。



### 常用方法

- **toString()** : 获取对象信息，返回该对象的字符串表示(返回地址)

    内部实现如下
    
    ```java
    public String toString() {
        return getClass().getName() + "@" + Integer.toHexString(hashCode());
    }
    ```
    
    调用
    
    ```java
    public class ToString {
        public static void main(String[] args) {
            Object o = new Object();
            System.out.println(o.toString());
    
        }
    }
    ```
    
    ![image-20201129202150961](https://img2020.cnblogs.com/blog/2213660/202011/2213660-20201129202152275-2027048405.png) 
    
- **equals(Obejct)** ：比较两个引用对象是否相等

    内部实现

    ```java
    public boolean equals(Object obj) {
        return (this == obj);
    }
    ```

    调用

    ```java
    public class Equals {
        public static void main(String[] args) {
            Equals equals = new Equals();
            Equals equals1 = equals;
            Equals equals2 = new Equals();
            System.out.println(equals.equals(equals1));
            System.out.println(equals.equals(equals2));
        }
    }
    ```

    ![image-20201129202739757](https://img2020.cnblogs.com/blog/2213660/202011/2213660-20201129202740949-1391391507.png) 



**上述两个方法一般会进行重写** 

