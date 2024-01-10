[Back](README.md)

## Machine learning for regression

<hr>


- Background of car price prediction project
    > We have a dataset with descriptions of cars, like make, model, and age, and we would like to use machine learning to predict their prices. These characteristics of cars are called features, and the price is the target variable — something we want to predict. Then the model gets the features and combines them to output
    the price.

### 1. Problem description


> Suppose that wehave a website where people can sell and buy used cars. When posting an ad on our website, sellers often struggle to come up with a meaningful price. We want to help our users with automatic price recommendations. We ask the sellers to specify the model, make, year, mileage, and other important characteristics of a car, and based on that information, we want to suggest the best price.


_One of the product managers in the company accidentally came across an open
dataset with car prices and asked us to have a look at it. We checked the data and saw that it contained all the important features as well as the recommended price — exactly what we needed for our use case. Thus, we decided to use this dataset for building the price-recommendation algorithm._

#### steps for the project
1. First, we download the dataset.
2. Next, we do some preliminary analysis of the data.
3. After that, we set up a validation strategy to make sure our model produces correct predictions.
4. 4 Then we implement a linear regression model in Python and NumPy.
5. Next, we cover feature engineering to extract important features from the data to improve the model.
6. Finally, we see how to make our model stable with regularization and use it to
predict car prices.

&nbsp;

### 2. Download the dataset
#### 2-1) Prerequisites

Install all the required libraries: Python, NumPy, Pandas, and Jupyter Notebook. The easiest way to do it is to use a Python distribution called Anaconda (https://www.anaconda.com)

<hr>

#### 2-2) Download the dataset
We have multiple options for doing this:

1. You can download it manually through the Kaggle web interface, available at https://www.kaggle.com/CooperUnion/cardataset. 

    _(You can read more about the dataset and the way it was collected at https://www.kaggle.com/jshih7/car-price-prediction)_

2. Use the Kaggle command-line interface (CLI), which is a tool for programmatic access to all datasets available via Kaggle(recommend)


    ```shell
    kaggle datasets download -d CooperUnion/cardataset
    ```
    Unzip the file, inside, there’s one file: data.csv


&nbsp;


### 3. Exploratory data analysis

We need to know what kind of data we have and whether it is useful. We do this with exploratory data analysis (EDA)

- The distribution of the target variable
- The features in this dataset 
- The distribution of values in these features
- The quality of the data
- The number of missing values

#### 3-1) Exploratory data analysis toolbox

> The main tools for this analysis are Jupyter Notebook, Matplotlib, and Pandas

- Jupyter Notebook 

    It is a tool for interactive execution of Python code. It allows us
    to execute a piece of code and immediately see the outcome. In addition, we
    can display charts and add notes with comments in free text. It also supports
    other languages such as R or Julia (hence the name: Jupyter stands for Julia,
    Python, R), but we will use it only for Python.

- Matplotlib 

    It is a library for plotting. It is very powerful and allows you to create
    different types of visualizations, such as line charts, bar charts, and histograms.

- Pandas 

    It is a library for working with tabular data. It can read data from any
    source, be it a CSV file, a JSON file, or a database.

- Seaborn

    It is another tool for plotting that is built on top of Matplotlib
    and makes it easier to draw charts.


<hr>

#### 3-2) Install Jupyter Notebook and import libraries

```shell
pip install notebook
pip install numpy
pip install pandas
pip install matplotlib
pip install seaborn

jupyter notebook
```

- import libraries
    ```python
    import numpy as np 
    import pandas as pd 
    from matplotlib import pyplot as plt 
    import seaborn as sns

    %matplotlib inline
    ```

    %matplotlib inline in line e tells Jupyter to expect plots in the notebook, so it will be able to render them when we need them


<hr>

#### 3-3) Reading and preparing data

We can use the read_csv function from Pandas for reading our dataset
```python
df = pd.read_csv('data.csv')
```

check how many rows there are
```python
len(df)
```

check the first five rows of our DataFrame
```python
df.head()
```

- Problem

    We can already see that there are some inconsistencies in this dataset: the column names sometimes have spaces, and sometimes have underscores (_). 
    The same is true for feature values: sometimes they’re capitalized, and sometimes they are short strings with spaces. This is inconvenient and confusing.



- Solution

    We can solve this by normalizing them — replacing all spaces with underscores and lowercase all letters.

<hr>

Lowercases all the column names, and replaces spaces with underscores
```python
df.columns = df.columns.str.lower().str.replace(' ', '_')
```

Lowercases and replaces spaces with underscores for values in all string columns of the DataFrame
```python

```