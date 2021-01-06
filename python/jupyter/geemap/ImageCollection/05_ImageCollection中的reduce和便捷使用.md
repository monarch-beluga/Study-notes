## ImageCollection中的reduce和便捷使用

使用 **ImageCollection.reduce()** 可以将数据集转化为单张 **image** ，**reduce()** 时要使用对应的 **ee.Reduce** 对象对 **ImageCollection** 进行处理，处理结果可以为数据集中每一个像元的最大值，最小值，平均值，中位数等……

下面是得到数据集的中位数 **Image** 

```python
collection = ee.ImageCollection('LANDSAT/LC08/C01/T1_TOA')\
    .filter(ee.Filter.eq('WRS_PATH', 44))\
    .filter(ee.Filter.eq('WRS_ROW', 34))\
    .filterDate('2014-01-01', '2015-01-01')

median = collection.reduce(ee.Reducer.median())
Map.addLayer(median,
             {'bands': ['B4_median', 'B3_median', 'B2_median'], 'max': 0.3},
             'also median')

median = collection.median()
Map.setCenter(-122.3578, 37.7726, 12)
Map.addLayer(median, {'bands': ['B4', 'B3', 'B2'], 'max': 0.3}, 'median')
```

- **reduce(ee.Reducer.median())** ：为 **ImageCollection** 中 **reduce** 的运用方式，运用之后图像的波段名称会发生对应的改变
- **median()** ：为 **ImageCollection** 中  **reduce** 的便捷使用方法，同样的便捷使用方法还有 **max(), min(), mean(), sum(), mode(), product(), count()** 