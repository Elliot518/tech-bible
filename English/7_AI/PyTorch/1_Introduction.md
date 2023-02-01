[Back](README.md)

## Introduction

<hr>

### 1. What is PyTorch

- Authoritative Definition

  > PyTorch is a machine learning framework based on the Torch library, used for applications such as computer vision and natural language processing, originally developed by Meta AI and now part of the Linux Foundation umbrella.It is free and open-source software released under the modified BSD license. PyTorch also has a C++ interface.

- History

  > Meta (formerly known as Facebook) operates both PyTorch and Convolutional Architecture for Fast Feature Embedding (Caffe2), but models defined by the two frameworks were mutually incompatible. The Open Neural Network Exchange (ONNX) project was created by Meta and Microsoft in September 2017 for converting models between frameworks. Caffe2 was merged into PyTorch at the end of March 2018.In September 2022, Meta announced that PyTorch would be governed by PyTorch Foundation, a newly created independent organization – a subsidiary of Linux Foundation.

- Successful Cases
  > A number of pieces of deep learning software are built on top of PyTorch, including Tesla Autopilot, Uber's Pyro, Hugging Face's Transformers, PyTorch Lightning, and Catalyst.

&nbsp;

### 2. PyTorch Features

PyTorch provides two high-level features:

- Tensor computing
  It is like NumPy with strong acceleration via graphics processing units (GPU)

- Deep neural networks
  It is built on a tape-based automatic differentiation system

  &nbsp;

### 3. Fundamental Conceptions

- Tensor

_In deep learning, we see tensors everywhere. Google’s framework is called TensorFlow! So what is a tensor?_

>Tensor is a data structure that has three or more dimensions. 

_In Numpy, you may have an array that has three dimensions, right? That is, technically speaking, a tensor._

A scalar (a single number) has zero dimensions.
A vector has one dimension.
A matrix has two dimensions.
A tensor has three or more dimensions.

![image.png](https://upload-images.jianshu.io/upload_images/12347236-4951b08d5478d605.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
