## DayCent5模型配置

#### 第三方库

#### 可直接安装

```
yum -y install libxml2-devel
yum -y install m4
yum -y install curl
yum -y install libcurl-devel
```



#### make编译安装

zlib安装参数

```
--prefix=${GCC_PACKAGE_HOME}/package --includedir=${GCC_PACKAGE_HOME}/include --libdir=${GCC_PACKAGE_HOME}/lib
```

openmpi安装参数

```
--prefix=${GCC_PACKAGE_HOME}/package --bindir=${GCC_PACKAGE_HOME}/bin --includedir=${GCC_PACKAGE_HOME}/include --libdir=${GCC_PACKAGE_HOME}/lib --disable-mpi-f77 --disable-mpi-f90 --enable-static --enable-shared --enable-mpi-io
```

hdf5安装参数

```
--prefix=${GCC_PACKAGE_HOME}/package --bindir=${GCC_PACKAGE_HOME}/bin --includedir=${GCC_PACKAGE_HOME}/include --libdir=${GCC_PACKAGE_HOME}/lib --with-zlib=${GCC_PACKAGE_HOME}/include --enable-static --enable-shared --disable-fortran CC=${GCC_PACKAGE_HOME}/bin/mpicc CFLAGS='-I${GCC_PACKAGE_HOME}/include -fPIC' LDFLAGS='-L${GCC_PACKAGE_HOME}/lib'
```

netcdf安装参数

```
--prefix=${GCC_PACKAGE_HOME}/package --bindir=${GCC_PACKAGE_HOME}/bin --includedir=${GCC_PACKAGE_HOME}/include --libdir=${GCC_PACKAGE_HOME}/lib --disable-examples --disable-hdf4-file-tests --disable-dap --disable-v2 --enable-netcdf4 CC=${GCC_PACKAGE_HOME}/bin/mpicc CFLAGS='-I${GCC_PACKAGE_HOME}/include -fPIC' LDFLAGS='-L${GCC_PACKAGE_HOME}/lib'
```



