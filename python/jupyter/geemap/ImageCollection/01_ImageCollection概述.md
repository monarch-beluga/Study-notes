## ImageCollection概述

#### 数据集(ImageCollection) 创建方法

```python
sentinelCollection = ee.ImageCollection('COPERNICUS/S2_SR')
```

- 使用 **ee.ImageCollection** 通过 **gee** 中的 **asset ID** 来得到对应的数据集

```
collectionFromConstructor = ee.ImageCollection([ee.Image(1), ee.Image(2)])
```

- 使用构造函数，通过列表来建立数据集

```python
collectionFromImages = ee.ImageCollection.fromImages(
  [ee.Image(3), ee.Image(4)])
```

- 通过 **fromImages() ** 来建立数据集

```python
print(collectionFromImages.getInfo())
```

- 通过 **getInfo()** 来得到数据集信息

![image-20210102171126824](https://img2020.cnblogs.com/blog/2213660/202101/2213660-20210102171129855-2103585925.png)