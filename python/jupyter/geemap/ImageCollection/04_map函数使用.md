## map函数使用

map函数可以将自定义的函数作用到数据集或列表的每一个元素中

```python
def addTime(image):
    return image.addBands(image.metadata('system:time_start'))
collection = ee.ImageCollection('LANDSAT/LC08/C01/T1_TOA')\
  .filter(ee.Filter.eq('WRS_PATH', 44))\
  .filter(ee.Filter.eq('WRS_ROW', 34))
image1 = collection.map(addTime).first()
image2 = collection.first()
print(image1.bandNames().getInfo())
print(image2.bandNames().getInfo())
```

![image-20210102210253419](https://img2020.cnblogs.com/blog/2213660/202101/2213660-20210102210253738-1554538602.png)

- **addTime** ：为自定义函数，内容为添加一个时间波段
- **metadata()** ：将 **image** 的指定属性变为 **double** 常量 **Image** 对象
- **map()** ：将 **addTime** 作用到数据集中的每一幅影像