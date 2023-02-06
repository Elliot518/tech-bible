[Back](README.md)

## Series数据结构

<hr>

### 1. 什么是Series

>Series是pandas中的一种特殊的数据结构, 也称 Series 序列。 它是一种类似于一维数组的结构, 由一组数据值(value)和一组标签(index)组成, 其中标签与数据值之间是一一对应的关系, 如果不特殊规定, 它的标签默认为整数并从0开始依次递增。
Series 可以保存任何数据类型，比如整数、字符串、浮点数、Python 对象等。

![Series数据结构示例](https://upload-images.jianshu.io/upload_images/12347236-139d433ea172b325.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)


- 函数语法
```
pandas.Series(data,index,dtype,copy)
```

data： 数据元素
index：索引标签，默认0,1,2,...
dtype：数据类型，默认自动识别。
copy：对data进行拷贝，默认False。

&nbsp;

### 2. 创建Series

##### 2-1) 创建空Series

```
s = pd.Series()
print(s)
```

Output：
Series([], dtype: float64)

<hr>

##### 2-2) Series 常用的创建方式:

**a) 通过标量创建**

eg:
```python
s = pd.Series(6,index =['a','b','c']) 
print(s)
```
Output:
a    6
b    6
c    6
dtype: int64

<hr>

**b) 通过ndarray数组创建**

eg1:
```python
import numpy as np
import pandas as pd

data = np.random.randn(3)
data
series_data = pd.Series(data)
series_data
```
![image.png](https://upload-images.jianshu.io/upload_images/12347236-1d2ec96f110fad5d.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

eg2:
```python
import numpy as np

arr = np.array([1,2,3])
s = pd.Series(arr,index =['a','b','c']) 
print(s)
```
Output:
a    1
b    2
c    3
dtype: int64

<hr>

**c) 通过列表创建**

eg1:
```python
# create series by list
sites2 = ["Google", "Runoob", "Wiki"]
sites2
series_sites2 = pd.Series(sites2)
series_sites2
```

eg2:
```python
# 没有规定索引的情况下标签默认为从0开始整数, 依次递增
s = pd.Series([1,2,3])
print(s)
```
Output:
0    1
1    2
2    3
dtype: int64

<hr>

**d) 通过字典创建**

eg1:
```python
import pandas as pd

# create series by dictionary
sites = {1: "Google", 2: "Runoob", 3: "Wiki"}
sites
series_sites = pd.Series(sites)
series_sites
```
![image.png](https://upload-images.jianshu.io/upload_images/12347236-b774499883b21282.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

eg2:
```python
s = pd.Series({'a':1,'b':2,'c':3}) 
print(s)
```
Output:
a    1
b    2
c    3
dtype: int64

<hr>

**e) 通过元组创建**

eg:
```python
s = pd.Series((1,2,3),index =['a','b','c']) 
print(s)
```

Output:
a    1
b    2
c    3
dtype: int64







