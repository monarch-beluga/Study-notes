## Geometry运算

```python
polygon = ee.Geometry.Polygon([
    [[-5, 40], [65, 40], [65, 60], [-5, 60], [-5, 60]]
])

buffer = polygon.buffer(1000000)

centroid = polygon.centroid()
Map.addLayer(buffer, {}, 'buffer')
Map.addLayer(polygon, {'color':'ff0000'}, 'polygon')
Map.addLayer(centroid, {'color': '00ff00'}, 'centroid')
Map.center_object(polygon, 3)
```

![image-20210106155608979](https://img2020.cnblogs.com/blog/2213660/202101/2213660-20210106155611423-1667742167.png)

- **buffer()** ：以给定距离建立缓冲区，如果为正，者扩大几何图形，为负，则缩小几何图形，单位为米
- **centroid()** ：计算几何图形的 **质心(几何中心)** 

```python
poly1 = ee.Geometry.Point([-50, 30]).buffer(1e6)
poly2 = ee.Geometry.Point([-40, 30]).buffer(1e6)

Map.setCenter(-45, 30)
Map.addLayer(poly1, {'color': 'FF0000'}, 'poly1')
Map.addLayer(poly2, {'color': '0000FF'}, 'poly2')

intersection = poly1.intersection(poly2, ee.ErrorMargin(1))
Map.addLayer(intersection, {'color': '00FF00'}, 'intersection')

union = poly1.union(poly2, ee.ErrorMargin(1))
Map.addLayer(union, {'color': 'FF00FF'}, 'union')

diff1 = poly1.difference(poly2, ee.ErrorMargin(1))
Map.addLayer(diff1, {'color': 'FFFF00'}, 'diff1')

symDiff = poly1.symmetricDifference(poly2, ee.ErrorMargin(1))
Map.addLayer(symDiff, {'color': '000000'}, 'symmetric difference')
```

- **intersection()** ：交集
- **union()** ：并集
- **difference()** ：差集
- **symmetricDifference()** ：并集与交集的差集