[Back](README.md)

## DataFrame API介绍(二)

<hr>


### 1. 创建DataFrame

我们知道，DataFrame可以从文件例如csv或excel读取，也可以自己主动创建。
有几种创建DataFrame的方式。
- 方式1(推荐)
通过平行的列表(list)进行创建

看下面的例子
```
fname = ['Paul', 'John', 'Richard', 'George']
lname = ['McCartney', 'Lennon', 'Starkey', 'Harrison']
birth = [1942, 1940, 1940, 1943]
people = {'first': fname, 'last': lname, 'birth': birth}
beatles = pd.DataFrame(people)
beatles
```
结果:
![image.png](https://upload-images.jianshu.io/upload_images/12347236-39c0a4e7085b8481.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)


从上面的例子可以看出，我们通过元素相同的平行的list来创建DataFrame，其中每个list均代表了DataFrame中的一列。
因此，平行list的方式是以列为维度来创建DataFrame的。它通过把每一列的数据创建出来。
*(上面的例子中，'first'，'last'，'birth'就是列名)*

**DataFrame的索引(index)**
默认index从0开始依次加1。
也可以自定义index，如下：
```
pd.DataFrame(people, index=["a", "b", "c", "d"])
```
![image.png](https://upload-images.jianshu.io/upload_images/12347236-18afb7ff74ec4f4b.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

<hr>

- 方式2
通过字典(dictionary)创建。
代码如下：
```
pd.DataFrame(
[{"first":"Paul","last":"McCartney", "birth":1942},
 {"first":"John","last":"Lennon", "birth":1940},
 {"first":"Richard","last":"Starkey", "birth":1940},
 {"first":"George","last":"Harrison", "birth":1943}])
```
![image.png](https://upload-images.jianshu.io/upload_images/12347236-baeb9e3fbe274ad3.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

可以看到通过字典(dictionary)的方式创建会重复地写列名，代码会有很多冗余。

&nbsp;

### 2. 自定义函数

可以在Series或DataFrame上应用自定义函数。

- Applying a function to a series
```
def MultiplyBy2(n):
    return n*2

adult_df.age.apply(MultiplyBy2)
```
![image.png](https://upload-images.jianshu.io/upload_images/12347236-9dbc122a28a40ac9.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

&nbsp;

### 3. 处理大数据集

Pandas是一个基于内存的工具库。对于处理超大数据集的时候，我们要防止内存溢出的情况发生。
我们可以把数据分行读取，如下:
```
large_dataset = pd.read_csv('large.csv', nrows=1000)
```

我们可以通过xxx_dataset.info()查看使用了多少内存。
例如，我们可以看到1000行使用了78KB的内存，那么我们可以预估，如果是10亿的数据量将要消耗78GB的内存。

也可以通过xxx_dataset.column_name.memory_usage()查看某一列使用了多少内存。
单位为byte。

除了指定行数以外，我们还可以指定数据块的大小，如下:
```
cols = ['carat', 'cut', 'color', 'clarity', 'depth', 'table', 'price']
diamonds_iter = pd.read_csv('../data/diamonds.csv', nrows=1000,
    dtype={'carat': np.float32, 'depth': np.float32,
           'table': np.float32, 'price': np.int16,
           'cut': 'category', 'color': 'category',
           'clarity': 'category'},
    usecols=cols,
    chunksize=200)

def process(df):
    return f'processed {df.size} items'

for chunk in diamonds_iter:
    print(process(chunk))
```

运行结果:
processed 1400 items
processed 1400 items
processed 1400 items
processed 1400 items
processed 1400 items

&nbsp;

### 4. 写文件

- 写入excel
```
import pandas as pd

data = [['Google', 10],['Runoob', 12],['Wiki', 13]]
df = pd.DataFrame(data, columns=['Site', 'Age'])
df

xl_writer = pd.ExcelWriter('../data/comp.xlsx')
df.to_excel(xl_writer, sheet_name='company')
xl_writer.save()
```

运行结果:
会新建一个comp.xlsx并把内容写入到该文件。

&nbsp;

### 5. 读取zip文件

当csv或excel文件很大的时候，我们可以压缩一下文件，pandas有对应的api进行读取

- 读取包含单个文件的zip文件
```
# read zip file with single file
autos = pd.read_csv('../data/vehicles.csv.zip')
autos
```
![image.png](https://upload-images.jianshu.io/upload_images/12347236-b05ff5899559560e.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

默认时间格式
```
autos.modifiedOn
```
![image.png](https://upload-images.jianshu.io/upload_images/12347236-6b9accdd261fa0d4.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

转成日期格式
```
pd.to_datetime(autos.modifiedOn)
```
![image.png](https://upload-images.jianshu.io/upload_images/12347236-9c0901dc45af82ce.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

直接在加载时转换格式
```
# convert date column during loading
autos = pd.read_csv('../data/vehicles.csv.zip', parse_dates=['modifiedOn'])
autos.modifiedOn
```

- 读取包含多个文件的zip文件
当zip文件中包含多个文件的时候，我们需要用到python标准库的zipfile模块。

如下:
```
import zipfile

# read zip file containing multiple files
with zipfile.ZipFile('../data/kaggle-survey-2018.zip') as z:
    print('\n'.join(z.namelist()))
    kag = pd.read_csv(z.open('multipleChoiceResponses.csv'))
    kag_questions = kag.iloc[0]
    survey = kag.iloc[1:]
    print(kag_questions)
```
![image.png](https://upload-images.jianshu.io/upload_images/12347236-f27d64d4c59b7821.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)