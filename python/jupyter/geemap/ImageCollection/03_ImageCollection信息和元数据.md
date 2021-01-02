## ImageCollection信息和元数据

**ImageCollection** 数据集信息可以直接用 **print** 打印到控制台上，但是打印的最大数量为5000，所以，可以通过其他的方法获得数据信息

```python
collection = (ee.ImageCollection('LANDSAT/LC08/C01/T1_TOA')
    .filter(ee.Filter.eq('WRS_PATH', 44))
    .filter(ee.Filter.eq('WRS_ROW', 34))
    .filterDate('2014-03-01', '2014-08-01'))
print('Collection: ', collection.getInfo())
```

- 直接打印到控制台
- **ee.Filter** ：建立一个筛选器
- **filter** ：通过筛选器来筛选数据



```python
count = collection.size()
print(count.getInfo())
```

- **size()** ：获取数据集的元素个数



```python
start = ee.Date(collection.aggregate_min("system:time_start"))
end = ee.Date(collection.aggregate_max("system:time_start"))
print("Date range:", 
      start.format('YYYY-MM-dd HH:mm:ss').getInfo(),
      end.format('YYYY-MM-dd HH:mm:ss').getInfo())
```

- 获取数据集中的Image的日期范围
- **aggregate_min** ：获取集合内所有元素的给定属性，并计算出最小值



```python
sunStats = collection.aggregate_stats('SUN_ELEVATION')
print('Sun elevation statistics: ', sunStats.getInfo())
```

![image-20210102174556800](https://img2020.cnblogs.com/blog/2213660/202101/2213660-20210102174557137-119533615.png)

- **aggregate_stats** ：获取集合内所有元素的给定属性，并计算所选属性的总和，最小值，最大值，平均值，样本标准偏差，样本方差，总标准偏差和总方差。



```python
image = collection.sort('CLOUD_COVER').first()
print('Least cloudy image: ', image.getInfo())
```

- 将数据集根据云量排序，获取云量最少的Image
- **sort** ：将数据集根据给定的属性排序
- **first()** ：获取数据集中的第一个



```python
recent = collection.sort('system:time_start').limit(10)
print('Recent images: ', recent.getInfo())
```

- 返回数据集中的10个数据
- **limit()** ：返回指定数量的元素，返回值为 **ImageCollection** 类型