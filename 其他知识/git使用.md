## git本地使用

> 引用自知乎用户CatOneTwo[点击跳转](https://zhuanlan.zhihu.com/p/140405392) 

### 初次配置

- 查看已有配置

  ```bash
  git config --list
  ```

  ![查看](https://pic2.zhimg.com/80/v2-38c8db39bd21800f6a24e0fc8779cb79_720w.jpg)

- 配置用户名和邮箱

  ```bash
  git config --global user.name "用户名"
  git config --global user.email 邮箱地址
  ```

  ![y](https://pic3.zhimg.com/80/v2-d16264a868a45b5f2e5ca0d40e249986_720w.jpg)



### 简单使用

- 查看仓库状态

  ```bash
  git status
  ```

  ![img](https://pic3.zhimg.com/80/v2-175a0e4f9992bdba91459b50b550c14e_720w.png)

- 初始化仓库

  ```bash
  git inti
  ```

  ![img](https://pic2.zhimg.com/80/v2-cdd7629e7d0dcc485c210e1a3b5c5e49_720w.png)

- 添加文件到缓冲区

  ```bash
  git add
  ```

  ![img](https://pic1.zhimg.com/80/v2-b388715d84dc5363b65752d5a8f09920_720w.png)

- 提交到本地仓库

  ```bash
  git commit
  git commit -m "first commit"
  ```

  -m 输入提交信息

  ![img](https://pic3.zhimg.com/80/v2-5ecf63843ec0e35ef0236ca90c94cb4e_720w.png)

- 打印 Git 仓库提交日志

  ```bash
  git log
  ```

  ![img](https://pic4.zhimg.com/80/v2-97fed808783c043988c8a6e9ed23f59f_720w.png)

- 查看分支

  ```bash
  git branch
  ```

  ![img](https://pic2.zhimg.com/80/v2-1b1e4fb4d207354c20bf3aecf6bb65e1_720w.png)

- 新建分支

  ```bash
  git branch a
  ```

  ![img](https://pic3.zhimg.com/80/v2-bd39adb5ac0a43368e26e03377627522_720w.png)

- 切换分支

  ```bash
  git checkout
  ```

  ![img](https://pic2.zhimg.com/80/v2-3d2875d79565f73c60c17fea474b3be1_720w.png)

- 合并分支

  ```bash
  git merge
  ```

  ![img](https://pic3.zhimg.com/80/v2-31cf4ddd8db2309bc61f8d2a6c550b5e_720w.png)

- 删除分支

  ```bash
  git branch -d a
  git branch -D a
  ```



## git与github交互

- 下载代码

  ```bash
  git clone
  ```

- 提交代码

  ```bash
  git push origin master
  ```

- 更新代码

  ```bash
  git pull origin master
  ```



