# 常见Dos命令

- 盘符切换：盘符名称加冒号	***E:***
- 查看当前目录下的所有文件 ： **dir**
- 切换目录：cd + 路径名称     ***cd study***
- 返回上级目录：***cd ..***
- 跨盘符切换路径: cd /d 其他盘符路径     ***cd /d D:***
- 清屏：***cls***或者***clear***
- 查看ip： ***ipconfig***
- 退出终端： exit
- ping命令获取指定网址的ip地址：***ping www.baidu.com***
- 创建文件夹： md 文件夹名称***md test***
- 创建文件： cd>文件名    ***cd>a.txt***
- 删除文件： del 文件名    ***del a.txt***
- 删除文件夹： rd 文件夹名称   ***rd test***
- **&** ：语句连接符
- /c: 打开的命令行执行完后会自动关闭
- /k: 打开的命令行执行完后不会自动关闭



#### 电脑关机，重启，休眠

```shell
# 0秒后关机
shutdown -s -t 00
# 0秒后重启
shutdown -r
# 休眠
shutdown -h
# 睡眠:需要安装psshutdown
psshutdown -t 00 -d
```

- 睡眠：切断除 **内存** 外的所有部件的电源，消耗少量电，可以快速打开计算机，并恢复进入睡眠之前的状态(睡眠前打开的应用和网站会重新打开)
- 休眠：与睡眠功能相同，不同的是，睡眠会将内存写入到硬盘，所以睡眠时电脑可以完全断电，和关机一样，但是电脑恢复的速度比睡眠慢

#### 清空回收站

```bash
rd /s /q C:\$RECYCLE.BIN
rd /s /q D:\$RECYCLE.BIN
rd /s /q E:\$RECYCLE.BIN
```

- **$RECYCLE.BIN** 为回收站路径
- C、D、E:为盘符

#### 开启/关闭笔记本自带键盘

```shell
# 关闭键盘并重启（重启生效）
sc config i8042prt start=disabled 
shutdown -r -t 00
# 开启键盘
sc config i8042prt start= auto 
shutdown -r -t 00
```

