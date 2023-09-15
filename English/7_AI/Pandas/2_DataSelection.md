[Back](README.md)

## DataFrame Operations - Data Selection

<hr>


### 1. Selecting Data by label

> The most common way of accessing the data of a DataFrame is by referring to its
labels. Use the attribute loc, which stands for location, to specify which rows and columns you want to retrieve.

#### df.loc[row_selection, column_selection]

- 1-1） Select 1 value - Scalar
    ```
    df.loc[idx_row, "col_name"]
    ```

<hr>

- 1-2) Select 1 column - Series
    ```
    df.loc[:, "col_name"]
    ```

<hr>

- 1-3) Select 1 row - Series
    ```
    df.loc[idx_row, :]
    ```
<hr>

- 1-4) Select 1 column in an array - DataFrame
    ```
    df.loc[:, ["col_name"]]
    ```

<hr>

- 1-5) Select 1 row in an array - DataFrame
    ```
    df.loc[[idx_row], :]
    ```
<hr>

- 1-6) Select multiple columns - DataFrame 
    ```
    df.loc[:, ["col_name1", "col_name2"]]
    ```
<hr>


- 1-7) Select multiple rows - DataFrame 
    ```
    df.loc[[idx_row_n, idx_row_m, ...], :]
    ```

<hr>

- 1-8) Select range of columns - DataFrame 
    ```
    df.loc[:, "col_name_1":"col_name_n"]
    ```
<hr>

- 1-9) Select range of rows - DataFrame
    ```
    df.loc[idx_row_n:idx_row_m, :]
    ```

&nbsp;


### 2. Selecting Data by position

> Use the iloc attribute, which stands for integer location.

#### df.iloc[row_selection, column_selection]

- 2-1） Select 1 value - Scalar
    ```
    df.iloc[idx_row, idx_col]
    ```
<hr>

- 2-2) Select 1 column - Series
    ```
    df.iloc[:, idx_col]
    ```

<hr>

- 2-3) Select 1 row - Series
    ```
    df.iloc[idx_row, :]
    ```

<hr>

- 2-4) Select 1 column in an array - DataFrame
    ```
    df.iloc[:, [idx_col]]
    ```
<hr>

- 2-5) Select 1 row in an array - DataFrame
    ```
    df.iloc[[idx_row], :]
    ```
<hr>


- 2-6) Select multiple columns - DataFrame 
    ```
    df.iloc[:, [idx_col_n, idx_col_m, ...]]
    ```

<hr>

- 2-7) Select multiple rows - DataFrame 
    ```
    df.iloc[[idx_row_n, idx_row_m, ...], :]
    ```

<hr>

- 2-8) Select range of columns - DataFrame
    ```
    df.iloc[:, idx_col_n:idx_col_m]
    df.iloc[:, :idx_col_m]
    ```

<hr>

- 2-9) Select range of rows - DataFrame
    ```
    df.iloc[idx_col_n:idx_col_m, :]
    df.iloc[:idx_col_m, :]
    ```

&nbsp;
&nbsp;

<hr>

### Source Code:

<a target="_blank" href="https://github.com/Elliot518/data-science/blob/main/jupyter/pandas/dataframe/create_dataframe.ipynb">Data Selection Source</a>