## ~~修改~~ （高版本弃用）

- 开始地图加载的图层

    ```python
    if kwargs.get("add_google_map"):
        self.add_layer(basemap_tiles["ROADMAP"])
        self.add_layer(basemap_tiles['HYBRID'])
    ```

- ~~**shp_to_ee** 加载shp文件出现无法识别编码的问题~~

    ~~**shp_to_ee** 导入shp文件的原理是先将shp文件读写成json文件，再将json文件读取成ee图层数据， 所以要修改两个函数 **shp_to_ee** 和 **shp_to_geojson**~~

    ```python
    def shp_to_ee(in_shp, encoding=None):
      	# 添加了一个encoding参数， 用来识别编码格式
        try:
            json_data = shp_to_geojson(in_shp, encoding=encoding)
            ee_object = geojson_to_ee(json_data)
            return ee_object
        except Exception as e:
            print(e)
    ```

    ```python
    def shp_to_geojson(in_shp, out_json=None, encoding=None):
    ```

    ```python
    if encoding is None:
        reader = shapefile.Reader(in_shp)
    else:
        reader = shapefile.Reader(in_shp, encoding=encoding)
    ```

- ~~**ee_to_shp** 函数导出shp文件时报错~~

     ~~**ee_to_shp** 中是将数据传递给 **ee_export_vector** 来进行导出，报错是因为没有关闭文件就开始删除，所以要修改 **ee_export_vector** 函数~~ 

     ==最新版本已解决该问题== 

     ```python
     try:
         if filetype == 'shp':
             z = zipfile.ZipFile(filename)
             z.extractall(os.path.dirname(filename))
             # 添加一条关闭文件的代码
             z.close()
             os.remove(filename)
             filename = filename.replace('.zip', '.shp')
     
         print('Data downloaded to {}'.format(filename))
     except Exception as e:
         raise ValueError(e)
     ```

- **ee_search** 函数打开gee中的面板，并将gee中的数据下载到本地

    修改数据下载到本地的地址，默认的地址为C盘

    ```python
    repo_tree, repo_output, _ = build_repo_tree(out_dir=r'E:\study\python\anaconda3\jupyter-notebook')
    ```

    

