Back](README.md)

<hr>

### 1. List

> List is a data type that contains multiple values in an ordered sequence.

- 1-1) List demo

```python
>>> [1, 2, 3]
[1, 2, 3]
>>> ['cat', 'bat', 'rat', 'elephant'] ['cat', 'bat', 'rat', 'elephant']
```

- 1-2) Access List by index

```python
>>> spam = ['cat', 'bat', 'rat', 'elephant']
>>> spam[0]
'cat'
>>> spam[1]
'bat'
```

- 1-3) Multi-dimensional List

```python
>>> spam = [['cat', 'bat'], [10, 20, 30, 40, 50]]
>>> spam[0]
['cat', 'bat']
>>> spam[0][1]
'bat'
>>> spam[1][4]
50
```

- 1-4) Negative Indexes

You can also use negative integers for the index.
The value -1 refers to the last index in a list, the value -2 refers to the second-to-last index in a list, and so on.

```python
>>> spam = ['cat', 'bat', 'rat', 'elephant']
>>> spam[-1]
'elephant'
>>> spam[-3]
'bat'
>>> 'The ' + spam[-1] + ' is afraid of the ' + spam[-3] + '.'
'The elephant is afraid of the bat.'
```

- 1-5) List with slice

A slice can get several values from a list.

#####list[start:end]

The first integer is the index where the slice starts.
The second integer is the index where the slice ends, but it will not include the end index.

```python
>>> spam = ['cat', 'bat', 'rat', 'elephant']
>>> spam[0:4]
['cat', 'bat', 'rat', 'elephant']
>>> spam[1:3]
['bat', 'rat']
>>> spam[0:-1]
['cat', 'bat', 'rat']
```
