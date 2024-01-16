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

<hr>

#### 6-2) Training linear regression model

The weight vector w can be computed with the following formula: <br>
$
w = (X^TX)^{-1}X^Ty
$
<br>

It’s quite easy to translate to NumPy:
- $X^T$ is the transpose of X. In NumPy, it’s X.T
- $X^TX$ is a matrix–matrix multiplication, which we can do with the dot method
from NumPy: X.T.dot(X)
- $X^{–1}$ is the inverse of X. We can use np.linalg.inv function to calculate the
inverse
<br>

So the formula above translates directly to: <br>
**inv(X.T.dot(X)).dot(X.T).dot(y)**

```python
def train_linear_regression(X, y):
    # adding the dummy column
    # Creates an array that contains only ones
    ones = np.ones(X.shape[0])

    # Adds the array of 1s as the first column of X 
    X = np.column_stack([ones, X]) 

    # normal equation formula
    # Computes X^TX
    XTX = X.T.dot(X) 

    # Computes the inverse of X^TX
    XTX_inv = np.linalg.inv(XTX) 

    # Computes the rest of the normal equation
    w = XTX_inv.dot(X.T).dot(y) 

    # Splits the weights vector into the bias and the rest of the weights
    return w[0], w[1:]
 ```

&nbsp;

### 7. Predicting the price

> We now have a function for training a linear regression model at our
disposal, so let’s use it to build a simple baseline solution

#### 7-1) Baseline solution

We have already prepared the y, but we still don’t have the X: what
we have right now is a data frame, not a matrix. So we need to extract some features from our dataset to create this matrix X.

Let’s select the features from the data frame and write them to a new variable, df_num:

```python
base = ['engine_hp', 'engine_cylinders', 'highway_mpg', 'city_mpg',  'popularity']
df_num = df_train[base]
```


As the dataset has missing values. We need to do something because the linear regression model cannot deal with missing values automatically.

Dropping all the rows that contain at least one missing value will lose the information that we have in the other columns.

Filling the missing values with some other value don’t lose the information in other columns and still can make predictions. We fill the missing values with zeros. 

We can use the fillna method from Pandas:
```python
df_num = df_num.fillna(0)
```

For example, we have five features, so the formula is: <br>
$
g(x_i) = w_0 + x_{i1}w_1 + x_{i2}w_2 + x_{i3}w_3 + x_{i4}w_4 + x_{i5}w_5
$

If feature three is missing, and we fill it with zero, xi3 becomes zero: <br>
$
g(x_i) = w_0 + x_{i1}w_1 + x_{i2}w_2 + x_{i4}w_4 + x_{i5}w_5
$

Now we need to convert this DataFrame to a NumPy array. The easiest way to do it is to use its values property: <br>

```python
# X_train is a matrix — a two-dimensional NumPy array
# We can use it as input to our linear_regresson function
X_train = df_num.values

w_0, w = train_linear_regression(X_train, y_train)

# We have just trained the first model! 
# Now we can apply it to the training data to see how well it predicts
y_pred = w_0 + X_train.dot(w)

# To see how good the predictions are, use histplot to plot the predicted values
# and compare them with the actual prices
sns.histplot(y_pred, label='prediction')
sns.histplot(y_train, label='target')
plt.legend()
```

![base line](https://github.com/Elliot518/mcp-oss-tech/blob/main/ai/ml/base_line.png?raw=true)

<hr>


#### 7-2) RMSE: Evaluating model quality

> We can use many metrics to evaluate how well a regression model behaves. The most commonly used one is root mean squared error — RMSE for short.

RMSE tells us how large the errors are that our model makes. It’s computed with
the following formula: <br>
$
RSME = \sqrt{\frac{1}{m}\sum_{i=1}^m(g(x_i) - y_i)^2}
$

$(g(x_i) - y_i)^2$ is the difference between the prediction we make for the observation and the
actual target value for that observation.
Then we use the square of the difference, which gives a lot more weight to larger differences. If we predict 9.5, for example, and the actual value is 9.6, the difference is
0.1, so its square is 0.01, which is quite small. But if we predict 7.3, and the actual value
is 10.3, the difference is 3, and the square of the difference is 9. <br>
This is the SE part (squared error) of RMSE. 

Next, we have a sum: <br>
$\sum_{i=1}^m(g(x_i) - y_i)^2$ <br>

This summation goes over all m observations and puts all the squared errors together into a single number.

If we divide this sum by m, we get the mean squared error: <br>
$\frac{1}{m}\sum_{i=1}^m(g(x_i) - y_i)^2$

Finally, we take the square root of that: <br>
$
RSME = \sqrt{\frac{1}{m}\sum_{i=1}^m(g(x_i) - y_i)^2}
$

#### The implementation of root mean squared error

```python
def rmse(y, y_pred):
    # Computes the difference between the prediction and the target
    error = y_pred - y 

    # Computes MSE: first computes the squared error, and then calculates its mean
    mse = (error ** 2).mean() 

    # Takes the square root to get RMSE
    return np.sqrt(mse)
```

<hr>

#### 7-3) Validating the model

The model will be used to predict the price of cars that it didn’t see before. For that purpose, we set aside a validation dataset. We intentionally don’t use it for training and keep it for validating the model.

We have already split our data into multiple parts: df_train, df_val, and df_test. We have also created a matrix X_train from df_train and used X_train and y_train to train the model. Now we need to do the same steps to get X_val — a matrix with features computed from the validation dataset. Then we can apply the model to X_val to get predictions and compare them with y_val.


```python
# converting a validation DataFrame into a matrix
X_val = prepare_X(df_val)

# Applies the model to the validation dataset
y_pred = w_0 + X_val.dot(w)

# check rsme of validation dataset
rmse(y_val, y_pred)
```
<hr>

#### 7-5) Simple feature engineering

We already have a simple baseline model with simple features. To improve our model further, we can add more features to the model: we create others and add them to the existing features. This process is called feature engineering. <br>
**Our aim is to improve the RMSE calculated on the validation data**

```python
# we don’t want to repeat the feature extraction code multiple times
# put this logic into the prepare_X function
def prepare_X(df):
    # Creates a copy of the input parameter to prevent side effects
    df = df.copy()

    # Creates a copy of the base list with the basic features
    features = base.copy()

    # Computes the age feature(because the dataset was created in 2017)
    df['age'] = 2017 - df.year

    # Appends age to the list of feature names we use for the model
    features.append('age')

    df_num = df[features]
    df_num = df_num.fillna(0)
    X = df_num.values
    return X
```

Let’s test if adding the feature “age” leads to any improvements:
```python
X_train = prepare_X(df_train)
w_0, w = train_linear_regression(X_train, y_train)

y_pred = w_0 + X_train.dot(w)
print('train', rmse(y_train, y_pred))

X_val = prepare_X(df_val)
y_pred = w_0 + X_val.dot(w)
print('validation', rmse(y_val, y_pred))
```

#### The validation error is 0.517, which is a good improvement from 0.76 — the value we had in the baseline solution. Thus, we conclude that adding “age” is indeed helpful when making predictions.

