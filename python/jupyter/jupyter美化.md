## 基于jupyterthemes的美化

- **jupyterthemes** 的安装

  ```bash
  pip install jupyterthemes
  ```

- 查看样式列表

  ```bash
  jt -l
  ```

  ![image-20201120161623610](https://img2020.cnblogs.com/blog/2213660/202011/2213660-20201120161625215-1374409362.png)

- 常用指令

  ![image-20201120161806082](https://img2020.cnblogs.com/blog/2213660/202011/2213660-20201120161806954-1113762332.png)

- 配置

  ```bash
  jt -t monokai -f roboto -fs 14 -nfs 14 -tfs 14 -ofs 11
  ```

  ![image-20201120162027546](https://img2020.cnblogs.com/blog/2213660/202011/2213660-20201120162028380-1937084210.png)

  ![image-20201120162049283](https://img2020.cnblogs.com/blog/2213660/202011/2213660-20201120162049938-1170222376.png)

  

  ## jupyter 自动补全
  
  - 安装
     如果之前安装过显示目录功能的话，这一步骤可以跳过。
  
    ```bash
    pip install jupyter_contrib_nbextensions
    ```
  
    
  
  - 配置
     安装完之后需要配置 nbextension，注意配置的时候要确保**已关闭** Jupyter Notebook：
  
     ```bash
    jupyter contrib nbextension install --user --skip-running-check
     ```
  
    
  
  - 启动 Jupyter Notebook，勾选设置
     上面两个步骤都没报错后，启动 Jupyter Notebook，上面选项栏会出现 Nbextensions 的选项
  
    ![img](https:////upload-images.jianshu.io/upload_images/2759738-f0b422455e3d78b5.png?imageMogr2/auto-orient/strip|imageView2/2/w/1000/format/webp)
  
    点开 Nbextensions 的选项，并勾选 Hinterland
  
    ![img](https:////upload-images.jianshu.io/upload_images/2759738-72952ade69a47155.png?imageMogr2/auto-orient/strip|imageView2/2/w/1200/format/webp)
  
    使用效果：
  
    ![img](https:////upload-images.jianshu.io/upload_images/2759738-857586f61c00363a.jpg?imageMogr2/auto-orient/strip|imageView2/2/w/461/format/webp)
  
  - Jupyter Lab 中的自动补全功能
     按 Tab 键即可使用。
  
    ![img](https:////upload-images.jianshu.io/upload_images/2759738-5da5313ea5f01167.jpg?imageMogr2/auto-orient/strip|imageView2/2/w/352/format/webp)
  
  