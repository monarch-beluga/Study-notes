## 常见的Linux指令

- 目录路径切换： cd [路径]

- 查看当前目录下的文件
  - ls 简易查看(只显示文件或文件夹名称)
  - ls -a 简易查看并显示隐藏文件
  - ll 详细查看(显示文件大小、权限、修改时间等)
  - ll -a 详细查看并显示隐藏文件
  
- 查看ip地址 ip addr 或者 ifconfig

- 编辑文本：可使用linux自带的vi，或者下载vim 详细使用方法可见 [vim使用](../其他知识/vim使用.md)

- 查看当前目录路径：pwd

- 清屏：clear

- 创建文件夹：mkdir

- 删除文件: rm
  - rm -f 不用二次确认是否删除
  - rm -r 删除文件夹
  
- 复制文件： cp 原文件路径 目的文件夹路径

- 移动文件： mv 原文件路径 目的文件路径

- 操作tar 或 tar.gz 文件： tar
  - -x 解压
  - -c 压缩
  - -z 通过gzip指令处理文件
  - -v 显示指令执行过程
  - -f 指定文件路径
  - 例如解压一个文件： tar -xzvf temp.tar.gz 这个事解压到当前路径下 压缩同理
  
- 包管理工具： centos7中使用yum进行包的安装与管理，Ubuntu中使用apt进行包的安装与管理

- 文件传输指令：scp

  ```shell
  # 从本地上传到服务器
  scp 本地文件路径 用户名@主机ip:服务器文件夹路径
  # 从服务器下载到本地
  scp 用户名@主机ip:服务器文件路径 本地文件夹路径
  ```

- sudo: ubuntu中以管理员身份执行指令

- alias: 设置指令别名，如 alias la='ls -A'，则 la就可以指代 ls -A 这条指令

