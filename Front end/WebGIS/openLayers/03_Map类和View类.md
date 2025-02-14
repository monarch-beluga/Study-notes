## openLayers要素介绍

### 一、地图创建

```javascript
const map = new Map({
    target: "map",      // 指定id属性
    layers: [
        new TileLayer({
            source: new XYZ({
                url:'https://services.arcgisonline.com/ArcGIS/rest/services/World_Imagery/MapServer/tile/{z}/{y}/{x}',
                wrapX: false,
            }),
        }),
    ],                      // 图层
    view: new View({
        center: [116.00628025588664, 29.6783993323542],
        zoom: 10,
        projection: "EPSG:4326",
        maxZoom: 18,
        minZoom: 9,
        extent: [115.50, 29.1, 116.50, 30.1]
    }), //视图默认投影坐标体系 不是 经纬度坐标体系 而是墨卡托坐标体系
});

const buttons = document.querySelectorAll('.buttons button');

buttons[0].onclick = function () {
    const view = map.getView();
    let center = [116.00628025588664, 29.6783993323542];
    view.setCenter(center);
    view.setZoom(9);
    map.render();
}

buttons[1].onclick = function () {
    const bjCenter = [116.00, 29.30];
    const view = map.getView();
    view.animate({
        center: bjCenter,
        zoom: 18,
        duration: 3000,
    })
}
```

#### 1、Map类

openLayers中控制地图图层的类，主要由下面三个属性

- target: 定义地图绑定在网页的哪个id标签上，id是**全局唯一**的
- layers：map中的图层
- view：map的视图

主要方法

- addLayer(): 添加图层
- render(): 重新渲染地图，一般在改变了视图操作之后调用



#### 2、View类

控制地图视图的类，主要属性

- center: 地图视图显示中心
- zoom: 缩放级别
- projection: 地图投影
- maxZoom: 最大缩放级别
- minZoom: 最小缩放级别
- extent: 地图范围

主要方法

- animate(): 为视图的平移，旋转，缩放添加动画效果
    - center: 需要转换的视图中心
    - zoom: 需要改变的缩放级别
    - duration: 动画时间 单位毫秒



