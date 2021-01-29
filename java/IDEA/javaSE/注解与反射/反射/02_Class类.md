## Class类

对象照镜子后可以得到的信息：某个类的属性、方法和构造器、某个类到底实现了哪些接口。对于每个类而言，**JRE** 都为其保留一个不变的 **Class** 类型的对象。一个 **Class** 对象包含了特定某个结构**(class/interface/enum/annotation/primitive type/void/[])** 的相关信息。

- **Class** 本身也是一个类
- **Class** 对象只能由系统建立对象
- 一个加载的类在 **JVM** 中只会有一个 Class 实例
- 一个 **Class** 对像对应的是一个加载到 **JVM** 中的一个 **.class** 文件
- 每个类的实例都会记得自己是由哪个 **Class** 实例所生成
- 通过 **Class** 可以完整地得到一个类中的所有被加载的结构
- **Class** 类是 **Reflection** 的根源， 针对任何你想动态加载、运行的类，唯有先获得相应的 **Class** 对像



### Class类的常用方法

![image-20210129190353788](https://img2020.cnblogs.com/blog/2213660/202101/2213660-20210129190355860-963696574.png)

- 若已知具体的类，通过类的class属性获取， 该方法最为安全可靠，程序性能最高

```java
Class clazz = Person.class;
```

- 已知某个类的实例，调用该实例的 **getClass()** 方法获取 **Class** 对像

```java
Class clazz = person.getClass()
```

- 已知一个类的全类名，且该类在类路径下，可通过 **Class** 类的静态方法 **forName()** 获取，可能抛出 **ClassNotFoundException** 异常

```java
Class clazz = Class.forName("demo01.Student")
```

- 内置基本数据类型可以直接用 **类名.Type** 
- 还可以利用 **ClassLoader** 

```java
package Com.Monarch.Reflection;

public class Class_create {
    public static void main(String[] args) throws ClassNotFoundException {
        Person person = new Student();
        System.out.println("这个人是："+person.name);

        // 方式一：通过对象获得
        Class c1 = person.getClass();
        System.out.println(c1.hashCode());

        // 方式二：通过forName获得
        Class c2 = Class.forName("Com.Monarch.Reflection.Student");
        System.out.println(c2.hashCode());

        // 方式三：通过类名.class获得
        Class c3 = Student.class;
        System.out.println(c3.hashCode());

        // 方式四：基本内置类型的包装类都有一个Type属性
        Class c4 = Integer.TYPE;
        System.out.println(c4);

        // 获得父类类型
        Class c5 = c1.getSuperclass();
        System.out.println(c5);
    }
}

class Person{
    String name;

    public Person() {
    }

    public Person(String name) {
        this.name = name;
    }

    @Override
    public String toString() {
        return "Person{" +
                "name='" + name + '\'' +
                '}';
    }
}

class Student extends Person{
    public Student(){
        this.name = "学生";
    }
}

class Teacher extends Person{
    public Teacher(){
        this.name = "老师";
    }
}
```

![image-20210129192515745](https://img2020.cnblogs.com/blog/2213660/202101/2213660-20210129192517300-2019496335.png)