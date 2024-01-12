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
for col in string_columns:
	df[col] = df[col].str.lower().str.replace(' ', '_')
```

- compare before and after the code
![compare df](https://github.com/Elliot518/mcp-oss-tech/blob/main/ai/ml/df_compare.png?raw=true)

<hr>

Analysis of the dataset:

- make: 
    
    make of a car (BMW, Toyota, and so on)

- model: 

    model of a car

- year: 

    year when the car was manufactured

- engine_fuel_type: 

    type of fuel the engine needs (diesel, electric, and so on)

- engine_hp: 

    horsepower of the engine

- engine_cylinders: 

    number of cylinders in the engine

- transmission_type: 

    type of transmission (automatic or manual)

- driven_wheels: 

    front, rear, all

- number_of_doors: 

    number of doors a car has

- market_category: 

    luxury, crossover, and so on

- vehicle_size: 

    compact, midsize, or large

- vehicle_style: 

    sedan or convertible

- highway_mpg: 

    miles per gallon (mpg) on the highway

- city_mpg: 

    miles per gallon in the city

- popularity: 

    number of times the car was mentioned in a Twitter stream

- msrp: 

    manufacturer’s suggested retail price

For us, the most interesting column here is the last one: MSRP (manufacturer’s suggested retail price, or simply the price of a car). We will use this column for predicting the prices of a car.

<hr>

#### 3-4) Target variable analysis

> The MSRP column contains the important information — it’s our target variable, the y, which is the value that we want to learn to predict.





One of the first steps of exploratory data analysis should always be to look at what the values of y look like. We typically do this by checking the distribution of y: a visual description of what the possible values of y can be and how often they occur. This type of visualization is called a histogram.

Use Seaborn to plot the histogram
```python
sns.histplot(df.msrp, bins=40)
```

![histgram](https://github.com/Elliot518/mcp-oss-tech/blob/main/ai/ml/mrsp_histogram.png?raw=true)

We can have a closer look by zooming in a bit and looking at values below $100,000
```python
sns.histplot(df.msrp[df.msrp < 100000])
```

<hr>

#### Use log transformation to see the distribution
```python
log_price = np.log1p(df.msrp)
sns.histplot(log_price)
```
As we see, this transformation removes the long tail, and now the distribution resembles a bell-shaped curve.

**The normal distribution, also known as Gaussian, follows the bell-shaped curve, which is symmetrical and has a peak in the center**


&nbsp;

### 4. Checking for missing values

This step is important because, typically,machine learning models cannot deal with missing values automatically. We need to know whether we need to do anything special to handle those values.

Pandas has a convenient function that checks the summary for missing values:
```python
df.isnull().sum()
```

We need to deal with missing values later when we train the model, so we should
keep this problem in mind.

&nbsp;

### 5. Validation framework

It’s important to set up the validation framework as early as possible to make sure that the models we train are good and can generalize — that is, that the model can be applied to new, unseen data.

**To do that, we put aside some data and train the model only on one part. Then we use the held-out dataset — the one we didn’t use for training — to make sure that the predictions of the model make sense.**


This step is important because we train the model by using optimization methods
that fit the function g(X) to the data X. Sometimes these optimization methods pick up spurious patterns — patterns that appear to be real patterns to the model but in reality are random fluctuations. If we have a small training dataset in which all BMW cars cost only $10,000, for example, the model will think that this is true for all BMW cars in the world.

To ensure that this doesn’t happen, we use validation. Because the validation dataset is not used for training the model, the optimization method did not see this data. When we apply the model to this data, it emulates the case of applying the model to new data that we’ve never seen. If the validation dataset has BMW cars with prices higher than $10,000, but our model will predict $10,000 on them, we will notice that the model doesn’t perform well on these examples.

<hr>

#### We need to split the dataset into three parts: train, validation, and test

- 20% of data goes to validation
- 20% goes to test
- The remaining 60% goes to train


#### Splitting Data into validation, test, and training sets
```python
# Gets the number of rows in the DataFrame
n = len(df)

# Calculates how many rows should go to train, validation, and test
n_val = int(0.2 * n) 
n_test = int(0.2 * n) 
n_train = n - (n_val + n_test)

# Fixes the random seed to make sure that the results are reproducible
np.random.seed(2) 

# Creates a NumPy array with indices from 0 to (n–1), and shuffles it
idx = np.arange(n) 
np.random.shuffle(idx)

# Uses the array with indices to get a shuffled DataFrame
df_shuffled = df.iloc[idx]

# Splits the shuffled DataFrame into train, validation, and test
df_train = df_shuffled.iloc[:n_train].copy() 
df_val = df_shuffled.iloc[n_train:n_train+n_val].copy() 
df_test = df_shuffled.iloc[n_train+n_val:].copy()

y_train_orig = df_train.msrp.values
y_val_orig = df_val.msrp.values
y_test_orig = df_test.msrp.values

# apply the log transformation
y_train = np.log1p(df_train.msrp.values)
y_val = np.log1p(df_val.msrp.values)
y_test = np.log1p(df_test.msrp.values)

# To avoid accidentally using the target variable later, let’s remove it from the dataframes
del df_train['msrp']
del df_val['msrp']
del df_test['msrp']
```

**When the validation split is done, we can go to the next step: training a model**


&nbsp;

### 6. Machine learning for regression

> After performing the initial data analysis, we are ready to train a model. The problem we are solving is a regression problem: the goal is to predict a number — the price of a car. For this project we will use the simplest regression model: linear regression.

#### 6-1) Linear regression

_Linear regression is a perfect model because it’s relatively simple and can be implemented with just a few lines of NumPy code._

$
g(x_i) = w_0 + x_i^Tw
$

- $w_0$ is the bias term
- $w$ is the n-dimensional vector of weights

$x_1 = (1, x_{11}, x_{12}, ... x_{1n})$
<br>
...<br>
$x_i = (1, x_{i1}, x_{i2}, ... x_{in})$
<br>
...<br>
$x_m = (1, x_{m1}, x_{m2}, ... x_{mn})$
<br>

#### We can put these vectors together as rows of a matrix. Let’s call this matrix X

![matrix of regression](https://github.com/Elliot518/mcp-oss-tech/blob/main/ai/ml/matrix_regression.png?raw=true)

