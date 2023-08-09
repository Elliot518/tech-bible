[Back](README.md)

## DataFrame

<hr>

### 1. What is DataFrame
>Definition

&nbsp;

### 2. DataFrame Operations

#### 2-1) Slice

>Pandas DataFrames can be sliced both on the columns and rows.
>
>However, the slicing function can only be done inside either .loc[] or .iloc[].

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

### 2-2) .unique() function

>All the possibile values for the column(返回某个列所有的可能值).
>返回值: 数组
```
df_name.column_name.unique()
```
