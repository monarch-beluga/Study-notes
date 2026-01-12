![image-20251026115020199](https://img2024.cnblogs.com/blog/2213660/202510/2213660-20251026115020329-1381718239.png)

红框的文件是函数文件，不重要

主要有两个文件

- **SNICdemo.py**: 运用到普通png文件上的

- **SNICrun.py**: 运用到遥感影像上，需要在cmd中运行

    ![image-20251026120207766](https://img2024.cnblogs.com/blog/2213660/202510/2213660-20251026120208281-999635703.png)

    - imgname: 需要分割的文件路径

    - savename: 分割后的文件保存路径

    - outLabel: 分割后文件label路径

    - 三个文件都是tif格式，outLabel后续需要在arcgis中转成shp文件

    - 在cmd中运行的命令

        ```sh
        python SNICrun.py imgname savename outLabel
        
        # 例如
        # python SNICrun.py D:\Work\temp\tile_1.TIF D:\Work\temp\tile_1_snic.tif  D:\Work\temp\tile_1_slabel.tif  
        ```

        

**当遥感影像太大时，需要在arcgis中将栅格分割好后再执行**