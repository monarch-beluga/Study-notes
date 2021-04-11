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



> window

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



