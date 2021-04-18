## 操作DOM对象

**DOM** :文档对象模型

![image-20210417215012842](https://img2020.cnblogs.com/blog/2213660/202104/2213660-20210417215013073-833499944.png) 

> 核心

浏览器网页就是一个Dom树形结构！

操作：

- 更新：更新Dom节点
- 遍历：得到Dom节点
- 删除：删除一个Dom节点
- 添加：添加一个新的节点

要操作一个Dom节点，就必须要先获得这个Dom节点



> 获得Dom节点

```html
<div id="father">
    <h1>标题一</h1>
    <p id="p1">p1</p>
    <p class="p2">p2</p>
</div>


<script>
    let h1 = document.getElementsByTagName('h1');       // 标签选择器,返回节点列表
    let p1 = document.getElementById('p1');             // id选择器
    let p2 = document.getElementsByClassName('p2');     // class选择器，返回节点列表

    let father = document.getElementById('father');

    // 读写
    father.children;                    // 获取所有子节点
    father.firstElementChild            // 第一个字节点
    father.lastElementChild             // 最后一个子节点
    // 只读
    father.childNodes                   // 所有节点
    father.firstChild                   // 第一个字节点，包含空白符
    father.lastChild                    // 最后一个子节点，包含空白符

    father.childElementCount            // 子节点数

</script>
```



> 更新节点

```html
<div id="father">
    <h1>标题一</h1>
    <p id="p1">p1</p>
    <p id="p2">p2</p>
    <p class="p3">p3</p>
    <button id="button" onclick="button_click()">点击更新节点</button>
</div>

<script>
    'use strict';

    let p1 = document.getElementById('p1');
    let p2 = document.getElementById('p2');
    let p3 = document.getElementsByClassName('p3');
    function button_click() {
        // 操作节点内容
        p1.innerText = 'p1更新节点';
        p2.innerHTML = '<strong>p2更新节点</strong>';
        p3[0].innerHTML = '<a href="01获得Dom节点.html" target="_blank">点击跳转</a>';

        // 操作节点CSS
        p1.style.color = 'red';
    }
    // let button = document.getElementById('button');
    // button.onclick = button_click;

</script>
```

![image-20210418111742842](https://img2020.cnblogs.com/blog/2213660/202104/2213660-20210418111744156-1621708015.png) 

点击按钮后

![image-20210418111755509](https://img2020.cnblogs.com/blog/2213660/202104/2213660-20210418111756237-1934507228.png)  

- .innerText: 内部文本
- .innerHTML：内部HTML
- .style：标签CSS样式
- button标签：
    - onclick：事件绑定



> 删除节点

```html
<div id="father">
    <h1>标题一</h1>
    <p id="p1">p1</p>
    <p id="p2">p2</p>
    <button id="button" onclick="button_click()">点击删除</button>
</div>

<script>
    'use strict';
    
    let p1 = document.getElementById('p1');
    function button_click(){
        p1.remove();
    }
    // let button = document.getElementById('button');
    // button.onclick = button_click;
</script>
```

![image-20210418155558988](https://img2020.cnblogs.com/blog/2213660/202104/2213660-20210418155559854-1554696819.png) 

![image-20210418155612622](https://img2020.cnblogs.com/blog/2213660/202104/2213660-20210418155613475-1720763686.png) 

- .remove():删除节点



> 插入节点

```html
<p id="java">JAVA</p>
<div id="list">
    <p id="se">JavaSE</p>
    <p id="ee">JavaEE</p>
    <p id="me">JavaME</p>
</div>
<button onclick="button_click1()">点击添加</button>
<button onclick="button_click2()">点击移动</button>

<script>
    let java = document.getElementById('java');
    let div = document.getElementById('list');
    // 添加节点
    function button_click1(){
        let newp = document.createElement('p');         // 创建一个新节点
        // 设置属性
        // newp.id = 'js';
        newp.setAttribute('id', 'js');
        newp.innerText = 'Javascript';
        // 添加
        div.append(newp);
    }
    // 添加现有节点(移动)
    function button_click2(){
        div.append(java);
    }

</script>
```



> insert

```javascript
function button_click3(){
    let newp = document.createElement('h1');
    newp.setAttribute('class', 'js');
    newp.innerText = '标题';
    java.insertAdjacentElement('beforebegin', newp);
}
```

- **.insertAdjacentElement()** ：将一个给定的元素节点插入到相对于被调用的元素的给定的一个位置。

- **.insertAdjacentHTML()** ：将一段HTML文本解析为节点，并插入到指定位置

- **.insertAdjacentText()** ：方法将一个给定的文本节点插入在相对于被调用的元素给定的位置。

- 相对位置：

    - `'beforebegin'`：节点本身之前。
    - `'afterbegin'`：节点第一个子节点之前。
    - `'beforeend'`：节点最后一个子之后。
    - `'afterend'`：节点本身之后。

- **.insertBefore()** ：

    ```javascript
    parentNode.insertBefore(newNode, referenceNode);
    ```

    - `parentNode` ：新插入节点的父节点
    - `newNode` ：用于插入的节点
    - `referenceNode` ： `newNode` 将要插在这个节点之前

