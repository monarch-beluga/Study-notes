## Http了解

### 1、 什么是HTTP

HTTP (超文本传输协议)是一个简单的请求-响应协议，它通常运行在TCP之上

- 文本：html，字符串，……
- 超文本：图片、音乐、视频、定位、地图……
- 默认端口：80

HTTPS:更为安全的HTTP通道(SSL加密)

- 默认端口：443



### 2、历史

- HTTP/0.9: 是一个交换信息的无序协议，仅仅限于文字。由于无法进行内容的协商，在双发的握手和协议中，并有规定双发的内容是什么，也就是图片是无法显示和处理的
- HTTP/1.0: 客户端可以与web服务器连接后，只能获得一个web资源,断开连接
- HTTP/1.1: 客户端可以与web服务器连接后，可以获得多个web资源，可以持续连接
- HTTP/2.0: 最新版本，由于之前两个版本所包含的协议规范十分庞大，所以网络协议新版本并不会马上取代旧版本



### 3、Http请求

- 客户端 ---> 发请求(Request) ---> 服务器

百度：

```shell
Request URL: https://www.baidu.com/					# 请求地址
Request Method: GET								# 请求方法：get方法，post方法
Status Code: 200 OK									# 状态码
Remote Address: 14.119.104.189:443						# 远程地址
Referrer Policy: strict-origin-when-cross-origin			
```

1. ##### 请求行
   
   - 请求行中的请求方式：**GET, POST**, HEAD, DELETE, PUT, TRACT
     - get: 请求能够携带的参数比较少，大小有限制，会在浏览器的URL地址栏显示数据内容，不安全，但高效
     - post：请求能够携带的参数没有限制，大小没有限制，不会在浏览器的URL地址栏显示数据内容，安全，但不高效
   
2. ##### 消息头

   ```shell
   Accept: 		# 告诉浏览器，它所支持的数据类型
   Accept-Encoding:  # 支持的编码
   Accept-Language:  # 告诉浏览器，它的语言环境
   Connection:  	 # 告诉浏览器，请求完成是断开还是保持连接
   Host：			# 主机
   ```

   

### 4、Http响应

- 服务器 ---> 响应 ----> 客户端

百度：

```shell
Cache-Control: private										# 缓存控制
Connection: keep-alive										# 连接
Content-Encoding: gzip										# 编码
Content-Type: text/html;charset=utf-8							# 类型
```

1. ##### 响应体

   ```shell
   Accept: 		# 告诉浏览器，它所支持的数据类型
   Accept-Encoding:  # 支持的编码
   Accept-Language:  # 告诉浏览器，它的语言环境
   Connection:  	 # 告诉浏览器，请求完成是断开还是保持连接
   Host：			# 主机
   Refrush:		# 告诉客户端，多久刷新一次
   Location: 		# 让网页重新定位
   ```

2. ##### 响应状态码

   - 200：请求响应成功
   - 3xx: 请求重定向
   - 404：找不到资源