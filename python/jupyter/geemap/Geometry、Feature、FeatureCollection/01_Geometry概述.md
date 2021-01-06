## Geometry概述

**Geometry** 包含 **Point** (点)，**LineString** (点的集合)，**LinearRing** (封闭的LineString)，和 **Polygon** (面，LinearRing的集合)，同时也支持 **MultiPoint、MultiLineString、MultiPolygon、MultiGeometry** 

### Geometry的创建

```python
point = ee.Geometry.Point([1.5, 1.5])

linearString = ee.Geometry.LineString(
    [[-35, -10], [35, -10], [35, 10], [-35, 10]])

linearRing = ee.Geometry.LinearRing(
    [[-35, -10], [35, -10], [35, 10], [-35, 10], [-35, -10]])

rectangle = ee.Geometry.Rectangle([-40, -20, 40, 20])

polygon = ee.Geometry.Polygon([
    [[-5, 40], [65, 40], [65, 60], [-5, 60], [-5, 60]]
])
```

- **LineString** 和 **LinearRing** 的区别在与 **LinearRing** 结尾有与开头相同的坐标来进行封闭
- **ee.Geometry.Rectangle** ：创建矩形 **Polygon** 

```python
Map.addLayer(point, {}, 'point')

Map.addLayer(linearString, {}, 'linearString')

Map.addLayer(linearRing, {}, 'linearRing')

Map.addLayer(rectangle, {}, 'rectangle')
Map.center_object(rectangle)
```

```python
Map.addLayer(polygon, {'color': 'ff0000'}, 'polygon')
Map.center_object(polygon)
```

- 将 **Geomety** 添加到 **Map** 中显示



### Geometry分解

单个 **Geometry** 可能包含多个 **geometry** ，如 **MultiPoint** 可以包含多个 **Point** 

```python
multiPoint = ee.Geometry.MultiPoint([[-121.68, 39.91], [-97.38, 40.34]])
geometries = multiPoint.geometries()
pt1 = geometries.get(0)
pt2 = geometries.get(1)
print('Point 1', pt1.getInfo())
print('Point 2', pt2.getInfo())
```

![image-20210106144215948](https://img2020.cnblogs.com/blog/2213660/202101/2213660-20210106144218095-1010937686.png)

- **geometries** ：将 **MultiPoint** 转化为 **List** 