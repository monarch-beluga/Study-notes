## Feature概述

**Feature**  是一个具有存储 **Geometry** 对象(或 **None**)的几何属性和存储其他属性字典的属性的对象

#### Feature的创建

```python
polygon = ee.Geometry.Polygon([
    [[-35, -10], [35, -10], [35, 10], [-35, 10], [-35, -10]]
])
polyFeature = ee.Feature(polygon, {'foo': 42, 'bar': 'tart'})
```

- **ee.Feature** ：创建 **Feature** ,参数可以为 **Geometry** 对象，和一个 **dict** 

```python
print(polyFeature.getInfo())
Map.addLayer(polyFeature, {}, 'feature')
Map.center_object(polyFeature, 3)
```

![image-20210107170345184](https://img2020.cnblogs.com/blog/2213660/202101/2213660-20210107170346897-219217353.png)

- **Feature** 与 **Geometry** 一样可以进行可视化

```python
dict1 = {'foo': ee.Number(8).add(88), 'bar': 'nihao'}
nowhereFeature = ee.Feature(None, dict1)
print(nowhereFeature.getInfo())
```

![image-20210107170350958](https://img2020.cnblogs.com/blog/2213660/202101/2213660-20210107170352628-1084584214.png)

- **Feature** 可以不需要 **Geometry** 属性



#### Feature属性设置

```python
feature = ee.Feature(ee.Geometry.Point([-122.22599, 37.17605]))\
    .set('genus', 'Sequoia').set('species', 'sempervirens')

species = feature.get('species')
print(species.getInfo())

feature = feature.set('presence', 1)
print(feature.getInfo())

newDict = {'genus': 'Brachyramphus', 'species': 'marmoratus'}
feature = feature.set(newDict)

print(feature.getInfo())
```

![image-20210107165811851](https://img2020.cnblogs.com/blog/2213660/202101/2213660-20210107165813812-1464432500.png)

- **set()** ：使用 *key: value*  或者使用 **dict** 来设置属性，当要设置的属性与之前属性相同时，将会覆盖



