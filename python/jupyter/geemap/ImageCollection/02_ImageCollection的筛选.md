## ImageCollection的筛选

##### 根据日期和范围进行筛选

```python
collection = (ee.ImageCollection('LANDSAT/LT05/C01/T2')
  .filterDate('1987-01-01', '1990-05-01')
  .filterBounds(ee.Geometry.Point(25.8544, -18.08874)))
```

- **filterDate()** ：筛选日期， 参数为字符串，等效于 **filter(ee.Filter.Date())** 
- **filterBounds()** ：筛选范围，等效于 **filter(ee.Filter.bounds())** 

##### 根据集合中Image的属性进行筛选

```python
filtered = collection.filterMetadata('IMAGE_QUALITY', 'equals', 9)
```

- **filterMetadata()** ：按属性筛选，参数为：**属性名称**、**运算符**、**属性对应的值** ，等效于 **filter(ee.Filter.Metadata())** 



