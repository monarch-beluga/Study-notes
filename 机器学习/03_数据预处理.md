## 数据预处理

在机器学习中，无论什么模型，在建模训练之前都需要对训练数据进行预处理。在现实工作中，我们获取到的数据，总是会出现各种问题，比如数据缺失、数据异常、数据分布不均等等。所以，若不进行数据预处理，模型训练将得不到我们想要的结果。

### 数据标准化

数据标准化主要是将数据(x)按照均值(u)中心化后，再按标准差(σ)缩放，标准化之后数据会服从标准正态分布N~(0,1)，公式：$x = \frac{x - \mu}{\sigma}$ 

代码实现：

```python
import numpy as np

def standardization(features):
    """
    特征数据标准化
    :param features: 特征值数据
    :return:
    """
    features_normalized = np.copy(features).astype('float')

    # 计算均值
    features_mean = np.mean(features, 0)

    # 计算标准差
    features_deviation = np.std(features, 0)

    # 标准化操作
    if features.shape[0] > 1:
        features_normalized -= features_mean

    # 防止除以0
    features_deviation[features_deviation == 0] = 1
    features_normalized /= features_deviation

    return features_normalized, features_mean, features_deviation
```



### 特征变换sinusoidal

将数据进行sin函数变换，从而实现非线性回归

代码实现：

```python
def generate_sinusoids(dataset, sinusoid_degree):
    """
    sin函数变换
    :param dataset: 特征数据
    :param sinusoid_degree: 变换角度
    :return: 变换后的数据
    """
    num_examples = dataset.shape[0]
    sinusoids = np.empty((num_examples, 0))

    for degree in range(1, sinusoid_degree+1):
        sinusoid_features = np.sin(degree * dataset)
        sinusoids = np.concatenate((sinusoids, sinusoid_features), axis=1)

    return sinusoids
```



### 特征变换polynomial(多项式变换)

将数据进行polynomial变换，从而实现非线性回归

代码实现：

```python
def generate_polynomials(dataset, polynomial_degree, normalize_data=False):
    """
    变换方法
    :param dataset: 特征数据
    :param polynomial_degree: 变换角度
    :param normalize_data: 是否标准化
    :return: 变换后的数据
    """
    features_split = np.array_split(dataset, 2, axis=1)
    dataset_1 = features_split[0]
    dataset_2 = features_split[1]

    num_examples_1, num_features_1 = dataset_1.shape
    num_examples_2, num_features_2 = dataset_2.shape

    if num_examples_1 != num_examples_2:
        raise ValueError('Can not generate polynomials for two sets with different number of row')

    if num_features_1 == 0 and num_features_2 == 0:
        raise ValueError('Can not generate polynomials for two sets with no columns')

    if num_features_1 == 0:
        dataset_1 = dataset_2
    elif num_features_2 == 0:
        dataset_2 = dataset_1

    num_features = num_features_1 if num_features_1 < num_examples_2 else num_features_2
    dataset_1 = dataset_1[:, :num_features]
    dataset_2 = dataset_2[:, :num_features]

    polynomials = np.empty((num_examples_1, 0))

    for i in range(1, polynomial_degree+1):
        for j in range(i+1):
            polynomial_feature = (dataset_1 ** (i - j)) * (dataset_2 ** j)
            polynomials = np.concatenate((polynomials, polynomial_feature), axis=1)

    if normalize_data:
        polynomials = standardization(polynomials)[0]

    return polynomials
```

这个特征变换在实际运用中一般是通过调用如sklearn等第三工具包来实现，这里只是尽可能的复现一下代码



### 增加偏置项

在特征数据上增加一列1，从而增加偏置项$\theta_0$

代码实现：

```python
# 加一列1
data_processed = np.hstack((np.ones((num_examples, 1)), data_processed))
```



### 整合预处理代码

预处理代码实现：

```python
def prepare_for_training(data, polynomial_degree, sinusoid_degree, normalize_data):

    # 获取样本总数
    num_examples = data.shape[0]

    data_processed = np.copy(data)

    # 标准化预处理
    features_mean = 0
    features_deviation = 0
    data_normalized = data_processed
    if normalize_data:
        data_normalized, features_mean, features_deviation = standardization(data_processed)

        data_processed = data_normalized

    # 特征变换sinusoidal
    if sinusoid_degree > 0:
        sinusoids = generate_sinusoids(data_normalized, sinusoid_degree)
        data_processed = np.concatenate((data_processed, sinusoids), axis=1)

    # 特征变换polynomial
    if polynomial_degree > 0:
        polynomials = generate_polynomials(data_normalized, polynomial_degree, normalize_data)
        data_processed = np.concatenate((data_processed, polynomials), axis=1)

    # 加一列1
    data_processed = np.hstack((np.ones((num_examples, 1)), data_processed))

    return data_processed, features_mean, features_deviation

```

- polynomial_degree, sinusoid_degree为非线性回归的变换系数

