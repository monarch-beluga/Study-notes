## 操作BOM对象

> 浏览器介绍

**Javascript** 和 浏览器的关系？

**JavaScript** 诞生就是为了能够让他在浏览器中运行！

**BOM**：浏览器对象模型

- IE 6-11
- Chrome
- Safari
- FireFox
- Opera



> window (重要)

**window** 代表浏览器窗口

```javascript
// window.alert(1);    // 弹窗
// 内部高度与宽度与浏览器网页缩放有关
console.log(window.innerHeight);        // 内部高度
console.log(window.innerWidth);         // 内部宽度
// 外部高度与宽度与显示器的分辨率有关
// 网页100%缩放时，outerWidth-innerWidth=16
console.log(window.outerHeight);         // 外部宽度
console.log(window.outerWidth);         // 外部宽度
```



> Navigator

**Navigator** 封装了浏览器的信息

```javascript
navigator.appName			// 网页名称
"Netscape"
navigator.appVersion		// 浏览器的平台和版本信息
"5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36"
navigator.userAgent			// 返回由客户机发送服务器的user-agent头部的值(即UA)
"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36"
navigator.platform			// 返回运行浏览器的操作系统平台
"Win32"
```

大多数时候，我们不会使用 `navigator` 对象，因为会被人为修改**(如UA伪装)** 

不建议使用这些属性来判断和编写代码



> screen

```javascript
screen.width            // 显示器的宽，单位px
// 1920
screen.height           // 显示器的高
// 1080
```



> location (重要)

**location** 代表当前页面的 **URL** 信息

```javascript
// location的一部分属性和方法
host: "v.qq.com"				// 主机
href: "https://v.qq.com/"		// 网址
protocol: "https:"				// 协议
reload: ƒ reload()				// 刷新网页
// 设置新的地址
location.assign('https://www.baidu.com/')
```



> document

**document** 代表当前的页面， HTML,DOM文档

```html
<dl id="dl">
    <dt>Java</dt>
    <dd>JavaSE</dd>
    <dd>JavaEE</dd>
</dl>

<script>
    // 根据id选择器获取元素，同理还有根据类选择器等来获取元素
    let dl = document.getElementById('dl');
    console.log(dl)
    /*<dl id="dl">
        <dt>Java</dt>
    <dd>JavaSE</dd>
    <dd>JavaEE</dd>
    </dl>*/
    // 网页标题(可修改)
    console.log(document.title)
    /*document*/
    // 获取cookie
    console.log(document.cookie)
</script>
```

- 可以获取和增加文档树的节点



> history

```javascript
history.back()			// 后退
history.forward()		// 前进
```

