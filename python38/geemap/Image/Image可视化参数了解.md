## 可视化参数

### 内置参数

- ***bands*** ：需要一个有且只含三个元素的列表，列表里每一个参数为影像的一个波段的名称，用这三个波段来映射到**RGB**的红绿蓝三种颜色中

- ***min,max*** ：设置显示波段颜色值的范围

- ***gamma*** ：即用于gamma矫正的一些参数，以矫正图像

    ```python
    image = ee.Image('LANDSAT/LC08/C01/T1_TOA/LC08_044034_20140318').select('B3', 'B4', 'B5')
    vizParams = {
      'bands': ['B5', 'B4', 'B3'],
      'min': 0,
      'max': 0.5,
      'gamma': [0.95, 1.1, 1]
    }
    Map.setCenter(-122.1899, 37.5010, 8)      # 按地图视图按经纬度坐标来
    Map.addLayer(image, vizParams, 'false color composite')
    ```

    ![image-20201117191748333](https://img2020.cnblogs.com/blog/2213660/202011/2213660-20201117191750507-1375356697.png)

- ***palette*** : 用于以彩色显示单波段的图像，由CSS样式的颜色字符串列表来建立色带显示图像

    ```python
    image = ee.Image('LANDSAT/LC08/C01/T1_TOA/LC08_044034_20140318')
    ndwi = image.normalizedDifference(['B3', 'B5'])
    # 计算两个波段之间归一化差异,计算方法为两个波段之差除以两个波段之和
    ndwiViz = {'min': 0.5, 'max': 1, 'palette': ['00FFFF', '0000FF']}
    Map.setCenter(-122.1899, 37.5010, 9)
    Map.addLayer(ndwi, ndwiViz, 'NDWI')
    ```

    ![image-20201117192109665](https://img2020.cnblogs.com/blog/2213660/202011/2213660-20201117192112023-1190331620.png)

- 



## 外部函数

- ***updateMask*** : 将不符合要求的点在图像上设置成不透明度为0

    ```python
    ndwiMasked = ndwi.updateMask(ndwi.gte(0.4))
    Map.addLayer(ndwiMasked, ndwiViz, 'NDWI masked')
    ```

    ![image-20201117192601504](https://img2020.cnblogs.com/blog/2213660/202011/2213660-20201117192603648-826237364.png)

- ***visualize*** : 可视化图像的RGB和灰度值

    ```python
    imageRGB = image.visualize(**{'bands': ['B5',  'B4',  'B3'], 'max': 0.5})
    ndwiRGB = ndwiMasked.visualize(**{
      'min': 0.5,
      'max': 1,
      'palette': ['00FFFF', '0000FF']
    })
    Map.addLayer(imageRGB, {}, "imageRGB")
    Map.addLayer(ndwiRGB, {}, "ndwiRGB")
    ```

    ![image-20201117193121003](https://img2020.cnblogs.com/blog/2213660/202011/2213660-20201117193123122-562422254.png)

    ![image-20201117193128607](https://img2020.cnblogs.com/blog/2213660/202011/2213660-20201117193130593-1699543122.png)

- ***mosaic()*** : 先用ImageCollection建立影像集，然后用.mosaic()按集合中的影像顺序绘制图层,实现一种镶嵌的效果

    ```python
    mosaic = ee.ImageCollection([imageRGB, ndwiRGB]).mosaic()
    Map.addLayer(mosaic, {}, 'mosaic')
    ```

    ![image-20201117193336594](https://img2020.cnblogs.com/blog/2213660/202011/2213660-20201117193338817-1227544763.png)

- ***clip*** : 为裁剪图层

    ```python
    roi = ee.Geometry.Point([-122.4481, 37.7599]).buffer(20000)
    # buffer返回一个给定距离的缓冲区，给定的范围的单位为米
    Map.addLayer(mosaic.clip(roi))
    ```

    ![image-20201117193504216](https://img2020.cnblogs.com/blog/2213660/202011/2213660-20201117193506275-8393358.png)



## 进阶用法

- ***palette*** 按地物类别创建的调色板来渲染地图

    ```python
    cover = ee.Image('MODIS/051/MCD12Q1/2012_01_01') \
      .select('Land_Cover_Type_1')
    
    igbpPalette = [
      'aec3d4', # water
      '152106', '225129', '369b47', '30eb5b', '387242', # forest
      '6a2325', 'c3aa69', 'b76031', 'd9903d', '91af40',  # shrub, grass
      '111149', # wetlands
      'cdb33b', # croplands
      'cc0013', # urban
      '33280d', # crop mosaic
      'd7cdcc', # snow and ice
      'f7e084', # barren
      '6f6f6f'  # tundra
    ]
    
    Map.setCenter(-99.229, 40.413, 5)
    Map.addLayer(cover,
                 {'min': 0, 'max': 17, 'palette': igbpPalette},
                 'IGBP classification')
    ```

    ![image-20201117213116756](https://img2020.cnblogs.com/blog/2213660/202011/2213660-20201117213118887-1557171330.png)

- ***sldStyle()*** ： 使用 **XML** 写法来渲染图层颜色

    ```python
    cover = ee.Image('MODIS/051/MCD12Q1/2012_01_01').select('Land_Cover_Type_1')
    
    # Define an SLD style of discrete intervals to apply to the image.
    sld_intervals = \
    '<RasterSymbolizer>' + \
     ' <ColorMap type="intervals" extended="False" >' + \
        '<ColorMapEntry color="#aec3d4" quantity="0" label="Water"/>' + \
        '<ColorMapEntry color="#152106" quantity="1" label="Evergreen Needleleaf Forest"/>' + \
        '<ColorMapEntry color="#225129" quantity="2" label="Evergreen Broadleaf Forest"/>' + \
        '<ColorMapEntry color="#369b47" quantity="3" label="Deciduous Needleleaf Forest"/>' + \
        '<ColorMapEntry color="#30eb5b" quantity="4" label="Deciduous Broadleaf Forest"/>' + \
        '<ColorMapEntry color="#387242" quantity="5" label="Mixed Deciduous Forest"/>' + \
        '<ColorMapEntry color="#6a2325" quantity="6" label="Closed Shrubland"/>' + \
        '<ColorMapEntry color="#c3aa69" quantity="7" label="Open Shrubland"/>' + \
        '<ColorMapEntry color="#b76031" quantity="8" label="Woody Savanna"/>' + \
        '<ColorMapEntry color="#d9903d" quantity="9" label="Savanna"/>' + \
        '<ColorMapEntry color="#91af40" quantity="10" label="Grassland"/>' + \
        '<ColorMapEntry color="#111149" quantity="11" label="Permanent Wetland"/>' + \
        '<ColorMapEntry color="#cdb33b" quantity="12" label="Cropland"/>' + \
        '<ColorMapEntry color="#cc0013" quantity="13" label="Urban"/>' + \
        '<ColorMapEntry color="#33280d" quantity="14" label="Crop, Natural Veg. Mosaic"/>' + \
        '<ColorMapEntry color="#d7cdcc" quantity="15" label="Permanent Snow, Ice"/>' + \
        '<ColorMapEntry color="#f7e084" quantity="16" label="Barren, Desert"/>' + \
        '<ColorMapEntry color="#6f6f6f" quantity="17" label="Tundra"/>' + \
      '</ColorMap>' + \
    '</RasterSymbolizer>'
    Map.addLayer(cover.sldStyle(sld_intervals), {}, 'IGBP classification styled')
    ```

    ![image-20201117220220843](https://img2020.cnblogs.com/blog/2213660/202011/2213660-20201117220224202-1285364607.png)

    **不仅仅可以用来给数据分类，还能按等级区分数据**

    ```python
    
    image = ee.Image('CGIAR/SRTM90_V4')
    
    # Define an SLD style of discrete intervals to apply to the image.
    sld_intervals = \
      '<RasterSymbolizer>' + \
        '<ColorMap type="intervals" extended="False" >' + \
          '<ColorMapEntry color="#0000ff" quantity="0" label="0"/>' + \
          '<ColorMapEntry color="#00ff00" quantity="100" label="1-100" />' + \
          '<ColorMapEntry color="#007f30" quantity="200" label="110-200" />' + \
          '<ColorMapEntry color="#30b855" quantity="300" label="210-300" />' + \
          '<ColorMapEntry color="#ff0000" quantity="400" label="310-400" />' + \
          '<ColorMapEntry color="#ffff00" quantity="1000" label="410-1000" />' + \
        '</ColorMap>' + \
      '</RasterSymbolizer>'
    
    # Define an sld style color ramp to apply to the image.
    sld_ramp = \
      '<RasterSymbolizer>' + \
        '<ColorMap type="ramp" extended="False" >' + \
          '<ColorMapEntry color="#0000ff" quantity="0" label="0"/>' + \
          '<ColorMapEntry color="#00ff00" quantity="100" label="100" />' + \
          '<ColorMapEntry color="#007f30" quantity="200" label="200" />' + \
          '<ColorMapEntry color="#30b855" quantity="300" label="300" />' + \
          '<ColorMapEntry color="#ff0000" quantity="400" label="400" />' + \
          '<ColorMapEntry color="#ffff00" quantity="500" label="500" />' + \
        '</ColorMap>' + \
      '</RasterSymbolizer>'
    
    # Add the image to the map using both the color ramp and interval schemes.
    Map.setCenter(-76.8054, 42.0289, 8)
    Map.addLayer(image.sldStyle(sld_intervals), {}, 'SLD intervals')
    Map.addLayer(image.sldStyle(sld_ramp), {}, 'SLD ramp')
    ```

    ![image-20201117220633732](https://img2020.cnblogs.com/blog/2213660/202011/2213660-20201117220636030-1203465325.png)

    ![image-20201117220659195](https://img2020.cnblogs.com/blog/2213660/202011/2213660-20201117220701222-640639251.png)

    **在显示多波段时，还可以用来增强显示某一个波段** 

    ```python
    image = ee.Image('LANDSAT/LC08/C01/T1/LC08_044034_20140318')
    
    template_sld = \
      '<RasterSymbolizer>' + \
        '<ContrastEnhancement><_enhance_/></ContrastEnhancement>' + \
        '<ChannelSelection>' + \
          '<RedChannel>' + \
            '<SourceChannelName>B5</SourceChannelName>' + \
          '</RedChannel>' + \
          '<GreenChannel>' + \
            '<SourceChannelName>B4</SourceChannelName>' + \
          '</GreenChannel>' + \
          '<BlueChannel>' + \
            '<SourceChannelName>B3</SourceChannelName>' + \
          '</BlueChannel>' + \
        '</ChannelSelection>' + \
      '</RasterSymbolizer>'
    
    equalize_sld = template_sld.replace('_enhance_', 'Histogram')
    normalize_sld = template_sld.replace('_enhance_', 'Normalize')
    
    Map.centerObject(image, 10)
    Map.addLayer(image, {'bands': ['B5',  'B4',  'B3'], 'min': 0, 'max': 15000}, 'Linear')
    Map.addLayer(image.sldStyle(equalize_sld), {}, 'Equalized')
    Map.addLayer(image.sldStyle(normalize_sld), {}, 'Normalized')
    ```

    ![image-20201117224001095](https://img2020.cnblogs.com/blog/2213660/202011/2213660-20201117224003366-1292276657.png)

    ![image-20201117224006455](https://img2020.cnblogs.com/blog/2213660/202011/2213660-20201117224008892-1018975287.png)

    ![image-20201117224042938](https://img2020.cnblogs.com/blog/2213660/202011/2213660-20201117224045137-1909978621.png)

