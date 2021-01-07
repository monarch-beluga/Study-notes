## FeatureCollection概述

一组相关的 **Feature** 可以合并成一个 **FeatureCollection** ，以便在整个集合上启用额外的操作，如过滤、排序和呈现。除了简单的 **Feature** (**Geometry** + 属性) ，特征集合还可以包含其他的集合。

### featureCollection的创建

```python
features = [
    ee.Feature(ee.Geometry.Rectangle(30.01, 59.80, 30.59, 60.15), {'name': 'Voronoi'}),
    ee.Feature(ee.Geometry.Point(-73.96, 40.781), {'name': 'Thiessen'}),
    ee.Feature(ee.Geometry.Point(6.4806, 50.8012), {'name': 'Dirichlet'})
]

fromList = ee.FeatureCollection(features)
print(fromList.getInfo())

fromGeom = ee.FeatureCollection(ee.Geometry.Point(16.37, 48.225))
print(fromGeom.getInfo())
```

![image-20210107173525506](https://img2020.cnblogs.com/blog/2213660/202101/2213660-20210107173527434-1360743420.png)

- **ee.FeatureCollection** ：创建 **FeatureCollection** 对象，参数可以是 **Feature** 列表，也可以是单个 **Feature** 

```python
fc = ee.FeatureCollection('TIGER/2016/Roads')
Map.setCenter(-73.9596, 40.7688, 12)
Map.addLayer(fc, {}, 'Census roads')
```

- 还可以通过 **gee** 提供的资产 **ID** 来建立



### 获取随机样本

```python
region = ee.Geometry.Rectangle(-119.224, 34.669, -99.536, 50.064)

randomPoints = ee.FeatureCollection.randomPoints(region)

Map.centerObject(randomPoints, 5)
Map.addLayer(region, {}, 'region')
Map.addLayer(randomPoints, {'color': 'ff0000'}, 'random points')
```

![image-20210107175056793](https://img2020.cnblogs.com/blog/2213660/202101/2213660-20210107175058747-363703424.png)

- **randomPoints()** ：获取指定几何范围中的随机点数据