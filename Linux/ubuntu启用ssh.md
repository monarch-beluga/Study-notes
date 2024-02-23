## Ubuntu上启用ssh

Secure Shell (SSH) 是一个网络协议，它主要被用来加密客户端和服务端之间的连接。 在客户端和服务端的每一次交互都被加密。

启用  SSH 将会允许你远程连接到你的系统，并且执行管理员任务。你将能够通过 `scp`和`sftp`安全传输文件。



#### 在Ubuntu上启用ssh

默认情况下，当 Ubuntu 最初被安装的时候，通过 SSH 进行远程访问是不被允许的。在 Ubuntu 上启用 SSH 非常的简单直接。

以 root 或者其他 sudo 用户身份执行下面的步骤，在你的 Ubuntu 系统上安装并且启用 SSH。

打开终端

```shell
# 更新 apt
sudo apt update
# 安装openssh-server
sudo apt install openssh-server
```

![image-20240222113448529](https://img2023.cnblogs.com/blog/2213660/202402/2213660-20240222113449661-1120322239.png)

安装完成后ssh服务会自动启用，可以用命令来验证ssh是否运行

```shell
sudo systemctl status ssh
```

输出将会告诉你服务正在运行，并且启用开机启动

![image-20240222113750164](https://img2023.cnblogs.com/blog/2213660/202402/2213660-20240222113751462-1242570392.png)

查看ip地址

```shell
ip addr
```

![image-20240222120343133](https://img2023.cnblogs.com/blog/2213660/202402/2213660-20240222120344416-350227118.png)

尝试在其他电脑电脑上登陆，这里用的是windows的终端输入

```shell
ssh username@ip
```

![image-20240222120559962](https://img2023.cnblogs.com/blog/2213660/202402/2213660-20240222120601418-1857301307.png)

完成登录

如果要配置root账户的ssh登录，则还需其他设置

编辑/etc/ssh/sshd_config文件

```shell
sudo vim /etc/ssh/sshd_config
```

![image-20240222121544659](https://img2023.cnblogs.com/blog/2213660/202402/2213660-20240222121546702-1167914480.png)

重启ssh服务，然后测试用root账户登录

![image-20240222121900790](https://img2023.cnblogs.com/blog/2213660/202402/2213660-20240222121902580-262694624.png)

