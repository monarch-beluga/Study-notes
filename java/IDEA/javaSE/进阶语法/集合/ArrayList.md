## List 集合

- 有索引
- 可以存储重复元素
- 元素存入的顺序和实际存储的顺序相同



### ArrayList

#### 创建对象

```java
import java.util.ArrayList;

public class Create {
    public static void main(String[] args) {
        ArrayList list = new ArrayList();
        list.add("monarch");
        list.add(10);
        list.add(12.8);

        ArrayList<String> list1 = new ArrayList<>();
        list1.add("monarch");
//        list1.add(10);
        list1.add("10");
    }
}
```

- 直接创建：集合中可以添加任意类型的对象和数据，较少使用
- 添加 **<>** 创建 ：集合中只能添加指定类型的对象和数据，较为常用



#### 常用方法

```java
import java.util.ArrayList;

public class Method {
    public static void main(String[] args) {
        ArrayList<String> list = new ArrayList<>();
        list.add("monarch");
        list.add("15");
        list.add("男");
        System.out.println("第零个元素是："+list.get(0));
        System.out.println("第一个元素是："+list.get(1));
        list.add(1, "2001");
        System.out.println("第一个元素是："+list.get(1));
        System.out.println("第二个元素是："+list.get(2));
        System.out.println("第三个元素是："+list.get(3));
        String s = list.set(2,"19");
        System.out.println("修改前的元素是："+s);
        System.out.println("修改后的元素是："+list.get(2));
        System.out.println("删除前的第一个元素是："+list.get(1));
        list.remove(1);
        System.out.println("删除后的第一个元素是："+list.get(1));
        System.out.println("list中的元素个数为："+list.size());
        System.out.println("list中是否存在19："+list.contains("19"));
        System.out.println("list中是否存在2001："+list.contains("2001"));
        list.remove("19");
        System.out.println("list中是否存在19："+list.contains("19"));
    }
}
```

![image-20201130122842244](https://img2020.cnblogs.com/blog/2213660/202011/2213660-20201130122844198-812608919.png)

- **add()** ：向 **list** 中添加对象或数据，可以添加到最后面，也可以添加到指定索引
- **set()** ：修改 **list** 中的指定索引对象
- **remove()** ：删除 **list** 中的对象，可以指定索引，也可以直接指定对象
- **size()** ：获取 **list** 中元素个数
- **contains()** ：查看 **list** 中是否有该对象

