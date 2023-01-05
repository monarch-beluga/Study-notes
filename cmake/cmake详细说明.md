## cmake详细说明

### 说明

- cmake命令不区分大小写，但是参数、变量区分大小写
- 参数用空格或分号隔开
- 使用${VAR}引用变量
- 引号可加可不加，但如果字符串中有空格必须加



### 概念

- 目标文件(target): 源代码文件(add_executable)、库文件(add_library)
- 命令(cmake-command): 下面会讲的函数
- 变量(cmake-variable): 以cmake_开头的变量名
- 属性(cmake-properties): 文件/文件夹都有各自的属性



### 命令

1. cmake_minimum_required(): 设置最低cmake版本

   ```cmake
   # 语法
   cmake_minimum_required(VERSION <min>)
   
   # 例子
   cmake_minimum_required(VERSION 3.10)
   ```

2. project(): 设置项目名和项目信息

   ```cmake
   #语法
   project(<project_name> [<language_name>....]) # 指定项目语言
   project(<project_name>
   		[VERSION <major>]
   		[DESCRIPTION <project_description_string>]
   		[HOMEPAGE_URL <url_string>]
   		[LANGUAGES <language_name>])
   		
   # 项目名会被存储在变量 PROJECT_NAME 和 CMAKE_PROJECT_NAME 中
   # PROJECT_SOURCE_DIR 等价于 <PROJECT_NAME>_SOURCE_DIR
   # PROJECT_BINARY_DIR 等价于 <PROJECT_NAME>_BINARY_DIR
   
   # 如果定义了版本号
   # 版本号被保存在 PROJECT_VERSION 和 <PROJECT_NAME>_VERSION 中
   # 主版本号被保存在 PROJECT_VERSION_MAJOR 和 <PROJECT_NAME>_VERSION_MAJOR 中
   # 次版本号被保存在 PROJECT_VERSION_MINOR 和 <PROJECT_NAME>_VERSION_MINOR 中
   
   # 例子
   project(Hello)
   project(Hello C CXX)
   project(Hello VERSION 1.0 LANGUAGE CXX)
   ```

3. add_executable():用指定的源文件作为项目添加可执行文件

   ```cmake
   # 语法
   add_executable(<name> [WIN32] [MACOSX_BUNDLE]
   			   [EXCLUDE_FROM_ALL]
   			   [source1] [source2] ...)
   
   # <name> 即生成的可执行文件名字(与项目名没有关系)，在一个项目中必须唯一
   # 如windows系统会生成<name>.exe文件
   # [source1]...为编译成可执行文件的源文件
   
   # 例子
   add_executable(Hello temp.cc)
   ```

4. message():打印信息

   ```cmake
   #语法
   message([<mode>] "message text"....)
   
   # mode类型
   # STATUS 前缀为--的信息
   # SEND_ERROR 产生错误，跳过生成过程
   # FATAL_ERROR 产生错误，终止运行
   ```

5. set(): 将变量设置为指定值

   ```cmake
   # 语法
   set(<variable> <value>)
   
   # 设置c++标准
   set(CMAKE_CXX_STANDARD 11)				# C++ 11 标准
   set(CMAKE_CXX_STANDARD_REQUIRED True)
   
   # 设置输出文件位置
   set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin) 	# 需要在目标文件生成的代码前设置
   
   # 设置存档目标文件(lib, a)的输出位置
   set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib)
   ```

6. option(): 定义一个开关

   ```cmake
   # 语法
   option(<variable> "<help_text>" [value])
   
   # [value]的值为ON 或 OFF，默认为OFF
   # 命令行 -D<variable> = ON/OFF 可以改变该variable的值
   # option定义的值一般配置if来使用
   
   # 例子
   option(VERSION_ENABLE "output version" ON)
   ```

