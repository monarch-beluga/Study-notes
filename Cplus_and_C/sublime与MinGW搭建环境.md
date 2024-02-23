## sublime与MinGW搭建环境

#### 1. Sublime Text3 的安装

**官网：https://www.sublimetext.com/ ，下载安装即可** 

#### 2. Package Control 的安装

首先菜单栏点击 Tool - Install Package
安装成功后提示 successfully

#### 3. 汉化

- **点击** `ctrl + shift + p`，输入 **install package**
- 搜索 **ChineseLocalizations**，点击安装
- 在 **帮助** 下发现出现 **Language** 选项

#### 4. 配置环境

打开 **C:\Users\(用户)\AppData\Roaming\Sublime Text 3\Packages\C++** 

![image-20210413205343720](https://img2020.cnblogs.com/blog/2213660/202104/2213660-20210413205344337-1892882067.png) 

分别编辑这两个文件

**C** 

```json
{
	"cmd": "gcc -g -Wall -std=c18 \"${file_name}\" -o \"${file_base_name}\"",			// 构建
	"file_regex": "^(..[^:]*):([0-9]+):?([0-9]+)?:? (.*)$",
	"working_dir": "${file_path}",														// 工作空间目录
	"selector": "source.c",																// 筛选指定源文件
	"encoding": "utf-8",																// 编码

	"variants":
	[
		{
			"name": "Compile",															// 编译获得汇编文件
			"cmd": ["cmd", "/c", "gcc", "-S", "${file_name}"]
		},
		{
			"name": "Compilation",														// 汇编获得obj文件
			"cmd": ["cmd", "/c", "gcc", "-c", "${file_name}"]
		},
		{
			"name": "Debug",															// Debug
			"cmd": ["cmd", "/c","start", "cmd", "/c", "gdb", "${file_base_name}"]
		},
		{
			"name": "Run",																// 运行
			"cmd": ["cmd","/c","start", "cmd", "/c", "${file_base_name} & pause"]
		}
	]
}
```

- 使用c18标准，输出调试信息(-g)，加所有警告(-Wall)

- ```
    ${file}：当前文件的完整路径，例如C：\ Files \ Chapter1.txt。
    ${file_path}：当前文件的目录，例如C：\ Files。
    ${file_name}：当前文件的名称部分，例如Chapter1.txt。
    ${file_extension}：当前文件的扩展名部分，例如txt。
    ${file_base_name}：当前文件的仅名称部分，例如Document。
    ```

**C++** 

```json
{
	"cmd": "g++ -g -Wall -std=c++17 \"${file_name}\" -o \"${file_base_name}\"",			// 构建
	"file_regex": "^(..[^:]*):([0-9]+):?([0-9]+)?:? (.*)$",
	"working_dir": "${file_path}",														// 工作空间目录
	"selector": "source.c++",															// 筛选指定源文件
	"encoding": "utf-8",																// 编码

	"variants":
	[
		{
			"name": "Compile",															// 编译获得汇编文件
			"cmd": ["cmd", "/c", "g++", "-S", "${file_name}"]
		},
		{
			"name": "Compilation",														// 汇编获得obj文件
			"cmd": ["cmd", "/c", "g++", "-c", "${file_name}"]
		},
		{
			"name": "Debug",															// Debug
			"cmd": ["cmd", "/c","start", "cmd", "/c", "gdb", "${file_base_name}"]
		},
		{
			"name": "Run",																// 运行
			"cmd": ["cmd","/c","start", "cmd", "/c", "${file_base_name} & pause"]
		}
	]
}
```

使用快捷鍵 `Ctrl + Shift + B` 选择用什么编译

![image-20210414204235174](https://img2020.cnblogs.com/blog/2213660/202104/2213660-20210414204235886-946556101.png) 

快捷键 `Ctrl+ B` 使用上一次的编译方式