## iframe内联框架

内联框架就是往网页中插入另外一个独立的网页

```html
<iframe src="path" name="mainFrame"></iframe>
```

```html
<!-- iframe内联框架
src:地址
width:宽度
height:高度
name:为iframe命名，与 a链接标签中的参数target配合，可以将链接网页在iframe中打开
-->

<iframe src="https://www.baidu.com" name="hello" width="800" height="800"></iframe>

<a href="https://www.taobao.com" target="hello">点击跳转</a>
```

![image-20210312223845319](https://img2020.cnblogs.com/blog/2213660/202103/2213660-20210312223846759-556120386.png)

![image-20210312223859330](https://img2020.cnblogs.com/blog/2213660/202103/2213660-20210312223900950-635870705.png)

- **src**:地址
- **width**:宽度
- **height**:高度
- **name**:为**iframe**命名，与 **a链接标签**中的参数**target**配合，**可以将链接网页在iframe中打开**