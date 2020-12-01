## File类

文件、文件夹，一个File对象代表磁盘上某个文件或者文件夹



### 构造方法

```java
import java.io.File;

public class Create {
    public static void main(String[] args) {
        File file = new File("E:\\temp\\a.txt");
        System.out.println("file："+file);
        System.out.println("==============");
        File file1 = new File("E:\\temp\\", "a.txt");
        System.out.println("file1："+file1);
        System.out.println("==============");
        File path = new File("E:\\temp\\");
        File file2 = new File(path, "a.txt");
        System.out.println("file2："+file2);
        System.out.println("==============");
    }
}
```

![image-20201201105455885](https://img2020.cnblogs.com/blog/2213660/202012/2213660-20201201105457523-1993059295.png)

- **File(String pathname)** 
- **File(String parent, String child)**  
- **File(File parent, String child)**  



### 成员方法

#### 文件创建和判断

```
import java.io.File;
import java.io.IOException;

public class Method {
    public static void main(String[] args) {
        String s = "E:\\temp\\b.txt";
        File file3 = new File(s);
        System.out.println(s+"该文件是否存在："+file3.exists());
        try {
            boolean newFile = file3.createNewFile();
        } catch (IOException e) {
            System.out.println("没有该路径");
        }
        System.out.println(s+"该文件是否存在："+file3.exists());
        System.out.println("==============");
        String s1 = "E:\\temp\\a";
        String s2 = "E:\\temp\\a\\b\\c";
        File file4 = new File(s1);
        File file5 = new File(s2);
        System.out.println(s1+"该路径是否存在："+file4.exists());
        System.out.println(s2+"该路径是否存在："+file5.exists());
        boolean newpath = file4.mkdir();
        newpath = file5.mkdirs();
        System.out.println(s1+"该路径是否存在："+file4.exists());
        System.out.println(s2+"该路径是否存在："+file5.exists());
        System.out.println("==============");
        System.out.println(s1+"是否为文件夹:"+file4.isDirectory());
        System.out.println(s+"是否为文件夹:"+file3.isDirectory());
        System.out.println(s+"是否为文件:"+file3.isFile());
    }
}
```

![image-20201201105637364](https://img2020.cnblogs.com/blog/2213660/202012/2213660-20201201105638921-1709872077.png)

- **createNewFIle()** ：创建文件
- **mkdir()** 和 **mkdirs()** ：创建目录，**mkdir()** 创建单级目录，**mkdirs()** 创建多级目录，一般使用**mkdirs()** 
- **isDirectory()** ：判断File对象是否为目录
- **isFile()** ：判断File对象是否为文件
- **exists()** ：判断FIle对象是否存在

#### 文件操作

```java
import java.io.File;

public class Method1 {
    public static void main(String[] args) {
        File file1 = new File("out\\production");
        System.out.println("file1的绝对路径："+file1.getAbsolutePath());
        System.out.println("file1的相对路径："+file1.getPath());
        System.out.println("====================");
        File file2 = new File("E:\\temp\\a.txt");
        System.out.println("路径为："+file2);
        System.out.println("文件名为："+file2.getName());
        System.out.println("====================");
        File path = new File("E:\\temp\\npp");
        String[] files = path.list();
        for (int i = 0; i < files.length;) {
            System.out.print(files[i] + "\t");
            if (++i % 2 == 0)
                System.out.println();
        }
        System.out.println("====================");
        File[] files1 = path.listFiles();
        for (File file : files1) {
            System.out.println(file);
        }
    }
}
```

![image-20201201124651468](https://img2020.cnblogs.com/blog/2213660/202012/2213660-20201201124653195-301733739.png) 

- **getAbsolutePath()** ：获取绝对路径
- **getPath()** ：获取文件相对路径
- **getName()** ：获取文件名
- **list()** ：获取指定目录下的所有文件(夹)名称数组
- **listFiles()** ：获取指定目录下所有文件(夹)File数组

