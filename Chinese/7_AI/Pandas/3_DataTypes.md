[Back](README.md)

## 基础数据类型

<hr>


### 1. 简介

>Pandas是一个高性能、易于使用的数据分析工具。

- 安装
```
pip install pandas
```

&nbsp;

### 2. 数据结构

Pandas 中有两种数据结构，Series 和 DataFrame，前者是一维的，后者是二维的，DataFrame 就是多个 Series。

#### 2-1) Series

>Series类似一维数组，它就像Python中的list或Numpy中的一维的array。

![Series](https://upload-images.jianshu.io/upload_images/12347236-af6ed25db3805f6e.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

![Series数据结构示例](https://upload-images.jianshu.io/upload_images/12347236-139d433ea172b325.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

Series 常用的创建方式:

a) 字典创建
```
import pandas as pd

# create series by dictionary
sites = {1: "Google", 2: "Runoob", 3: "Wiki"}
sites
series_sites = pd.Series(sites)
series_sites
```
![image.png](https://upload-images.jianshu.io/upload_images/12347236-b774499883b21282.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

b) 列表创建
```
# create series by list
sites2 = ["Google", "Runoob", "Wiki"]
sites2
series_sites2 = pd.Series(sites2)
series_sites2
```

c) 数组创建
```
import numpy as np
import pandas as pd

data = np.random.randn(3)
data
series_data = pd.Series(data)
series_data
```
![image.png](https://upload-images.jianshu.io/upload_images/12347236-1d2ec96f110fad5d.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)


d) 索引访问
```
# access by index
data = pd.Series(sites, index = ['G', 'R', 'W'])
data
data[['G', 'R']]
```
![image.png](https://upload-images.jianshu.io/upload_images/12347236-5609422ec6ad8664.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

e) Series 运算
```
# Series 运算
data = pd.Series([1, 2, 3], index = ['x', 'y', 'z'])
data
data = data * 2
data
```
![image.png](https://upload-images.jianshu.io/upload_images/12347236-d223fc2b4da72efc.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

&nbsp;

####2-2) DataFrame

>DataFrame 是二维结构，类似于 Excel 表格。

![DataFrame](https://upload-images.jianshu.io/upload_images/12347236-a42a6310d6620690.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

pandas.DataFrame(data, index, columns)

data：数据，列表、字典等
index：行索引
columns：列索引

DataFrame 常用的创建方式:

a) 二维列表创建
```
import pandas as pd

# 二维列表
data = [['Google', 10],['Runoob', 12],['Wiki', 13]]
pd.DataFrame(data, columns=['Site', 'Age'])
```

b) 字典组成的列表创建
```
# 字典组成的列表
data = [{'Site': 'Google', 'Age': 10},{'Site': 'Runoob', 'Age': 12},{'Site': 'Wiki', 'Age': 13}]
pd.DataFrame(data)
```

c) 列表组成的字典创建
```
# 列表组成的字典
data = {'Site':['Google', 'Runoob', 'Wiki'], 'Age':[10, 12, 13]}
pd.DataFrame(data)
```

d) 访问列
```
# 访问列
data['Site']
```
