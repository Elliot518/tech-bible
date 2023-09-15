[Back](README.md)

## Data Manipulation

<hr>


### 1. Selecting Data by label

> The most common way of accessing the data of a DataFrame is by referring to its
labels. Use the attribute loc, which stands for location, to specify which rows and columns you want to retrieve.

#### df.loc[row_selection, column_selection]

- 1-1） Select 1 value - Scalar
    ```
    df.loc[row_num, "col_name"]
    ```

<hr>

- 1-2) Select 1 column - Series
    ```
    df.loc[:, "col_name"]
    ```

<hr>

- 1-3) Select 1 row - Series
    ```
    df.loc[row_num, :]
    ```
<hr>

- 1-4) Select 1 column in an array - DataFrame
    ```
    df.loc[:, ["col_name"]]
    ```

<hr>

- 1-5) Select 1 row in an array - DataFrame
    ```
    df.loc[[row_num], :]
    ```
<hr>

- 1-6) Select multiple columns - DataFrame 
    ```
    df.loc[:, ["col_name1", "col_name2"]]
    ```
<hr>

- 1-7) Select range of columns - DataFrame 
    ```
    df.loc[:, "col_name1":"col_namen"]
    ```
<hr>

&nbsp;


### 2. Selecting Data by position

> Use the iloc attribute, which stands for integer location.

#### df.iloc[row_selection, column_selection]

- 2-1） Select 1 value - Scalar
    ```
    df.iloc[idx_row, idx_col]
    ```


