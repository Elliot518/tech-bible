[Back](README.md)

<hr>

### 1. 简介

- 什么是 Lambda

  > Lambda 表达式是 JDK8 的一个新特性，可以取代大部分的匿名内部类，写出更优雅的 Java 代码，尤其在集合的遍历和其他集合操作中，可以极大地优化代码结构。
  > 同时，JDK 也提供了大量的内置函数式接口供我们使用，使得 Lambda 表达式的运用更加方便、高效。

- 基本语法
  语法形式为 () -> {}，其中 () 用来描述参数列表，{} 用来描述方法体，-> 为 lambda 运算符 ，读作 (goes to)。

&nbsp;

### 2. 应用

能用 Lambda 表达式来表示的类型，必须是一个函数式接口。

- 什么是函数式接口(Functional Interface)

  > 函数接口是只有一个抽象方法的接口，用作 Lambda 表达式的类型。
  > 使用@FunctionalInterface 注解修饰的类，编译器会检测该类是否只有一个抽象方法或接口，否则，会报错。

- java8 自带的常用函数式接口
  ![image.png](https://upload-images.jianshu.io/upload_images/12347236-c0f1f96a9d730d9e.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
