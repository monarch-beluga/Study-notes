## Century5、DayCent5模型环境配置

本教程基于ubuntu Linux系统来进行环境配置 [ubuntu虚拟机安装教程](Linux/ubuntu虚拟机安装.md)

由于处于Linux环境下，一些常用的命令行指令可参考这里 [常见的Linux指令](Linux/常见的Linux指令.md)

在编译Century5、DayCent5模型时需要gcc、g++环境  [Ubuntu配置gcc环境](Cplus_and_C/Ubuntu配置gcc环境.md)

为了方便操作，这里所有的命令都是在windows的终端上使用ssh连接虚拟后进行指令输入 [ubuntu启用ssh](Linux/ubuntu启用ssh.md)



### 一、准备

在Windows的终端上使用ssh连接虚拟机

![image-20240222134718071](https://img2023.cnblogs.com/blog/2213660/202402/2213660-20240222134719582-2075879533.png)

为了方便管理，后续的文件上传都会指定一个文件夹这里使用的是 /home/monarch/data 这是我monarch 目录下的一个空目录，需要自己新建，大家可以随意指定

```shell
# 切换到指定目录
cd /home/monarch/data
# 查看当前目录下文件 注：我的是空路径
ls
```

![image-20240222135054391](https://img2023.cnblogs.com/blog/2213660/202402/2213660-20240222135055816-695790889.png)



### 二、第三方库

DayCent5模型的编译需要netcdf的支持，而netcdf需要hdf5、libxml2、m4、curl的支持，并且本模型还有并行计算的版本，所以这里考虑安装openmpi库来构建netcdf

由于安装的路径涉及系统路径，所以本教程是以root方式登录的终端

#### 1、openmpi 编译安装

openmpi下载：[openmpi download](https://www.open-mpi.org/software/ompi/v5.0/)

![image-20240222134034054](https://img2023.cnblogs.com/blog/2213660/202402/2213660-20240222134035518-28767203.png)

用windows下载好压缩包后，在下载路径下打开终端(cmd)，使用scp命令传输文件

![image-20240222134320460](https://img2023.cnblogs.com/blog/2213660/202402/2213660-20240222134321715-1488230848.png)

![image-20240222135158688](https://img2023.cnblogs.com/blog/2213660/202402/2213660-20240222135200058-1252701251.png)

```shell
# 查看当前目录下文件
dir
```

![image-20240222135249685](https://img2023.cnblogs.com/blog/2213660/202402/2213660-20240222135250784-1754976486.png)

```shell
# 传输文件到虚拟机 会让你输入用户密码
scp openmpi-5.0.2.tar.gz root@192.168.31.216:/home/monarch/data
```

![image-20240222135501048](https://img2023.cnblogs.com/blog/2213660/202402/2213660-20240222135502244-579413329.png)

切换到连接虚拟机的终端，使用ls命令查看文件

![image-20240222135539618](https://img2023.cnblogs.com/blog/2213660/202402/2213660-20240222135541092-418987453.png)

说明文件已经传输完毕，接下来就是解压

```shell
# 解压文件
tar -xzvf openmpi-5.0.2.tar.gz
# 查看文件
ls
```

![image-20240222135653884](https://img2023.cnblogs.com/blog/2213660/202402/2213660-20240222135655117-256188750.png)

得到openmpi-5.0.2目录，进入这个目录，查看文件

```shell
cd openmpi-5.0.2
ls
```

![image-20240222135901720](https://img2023.cnblogs.com/blog/2213660/202402/2213660-20240222135903057-1615467462.png)

configure文件介绍：是一个可执行文件，是用于配置make编译的一些参数，可以指定软件的安装位置和其他的参数，使用configure --help可以查看这个可执行文件有哪些参数

![image-20240222140238323](https://img2023.cnblogs.com/blog/2213660/202402/2213660-20240222140239957-1761072330.png)

执行下面的命令，然后等待结果

```shell
./configure --prefix=${GCC_PACKAGE_HOME}/package --bindir=${GCC_PACKAGE_HOME}/bin --includedir=${GCC_PACKAGE_HOME}/include --libdir=${GCC_PACKAGE_HOME}/lib --disable-mpi-f77 --disable-mpi-f90 --enable-static --enable-shared --enable-mpi-io
```

重要参数：

- --prefix: 指定安装路径
- --bindir: 指定可执行文件安装路径
- --includedir： 指定头文件安装路径
- --libdir: 指定二进制文件(静态库和动态库)文件安装路径
- --enable-static ：生成静态链接库
- --enable-shared：生成动态链接库

![image-20240222142537254](https://img2023.cnblogs.com/blog/2213660/202402/2213660-20240222142539563-355699862.png)

执行结束

![image-20240222142600751](https://img2023.cnblogs.com/blog/2213660/202402/2213660-20240222142602212-259905204.png)

使用ls命令查看文件

![image-20240222142644496](https://img2023.cnblogs.com/blog/2213660/202402/2213660-20240222142645765-1586103331.png)

这个Makefile文件就是刚刚configure脚本得到的结果，然后我们就可以用make指令去编译这个软件

```shell
# make 是linux中常用的编译指令，它需要有Makefile才能知道具体需要怎么编译
make -j 4
# -j 参数是指定编译时的线程数，这里指定4个线程
```

![image-20240222143031330](https://img2023.cnblogs.com/blog/2213660/202402/2213660-20240222143032558-2055163135.png)

开始编译openmpi这个第三方库，编译需要一定的时间，我们可以先去把其他第三方库都下载下来然后传输到虚拟机并解压

编译完成后使用下面的指令，将编译的结果安装到之前配置的gcc第三方库的位置

```shell
make installl
```

![image-20240222145331726](https://img2023.cnblogs.com/blog/2213660/202402/2213660-20240222145333913-577033312.png)

安装完成后，我们进入examples目录下，验证安装结果

![image-20240222145600234](https://img2023.cnblogs.com/blog/2213660/202402/2213660-20240222145602035-1937243036.png)

![image-20240222145650087](https://img2023.cnblogs.com/blog/2213660/202402/2213660-20240222145651390-1164066363.png)

先直接make编译

![image-20240222145847955](https://img2023.cnblogs.com/blog/2213660/202402/2213660-20240222145849512-716591711.png)

然后使用下面的命令来并行运行，得到如下结果说明安装成功

```shell
mpirun --allow-run-as-root -np 4 hello_c 
```

![image-20240222150051242](https://img2023.cnblogs.com/blog/2213660/202402/2213660-20240222150052848-334465265.png)



#### 2、zlib安装

zlib下载：[zlib download](https://www.zlib.net/)

![image-20240222143458867](https://img2023.cnblogs.com/blog/2213660/202402/2213660-20240222143500280-1102734114.png)

使用scp命令上传到虚拟机，并解压

![image-20240222143758443](https://img2023.cnblogs.com/blog/2213660/202402/2213660-20240222143759789-1523425310.png)

进入zlib-1.3.1目录，查看文件

![image-20240222143836345](https://img2023.cnblogs.com/blog/2213660/202402/2213660-20240222143837769-794934258.png)

同样用cnofigure脚本进行构建Makefile，具体命令如下

```shell
./configure --prefix=${GCC_PACKAGE_HOME}/package --includedir=${GCC_PACKAGE_HOME}/include --libdir=${GCC_PACKAGE_HOME}/lib
```

![image-20240222144003824](https://img2023.cnblogs.com/blog/2213660/202402/2213660-20240222144005503-849470241.png)

然后用make编译

![image-20240222144040409](https://img2023.cnblogs.com/blog/2213660/202402/2213660-20240222144041803-352351897.png)

最后使用make install 进行安装

![image-20240222144110220](https://img2023.cnblogs.com/blog/2213660/202402/2213660-20240222144111548-1916949314.png)



#### 3、HDF5安装

HDF5下载：[HDF5 download](https://support.hdfgroup.org/ftp/HDF5/prev-releases/)

![image-20240222144555587](https://img2023.cnblogs.com/blog/2213660/202402/2213660-20240222144557341-1103034206.png)

![image-20240222144600790](https://img2023.cnblogs.com/blog/2213660/202402/2213660-20240222144602347-875592137.png)

![image-20240222144635499](https://img2023.cnblogs.com/blog/2213660/202402/2213660-20240222144636733-994945229.png)

![image-20240222144638710](https://img2023.cnblogs.com/blog/2213660/202402/2213660-20240222144639891-1314067337.png)

同理，下载后上传到虚拟机并解压

![image-20240222144849549](https://img2023.cnblogs.com/blog/2213660/202402/2213660-20240222144851125-711195222.png)

进入文件夹，查看文件

![image-20240222144924057](https://img2023.cnblogs.com/blog/2213660/202402/2213660-20240222144925273-1697203743.png)

执行configure命令，这一步之前首先要把openmpi安装好

```shell
./configure --prefix=${GCC_PACKAGE_HOME}/package --bindir=${GCC_PACKAGE_HOME}/bin --includedir=${GCC_PACKAGE_HOME}/include --libdir=${GCC_PACKAGE_HOME}/lib --with-zlib=${GCC_PACKAGE_HOME}/include --enable-static --enable-shared --disable-fortran CC=${GCC_PACKAGE_HOME}/bin/mpicc  CFLAGS='-I${GCC_PACKAGE_HOME}/include -fPIC' LDFLAGS='-L${GCC_PACKAGE_HOME}/lib'
```

- CC: 指定c语言编译器，这里指定的时openmpi中的mpicc

![image-20240222150157846](https://img2023.cnblogs.com/blog/2213660/202402/2213660-20240222150159465-557740950.png)

执行结果

![image-20240222150353502](https://img2023.cnblogs.com/blog/2213660/202402/2213660-20240222150355242-348250697.png)

同上，使用make编译安装，最终结果

![image-20240222151237113](https://img2023.cnblogs.com/blog/2213660/202402/2213660-20240222151238915-665819549.png)





#### 4、netcdf安装

netcdf下载: [netcdf download](https://downloads.unidata.ucar.edu/netcdf/)

![image-20240222150900101](https://img2023.cnblogs.com/blog/2213660/202402/2213660-20240222150901785-272138511.png)

下载，上传，解压

![image-20240222151131535](https://img2023.cnblogs.com/blog/2213660/202402/2213660-20240222151132847-180644113.png)

进入文件夹，查看文件，运行configure指令

```
./configure --prefix=${GCC_PACKAGE_HOME}/package --bindir=${GCC_PACKAGE_HOME}/bin --includedir=${GCC_PACKAGE_HOME}/include --libdir=${GCC_PACKAGE_HOME}/lib --disable-examples --disable-hdf4-file-tests --disable-dap --disable-v2 --enable-netcdf4 CC=${GCC_PACKAGE_HOME}/bin/mpicc CFLAGS='-I${GCC_PACKAGE_HOME}/include -fPIC' LDFLAGS='-L${GCC_PACKAGE_HOME}/lib'
```

![image-20240222151336932](https://img2023.cnblogs.com/blog/2213660/202402/2213660-20240222151338508-1431749107.png)

这时会报错

![image-20240222151420846](https://img2023.cnblogs.com/blog/2213660/202402/2213660-20240222151422450-1961740900.png)

需要我们去安装libxml2，运行以下指令

```shell
apt -y install libxml2-dev
```

![image-20240222151812866](https://img2023.cnblogs.com/blog/2213660/202402/2213660-20240222151814764-352409737.png)

然后再执行configure命令

报错

![image-20240222151943732](https://img2023.cnblogs.com/blog/2213660/202402/2213660-20240222151945570-467473901.png)

需要m4,执行下列指令安装

```shell
apt -y install m4
```

![image-20240222152055442](https://img2023.cnblogs.com/blog/2213660/202402/2213660-20240222152057284-700127549.png)

再次执行configure命令，报错

![image-20240222152142591](https://img2023.cnblogs.com/blog/2213660/202402/2213660-20240222152144300-1095377702.png)

执行下列指令安装curl

```shell
apt -y install libcurl4-openssl-dev
```

![image-20240222152510270](https://img2023.cnblogs.com/blog/2213660/202402/2213660-20240222152511853-1678744668.png)

执行configure命令，这一次不会报错了，可以得到最终结果

![image-20240222152609280](https://img2023.cnblogs.com/blog/2213660/202402/2213660-20240222152610899-914880093.png)

使用make编译并安装

![image-20240222152726122](https://img2023.cnblogs.com/blog/2213660/202402/2213660-20240222152728481-2048122884.png)



### 三、模型的编译

我们打开模型的目录

![image-20240222161133188](https://img2023.cnblogs.com/blog/2213660/202402/2213660-20240222161135130-2047578105.png)

其中IRC_source.zip是要上传到虚拟机用来编译的文件，而DayCent_Manual_full_05.02.108-1.pdf是模型的介绍，包含模型的输入输出

用scp把IRC_source.zip上传到虚拟机

![image-20240222161424734](https://img2023.cnblogs.com/blog/2213660/202402/2213660-20240222161426384-211988713.png)

然后执行命令

```shell
# tar 只能解压 tar或tar.gz文件，zip文件需要unzip来解压
unzip IRC_source.zip
```

![image-20240222161606947](https://img2023.cnblogs.com/blog/2213660/202402/2213660-20240222161608490-101726504.png)

进入IRC目录，查看文件，有一个rev974目录，进入这个目录，查看文件

![image-20240222161734551](https://img2023.cnblogs.com/blog/2213660/202402/2213660-20240222161735919-1110480652.png)

- Ecosystem目录：是模型的源码目录，后续生成的可执行文件也在这个目录中
- build-century5.sh: 是构建Century5模型的脚本
- build-daycent5.sh： 构建DayCent5模型的脚本

#### 1、Century5 模型构建

直接运行build-century5.sh脚本，等待运行结果

```shell
./build-century5.sh
```

![image-20240222162034253](https://img2023.cnblogs.com/blog/2213660/202402/2213660-20240222162036406-2141043546.png)

编译失败,主要集中在以下两个错误

![image-20240223165931366](https://img2023.cnblogs.com/blog/2213660/202402/2213660-20240223165933523-1209419341.png)

![image-20240223170049984](https://img2023.cnblogs.com/blog/2213660/202402/2213660-20240223170051546-478790131.png)

第一个错误是由于我们的g++版本为13.2.0，默认使用的是c++17规范，而显然模型源码与这个规范相冲突，解决方法是在模型编译参数中添加 `-std=c++98` 让其按照c++98的规范来编译源码,需要修改以下几个文件，都是使用vim来打开

```shell
vim Numerical/blitz/make.gxx.sh
```

![image-20240223170526121](https://img2023.cnblogs.com/blog/2213660/202402/2213660-20240223170528087-981389633.png)

修改为,然后保存退出

![image-20240223170604365](https://img2023.cnblogs.com/blog/2213660/202402/2213660-20240223170605794-370985767.png)

```shell
vim Ecosystem/Weather/projects/gxx/Makefile.WeatherDataFramework.gxx
```

在45行的位置，修改C_FLAGS参数

![image-20240223170732286](https://img2023.cnblogs.com/blog/2213660/202402/2213660-20240223170734134-182795646.png)

修改为，保存并退出

![image-20240223170817390](https://img2023.cnblogs.com/blog/2213660/202402/2213660-20240223170819108-1054128808.png)

```sehll
vim Ecosystem/Weather/projects/gxx/Makefile.WeatherLib.gxx
```

在40行的位置

![image-20240223170958920](https://img2023.cnblogs.com/blog/2213660/202402/2213660-20240223171000823-2028628431.png)

修改为

![image-20240223171035085](https://img2023.cnblogs.com/blog/2213660/202402/2213660-20240223171037025-294273717.png)

第二个错误是由于源码文件WeatherTransform.h在调用模板函数时没有显示的声明，所以需要修改该文件，在函数前加上 `template `来显示声明

```shell
vim Ecosystem/Weather/src/WeatherTransform.h
```

在118行的位置

![image-20240223171415063](https://img2023.cnblogs.com/blog/2213660/202402/2213660-20240223171416924-1085711309.png)

修改为

![image-20240223171451355](https://img2023.cnblogs.com/blog/2213660/202402/2213660-20240223171452858-744786061.png)

然后再执行build-century5.sh脚本，等待结果

![image-20240223172724444](https://img2023.cnblogs.com/blog/2213660/202402/2213660-20240223172727081-1285379220.png)

编译成功，这时会在 Ecosystem/Century5/bin 目录下生成century.gxx.exe，我们进入这个路径，查看文件

![image-20240223172816702](https://img2023.cnblogs.com/blog/2213660/202402/2213660-20240223172818887-1865479588.png)

执行

```shell
./century.gxx.exe
```

会显示模型有哪些参数，这些参数的解释，并给出一个例子

![image-20240223173044785](https://img2023.cnblogs.com/blog/2213660/202402/2213660-20240223173046784-374681200.png)

在当前目录下，还有一个 examples 文件夹，里面有两个文件夹，一个是日尺度的数据，一个是月尺度的数据，我们进入月尺度的目录，查看文件

![image-20240223173613701](https://img2023.cnblogs.com/blog/2213660/202402/2213660-20240223173615597-82437437.png)

其中以 .100为后缀的就是站点文件，.sch为管理文件，我们以c3grs.100和c3grs.sch为例运行以下century5模型

首先我们先创建一个result文件夹作为输出路径

![image-20240223173936498](https://img2023.cnblogs.com/blog/2213660/202402/2213660-20240223173938301-1639282586.png)

然后执行下面的命令

```shell
../../century.gxx.exe -s c3grs.100 -m c3grs.sch -o result/c3grs -ts -ar -d1
```

- ../../century.gxx.exe : 表示指定上两级目录下的century.gxx.exe模型可执行文件
- -s c3grs.100 ：指定c3grs.100为站点文件
- -m c3grs.sch： 指定3grs.sch为管理文件
- -o result/c3grs： 指定result/为输出路径，并指定c3grs为输出文件前缀
- -ts ： 表示输出文件为csv格式
- -ar : 表示输出文件为替换
- -d1: 显示程序运行时间

![image-20240223174440394](https://img2023.cnblogs.com/blog/2213660/202402/2213660-20240223174442533-1653485740.png)

执行完成，得到的结果在result目录中，进入result目录，查看文件

![image-20240223174531571](https://img2023.cnblogs.com/blog/2213660/202402/2213660-20240223174533168-1069512728.png)

里面包含六个csv文件和一个日志文件log，模型演示就到这里了

#### 2、DayCent5模型构建

直接执行脚本 build-daycent5.sh，由于在构建Century5模型时已经完成了对源码的修改，所以现在应该可以直接成功构建该模型

![image-20240223174900022](https://img2023.cnblogs.com/blog/2213660/202402/2213660-20240223174902234-1416587636.png)

![image-20240223175459319](https://img2023.cnblogs.com/blog/2213660/202402/2213660-20240223175501656-232708987.png)

构建完成，同样在Ecosystem/Century5/bin目录下会生成一个可执行文件daycent.gxx.exe

![image-20240223175608863](https://img2023.cnblogs.com/blog/2213660/202402/2213660-20240223175610574-631535838.png)

模型具体的使用方式由于没有具体的例子，所以就不作演示了

现在，模型的编译与构建就完成了，具体的使用方法需要去参考模型中的介绍文件

![image-20240223175838162](https://img2023.cnblogs.com/blog/2213660/202402/2213660-20240223175840080-517554360.png)



### 四、模型设置别名方便使用

由于模型在一个指定的目录中，每次调用可能有很长的文件路径，所以可以使用别名的方式来方便调用亦或者将模型可执行文件所在文件夹加入系统环境路径中

我这里的模型路径在 /home/monarch/data/IRC/rev974/Ecosystem/Century5/bin 路径下所以可以如下设置

```shell
alias century5='/home/monarch/data/IRC/rev974/Ecosystem/Century5/bin/century.gxx.exe'
alias daycent5='/home/monarch/data/IRC/rev974/Ecosystem/Century5/bin/daycent.gxx.exe'
```

这只是临时的终端配置，如果要永久生效，可以将上述命令写入/etc/profile配置文件中,这时，不管我们在那个路径，都可以使用century5和daycent5来调用模型

例如我在用户文件夹下调用daycent5模型

![image-20240223181014301](https://img2023.cnblogs.com/blog/2213660/202402/2213660-20240223181016693-1319217426.png)