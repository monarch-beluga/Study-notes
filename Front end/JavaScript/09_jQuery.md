## jQuery

javaScript

JQuery库，里面存在大量的JavaScript函数

> 导入

```html
<script src="https://cdn.bootcdn.net/ajax/libs/jquery/3.6.0/jquery.js"></script>
```

![image-20210420210300543](https://img2020.cnblogs.com/blog/2213660/202104/2213660-20210420210301885-1921402534.png) 



> 选择器

```javascript
// 原生js：选择器少，麻烦不好记
// 标签
document.getElementsByTagName('tagName');
// id
document.getElementById('id');
// 类
document.getElementsByClassName('class');
// jQuery
// 标签
$('tagName')
// id
$('#id')
// 类
$('.class')
```



> 事件

鼠标事件，键盘事件，

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>事件</title>
    <style>
        div{
            height: 200px;
            width: 200px;
            border: solid 1px red;
        }
    </style>
    <script src="https://cdn.bootcdn.net/ajax/libs/jquery/3.6.0/jquery.js"></script>
</head>
<body>
<!-- 获取鼠标当前坐标 -->
<p>
    mouse: <span id="mouseMove"></span>
</p>
在这里移动鼠标试试:
<div id="divMove">

</div>

<script>
    // 当网页元素加载完毕之后，响应事件
    $(function (){
        $('#divMove').mousemove(function (e){
            $('#mouseMove').text(e.pageX+','+e.pageY);
        });
    })
</script>

</body>
</html>
```

![image-20210421222305400](https://img2020.cnblogs.com/blog/2213660/202104/2213660-20210421222306002-1482997538.png) 



> 操作DOM对象

**节点文本操作** 

```javascript
let li = $('#test li[id=python]');	// 选择器
li.text();          // 获得值
li.text('设置值');          // 设置值
li.html();                  // 获得值
li.html('设置值');                  // 设置值
```

**CSS操作** 

```javascript
li.css('color','red');           // 单个CSS属性
li.css({'color':'blue', 'font-size':'20px'});       // 多个属性
```

**元素显示隐藏** 

```javascript
i.hide();      // 隐藏
li.show();      // 显示
```

