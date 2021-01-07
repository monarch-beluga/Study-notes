## FeatureCollection信息和元数据

#### 元数据聚合

```python
def fun(feature):
    num = ee.Number.parse(feature.get('areasqkm'))
    return feature.set('areasqkm', num)

sheds = ee.FeatureCollection('USGS/WBD/2017/HUC06')\
        .filterBounds(ee.Geometry.Rectangle(-127.18, 19.39, -62.75, 51.29))\
        .map(fun)

Map.addLayer(sheds, {}, 'watersheds')
first = sheds.first()

print('Count:', sheds.size().getInfo())

print('Area stats:', sheds.aggregate_stats('areasqkm').getInfo())
```

![image-20210107201945899](https://img2020.cnblogs.com/blog/2213660/202101/2213660-20210107201947800-1212531294.png)

- 数据获取方式与 **ImageCollection** 是一样的



#### 属性信息

```python
wdpa = ee.FeatureCollection("WCMC/WDPA/current/points")
wdpa.limit(0).getInfo()['columns']
```

- 先 **getInfo()** 即可获取 **FeatureCollection** 全部信息，然后选择其中的 **columns** ，返回的是一个 **dict** 
- 这里使用 **limit(0)** 是因为与 **ImageCollection**  一样，请求的数量不能超过5000



