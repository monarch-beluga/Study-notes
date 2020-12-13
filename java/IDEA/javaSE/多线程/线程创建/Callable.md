## Callable

```java
import org.apache.commons.io.FileUtils;

import java.io.File;
import java.io.IOException;
import java.net.URL;
import java.util.concurrent.*;

public class CreateCallable {
    public static void main(String[] args) throws ExecutionException, InterruptedException {
        MyCallable runner1 = new MyCallable("https://img2020.cnblogs.com/blog/2213660/202012/2213660-20201212111216478-609764954.png", "多线程/image/1.png");
        MyCallable runner2 = new MyCallable("https://img2020.cnblogs.com/blog/2213660/202011/2213660-20201129222930724-678630901.png", "多线程/image/2.png");
        MyCallable runner3 = new MyCallable("https://img2020.cnblogs.com/blog/2213660/202011/2213660-20201129221933721-552034182.png", "多线程/image/3.png");

        ExecutorService ser = Executors.newFixedThreadPool(3);
        Future<Boolean> r1 = ser.submit(runner1);
        Future<Boolean> r2 = ser.submit(runner2);
        Future<Boolean> r3 = ser.submit(runner3);

        boolean rs1 = r1.get();
        boolean rs2 = r2.get();
        boolean rs3 = r3.get();

        System.out.println(rs1);
        System.out.println(rs2);
        System.out.println(rs3);

        ser.shutdownNow();
    }
}
class MyCallable implements Callable<Boolean>{
    private final String url;
    private final String name;

    public MyCallable(String url, String name) {
        this.url = url;
        this.name = name;
    }

    @Override
    public Boolean call() throws Exception {
        WebDownloader downloader = new WebDownloader();
        downloader.downloader(url, name);
        System.out.println("下载文件名为："+name);
        return true;
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

- 与其他两个不同的是，**Callable** 接口的多线程可以有返回值
- **Callable** 需要开启一个线程池，然后将**Callable** 事件放入线程池中执行，最后关闭线程池