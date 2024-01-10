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

