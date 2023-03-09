## pip 设置国内源

#### pip临时使用清华源

```
pip install -i https://pypi.tuna.tsinghua.edu.cn/simple some-package
```

#### 设置为默认

```shell
# 需要pip版本>= 10.0.0
pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple
```

