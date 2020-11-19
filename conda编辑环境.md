## 新建环境

**conda create --name 环境名称 [python=3.7]** 

```bash
conda create --name python37 python=3.7
```

## 查看所有环境

```bash
conda info --env
```

![image-20201119202328411](https://img2020.cnblogs.com/blog/2213660/202011/2213660-20201119202329497-1391796357.png)

## 激活环境

**activate 环境名称** 

```bash
activate python37
```

![image-20201119202542187](https://img2020.cnblogs.com/blog/2213660/202011/2213660-20201119202542848-1538101466.png)

## 删除环境

**conda remove -n 环境名称 --all** 