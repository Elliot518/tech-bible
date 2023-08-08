[Back](README.md)

## DataFrame API介绍(三)

<hr>


### 1. 找最大的一批值

```
import pandas as pd
import numpy as np
pd.set_option('max_columns', 4, 'max_rows', 10, 'max_colwidth', 12)

movie = pd.read_csv('../data/movie.csv')
movie2 = movie[['movie_title', 'imdb_score', 'budget']]
movie2.head()

# Use the .nlargest method to select the top N data by column name
# eg: select the top 100 movies by imdb_score
movie2.nlargest(100, 'imdb_score').head()
```

结果
![image.png](https://upload-images.jianshu.io/upload_images/12347236-51123d1ad21825dd.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

&nbsp;

### 2. 找一批最小值

你可以用链式操作，在前一个结果集上继续调用函数。
如下:
```
# chain the .nsmallest method to return the 3 lowest budget films among those with a top 100 score
(movie2
  .nlargest(100, 'imdb_score')
  .nsmallest(3, 'budget')
)
```
结果
![image.png](https://upload-images.jianshu.io/upload_images/12347236-c695cb62bf6631bc.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

&nbsp;

### 3. 值排序

```
(movie
  [['movie_title', 'title_year', 'imdb_score']]
  .sort_values('imdb_score', ascending=False)
)
```
结果
![image.png](https://upload-images.jianshu.io/upload_images/12347236-ecbe8086e8232a2a.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

&nbsp;

### 4. 去重

去重前
```
# original data
(movie
  [['movie_title', 'title_year', 'imdb_score']]
  .sort_values(['title_year','imdb_score'],
               ascending=False)
)
```
![image.png](https://upload-images.jianshu.io/upload_images/12347236-0034e44285aa731f.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

去重后
```
# use the .drop_duplicates method to keep only the first row of every year
(movie
  [['movie_title', 'title_year', 'imdb_score']]
  .sort_values(['title_year','imdb_score'],
               ascending=False)
  .drop_duplicates(subset='title_year')
)
```
![image.png](https://upload-images.jianshu.io/upload_images/12347236-72c8a4d868171e48.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

&nbsp;

### 5. 分组排序

通过groupby函数进行分组并且组内排序
```
# group by title_year and select the topest score of each group
(movie
  [['movie_title', 'title_year', 'imdb_score']]
  .groupby('title_year', as_index=False)
  .apply(lambda df: df.sort_values('imdb_score',
         ascending=False).head(1))
  .sort_values('title_year', ascending=False)
)
```
结果
![image.png](https://upload-images.jianshu.io/upload_images/12347236-c0919c19f6649c0a.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
