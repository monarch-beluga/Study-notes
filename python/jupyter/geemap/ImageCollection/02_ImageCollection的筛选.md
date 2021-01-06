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

##### 根据时间范围来筛选

```python
mod13A2 = ee.ImageCollection('MODIS/006/MOD13A2')\
  .filter(ee.Filter.calendarRange(58, 119, 'day_of_year'))
print(mod13A2.aggregate_array('system:id').getInfo())
```

- 这个筛选方法比较特殊，它可以选择 **“day_of_year, day_of_month, and day_of_week”** 三种，选择 **day_of_year** 时，按照一年有 365 或者 366天，那上述代码就表示 **时间序列** 在一年中的第58天和119天之间的 **Image** ，这样就能较为准确的选择 **三月到四月** 的影像， **day_of_month, and day_of_week** 同理