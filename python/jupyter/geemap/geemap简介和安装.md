## 简介

​		**geemap**是用于与[Google Earth Engine](https://earthengine.google.com/)（GEE）进行交互式映射的Python程序包，与全面的[文档](https://developers.google.com/earth-engine)和交互式IDE（即[GEE JavaScript代码编辑器）相比](https://code.earthengine.google.com/)）的GEE JavaScript API中，GEE Python API的文档相对较少，并且只能以交互式方式可视化结果。该**geemap** Python包是为了填补这一空白。它基于[ipyleaflet](https://github.com/jupyter-widgets/ipyleaflet)和[ipywidgets构建](https://github.com/jupyter-widgets/ipywidgets)，使用户能够在基于**Jupyter**的环境中交互式地分析和可视化Earth Engine数据集。



## 用途

​		**geemap**适用于希望利用各种库和工具的Python生态系统来探索Google Earth Engine的学生和研究人员。它还为希望从GEE JavaScript API过渡到Python API的现有GEE用户设计。自动化的JavaScript到的Python[转换模块](https://github.com/giswqs/geemap/blob/master/geemap/conversion.py)的的**geemap**包可大大减少到现有GEE Java脚本转换成Python脚本和Jupyter笔记本所需的时间。



## 安装

要使用**geemap**，您必须首先[注册](https://earthengine.google.com/signup/)一个[Google Earth Engine](https://earthengine.google.com/)帐户。

### 基于PyPI的安装

```bash
pip install geemap
```

### 基于conda-forge的安装

```bash
conda install mamba -c conda-forge
mamba install geemap -c conda-forge
```

你也可以新建一个conda Python环境来安装

```bash
conda create -n gee python
conda activate gee
conda install mamba -c conda-forge
mamba install geemap -c conda-forge
```



## 更新

### 基于PyPI的更新

```bash
pip install -U geemap
```

### 基于conda的更新

```bash
mamba update -c conda-forge geemap
```

### 使用[Git](https://git-scm.com/)从GitHub安装开发版本

```bash
pip install git+https://github.com/giswqs/geemap
```

### 在不使用Git的情况下直接在GitHub中直接从GitHub安装开发版本

```python
import geemap
geemap.update_package()
```



