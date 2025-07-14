### **一、目标：**

1. **计算EAAF内每个国家1985-2022年红树林、盐沼、光滩面积变化**
2. **计算EAAF内每0.5°网格内红树林、盐沼、光滩和总面积（三个类型求和）变化（这里暂定0.5°，最后根据效果看看是否要调整为1°）**
3. **根据GEE里已有的在分析数据集，计算EAAF内每个国家1985-2022年滨海区域的年均温、年降水、人口变化等。**



### 二、数据源

#### 1、EAAF数据

研究区域：东亚-澳大利西亚迁飞区EAAF

![image-20250208111348072](https://img2023.cnblogs.com/blog/2213660/202502/2213660-20250208111351701-172701316.png)



#### 2、全球30米土地利用数据集GLC_FCS30D

##### 1、GLC_FCS30D介绍

GLC_FCS30D数据集提供了1985至2022年间全球30米分辨率的土地覆盖变化数据，采用Landsat影像和Google Earth Engine平台的连续变化检测方法，涵盖35个土地覆盖子类，数据更新频率为2000年前每五年一次，2000年后每年一次。

>  地物类型分类

| 值      | Classification                                           | RGB value         | 类别                              | 映射值 |
| ------- | -------------------------------------------------------- | ----------------- | --------------------------------- | ------ |
| 10      | Rainfed cropland                                         | (255,255,100)     | 雨养耕地                          | 1      |
| 11      | Herbaceous cover cropland                                | (255,255,100)     | 草本植被覆盖                      | 2      |
| 12      | Tree or shrub cover (Orchard) cropland                   | (255,255,0)       | 树木或灌木覆盖（果园）            | 3      |
| 20      | Irrigated cropland                                       | (170,240,240)     | 灌溉耕地                          | 4      |
| 51      | Open evergreen broadleaved forest                        | (76,115,0)        | 开阔常绿阔叶林                    | 5      |
| 52      | Closed evergreen broadleaved forest                      | (0,100,0)         | 闭阔常绿阔叶林                    | 6      |
| 61      | Open deciduous broadleaved forest (0.15<fc<0.4)          | (170,200,0)       | 开阔落叶阔叶林（0.15 < fc < 0.4） | 7      |
| 62      | Closed deciduous broadleaved forest                      | (0,160,0)         | 闭阔落叶阔叶林（fc > 0.4）        | 8      |
| 71      | Open evergreen needle-leaved forest (0.15< fc <0.4)      | (0,80,0)          | 开阔常绿针叶林（0.15 < fc < 0.4） | 9      |
| 72      | Closed evergreen needle-leaved forest (fc >0.4)          | (0,60,0)          | 闭阔常绿针叶林（fc > 0.4）        | 10     |
| 81      | Open deciduous needle-leaved forest (0.15< fc <0.4)      | (40,100,0)        | 开阔落叶针叶林（0.15 < fc < 0.4） | 11     |
| 82      | Closed deciduous needle-leaved forest (fc >0.4)          | (40,80,0)         | 闭阔落叶针叶林（fc > 0.4）        | 12     |
| 91      | Open mixed leaf forest (broadleaved and needle-leaved)   | (160,180,50)      | 开阔混交叶片林（阔叶树和针叶树）  | 13     |
| 92      | Closed mixed leaf forest (broadleaved and needle-leaved) | (120,130,0)       | 闭阔混交叶片林（阔叶树和针叶树）  | 14     |
| 120     | Shrubland                                                | (150,100,0)       | 灌木地                            | 15     |
| 121     | Evergreen shrubland                                      | (150,75,0)        | 常绿灌木地                        | 16     |
| 122     | Deciduous shrubland                                      | (150,100,0)       | 落叶灌木地                        | 17     |
| 130     | Grassland                                                | (255,180,50)      | 草地                              | 18     |
| 140     | Lichens and mosses                                       | (255,220,210)     | 地衣和苔藓植被                    | 19     |
| 150     | Sparse vegetation (fc<0.15)                              | (255,235,175)     | 稀疏植被（fc < 0.15）             | 20     |
| 152     | Sparse shrubland (fc<0.15)                               | (255,210,120)     | 稀疏灌木地（fc < 0.15）           | 21     |
| 153     | Sparse herbaceous                                        | (255,235,175)     | 稀疏草本植被（fc < 0.15）         | 22     |
| 181     | Swamp                                                    | (0,168,132)       | 沼泽                              | 23     |
| 182     | Marsh                                                    | (115,255,223)     | 沼泽地                            | 24     |
| 183     | Flooded flat                                             | (158,187,215)     | 水淹平地                          | 25     |
| 184     | Saline                                                   | (130,130,130)     | 盐碱地                            | 26     |
| **185** | **Mangrove**                                             | **(245,122,182)** | **红树林**                        | **27** |
| **186** | **Salt marsh**                                           | **(102,205,171)** | **盐沼地**                        | **28** |
| **187** | **Tidal flat**                                           | **(68,79,137)**   | **潮间带平地**                    | **29** |
| 190     | Impervious surfaces                                      | (195,20,0)        | 不透水表面                        | 30     |
| 200     | Bare areas                                               | (255,245,215)     | 裸地                              | 31     |
| 201     | Consolidated bare areas                                  | (220,220,220)     | 固化裸地                          | 32     |
| 202     | Unconsolidated bare areas                                | (255,245,215)     | 非固化裸地                        | 33     |
| 210     | Water body                                               | (0,70,200)        | 水体                              | 34     |
| 220     | Permanent ice and snow                                   | (255,255,255)     | 永久性冰雪覆盖                    | 35     |
| 0, 250  | Filled value                                             | (255,255,255)     | 填充值                            | 36     |

其中粗体为研究对象的类别



##### 2、GLC_FCS30D数据调用

```python
# 1985--2000
five_year = ee.ImageCollection("projects/sat-io/open-datasets/GLC-FCS30D/five-years-map")

# 2000年后
annual = ee.ImageCollection("projects/sat-io/open-datasets/GLC-FCS30D/annual")
```



##### 3、GLC_FCS30D数据值重新映射

```python
uniqueClasses = [10, 11, 12, 20, 51, 52, 61, 62, 71, 72, 81, 82, 91, 92,120, 121, 122, 130, 140, 150, 152, 153, 181, 182,183, 184, 185, 186, 187, 190, 200, 201, 202, 210, 220, 0]

palette = [
  "#ffff64", "#ffff64", "#ffff00", "#aaf0f0", "#4c7300", "#006400", "#a8c800", "#00a000", 
  "#005000", "#003c00", "#286400", "#285000", "#a0b432", "#788200", "#966400", "#964b00", 
  "#966400", "#ffb432", "#ffdcd2", "#ffebaf", "#ffd278", "#ffebaf", "#00a884", "#73ffdf", 
  "#9ebb3b", "#828282", "#f57ab6", "#66cdab", "#444f89", "#c31400", "#fff5d7", "#dcdcdc", 
  "#fff5d7", "#0046c8", "#ffffff", "#ffffff"
]

def recodeClasses(image):
    reclassed = image.remap(uniqueClasses, ee.List.sequence(1, uniqueClasses.length))
    return reclassed
```



##### 4、GLC_FCS30D年度数据影像生成

```python
# 1985--2000
# GLC_1985_image = recodeClasses(five_year.mosaic().select(f'b1'))
# GLC_1985_image = recodeClasses(five_year.mosaic().select(f'b2'))
images = []
for i in [1, 2, 3]:
    image = recodeClasses(five_year.mosaic().select(f'b{i}'))
    images.append(image)

# 2000年后
# GLC_2000_image = recodeClasses(annual.mosaic().select(f'b1'))
# GLC_2001_image = recodeClasses(annual.mosaic().select(f'b2'))
for i in range(1, 24):
    image = recodeClasses(annual.mosaic().select(f'b{i}'))
    images.append(image)
    
Map.addLayer(images[0], {'palette': palette}, "GLC_1985")
Map.addLayer(images[4], {'palette': palette}, "GLC_2000")
```



#### 三、计算方法

以统计两小块范围内1985年红树林面积

```python
import pandas as pd
pd.set_option('display.float_format',lambda x : '%.0f' % x)

# 统计区域矢量
roi = ee.FeatureCollection([
    ee.Feature(ee.Geometry.Rectangle([115, 2, 120, 7]), {"name": "A"}),
    ee.Feature(ee.Geometry.Rectangle([111, 0, 116, 5]), {"name": "B"})
])

# 1985年数据
image = images[0]
image_mangrove =  image.eq(27)

# 统计像元个数
roi_mangrove_count = image_mangrove.reduceRegions(**{
    'reducer': ee.Reducer.sum(),
    'collection': roi,
    "scale": 30,
    "crs": "epsg:3857"
})

# 转为DataFrame
mangrove_df = geemap.ee_to_df(roi_mangrove_count, columns=["name", "sum"])

# 乘以像元面积
mangrove_df['sum'] *= 900

# 修改列名
mangrove_df.rename(columns={'sum':'1985_area'})
```

![image-20250208132426861](https://img2023.cnblogs.com/blog/2213660/202502/2213660-20250208132430209-1377039802.png)



1、计算EAAF内每个国家1985-2022年红树林、盐沼、光滩面积变化

使用全球地图，与EAAF做橡胶分析，得到每个国家在EAAF中的分布矢量，然后分别统计1985-2022年红树林、盐沼、光滩面积



2、计算EAAF内每0.5°网格内红树林、盐沼、光滩和总面积（三个类型求和）变化（这里暂定0.5°，最后根据效果看看是否要调整为1°）

使用EAAF数据生成0.5°渔网，然后统计网格内红树林、盐沼、光滩和总面积（三个类型求和）面积



3、寻找GEE中的气温，降水和人口数据，统计每个国家在红树林、盐沼、光滩三个分布总区域内的年均温、年降水、人口变化



#### 四、具体计算

> 0.5°网格湿地统计

1、arcgis创建渔网

以EAAF矢量为模板，创建渔网，取消创建标注点，选择几何类型为POLYGON

![image-20250214163134060](https://img2023.cnblogs.com/blog/2213660/202502/2213660-20250214163135484-1594083888.png)

由于EAAF横跨经度180，且渔网构建是矩形，所以会生成大量不在EAAF中的不必要网格，我们可以用按位置选择，选中与EAAF矢量相交的部分网格进行导出

![image-20250214163422582](https://img2023.cnblogs.com/blog/2213660/202502/2213660-20250214163424028-329332158.png)

![image-20250214163532566](https://img2023.cnblogs.com/blog/2213660/202502/2213660-20250214163533836-1849541018.png)

![image-20250214163545365](https://img2023.cnblogs.com/blog/2213660/202502/2213660-20250214163546468-2067662523.png)



2、将网格矢量上传到GEE,在[GEE代码编辑平台](https://code.earthengine.google.com/)的左边Assets栏，点击new

![image-20250214163748505](https://img2023.cnblogs.com/blog/2213660/202502/2213660-20250214163749735-36014565.png)

选择shpfile，然后将网格矢量后缀名为 .dbf .prj .sbn .shp .shx 这五个文件选中上传

![image-20250214164101712](https://img2023.cnblogs.com/blog/2213660/202502/2213660-20250214164103390-202523975.png)

然后等待上传成功即可，上传进度可在右边Tasks栏中查看

![image-20250214164204959](https://img2023.cnblogs.com/blog/2213660/202502/2213660-20250214164206384-1231665238.png)



3、进行分区统计

```python
# 导入geemap和ee
import ee,geemap

Map = geemap.Map()
Map
```

```python
# 调用GLC_FCS30D年度数据
# 1985--2000
five_year = ee.ImageCollection("projects/sat-io/open-datasets/GLC-FCS30D/five-years-map")

# 2000年后
annual = ee.ImageCollection("projects/sat-io/open-datasets/GLC-FCS30D/annual")
```

```python
# 进行代码映射
uniqueClasses = [10, 11, 12, 20, 51, 52, 61, 62, 71, 72, 81, 82, 91, 92,120, 121, 122, 130, 140, 150, 152, 153, 181, 182,183, 184, 185, 186, 187, 190, 200, 201, 202, 210, 220, 0]

palette = [
  "#ffff64", "#ffff64", "#ffff00", "#aaf0f0", "#4c7300", "#006400", "#a8c800", "#00a000", 
  "#005000", "#003c00", "#286400", "#285000", "#a0b432", "#788200", "#966400", "#964b00", 
  "#966400", "#ffb432", "#ffdcd2", "#ffebaf", "#ffd278", "#ffebaf", "#00a884", "#73ffdf", 
  "#9ebb3b", "#828282", "#f57ab6", "#66cdab", "#444f89", "#c31400", "#fff5d7", "#dcdcdc", 
  "#fff5d7", "#0046c8", "#ffffff", "#ffffff"
]

def recodeClasses(image):
    reclassed = image.remap(uniqueClasses, ee.List.sequence(1, len(uniqueClasses)))
    return reclassed
```

```python
# 导入上传至GEE的网格矢量
fishnet = ee.FeatureCollection("projects/ee-2431566134liumonarch/assets/EAAF_roi_fishnet")
Map.addLayer(fishnet, {}, 'fishnet')
```

下一步是将GLC_FCS30D所有年度数据合成到一张影像中，每年的影像作为影像中的一个波段，波段名为年份

```python
# 1985--2000
# GLC_1985_image = recodeClasses(five_year.mosaic().select(f'b1'))
# GLC_1985_image = recodeClasses(five_year.mosaic().select(f'b2'))
images = []
images_name = []
for i in [1, 2, 3]:
    image = recodeClasses(five_year.mosaic().select(f'b{i}'))
    images.append(image)
    images_name.append(f"{1985+(i-1)*5}")

# 2000年后
# GLC_2000_image = recodeClasses(annual.mosaic().select(f'b1'))
# GLC_2001_image = recodeClasses(annual.mosaic().select(f'b2'))
for i in range(1, 24):
    image = recodeClasses(annual.mosaic().select(f'b{i}'))
    images.append(image)
    images_name.append(f"{2000+i-1}")
```

```python
# 合成影像
image = ee.Image(images).rename(images_name)
image.bandNames()
```

下一步是湿地统计

```python
# 由于代码映射，mangrove类型对应在GLC_FCS30D中的数值为27，salt为28，tidal为29
# 通过代码来建立mask
# 然后使用reduceRegions，调用ee.Reducer.count()来进行统计每个区域的像元数

image_mangrove =  image.updateMask(image.eq(27))

eaaf_fishNet_mangrove_count = image_mangrove.reduceRegions(**{
    'reducer': ee.Reducer.count(),
    'collection': roi,
    "scale": 30,
    "crs": "epsg:3857"
})

image_salt =  image.updateMask(image.eq(28))
eaaf_fishNet_salt_count = image_salt.reduceRegions(**{
    'reducer': ee.Reducer.count(),
    'collection': roi,
    "scale": 30,
    "crs": "epsg:3857"
})

image_tidal =  image.updateMask(image.eq(29))
eaaf_fishNet_tidal_count = image_tidal.reduceRegions(**{
    'reducer': ee.Reducer.count(),
    'collection': roi,
    "scale": 30,
    "crs": "epsg:3857"
})

image_total = image.updateMask(image.gte(27).And(image.lte(29)))
eaaf_fishNet_total_count = image_total.reduceRegions(**{
    'reducer': ee.Reducer.count(),
    'collection': roi,
    "scale": 30,
    "crs": "epsg:3857"
})
```

由于计算量大，在线交互的计算能力较弱，所以我们一般会采用批量的方法先将计算结果导出到GEE中的asset中，然后再从asset中调用结果，从而减少计算量

```python
# 将统计好的矢量导出到GEE中的asset，这个导入需要时间，具体进度同样可在GEE代码编辑页面的Tasks中查看

geemap.ee_export_vector_to_asset(eaaf_fishNet_mangrove_count, "eaaf_fishNet_mangrove_count", "eaaf_fishNet_mangrove_count")

geemap.ee_export_vector_to_asset(eaaf_fishNet_salt_count, "eaaf_fishNet_salt_count", "eaaf_fishNet_salt_count")

geemap.ee_export_vector_to_asset(eaaf_fishNet_tidal_count, "eaaf_fishNet_tidal_count", "eaaf_fishNet_tidal_count")

geemap.ee_export_vector_to_asset(eaaf_fishNet_total_count, "eaaf_fishNet_total_count", "eaaf_fishNet_total_count")
```

```python
# 使用os库来定义工作空间
import os

os.chdir(r"D:\Work\EAAF")
```

```python
# 当统计结果导出后，再从asset中导入结果，并通过geemap转为shpfile矢量文件

eaaf_fishNet_mangrove_count = ee.FeatureCollection("users/2431566134liumonarch/eaaf_fishNet_mangrove_count")
geemap.ee_to_shp(eaaf_fishNet_mangrove_count, "eaaf_fishNet_mangrove_count.shp")

eaaf_fishNet_salt_count = ee.FeatureCollection("users/2431566134liumonarch/eaaf_fishNet_salt_count")
geemap.ee_to_shp(eaaf_fishNet_salt_count, "eaaf_fishNet_salt_count.shp")

eaaf_fishNet_tidal_count = ee.FeatureCollection("users/2431566134liumonarch/eaaf_fishNet_tidal_count")
geemap.ee_to_shp(eaaf_fishNet_tidal_count, "eaaf_fishNet_tidal_count.shp")

eaaf_fishNet_total_count = ee.FeatureCollection("users/2431566134liumonarch/eaaf_fishNet_total_count")
geemap.ee_to_shp(eaaf_fishNet_total_count, "eaaf_fishNet_total_count.shp")
```

最后就是将统计的数据进行进一步处理

```python
# 由于四种统计数据处理方法相识所以这里使用循环来处理
ts = ['mangrove', 'salt', 'tidal', 'total']

# 导入pandas和geopandas库
import pandas as pd
import geopandas as gpd

# 导入计算一元线性回归的库
from scipy import stats
```

```python
for t in ts:
    # 读取shpfile矢量文件
    gdf1 = gpd.read_file(f"eaaf_fishNet_{t}_count.shp")
    # 统计所有年份湿地像元之和
    df_sum = gdf1.iloc[:, :26].sum(axis=1)
    # 排除所有年份都没有湿地的网格
    gdf2 = gdf1.loc[df_sum > 0, :]
    # 网格像元数转为面积，单位平方公里
    gdf2.iloc[:, :26] *= 900
	gdf2.iloc[:, :26] /= 1000000
    # 导出含有湿地的网格矢量
    gdf2.to_file(f"EAAF_fishNet_{t}_noValue.shp")
    
    # 计算slope
    df2 = gdf2.iloc[:, :26]
    columns = df2.columns
    # 定义线性回归的年份x
    x = [int(i) for i in columns]
    slope = []
    rvalue = []
    # 定义计算线性回归的函数
    def fun(data):
        # 以每一行的值作为y
        y = data.values
        # 进行一元线性回归
        OLS = stats.linregress(x, y)
        # 添加slope
        slope.append(OLS[0])
        # 添加r平方
        rvalue.append(OLS[2]**2)
        # 导入p值
        return OLS[3]
    # 使用apply函数，将fun函数作用到每一行，并获取p值
    pvalue = df2.apply(fun, axis=1)
    # 将p值，slope，r2写入gdf2
    gdf2["pvalue"] = pvalue
    gdf2['slope'] = slope
    gdf2['r2'] = rvalue
    # 去除p值不小于0.05的部分
    gdf3 = gdf2.loc[pvalue < 0.05, :]
    # 导出带趋势且p值小于0.05的网格
	gdf3.to_file(f"EAAF_{t}_Area_fistNet_slope.shp")
```

0.5°网格统计完成



> 国家湿地统计

以19个国家的矢量与上面网格得到的三种湿地总面积的矢量，即**EAAF_fishNet_total_noValue.shp**文件进行相交分析，这样能减少每个国家需要统计的区域，减少计算量，将相交分析后的矢量按国家进行矢量融合，这样可以融合每个国家内的网格，最后生成类似这样的矢量

![image-20250214172852280](https://img2023.cnblogs.com/blog/2213660/202502/2213660-20250214172853995-142407657.png)

同样，将上述矢量上传到GEE的asset中，后面统计的方法和网格统计类似，主要在后面的统计后处理有所不同。为了保存每个国家的统计，这里就没有进行湿地零值排除和趋势分析，且将国家数据导出为表格

```python
# 以处理mangrove为例
# 读取矢量
gdf1 = gpd.read_file(f"eaaf_country_mangrove_count.shp")
# 获取数据列
df1 = gdf1.iloc[:, :26]
# 重新排列数据
columns = ["name"] +  df1.columns.to_list()
df2 = gdf1[columns]
# 计算面积
df2= df2.astype(object)
df2.iloc[:, 1:] *= 900
df2.iloc[:, 1:] /= 1000000
df2.to_csv("EAAF_Mangrove_Area_Country")
```



> 保护区湿地统计

将保护区矢量按ramsarid进行矢量融合，然后将融合后的矢量进行上传，再进行分区统计。同样为保存每个保护区的统计数据，这里也没有进行湿地零值排除和趋势分析。在湿地统计后处理时，有一个问题，就是统计后的矢量由于格式原因，无法直接保存为shpfile矢量，这里是用统计之前的矢量按照ramsarid进行对应，将统计结果写入之前本地的融合后的矢量中。这里也以mangrove为例

```python
# 读取本地融合后的矢量
gdf = gpd.read_file("EAAF_Ramsar_sites_diss.shp") 
# 以ramsarid排序，方便后面匹配数据
gdf.sort_values("ramsarid", inplace=True)

# 通过ee_to_gdf，将统计结果转换为gdf
eaaf_ramsar_mangrove_count = ee.FeatureCollection("users/2431566134liumonarch/eaaf_ramsar_mangrove_count")
gdf1 = geemap.ee_to_gdf(eaaf_ramsar_mangrove_count)

# 整理列名
columns = ['FIRST_v_id', 'FIRST_rams', 'FIRST_offi', 'FIRST_iso3', 'FIRST_coun', 'FIRST_area'] + images_name
columns_r = ['v_idris', 'ramsarid', 'officialna', 'iso3', 'country_en', 'area_off'] + images_name
# 获取统计数据表格
df = gdf1[columns]
df.columns = columns_r
# 像元个数转换面积
df.iloc[:, 6:] *= 900
df.iloc[:, 6:] /= 1000000
# 以ramsarid排序，方便后面匹配数据
df.sort_values("ramsarid", inplace=True)
# 将统计数据表格与矢量列拼接重组
gdf2 = gpd.GeoDataFrame(df, crs=4326, geometry=gdf["geometry"])
# 导出矢量
gdf2.to_file("EAAF_Mangrove_Area_Ramsar.shp")
# 导出表格
df.to_csv("EAAF_Mangrove_Area_Ramsar.csv", index=False)
```



**后续的统计气温和人口方法都是类似的，只不过是将统计像元个数的ee.Reducer.count()换成ee.Reducer.mean()来求像元平均**







