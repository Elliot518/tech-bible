[Back](Catalog.md)

### 1. What is TensorFlow

- Authoritative Definition

  > TensorFlow is a free and open-source software library for machine learning and artificial intelligence. It can be used across a range of tasks but has a particular focus on training and inference of deep neural networks.

- History

  > TensorFlow was developed by the Google Brain team for internal Google use in research and production.The initial version was released under the Apache License 2.0 in 2015.Google released the updated version of TensorFlow, named TensorFlow 2.0, in September 2019.

- Other Knowledge
  > TensorFlow can be used in a wide variety of programming languages, including Python, JavaScript, C++, and Java.

&nbsp;

### 2. What is Machine Learning

Since we know that TensorFlow is a software library for machine learning, but what is machine learning?

> Machine learning is a process where we train and deploy a computational model to predict some output given the data as input.

##### A machine learning problem typically consists of the following steps:

**1. Understanding analysis of data**
This is where you will explore the data provided to you (e.g., understand the dependent/independent variables).

**2. Cleaning data**
Real world data is usually messy, so data cleaning is of the upmost importance to make sure the model sees high-quality data.

**3. Feature engineering**
New features need to be engineered from the existing features or raw data.

**4. Modeling**
In this stage, you train a model using the selected features and corresponding targets.

**5. Evaluation**
After training the model, you must ensure it is reliable and can perform well on unseen data (e.g., test data).

**6. Creating a user interface for stakeholders to use the model**
In most cases, you will need to provide a dashboard/user interface for users to interact with the model.

&nbsp;

### 3. What is Keras

- Authoritative Definition

  > Keras is a deep learning API written in Python, running on top of the machine learning platform TensorFlow.Keras is the high-level API of TensorFlow 2, it is a beautiful API for composing building blocks to create and train deep learning models.

- History

  > Keras was initially founded by François Chollet as a platform-agnostic, high-level API that can use one of two popular low-level symbolic math libraries at a time: Tensor- Flow or Theano. Specifically, Keras provides layers (e.g., fully connected layers, con- volution layers, etc.), which encapsulate core computations of neural networks.
  > Furthermore, Keras provides pretrained models that can be downloaded and used conveniently. As Theano retired in 2017, TensorFlow became the go-to backend for Keras. In 2017 (TensorFlow v1.4 upward), Keras was integrated into TensorFlow and is now a submodule in TensorFlow that provides a wide variety of reusable layers that can be used to build deep learning models as well as pretrained models.

- Other Knowledage
  > Keras can be integrated with multiple deep learning engines including Google TensorFlow, Microsoft CNTK, Amazon MXNet, and Theano. Starting with TensorFlow 2.0, Keras, the API developed by François Chollet, has been adopted as the standard high-level API, largely simplifying coding and making programming more intuitive.

&nbsp;

### 4. What is Neural Networks

> Artificial neural networks (briefly, “nets” or ANNs) represent a class of machine learning models loosely inspired by studies about the central nervous systems of mammals.Each ANN is made up of several interconnected “neurons,” organized in “layers.” Neurons in one layer pass messages to neurons in the next layer and this is how the network computes things.
>
> Neural networks aims at generalizing established observations to predict future results.
