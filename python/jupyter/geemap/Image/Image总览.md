## 添加Image图层

- **ee.Image**:  *返回Image对象，用gee中的asset ID为参数导入ee图层数据* 

    *这个asset ID 可以为gee里自带的ID，也可以是个人用户上传到gee的ID* 

    ```python
    loadedImage = ee.Image('JAXA/ALOS/AW3D30/V2_2')
    ```

- **Map.addLayer:** *向geemap.Map对象中添加图层，也可以写成Map.add_ee_layer* 

    ```python
    Map.addLayer(loadedImage, {}, 'loadedImage', opacity=0.5)
    ```
    
    - 四个参数
        1. 第一个为ee数据对象
        2. 二个为一个字典，里面可以设定输出图像的可视化参数，如：值的范围，和图像显示的色带
        3. 第三个为图层名称
        4. 第四个为图层的透明度，默认为1
    
    ![image-20201116124309386](https://img2020.cnblogs.com/blog/2213660/202011/2213660-20201116124311662-928137096.png)



## 在ImageCollection中添加Image图层对象

-  **ee.ImageCollection:** *返回ImageCollection对象，获取gee中的数据集* 

    - 一般配合其他函数使用
        1. **filterBounds()** ：*按范围筛选影像* 
        2. **filterDate()** ：*按日期筛选图像，接受字符串和数值两种形式的参数，建议使用YYYY-MM-dd的形式*
        3. **sort()** ：*按指定Image属性对集合进行排序*
        4. **first()** : *选择数据集中的第一幅 Image 影像* 

    ```python
    first = (ee.ImageCollection('COPERNICUS/S2_SR')
                    .filterBounds(ee.Geometry.Point(-70.48, 43.3631))
                    .filterDate('2019-01-01', '2019-12-31')
                    .sort('CLOUDY_PIXEL_PERCENTAGE')
                    .first())
    Map.centerObject(first, 8)
    Map.addLayer(first, {'bands': ['B4', 'B3', 'B2'], 'min': 0, 'max': 2000}, 'first')
    ```

    ![image-20201116125953613](https://img2020.cnblogs.com/blog/2213660/202011/2213660-20201116125955819-1194080547.png)



## Image数据的基础操作

- **根据常量创建ee对象** 

    ```python
    image1 = ee.Image(1)
    print(image1.getInfo())
    ```

    ![image-20201117234119388](https://img2020.cnblogs.com/blog/2213660/202011/2213660-20201117234121311-1364604560.png)

- **ee对象的合并** 

    ```python
    image2 = ee.Image(2)
    image3 = ee.Image(3)
    image4 = ee.Image.cat([image1, image2, image3])
    print(image4.getInfo())
    ```

    ![image-20201117234220645](https://img2020.cnblogs.com/blog/2213660/202011/2213660-20201117234222665-1174633614.png)

    ```python
    multiband = ee.Image([1, 2, 3])
    print(multiband.getInfo())
    ```

    ![image-20201117234241026](https://img2020.cnblogs.com/blog/2213660/202011/2213660-20201117234242892-754264784.png)

- **ee对象修改波段名** 

    ```python
    renamed = multiband.select(
        [0, 1, 2], # old names
        ['band1', 'band2', 'band3']               # new names
    )
    print(renamed.getInfo())
    ```

    ![image-20201117234732938](https://img2020.cnblogs.com/blog/2213660/202011/2213660-20201117234734836-1697729198.png)

- **向ee对象中添加波段** 

    ```python
    image5 = image4.addBands(ee.Image(42))
    print(image5.getInfo())
    ```

    ![image-20201117234751627](https://img2020.cnblogs.com/blog/2213660/202011/2213660-20201117234753563-1226998451.png)



##  select函数应用

- **导入ee图层中的指定波段————select函数，select有两种传递的参数方式**

    1. 第一种直接传递波段 **索引值** 或 **波段名称**或**其名称的正则表达式**组成的**非列表序列**，如下： 

        ```python
        loadedImage = ee.Image('JAXA/ALOS/AW3D30/V2_2').select('.*?DSM', 'AVE_STK', 2)
        Map.addLayer(loadedImage, {}, 'loadedImage')
        ```

        ![image-20201117190954407](https://img2020.cnblogs.com/blog/2213660/202011/2213660-20201117190956548-1437784142.png)

    2. 第二种传递两个列表，第一个列表用于**波段筛选**，第二个列表用于**指定波段的新名称**两个列表的**元素个数必须一致**，如下：

        ```python
        loadedImage_All = ee.Image('JAXA/ALOS/AW3D30/V2_2').select([0, 1], ['A', 'B'])
        Map.addLayer(loadedImage_All, {}, 'All')
        Map.addLayer(loadedImage_All.select(0), {}, 'A')
        Map.addLayer(loadedImage_All.select('B'), {}, 'B')
        ```

        ![image-20201117191057085](https://img2020.cnblogs.com/blog/2213660/202011/2213660-20201117191059097-1389396013.png)

        ![image-20201117191103495](https://img2020.cnblogs.com/blog/2213660/202011/2213660-20201117191105373-57869411.png)

        ![image-20201117191108114](https://img2020.cnblogs.com/blog/2213660/202011/2213660-20201117191110091-1292686106.png)

        

    