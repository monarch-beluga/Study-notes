## CSS的三种导入方法

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <!--内部样式-->
	<style>
		h1{
			color: green
		}
	</style>
    <!--外部样式--链接式-->
    <link rel="stylesheet" href="CSS/style.css">
    <!--外部样式--导入式-->
    <style>
            @import url("CSS/style.css");
    </style>
</head>
<body>

    <!--优先级：就近原则-->
    
	<!--行内样式：在标签元素中，编写一个style属性，编写样式即可-->
    <h1 style="color:red">我是标题</h1>


</body>
</html>
```

![image-20210321231252574](https://i.loli.net/2021/03/21/l6AdS4GRxBeQvMX.png) 

- **行内样式** ：在标签元素中，编写一个style属性，编写样式即可

    ```html
    <!--行内样式：在标签元素中，编写一个style属性，编写样式即可-->
    <h1 style="color:red">我是标题</h1>
    ```

- **内部样式** ：在HTML文件内部编写

    ```html
    <!--内部样式-->
    <style>
        h1{
            color: green
        }
    </style>
    ```

    

- **外部样式** 

    - 链接式：**link** 标签导入   (常用，建议使用)，属于 **HTML** 

        ```html
        <!--外部样式--链接式-->
        <link rel="stylesheet" href="CSS/style.css">
        ```

    - 导入式：**style** 标签中用 **@import url()** 导入   (不建议使用，会导致网站先加载结构而后加载CSS)，属于 **CSS2.1** 特有的

        ```html
        <!--外部样式--导入式-->
        <style>
            @import url("CSS/style.css");
        </style>
        ```

- 四种导入方式作用同一标签时，采用 **就近原则** 匹配

