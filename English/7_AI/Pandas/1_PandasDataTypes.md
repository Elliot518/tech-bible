[Back](README.md)

## Pandas and its data types Introduction

<hr>


### 1. What is Pandas

- Definition

  > Pandas is a fast, powerful, flexible and easy to use open source data analysis and manipulation tool, built on top of the Python programming language.

&nbsp;

### 2. Important Data Types in Pandas

#### 2-1) Series
>A Series is a sequence of data similar to better known types of data such as a list in Python or a Numpy array.

<hr>

### 2-2) DataFrame
>DataFrame is a 2-dimensional labeled data structure with columns of potentially different types. You can think of it like a spreadsheet or SQL table, or a dict of Series objects. It is generally the most commonly used pandas object.

<hr>

### 2-3) Index
>The row labels of a DataFrame are called index.
> If you don’t have your own index, pandas will then automatically create an integer index starting at zero.

<hr>

![df index](https://raw.githubusercontent.com/Elliot518/mcp-oss-repo/main/data_science/pandas/df_index.png)

&nbsp;

### 3. How to create a Series (Manually)

#### 3-1) Create by dictionary

```python
dict = { key1: value1, ... ,  keyN: valueN }
series = pd.Series(dict)
```
<hr>

#### 3-2) Create by list

```python
list = [ A, B, ... N ]
series = pd.Series(list)
```

<hr>

#### 3-3) Access Series by index

```python
# single element
series[idx]
# multiple elements
series[idx1, idx2, ... idxN]
```

&nbsp;

### 4. How to create a DataFrame (Manually)

- Syntax:
  >pandas.DataFrame(data, index, columns)

- Parameters:
  - data: dictionary/list
  - index: row indexes
  - column: column names

&nbsp;
&nbsp;

<hr>

### Source Code:

<a target="_blank" href="https://github.com/Elliot518/data-science/blob/main/jupyter/pandas/dataframe/data_selection.ipynb">Create and access Series</a>

<a target="_blank" href="https://github.com/Elliot518/data-science/blob/main/jupyter/pandas/dataframe/create_dataframe.ipynb">Create and access DataFrame</a>
