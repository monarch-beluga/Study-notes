## 实现Runable接口

```java
public class Create implements Runnable{
    @Override
    public void run() {
        for (int i = 0; i < 5; i++) {
            try {
                Thread.sleep(100);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
            System.out.println("我在看代码——"+i);
        }
    }
    public static void main(String[] args) throws InterruptedException {
        Create create = new Create();
        Thread thread = new Thread(create);
        thread.start();
        for (int i = 0; i < 5; i++) {
            Thread.sleep(100);
            System.out.println("我在学习多线程——"+i);
        }
    }
}
```

- 先继承 **Runnable** 接口，然后重写 **run()** 方法，接着用重写的类为参数创建一个 **Thread** 类并执行 **start()** 方法

```java
import org.apache.commons.io.FileUtils;

import java.io.File;
import java.io.IOException;
import java.net.URL;

public class TestCreate {
    public static void main(String[] args) {
        MyRunner runner1 = new MyRunner("https://img2020.cnblogs.com/blog/2213660/202012/2213660-20201212111216478-609764954.png", "多线程/image/1.png");
        MyRunner runner2 = new MyRunner("https://img2020.cnblogs.com/blog/2213660/202011/2213660-20201129222930724-678630901.png", "多线程/image/2.png");
        MyRunner runner3 = new MyRunner("https://img2020.cnblogs.com/blog/2213660/202011/2213660-20201129221933721-552034182.png", "多线程/image/3.png");
        new Thread(runner1).start();
        new Thread(runner2).start();
        new Thread(runner3).start();
    }
}

class MyRunner implements Runnable{
    private final String url;
    private final String name;

    MyRunner(String url, String name) {
        this.url = url;
        this.name = name;
    }

    @Override
    public void run() {
        WebDownloader downloader = new WebDownloader();
        downloader.downloader(url, name);
        System.out.println("下载文件名为："+name);
    }
}

class WebDownloader{
    public void downloader(String url, String name){
        try {
            FileUtils.copyURLToFile(new URL(url), new File(name));
        } catch (IOException e) {
            System.out.println("IO异常，downloader方法异常");
        }
    }
}
```

- 由于java单继承的局限性，所以一般建议使用实现 **Runnable** 接口的方式开启多线程