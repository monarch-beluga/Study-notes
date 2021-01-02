## 查看ee图层元数据

以下函数返回的都是一个数据对象，要使用 ***.getInfo()*** 来从服务器检索此对象的值

```python
image = ee.Image('LANDSAT/LC08/C01/T1/LC08_044034_20140318')
```

- ***bandNames()*** ：获取波段名称

    ```python
    bandNames = image.bandNames().getInfo()
    print('Band names: ', bandNames)
    ```

    ![image-20201117235431543](https://img2020.cnblogs.com/blog/2213660/202011/2213660-20201117235434583-805591716.png)

- ***projection()*** : 获取一个波段的影像信息

    ```python
    b1proj = image.select('B1').projection().getInfo()
    print('Band 1 projection: ', b1proj)
    ```

    ![image-20201118000019963](https://img2020.cnblogs.com/blog/2213660/202011/2213660-20201118000021910-445669164.png)

- ***nominalScale()*** ： 获取影像分辨率

    ```python
    b1scale = image.select('B4').projection().nominalScale().getInfo()
    print('Band 1 scale: ', b1scale)
    ```

    ![image-20201118001541675](https://img2020.cnblogs.com/blog/2213660/202011/2213660-20201118001543856-1107435289.png)

- ***propertyNames()*** : 获取影像的属性名称

    ```python
    properties = image.propertyNames().getInfo()
    print('Metadata properties: ', properties)
    ```

    ![image-20201118001718443](https://img2020.cnblogs.com/blog/2213660/202011/2213660-20201118001720398-793423478.png)

- ***get()*** : 提供一个属性名称的参数，获取该属性值

    ```python
    cloudiness = image.get('CLOUD_COVER').getInfo()
    print('CLOUD_COVER: ', cloudiness)
    ```

    ![image-20201118001918351](https://img2020.cnblogs.com/blog/2213660/202011/2213660-20201118001920285-1104676306.png)

    - 获取时间属性的方式稍有不同,直接获取到的是一个数值，要将数值改为Date类型，然后格式化输出

        ```python
        image.get('system:time_start').getInfo()
        ```

        ![image-20201118004000749](https://img2020.cnblogs.com/blog/2213660/202011/2213660-20201118004002651-473767728.png)

        ```python
        date = ee.Date(image.get('system:time_start')).format('YYYY-MM-dd HH:mm:ss').getInfo()
        print('Timestamp: ', date)
        ```

        ![image-20201118004036865](https://img2020.cnblogs.com/blog/2213660/202011/2213660-20201118004038731-305003250.png)

        

