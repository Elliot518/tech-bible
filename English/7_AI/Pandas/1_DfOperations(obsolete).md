### 2. DataFrame Operations

#### 2-1) Slice

>Pandas DataFrames can be sliced both on the columns and rows.
>
>However, the slicing function can only be done inside either .loc[] or .iloc[].

- Syntax:
    #### df.loc[row_selection, column_selection]

eg: slices adult_df to show all of the rows, but only the columns from education to occupation
```
adult_df.loc[:,'education':'occupation']
```

![dataframe slice by column names](https://raw.githubusercontent.com/Elliot518/mcp-oss-repo/main/data_science/pandas/df_slice_loc.png)

eg: sorts the DataFrame by some column, and filter the first row and every 3,617th row after that until the end of the DataFrame

```
adult_df.sort_values('education-num').reset_index().iloc[1:32561:3617]
```

![dataframe slice by column indexes](https://github.com/Elliot518/mcp-oss-repo/blob/main/data_science/pandas/df_slice_iloc.png?raw=true)

<hr>

#### 2-2) unique() function

>All the possibile values for the column(返回某个列所有的可能值).
>返回值: 数组
```
df_name.column_name.unique()
```
<hr>

#### 2-3) value_counts() function

>It is how often each possibility happens, the output of value_counts() function is also known as the frequency table.

```
# frequency table of relationship column values(统计某个字段每个值出现的频率)
adult_df.relationship.value_counts()


# draw bar chart via value_counts(根据频率表画出柱状图)
adult_df.relationship.value_counts().plot.bar()
```

&nbsp;

### 3. Apply a function to a series or a DataFrame

You can apply a function to a series or a DataFrame.

#### 3-1) Applying a function to a series
```
# eg: we want to multiply the series adult_df.age by 2.

def MultiplyBy2(n):
    return n*2

adult_df.age.apply(MultiplyBy2)
```

&nbsp;

#### 3-2) Applying a Lambda function

>A lambda function is a function that is expressed in one line, you could simply apply a lambda function instead of an explicit function.

```
total_fnlwgt = adult_df.fnlwgt.sum()

adult_df.fnlwgt = adult_df.fnlwgt.apply(lambda v: v/total_fnlwgt*100)
adult_df
```