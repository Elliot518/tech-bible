[Back](README.md)

## Introduction to Machine Learning

<hr>


### 1. What is Machine learning

> Machine learning is part of applied mathematics and computer science. It uses tools from mathematical disciplines such as probability, statistics, and optimization theory to extract patterns from data.

The main idea behind machine learning is learning from examples: we prepare a
dataset with examples, and a machine learning system “learns” from this dataset. In other words, we give the system the input and the desired output, and the system tries to figure out how to do the conversion automatically, without asking a human.

eg:
We can collect a dataset with descriptions of cars and their prices, for example.
Then we provide a machine learning model with this dataset and “teach” it by
showing it cars and their prices. This process is called training or sometimes fitting.

- Training

    ![Training](https://github.com/Elliot518/mcp-oss-tech/blob/main/ai/ml/training.png?raw=true)

<hr>

- Predicting

    ![Predicting](https://github.com/Elliot518/mcp-oss-tech/blob/main/ai/ml/predicting.png?raw=true)

- Tradional ways

    This process is quite different from traditional software engineering. Without
    machine learning, analysts and developers look at the data they have and try to find patterns manually. After that, they come up with some logic: a set of rules for converting the input data to the desired output. Then they explicitly encode these rules using a programming language such as Java or Python, and the result is called software. 

    So, in contrast with machine learning, a human does all the difficult work.
    ![Tradional ways](https://github.com/Elliot518/mcp-oss-tech/blob/main/ai/ml/traditional_way.png?raw=true)

In summary, the difference between a traditional software system and machine learning is as follows:

- traditional systems

    We first find the patterns in the data ourselves and then write code that converts the data to the desired outcome, using the manually discovered patterns.

- machine learning

    We give the system the input and output data, and the result is a model (code) that can transform the input into the output. The difficult work is done by the machine; we need only supervise the training process to make sure that the model is good.


&nbsp;

### 2. Supervised machine learning

>We supervise or teach the model by showing it examples, exactly as we would teach children by showing them pictures of different objects and then telling them the names of those objects, this type of learning is called supervised machine learning.

To express a supervised machine learning model mathematically as

$
y \approx g(X)
$

Explanation:
- g is the function that we want to learn with machine learning
- X is the feature matrix in which rows are feature vectors
- y is the target variable: a vector

The process of learning g is usually called training or fitting. We "fit" g to dataset X in such a way that it produces y.

#### The main types of supervised learning

- Regression

    The target variable y is numeric, such as a car price or the temperature tomorrow


- Classification

    The target variable y is categorical, such as spam, not spam, or car
    make. 
    
    We can further split classification into two subcategories: 


    (1) binary classification, which has only two possible outcomes, such as spam or not spam

    (2) multiclass classification, which has more than two possible outcomes, such as a car make (Toyota, Ford, Volkswagen, and so on). 
    Classification, especially binary classification, is the most common application of machine learning. 

- Ranking

    The target variable y is an ordering of elements within a group, such as
    the order of pages in a search-result page. The problem of ranking often happens in areas like search and recommendations.

Each supervised learning problem can be solved with different algorithms. Many types of models are available. These models define how exactly function g learns to predict y from X.

These models include:
- Linear regression 
    
    solving the regression problem
    
- Logistic regression 

    solving the classification problem


- Tree-based models

    solving both regression and classification

- Neural networks

    solving both regression and classification

&nbsp;

### 3. Machine learning process

machine learning process has six steps:
1. Business understanding
2. Data understanding
3. Data preparation
4. Modeling
5. Evaluation
6. Deployment

