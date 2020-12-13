## Lambda表达式

**Functional interface** （函数式接口） 是 Lambda 表达式的关键

- **函数式接口** 的定义
    - 任何接口，如果只包含 **唯一一个** 抽象方法，那么他就是一个函数式接口，比如 **Runnable** 接口
    - 对于函数是接口，我们可以通过Lambda表达式来创建该接口的对象

```java
public class Lambda {
    public static void main(String[] args) {
        ILike like = new Like();
        like.lambda();

        like = new Like2();
        like.lambda();

        // 局部内部类
        class Like3 implements ILike{

            @Override
            public void lambda() {
                System.out.println("I like lambda3");
            }
        }
        like = new Like3();
        like.lambda();

        // 匿名内部类
        like = new ILike() {
            @Override
            public void lambda() {
                System.out.println("I like lambda4");
            }
        };
        like.lambda();

        // Lambda表达式
        like = () -> {
            System.out.println("I like lambda5");
        };
        like.lambda();
    }
    // 静态内部类
    static class Like2 implements ILike{

        @Override
        public void lambda() {
            System.out.println("I like lambda2");
        }
    }
}

interface ILike{
    void lambda();
}
// 实现类
class Like implements ILike{

    @Override
    public void lambda() {
        System.out.println("I like lambda1");
    }
}
```

![image-20201212230543858](https://img2020.cnblogs.com/blog/2213660/202012/2213660-20201212230545142-1201231671.png)

语法格式：

**(parameters) -> expression** 

**(parameters) ->{ statements; }** 

```java
public class TestLambda {
    public static void main(String[] args) {
        ILove love = new Love();
        love.love(1);
        love = a -> {
            love1(a);
            love1(a);
        };
        love.love(2);
    }
    static public void love1(int a) {
        System.out.println("I love you——>"+a);
    }
}

interface ILove{
    void love(int a);
}

class Love implements ILove{

    @Override
    public void love(int a) {
        System.out.println("I love you——>"+a);
    }
}
```

