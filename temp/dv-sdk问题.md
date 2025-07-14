## Vite+Vue开发环境生成网页加载报错

在vite 和 Vue3 环境下构建的代码，用 vite build打包后，有libs/dc-sdk/resources目录

![image-20250119194920729](https://img2023.cnblogs.com/blog/2213660/202501/2213660-20250119194923124-832719494.png)

把打包生成的资源部署到nginx上时，发现网页打开后没有成功加载viewer，其中控制台报错如下:

![image-20250119195101712](https://img2023.cnblogs.com/blog/2213660/202501/2213660-20250119195103081-867681208.png)

![image-20250119195123512](https://img2023.cnblogs.com/blog/2213660/202501/2213660-20250119195124830-272020536.png)

当我把这个文件的 throw new Error(e[s(2536)]) 删除时，控制台就没有了该错误，但是，发现了其他的错误

![image-20250119195327890](https://img2023.cnblogs.com/blog/2213660/202501/2213660-20250119195329204-1015685041.png)

![image-20250119195341643](https://img2023.cnblogs.com/blog/2213660/202501/2213660-20250119195343000-1788224337.png)

这个其他的错误是，即使没有改变dc的默认baseUrl路径，也生成了libs/dc-sdk/resources目录，但是网页默认还是去assets下面访问cesium静态资源

当我把libs/dc-sdk/resources下的静态资源拷贝到assets下面时，网页才能正常加载

![image-20250119195610799](https://img2023.cnblogs.com/blog/2213660/202501/2213660-20250119195612562-641166077.png)

所以这是有什么bug吗？