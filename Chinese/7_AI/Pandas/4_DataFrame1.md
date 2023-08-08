[Back](README.md)

## DataFrame API介绍(一)

<hr>


### 1. select_dtypes(通过类型选择列)

- 包含列

```
df.select_dtypes(include="number")
df.select_dtypes(include=["int", "object"])
```

- 排除列

```
df.select_dtypes(exclude="float")
```

&nbsp;

### 2. filter(过滤列)

- like 过滤

```
df.filter(like="keyword")
```

- 列名过滤

```
cols = [
    "col1",
    "col2",
    ...
    "coln"
]

df.filter(items=cols)
```

- 正则过滤

```
# 列名中含有数字的列
df.filter(regex=r"\d")
```

&nbsp;

### 3. 处理缺失值(missing values)

Pandas uses the NumPy NaN (np.nan) object to represent a missing value.

```
>>> np.nan == np.nan
False
>>> None == None
True
>>> np.nan > 5
False
>>> 5 > np.nan
False
>>> np.nan != 5
True
```

- 查找缺失值

```
college = pd.read_csv("data/college.csv", index_col="INSTNM")
college_ugds = college.filter(like="UGDS_")

# Instead of using == to find missing numbers, use the .isna method
college_ugds.isna().sum()

```

&nbsp;

### 4. loc 和 iloc

- loc (Selecting by label)
  loc 函数是基于行标签和列标签进行索引的，其基本用法为

DataFrame.loc[行标签,列标签]
df.loc[row_selection, column_selection]

一些例子
![image.png](https://upload-images.jianshu.io/upload_images/12347236-e6fa9301fec18a51.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)


- iloc (Selecting by position)

iloc 函数是基于行和列的位置进行索引的，行和列的索引值从 0 开始，并且得到的结果不包括最后一个位置的值
DataFrame.iloc[行位置,列位置]

![image.png](https://upload-images.jianshu.io/upload_images/12347236-2b4b3127216c3e81.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

具体例子:
```
import numpy as np
import pandas as pd

df = pd.DataFrame({"Fruits":["apple","pear","banana","watermelon"],"Price":[1.2,1.4,2.3,4.2],"Sales":[11,45,25,16]})

# 直接使用行或者列标签(选取df的Fruits和Price两列)
df[['Fruits','Price']]
```
![image.png](https://upload-images.jianshu.io/upload_images/12347236-e05ffc392367043c.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

```
# 选取df的第1到第3行
df[1:4]
```
![image.png](https://upload-images.jianshu.io/upload_images/12347236-526000f7e49b0e05.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

```
# loc函数(选取df的第2到3行和Price、Sales对应的列)
df.loc[2:3,'Price':'Sales']
```
![image.png](https://upload-images.jianshu.io/upload_images/12347236-86b2651a9236a363.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

```
# loc函数(选取所有的行和Fruits、Sales对应的列)
df.loc[:,['Fruits','Sales']]
```
![image.png](https://upload-images.jianshu.io/upload_images/12347236-ead245683b089513.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

```
# iloc函数(选取df的第2到3行和第1到2列)
df.iloc[2:4,1:3]
```
![image](https://upload-images.jianshu.io/upload_images/12347236-6a1f37515bd9f12b.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

```
# iloc函数(选取所有的行和第0、2列)
df.iloc[:,[0,2]]
```
![image.png](https://upload-images.jianshu.io/upload_images/12347236-6f4a3df62551affc.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

&nbsp;

### 5. 通过逻辑表达式来过滤 dataframe(Selecting by boolean indexing)

- 常规逻辑

```
tf = (df["age"] > 40) & (df["country"] == "USA")
# This is a Series with only True/False
tf
```

Output

```
Out[24]:
user_id
1001    False
1000    False
1002     True
1003    False
dtype: bool
```

然后 dataframe 可以通过 loc 函数使用逻辑表达式参数来加载符合条件的数据项

```
df.loc[tf, :]
```

Output

```
Out[25]:
properties name  age country  score continent
 user_id
 1002      Tim   41     USA    3.9   America
```

- pands 中的逻辑符

此处注意 pandas 中的逻辑符与我们常规编程的区别，如下:

```
and &
or |
not ~
```

- isin 函数

该函数等价于 sql 中的 in, 它接收一个 list

```
df.loc[df["country"].isin(["Italy", "Germany"]), :]
```

Output

```
properties   name  age  country  score continent
user_id
1001         Mark   55    Italy    4.5    Europe
1003        Jenny   12  Germany    9.0    Europe
```

&nbsp;

### 6. 多列索引(Selecting by using a MultiIndex)

例子

```
# A MultiIndex needs to be sorted
df_multi = df.reset_index().set_index(["continent", "country"])
# 通过索引排序
df_multi = df_multi.sort_index()
df_multi
```

Output

![image.png](https://upload-images.jianshu.io/upload_images/12347236-402edf8af69e1baa.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

### 7. 统计函数

- value_counts()
>The output of the .value_counts() function is also known as the frequency table.
>
>统计某个列中每个内容出现的次数，可以理解为sql中的group by + count。

可以通过matplotlib库把统计结果画出来
eg:
```
df.column_name.value_counts().plot.bar()
```
![image.png](https://upload-images.jianshu.io/upload_images/12347236-a2c30779ad70153d.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)