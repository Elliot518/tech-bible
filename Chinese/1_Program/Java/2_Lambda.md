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

- java.util.function包下的几个重要的类

单个入参或无入参
| 方法 | 解释 |
| ---- | ---- |
| Consumer  void accept(T t) | 有入参，无返回值 |
| Function R apply(T t) | 有入参，有返回值 |
| Predicate   boolean test(T t) | 有入参，返回 boolean 值 |
| Supplier T get() | 没有入参，有返回值 |

多个入参
| 方法 | 解释 |
| ---- | ---- |
| BiConsumer void accept(T t, U u) | 两个入参，无返回值 |
| BiFunction R apply(T t, U u) | 两个入参，有返回值 |
| BiPredicate boolean test(T t, U u) | 两个入参，返回 boolean 值 |

- 方法引用
>方法引用是一种特殊的lambda，当方法体中只有一个方法调用时，就可以用[类名::方法名]来简化。

eg:
```java
Function<String, Integer> toLength = s -> s.length();
Function<String, Integer> toLength = String::length;

Function<User, String> getName = user -> user.getName();
Function<String, Integer> toLength = User::getName;

Consumer<String> printer = s -> System.out.println(s);
Consumer<String> printer = System.out::println;

// 构造方法的简化
Supplier<List<String>> newListOfStrings = () -> new ArrayList<>();
Supplier<List<String>> newListOfStrings = ArrayList::new;
```

&nbsp;

### 3. 惰性求值和Java8的一些常用的流API

#### 什么是惰性求值
>惰性求值即Java8的Stream操作。惰性求值操作的结果也是Stream，惰性求值可以像建造者模式一样链式使用，最后再使用及早求值得到最终结果。

#### 常用的流API
- collect(Collectors.toList())
>及早求值函数: 将流转换为List，Set对应toSet()，Map对应toMap()等。

eg:
```java
public class TestCase {
    public static void main(String[] args) {
        List<Student> studentList = Stream.of(new Student("路飞", 22, 175),
                new Student("红发", 40, 180),
                new Student("白胡子", 50, 185)).collect(Collectors.toList());
        System.out.println(studentList);
    }
}
```
输出结果:
[Student{name='路飞', age=22, stature=175, specialities=null}, 
Student{name='红发', age=40, stature=180, specialities=null}, 
Student{name='白胡子', age=50, stature=185, specialities=null}]

<hr>

- filter
>惰性求值函数: 起过滤筛选的作用，内部就是Predicate接口。

eg:
```java
public class TestCase {
    public static void main(String[] args) {
        List<Student> students = new ArrayList<>(3);
        students.add(new Student("路飞", 22, 175));
        students.add(new Student("红发", 40, 180));
        students.add(new Student("白胡子", 50, 185));
        List<Student> list = students.stream()
            .filter(stu -> stu.getStature() < 180)
            .collect(Collectors.toList());
        System.out.println(list);
    }
}
```
输出结果:
[Student{name='路飞', age=22, stature=175, specialities=null}]

<hr>

- map
>惰性求值函数: 映射函数，实现转换功能，内部就是Function接口。

eg:
```java
public class MapDemo {
    public static void main(String[] args) {
        List<Student> students = new ArrayList<>(3);
        students.add(new Student("路飞", 22, 175));
        students.add(new Student("红发", 40, 180));
        students.add(new Student("白胡子", 50, 185));
        List<String> names = students.stream().map(Student::getName)
                .collect(Collectors.toList());
        System.out.println(names);
    }
}
```
输出结果:
[路飞, 红发, 白胡子]

<hr>

- flatMap
>惰性求值函数: 将多个Stream合并为一个Stream。

eg:
```java
public class FlatMapDemo {
    public static void main(String[] args) {
        List<Student> students = new ArrayList<>(3);
        students.add(new Student("路飞", 22, 175));
        students.add(new Student("红发", 40, 180));
        students.add(new Student("白胡子", 50, 185));
        List<Student> studentList = Stream.of(students,
                Arrays.asList(new Student("艾斯", 25, 183),
                        new Student("雷利", 48, 176)))
                .flatMap(Collection::stream).collect(Collectors.toList());
        System.out.println(studentList);
    }
}
```
输出结果:
[Student{name='路飞', age=22, height=175.0}
, Student{name='红发', age=40, height=180.0}
, Student{name='白胡子', age=50, height=185.0}
, Student{name='艾斯', age=25, height=183.0}
, Student{name='雷利', age=48, height=176.0}
]

<hr>

- max和min
>及早求值函数: 在集合中求最大或最小值。

eg:
```java
public class MaxMinDemo {
    public static void main(String[] args) {
        List<Student> students = new ArrayList<>(3);
        students.add(new Student("路飞", 22, 175));
        students.add(new Student("红发", 40, 180));
        students.add(new Student("白胡子", 50, 185));
        Optional<Student> max = students.stream()
                .max(Comparator.comparing(Student::getAge));
        Optional<Student> min = students.stream()
                .min(Comparator.comparing(Student::getAge));
        //判断是否有值
        max.ifPresent(System.out::println);
        min.ifPresent(System.out::println);
    }
}
```
输出结果:
Student{name='白胡子', age=50, height=185.0}
Student{name='路飞', age=22, height=175.0}

<hr>

- count
>及早求值函数: 统计功能，一般都是结合filter使用，先筛选出我们需要的再统计即可。

eg:
```java
public class CountDemo {
    public static void main(String[] args) {
        List<Student> students = new ArrayList<>(3);
        students.add(new Student("路飞", 22, 175));
        students.add(new Student("红发", 40, 180));
        students.add(new Student("白胡子", 50, 185));
        long count = students.stream().filter(s1 -> s1.getAge() < 45).count();
        System.out.println("年龄小于45岁的人数是：" + count);
    }
}
```
输出结果:
年龄小于45岁的人数是：2

<hr>

- reduce
>及早求值函数: 可以实现从一组值中生成一个值。

eg:
```java
public class ReduceSumDemo {
    public static void main(String[] args) {
        Integer reduce = Stream.of(1, 2, 3, 4, 5).reduce(0, Integer::sum);
        System.out.println(reduce);
    }
}
```
输出结果:
15