7. configure_file(): 将输入文件进行替换并生成输出文件

   ```cmake
   # 语法
   configure_file(<input> <output>
   				[COPYONLY] [ESCAPE_QUOTES] [@ONLY]
   				[NEWLINE_STYLE [UNIX|DOS|WIN32|LF|CRLF])
   
   # 输入文件中形如 @VAR@ 或 ${VAR} 的字符串会被替换为这些变量的当前值，如果未定义则被替换为空字符串
   # COPYONLY：只拷贝文件，不进行任何的变量替换。
   # ESCAPE_QUOTES：躲过任何的反斜杠(C风格)转义
   # @ONLY：限制变量替换，让其只替换被@VAR@引用的变量(那么${VAR}格式的变量将不会被替换)。
   # NEWLINE_STYLE style：指定输出文件中的新行格式。
   
   # 例子
   configure_file(config.h.in ${PROJECT_SOURCE_DIR}/config.h)
   ```

   ```c++
   // config.h.in
   #define PROJECT_VERSION_MAJOR @PROJECT_VERSION_MAJOR@
   #define PROJECT_VERSION_MINOR @PROJECT_VERSION_MINOR@
   
   // config.h
   #define PROJECT_VERSION_MAJOR 1
   #define PROJECT_VERSION_MINOR 0
   ```

8. include_directories(): 为所有目标添加头文件路径

   ```cmake
   # 语法
   include_directories(dir1 [dir2 ....])
   
   # 目录会被添加到当前文件的 INCLUDE_DIRECTORIES 属性中
   # 当前文件的每一个目标文件的 INCLUDE_DIRECTORIES 属性也会添加该目录
   ```

9. target_include_directories(): 为指定目标添加头文件路径

   ```cmake
   # 语法
   target_include_directories(<target> 
   						<INTERFACE|PUBLIC|PRIVATE> [items1 ....]
   						<INTERFACE|PUBLIC|PRIVATE> [items2 ....])
   
   # 目标文件有 INCLUDE_DIRECTORIES 和 INTERFACE_INCLUDE_DIRECTORIES 两个属性
   # INCLUDE_DIRECTORIES 对内头文件目录
   # INTERFACE_INCLUDE_DIRECTORIES 对外头文件目录
   # PRIVATE: 对内公开，对外不公开，将目录添加到 INCLUDE_DIRECTORIES 属性中
   # INTERFACE：对外公开，对内不公开，将目录添加到 INTERFACE_INCLUDE_DIRECTORIES 属性中
   # PUBLIC：:对内对外都公开，即两个属性都添加，PUBLIC=INTERFACE+PRIVATE
   ```

10. add_subdirectory(): 添加源文件目录，每个源文件目录下都需要有一个CMakeLists.txt

    ```cmake
    # 语法
    add_subdirectory(source_dir [binary_dir] [EXCLUDE_FORM_ALL])
    # binary_dir 指定编译结果存放的位置
    
    # 例子
    add_subdirectory(calc)
    # calc 为相对 PROJECT_SOURCE_DIR 的相对路径目录
    ```

11. add_library(): 用指定的源文件生成库

    ```cmake
    # 语法
    add_library(<name> [STATIC | SHARED | MODULE]
    			[EXCLUDE_FORM_ALL] [<source>...])
    			
    # STATIC 静态库
    # SHARED 动态库
    # 生成的库文件名为 lib<name>.xxx，windows为 .a 后缀
    
    # 例子
    add_library(addition STATIC addition.cpp)			# libaddition.a
    ```

12. target_link_libraries(): 为目标链接库

    ```cmake
    # 语法
    target_link_libraries(<target> 
    					  <PRIVATE | INTERFACE | PUBLIC> <item>...
    					  [<PRIVATE | INTERFACE | PUBLIC> <item>...])
    
    # item 可以是target名、绝对路径(必须保证文件存在)
    
    target_link_libraries(Hello PUBLIC addition)
    ```
    



### 安装

#### cmake 代码

```cmake
# 语法
install(TARGETS <target> DESTINATION <dir>)
install(FILES <file> DESTINATION <dir>)
install(PROGRAMS <非目标文件的可执行程序> DESTINATION <dir>)  		# 如脚本
install(DIRECTORY <dir> DESTINATION <dir>)

# install需要在对应的CMakeLists.txt中使用

install(TARGETS Hello DESTINATION bin)
install(FILES "${PROJECT_SOURCE_DIR}/config.h" DESTINATION include)
```

#### 命令行

```shell
cmake --install .			# 安装到默认目录 CMAKE_INSTALL_PREFIX
cmake --install . --prefix <dir> 		# 安装到指定目录

# 注：安装前先要将程序build成功
```

