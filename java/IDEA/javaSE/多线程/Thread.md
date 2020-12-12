## Thread

```java
public class TestThread1 extends Thread{
    @Override
    public void run() {
        for (int i = 0; i < 5; i++) {
            try {
                sleep(100);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
            System.out.println("我在看代码——"+i);
        }
    }

    public static void main(String[] args) throws InterruptedException {
        TestThread1 thread1 = new TestThread1();

        thread1.start();
        // thread1.run();

        for (int i = 0; i < 5; i++) {
            sleep(100);
            System.out.println("我在学习多线程——"+i);
        }
    }
}
```

![image-20201212111215465](https://img2020.cnblogs.com/blog/2213660/202012/2213660-20201212111216478-609764954.png)

- 通过继承 **Thread** 类，并重写 **run** 方法来创建
- 调用 **start()** 方法来执行多线程
- 线程开辟之后并不会立即执行，而是由CPU调度执行



#### 网图下载

```java
import org.apache.commons.io.FileUtils;

import java.io.File;
import java.io.IOException;
import java.net.URL;

public class TestThread2 extends Thread{
    private String url;
    private String name;

    public TestThread2(String url, String name) {
        this.url = url;
        this.name = name;
    }

    @Override
    public void run() {
        WebDownloader downloader = new WebDownloader();
        downloader.downloader(url, name);
        System.out.println("下载文件名为："+name);
    }

    public static void main(String[] args) {
        TestThread2 thread1 = new TestThread2("https://img2020.cnblogs.com/blog/2213660/202012/2213660-20201212111216478-609764954.png", "多线程/image/1.png");
        TestThread2 thread2 = new TestThread2("https://img2020.cnblogs.com/blog/2213660/202011/2213660-20201129222930724-678630901.png", "多线程/image/2.png");
        TestThread2 thread3 = new TestThread2("https://img2020.cnblogs.com/blog/2213660/202011/2213660-20201129221933721-552034182.png", "多线程/image/3.png");
        thread1.start();
        thread2.start();
        thread3.start();
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

![image-20201212115508094](https://img2020.cnblogs.com/blog/2213660/202012/2213660-20201212115509039-267202544.png)

- 首先需要在网上下载 **commons.io** 这个类，并将类放置在项目中，并点击 Add as Library,将包导入

    ![image-20201212114856523](https://img2020.cnblogs.com/blog/2213660/202012/2213660-20201212114857488-1486777504.png)

    ![image-20201212114931312](https://img2020.cnblogs.com/blog/2213660/202012/2213660-20201212114932245-1597870041.png) ![image-20201212114951163](https://img2020.cnblogs.com/blog/2213660/202012/2213660-20201212114952106-1655117071.png)
    
- **commons.io** 是一个写好的从网络下载资源的包

- **FileUtils.copyURLToFile** ：为包内的方法

