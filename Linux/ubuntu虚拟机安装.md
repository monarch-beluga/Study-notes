## ubuntu虚拟机安装

#### 1、下载 Ubuntu 镜像（iso文件）

- 官方下载地址：[官方下载地址](https://ubuntu.com/download)
- 清华大学开源软件镜像站：[清华大学开源软件镜像站](https://mirrors.tuna.tsinghua.edu.cn/ubuntu-releases/)
- 阿里云开源镜像站：[阿里云开源镜像站](https://mirrors.aliyun.com/ubuntu-releases/)

注：官方下载位置可能有点慢，建议选择后两个镜像源下载

这里以清华大学镜像站为例：

可以选择版本，这里选择的是23.10.1

![image-20240222103718357](https://img2023.cnblogs.com/blog/2213660/202402/2213660-20240222103719301-216990523.png)

选择 ubuntu-23.10.1-desktop-amd64.iso 下载

![image-20240222094606422](https://img2023.cnblogs.com/blog/2213660/202402/2213660-20240222094607471-684390396.png)



#### 2、安装虚拟机

- 打开VMware,选择创建虚拟机。

  ![image-20240222092210428](https://img2023.cnblogs.com/blog/2213660/202402/2213660-20240222092212238-1351111108.png)

  或者选择菜单栏的文件，然后点击新疆虚拟机(快捷键为Ctrl+N)

  ![image-20240222092634408](https://img2023.cnblogs.com/blog/2213660/202402/2213660-20240222092635204-267350399.png)

- 勾选【典型】,然后点击下一步

  ![image-20240222092836869](https://img2023.cnblogs.com/blog/2213660/202402/2213660-20240222092838006-1691048567.png)

- 选择【稍后安装操作系统】，点击下一步

  ![image-20240222093009452](https://img2023.cnblogs.com/blog/2213660/202402/2213660-20240222093010492-56449947.png)

- "客户机操作系统"选择【Linux】，然后"版本"选择【Ubuntu 64位】，点击下一步

  ![image-20240222093154818](https://img2023.cnblogs.com/blog/2213660/202402/2213660-20240222093155686-2029377712.png)

- 自定义或默认虚拟机名称，然后选择一个安装虚拟机的位置，点击下一步

  ![image-20240222093333328](https://img2023.cnblogs.com/blog/2213660/202402/2213660-20240222093334281-1694195997.png)

- 设置最大磁盘大小(建议20GB以上),然后勾选将虚拟磁盘拆分成多个文件,点击下一步

  ![image-20240222093549510](https://img2023.cnblogs.com/blog/2213660/202402/2213660-20240222093550297-1214377424.png)

- 点击"自定义硬件"

  ![image-20240222093702909](https://img2023.cnblogs.com/blog/2213660/202402/2213660-20240222093704020-1365705212.png)

- 内存设置："此虚拟机的内存"可以选择默认的 **4096** MB

  ![image-20240222093840862](https://img2023.cnblogs.com/blog/2213660/202402/2213660-20240222093842159-1776430699.png)

- 处理器设置："处理器数量"可根据主机处理器来设置，我这里选择4，"每个处理器的内核数量"建议选2

  ![image-20240222094116003](https://img2023.cnblogs.com/blog/2213660/202402/2213660-20240222094116817-2132005019.png)

- 新 CD/DVD(SATA)设置："设备状态"勾选 【启动时连接】,"连接" 选择使用ISO映像文件，即刚刚下载的 ubuntu-23.10.1-desktop-amd64.iso 的位置

  ![image-20240222094708710](https://img2023.cnblogs.com/blog/2213660/202402/2213660-20240222094709993-334426902.png)

- 网络适配器设置："设备状态" 勾选 【启动时连接】，网络连接选择 【桥接模式】并勾选【复制物理网络连接状态】

  ![image-20240222095150423](https://img2023.cnblogs.com/blog/2213660/202402/2213660-20240222095151520-1758958267.png)

  - 桥接模式：在桥接模式下，VMware操作系统就像局域网中的一个**独立的主机**，可以访问局域网内任何一台机器。即，可以连接外网(互联网)，也可以通过内网(局域网)连接除**宿主机**(安装虚拟机的主机)之外的主机，其他主机也能访问该虚拟机，且ip可以为静态。(建议使用)
    - 【复制物理网络连接状态】 仅用于笔记本电脑在有线网络与无线网络之间切换时进行IP地址续订，虚拟机IP地址不变
  - NAT模式：是让虚拟系统借助NAT(网络地址转换)功能，通过宿主机器所在的网络来访问公网。也就是说，使用NAT模式可以实现在虚拟系统里访问互联网，但是NAT模式下的虚拟系统的TCP/IP配置信息是由VMnet8(NAT)虚拟网络的DHCP服务器提供的，无法进行手工修改，因此虚拟系统无法和本机局域网中的其他真实主机进行。即，可以连接外网，可以通过局域网来访问除**宿主机**外的其他主机，但是不能被其它主机通过局域网访问，ip必须由DHCP分配。
  - 主机模式：虚拟网络是一个全封闭的网络，**它唯一能够访问的就是宿主机**，即不能访问外网，也不能访问内网，网络与宿主机一一对应。

- 然后点击关闭

  ![image-20240222095341545](https://img2023.cnblogs.com/blog/2213660/202402/2213660-20240222095342674-2136571123.png)

- 点击 完成

  ![image-20240222095406653](https://img2023.cnblogs.com/blog/2213660/202402/2213660-20240222095407702-1048317346.png)

- 点击 【开启此虚拟机】

  ![image-20240222095448364](https://img2023.cnblogs.com/blog/2213660/202402/2213660-20240222095449225-898016407.png)

- 选择 【Try or Install Ubuntu】 回车，然后等待一段时间

  ![image-20240222095633908](https://img2023.cnblogs.com/blog/2213660/202402/2213660-20240222095635122-1070096704.png)

- 一段时间后会出现下面的界面，选择【中文(简体)】，然后点击 【next】

  ![image-20240222100048298](https://img2023.cnblogs.com/blog/2213660/202402/2213660-20240222100049839-1643530075.png)

- 勾选 【Install Ubuntu】，点击 next

  ![image-20240222100127568](https://img2023.cnblogs.com/blog/2213660/202402/2213660-20240222100128916-1473184675.png)

- "Keyboard layout" 选择 【Chiese】, 点击 next

  ![image-20240222100308839](https://img2023.cnblogs.com/blog/2213660/202402/2213660-20240222100310123-2021059804.png)

- 勾选 【Use wired connection】, 点击 next

  ![image-20240222100442336](https://img2023.cnblogs.com/blog/2213660/202402/2213660-20240222100443420-1079496729.png)

- 点击 skip 跳过

  ![image-20240222100517457](https://img2023.cnblogs.com/blog/2213660/202402/2213660-20240222100518546-299104973.png)

- 【Defult installation】是基本安装；【Full installation】是完全安装。我这里选择的是【Defult installation】，点击 next

  ![image-20240222100851690](https://img2023.cnblogs.com/blog/2213660/202402/2213660-20240222100853464-502840081.png)

- 勾选 【Erase disk and install Ubutu】，点击 next

  ![image-20240222100950145](https://img2023.cnblogs.com/blog/2213660/202402/2213660-20240222100951330-1905274053.png)

- 点击 Install 

  ![image-20240222101027685](https://img2023.cnblogs.com/blog/2213660/202402/2213660-20240222101029008-1018821091.png)

- 时区选择 Shanghai 点击 next

  ![image-20240222101312697](https://img2023.cnblogs.com/blog/2213660/202402/2213660-20240222101313907-59103459.png)

- 设置用户名和密码，具体步骤如下：（【Your computer’s name】为你的机器的名字，如果你不改的话系统会自动根据你的用户名生成一个名字；不改问题也不大），点击next

  ![image-20240222101708803](https://img2023.cnblogs.com/blog/2213660/202402/2213660-20240222101710337-1466945177.png)

- 选择主题，随意，点击 next，等待安装，时间有点长

  ![image-20240222101842816](https://img2023.cnblogs.com/blog/2213660/202402/2213660-20240222101844131-32108833.png)

- 点击 【Restart now】

  ![image-20240222103748998](https://img2023.cnblogs.com/blog/2213660/202402/2213660-20240222103750192-1888713902.png)

  出现这个界面，输入回车

  ![image-20240222103832312](https://img2023.cnblogs.com/blog/2213660/202402/2213660-20240222103833378-1514462451.png)

- 这时虚拟机安装完成了，后面就是用户登录

  ![image-20240222111641023](https://img2023.cnblogs.com/blog/2213660/202402/2213660-20240222111642061-235098341.png)



在使用用户登录后，由于Ubuntu的root权限密码是在默认情况下是随机的，所以我们要进行修改

按下图所示，打开终端Terminal

![image-20240222110656563](https://img2023.cnblogs.com/blog/2213660/202402/2213660-20240222110658631-1478381644.png)

![image-20240222110722323](https://img2023.cnblogs.com/blog/2213660/202402/2213660-20240222110723303-555281608.png)

使用命令设置root密码

```shell
sudo passwd
```

![image-20240222111354543](https://img2023.cnblogs.com/blog/2213660/202402/2213660-20240222111355934-2021342214.png)

然后输入命令改为root权限

```shell
su root
```

![image-20240222111521299](https://img2023.cnblogs.com/blog/2213660/202402/2213660-20240222111522544-1335233157.png)

这时我们修改了root密码，但是还是不能在用户界面登录，需要再做以下修改

```shell
# 切换路径
cd /etc/pam.d
# 查看文件
ls
```

![image-20240222114915435](https://img2023.cnblogs.com/blog/2213660/202402/2213660-20240222114916872-1803386601.png)

修改gdm-autologin和gdm-password两个文件，这里使用vim编辑器 详细使用方法可见 [vim使用](../其他知识/vim使用.md)

vim 安装

```shell
# 更新apt
sudo apt update
# 安装vim
sudo apt install vim
```



```shell
# 打开gdm-sutologin文件
vim gdm-sutologin
# 打开后按i进入输入模式
# 如下图注释后按Esc进入正常模式
# 然后输入冒号 : 进入命令模式 输入wq保存并退出
# 打开gdm-password文件
vim gdm-password
```

![image-20240222115155204](https://img2023.cnblogs.com/blog/2213660/202402/2213660-20240222115156615-669382168.png)

![image-20240222115528035](https://img2023.cnblogs.com/blog/2213660/202402/2213660-20240222115529350-287017381.png)

返回登录界面

![image-20240222115758017](https://img2023.cnblogs.com/blog/2213660/202402/2213660-20240222115759008-1943296754.png)

输入root

![image-20240222115817416](https://img2023.cnblogs.com/blog/2213660/202402/2213660-20240222115818503-1397461299.png)

输入密码然后登录成功

到此Ubuntu虚拟机正式安装完成，想要初步了解Linux指令的可以参考这个 [常见的Linux指令](常见的Linux指令.md)



#### apt设置国内镜像

24.04版本，在`/etc/apt/sources.list.d` 目录的 `ubuntu.sources`文件中写入

```shell
# 中科大源
Types: deb
URIs: http://mirrors.ustc.edu.cn/ubuntu/
Suites: noble noble-updates noble-security
Components: main restricted universe multiverse
Signed-By: /usr/share/keyrings/ubuntu-archive-keyring.gpg
```





