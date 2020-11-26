### break

- **break** 在任何循环语句的主体部分，均可用 **break** 控制循环流程， **break** 用于强行退出循环，不执行循环中剩余的语句。

    ```java
    public class Break {
        public static void main(String[] args) {
            int i = 0;
            while (i < 100){
                System.out.print(i + "\t");
                if (i == 20){
                    break;
                }
                i++;
            }
        }
    }
    ```
    
    ![image-20201122125204381](https://img2020.cnblogs.com/blog/2213660/202011/2213660-20201122125204601-1918304788.png)

- 只会跳出循环，不会终止程序



### continue

- **continue** 用于终止某次循环过程，即跳过循环中尚未执行的语句，接着开始下一次是否执行循环的判定

    ```java
    public class Continue {
        public static void main(String[] args) {
            int i =0;
            while (i < 100){
                i++;
                if (i % 10 == 0){
                    System.out.println();
                    continue;
                }
                System.out.print(i+" ");
            }
        }
    }
    ```
    
    ![image-20201122125937843](https://img2020.cnblogs.com/blog/2213660/202011/2213660-20201122125938183-956933410.png)



### goto

- **goto** 很早就开始在程序设计中使用，但是java中并没有正式的使用它

- **java** 中使用 **outer:........continue outer;** 来达到和 **goto** 类似的效果

- 一般不建议使用，代码可读性差

    ```java
    public class LableGoto {
        public static void main(String[] args) {
            // 普通循环
            int count = 0;
            for (int i = 101; i < 150; i++) {
                for (int j = 2; j <= i/2; j++){
                    if (i % j == 0){
                        count = 1;
                        break;
                    }
                }
                if (count == 0)
                    System.out.print(i+"\t");
                count = 0;
            }
            System.out.println();
            System.out.println("===============");
    
            // goto类的标签循环，outer:.... continue outer;
            outer: for (int i = 101; i < 150; i++) {
                for (int j = 2; j <= i/2; j++){
                    if (i % j == 0){
                        continue outer;
                    }
                }
                System.out.print(i+"\t");
            }
        }
    }
    ```
    
    ![image-20201122131425285](https://img2020.cnblogs.com/blog/2213660/202011/2213660-20201122131425522-178092919.png)

    

