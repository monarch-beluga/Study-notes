## 使用前的准备

- **首先需要科学上网** ，推荐几个工具

    1.  **shadowsocks**
    2.  **shadowsocksR** 
    3.  **V2ray** 

- **知道代理端口** 

    1. **shadowsocks** 

        ![image-20201116101511459](https://img2020.cnblogs.com/blog/2213660/202011/2213660-20201116101513137-1798026913.png)

    2.  **shadowsocksR** 

        ![image-20230309213120470](https://img2023.cnblogs.com/blog/2213660/202303/2213660-20230309213121843-67747669.png)

    3.  **V2ray** 

        ![image-20230309213214094](https://img2023.cnblogs.com/blog/2213660/202303/2213660-20230309213215203-1733398350.png)

- 编写一个 **startup.py** 的文件

    - urllib3 1.26版本之前

        ```python
        import os
        # 这里的1080即上述的代理端口， 替换为自己的代理端口即可
        os.environ['http_proxy']= "http://127.0.0.1:1080"
        os.environ['https_proxy']= "https://127.0.0.1:1080"
        os.environ['HTTP_PROXY']= os.environ['http_proxy']
        os.environ['HTTPS_PROXY']= os.environ['https_proxy']
        ```

    - 1.26之后

        ```python
        import os
        # 这里的1080即上述的代理端口， 替换为自己的代理端口即可
        os.environ['http_proxy']= "http://127.0.0.1:1080"
        os.environ['HTTP_PROXY']= os.environ['http_proxy']
        os.environ['HTTPS_PROXY']= os.environ['http_proxy']
        ```

-  然后将该文件放入C盘用户文件夹下的**%USERPROFILE%\\.ipython\profile_default\startup** 中

    ![image-20201116102330525](https://img2020.cnblogs.com/blog/2213660/202011/2213660-20201116102331899-1424343006.png)

**大功告成！！！** 



## 简单使用

### 导入地图

```python
import geemap

Map = geemap.Map()
Map
```

![image-20201116121648593](https://img2020.cnblogs.com/blog/2213660/202011/2213660-20201116121650283-1074635751.png)

### 指定坐标缩放

```python
# Map.setCenter(lon, lat, zoom)
Map.setCenter(116, 40, 7)
```

![image-20201116122232582](https://img2020.cnblogs.com/blog/2213660/202011/2213660-20201116122234189-1994157654.png)

### 添加其他底图

```python
Map.add_basemap('HYBRID')
```

![image-20201116122551916](https://img2020.cnblogs.com/blog/2213660/202011/2213660-20201116122553698-1065657030.png)

### 将shapefile转换为Earth Engine对象

```python
ee_object = geemap.shp_to_ee(shp_file_path)
```

### 将Earth Engine数据层添加到地图

```python
Map.addLayer(ee_object, vis_params, name, shown, opacity)
```

### 将ee.Image导出为GeoTIFF文件

```python
geemap.ee_export_image(ee_object, filename, scale, crs, region, file_per_band)
```

### 创建拆分面板地图

```python
Map.split_map(left_layer='HYBRID', right_layer='ESRI')
```



**具体信息还请转至** [geemap文档](https://geemap.readthedocs.io/en/latest/readme.html) 











