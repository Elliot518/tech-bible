[Back](README.md)

## Foundations

<hr>

### 1. Categories

> Machine learning can be classified into supervised learning, unsupervised learning, self supervised learning, semi-supervised learning, and Reinforcement Learning.

_ML systems can be classified according to the amount and type of
supervision they get during training.
They are: supervised learning, unsupervised learning, self supervised learning, semi-supervised learning, and Reinforcement Learning._

- Supervised learning
    >In supervised learning, the training set you feed to the algorithm includes
    the desired solutions, called labels.
    ```
    A typical supervised learning task is classification.
    eg:
     1) spam filter - it trained with many example emails along with their class 
        (spam or ham), and it must learn how to classify new emails.
     2) predict a target numeric value, such as the price of a car, given a set of 
        features (mileage, age, brand, etc.). This sort of task is called regression.
    ```
- Unsupervised learning
    >In unsupervised learning, the training data is unlabeled, the system tries to learn without a teacher.
    ```
    eg:
    say you have a lot of data about your blog’s visitors. 
    You may want to run a clustering algorithm to try to detect groups of similar visitors. 
    For example, it might notice that 40% of your visitors are teenagers who love comic books 
    and generally read your blog after school, while 20% are adults who enjoy
    sci-fi and who visit during the weekends.
    ```
- Semi-supervised learning
    >Since labeling data is usually time-consuming and costly, you will often have plenty of unlabeled instances, and few labeled instances. 
    Some algorithms can deal with data that’s partially labeled. This is called semi supervised learning.
    ```
    eg:
    Some photo-hosting services, such as Google Photos, once you upload all your family photos to the service, 
    it automatically recognizes that the same person A shows up in photos 1, 5, and 11, 
    while another person B shows up in photos 2, 5, and 7. 
    This is the unsupervised part of the algorithm (clustering). 
    Now all the system needs is for you to tell it who these people are. 
    Just add one label per person and it is able to name everyone in every photo, which is useful for searching photos.
    Most semi-supervised learning algorithms are combinations of unsupervised and supervised algorithms.
    ```
- Self-supervised learning
    >This is generating a fully labeled dataset from a fully unlabeled one. 
    Once the whole dataset it labeled, any supervised learning algorithm can be used.
    This approach iscalled self-supervised learning.
    ```
    eg:
    if you have a large dataset of unlabeled images, 
    you can randomly mask a small part of each image and then train a model 
    to recover the original image. 
    During training, the masked images are used as the inputs to the model, 
    and the original images are used as the labels.
    ```
- Reinforcement Learning
    >Reinforcement Learning is a very different beast. 
    The learning system, called an agent in this context, can observe the environment, 
    select and perform actions, 
    and get rewards in return(or penalties in the form of negative rewards).
    It must then learn by itself whatis the best strategy, called a policy, 
    to get the most reward over time. 
    A policy defines what action the agent should choose when it is in a given situation.
    (DeepMind’s AlphaGo program is also a good example of Reinforcement Learning)
    ![Reinforcement Learning](ml1.png)

<hr>

### Smmary

- Supervised learning

    Labeled Data, Direct feedback, Predict outcome/future

- Unsupervised learning

    No labels, No feedback, Find hidden structure in data

- Reinforcement Learning

    Decision process, Reward system, Learn series of actions

    In sum, reinforcement learning is concerned with learning to choose a series of actions that maximizes the total reward, which could be earned either immediately after taking an action or via delayed
    feedback.

&nbsp;

### 2. Instance-Based Versus Model-Based Learning

#### 2-1) What is a machine learning Model?

Machine learning models are computer programs that are used to recognize patterns in data or make predictions. Machine learning models are created from machine learning algorithms, which are trained using either labeled, unlabeled, or mixed data.

For example, in natural language processing, machine learning models can parse and recognize the intent behind previously unheard sentences or combinations of words. In image recognition, a machine learning model can be taught to recognize objects - such as cars or dogs. A machine learning model can perform such tasks by having it 'trained' with a large dataset. During training, the machine learning algorithm is optimized to find certain patterns or outputs from the dataset, depending on the task. The output of this process - often a computer program with specific rules and data structures - is called a machine learning model.

- Instance-based learning
>It is simply to learn by heart.
>
>The system learns the examples by heart, then generalizes to new cases by using a similarity measure to compare them to the learned examples

<hr>

- Model-based learning
>It is to generalize from a set of examples is to build a model of these examples and then use that model to make predictions.

&nbsp;

### 3. Machine learning terminology

- Training example
>A row in a table representing the dataset and synonymous with an observation, record, instance, or sample (in most contexts, sample refers to a collection of training 
examples).

- Training
>Model fitting, for parametric models similar to parameter estimation.

- Feature, abbrev. x
>A column in a data table or data (design) matrix. Synonymous with predictor, variable, input, attribute, or covariate.

- Target, abbrev. y
>Synonymous with outcome, output, response variable, dependent variable, (class) label, and ground truth.

- Loss function
>Often used synonymously with a cost function. Sometimes the loss function is 
also called an error function. In some literature, the term “loss” refers to the loss measured for 
a single data point, and the cost is a measurement that computes the loss (average or summed) 
over the entire dataset.

- Overfitting(过拟合)
>It means that the model performs well on the training data, but it does not generalize well.
```
Say you are visiting a foreign country and the taxi driver rips you off. You
might be tempted to say that all taxi drivers in that country are thieves.
Overgeneralizing is something that we humans do all too often, and
unfortunately machines can fall into the same trap if we are not careful.
```

- Underfitting(欠拟合)
>Underfitting is the opposite of overfitting, it occurs when your model is too simple to learn the underlying structure of the data.
```
For example, a linear model of life satisfaction is prone to underfit; reality
is just more complex than the model, so its predictions are bound to be
inaccurate, even on the training examples.
```
Solutions:
```
1. Select a more powerful model, with more parameters.
2. Feed better features to the learning algorithm (feature engineering).
3. Reduce the constraints on the model (e.g., reduce the regularization hyperparameter)
```

&nbsp;

### 4. Testing and Validating

The only way to know how well a model will generalize to new cases is to
actually try it out on new cases.

1. put your model in production and monitor how well it performs
 disadvantage:
 This works well, but if your model is horribly bad, your users will complain(not the best idea).

 2. split your data into two sets: the training set and the test set(suggested)
 You train your model using the training set, and you test it using the test set.

    The error rate on new cases is called the generalization error (or out-of-sample error), and by evaluating your model on the test set, you get an estimate of this error. This value tells you how well your model will perform on instances it has never seen before.

    If the training error is low (i.e., your model makes few mistakes on the training set) but the generalization error is high, it means that your model is overfitting the training data.

