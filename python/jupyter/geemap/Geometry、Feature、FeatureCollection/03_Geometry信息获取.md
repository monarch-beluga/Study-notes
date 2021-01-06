## Geometry信息获取

```python
print('Polygon printout: ', polygon.getInfo())

print('Polygon area: ', polygon.area().divide(1000 * 1000).getInfo())

print('Polygon perimeter: ', polygon.perimeter().divide(1000).getInfo())

print('Polygon GeoJSON: ', polygon.toGeoJSONString())

print('Geometry type: ', polygon.type().getInfo())

print('Polygon coordinates: ', polygon.coordinates().getInfo())

print('Polygon is Geodesic? ', polygon.geodesic().getInfo())

print('planarPolygon is Geodesic? ', planarPolygon.geodesic().getInfo())
```

![image-20210106154758615](https://img2020.cnblogs.com/blog/2213660/202101/2213660-20210106154800882-1304749934.png)

- 直接 **print** **Geometry** 
- **area()** ：获取面积，返回的单位为平方米，除非指定了投影
- **toGeoJSONString()** ：获取 **Geometry** 的 **GeoJSON** 字符串
- **type()** ：获取几何类型
- **coordinates()** ：获取坐标列表
- **geodesic() ** ：判断几何是否为 **测地线** 几何

