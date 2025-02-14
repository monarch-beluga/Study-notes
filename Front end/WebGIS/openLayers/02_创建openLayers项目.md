## 创建openLayers项目

我们使用IDEA作为IDE(集成开发环境)，来构建项目

#### 1、创建项目

在IDEA中新建项目，选择Vite作为生成器，然后选择vanilla作为模板

![image-20250104161206176](https://img2023.cnblogs.com/blog/2213660/202501/2213660-20250104161208029-835178502.png)

- vanilla：原生的JavaScript
- react，Vue，svelte，preact，lit: 前端开发框架



#### 2、安装依赖

项目创建完成后，会出现安装依赖项的提示，点击 运行 'npm install' 即可

或者可在手动在终端中使用 'npm install' 来安装依赖项

![image-20250104161635715](https://img2023.cnblogs.com/blog/2213660/202501/2213660-20250104161637530-1508996462.png)



#### 3、删除不必要的文件

打开项目，查看文件树

```
demo
|-- .idea
|-- node_modules
|-- public
|-- src
| |-- counter.js
| |-- javascript.svg
| |-- main.js
| |-- style.css
|-- index.html
|-- package.json
```

其中index.html是项目的主网页，src中的counter.js是不必要的，直接删除，然后再将main.js和style.css中的内容清空，将index.html中id为app的div改id为map

![image-20250104164054983](https://img2023.cnblogs.com/blog/2213660/202501/2213660-20250104164057073-695766003.png)



#### 4、安装openLayers依赖

在终端中输入

```shell
npm install  ol
# 或者可将install 简化为 i
npm i ol
```

![image-20250104162828173](https://img2023.cnblogs.com/blog/2213660/202501/2213660-20250104162830387-1260576494.png)

这些依赖库全都在项目目录的node_modules目录中，并且我们打开package.json也能查看添加了那些库

![image-20250104162943098](https://img2023.cnblogs.com/blog/2213660/202501/2213660-20250104162944967-1867876039.png)



**至此，项目的配置就基本完成了，接下来就是写代码了**