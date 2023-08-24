[Back](README.md)

<hr>

### 1. What is Tuple
>A tuple is a fixed-length, immutable sequence of Python objects which, once assigned, cannot be changed.

The easiest way to create one is with a comma-separated sequence of values wrapped in parentheses:
```
tup = (4, 5, 6)
```

convert any sequence or iterator to a tuple by invoking tuple:
```
tuple([4, 0, 2])
// (4, 0, 2)

tup = tuple('string')
// ('s', 't', 'r', 'i', 'n', 'g')
```


&nbsp;

### 2. Tuple Operations

#### 2-1) concatenate tuples 

using the + operator:
```
(4, None, 'foo') + (6, 0) + ('bar',)
```

#### 2-2) Tuple Multiply

Multiplying a tuple by an integer, has the effect of concatenating that many copies of the tuple:
```
('foo', 'bar') * 4
```

#### 2-3) Unpacking tuples

> If you try to assign to a tuple-like expression of variables, Python will attempt to unpack the value on the righthand side of the equals sign

eg 1:
```python
# swap two values
a, b = 1, 2
b, a = a, b
```
<hr>

eg 2:
```python
seq = [(1, 2, 3), (4, 5, 6), (7, 8, 9)]
for a, b, c in seq:
    print(f'a={a}, b={b}, c={c}')
```

Output
```
a=1, b=2, c=3 
a=4, b=5, c=6 
a=7, b=8, c=9
```

&nbsp;

### 3. Tuple Methods

#### 3-1) count

> counts the number of occurrences of a value

eg:
```python
a = (1, 2, 2, 2, 3, 4, 2)
a.count(2)
```

Output
```
4
```
