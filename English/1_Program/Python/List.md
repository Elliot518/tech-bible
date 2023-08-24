[Back](README.md)

<hr>

### 1. What is List

> List is a data type that contains multiple values in an ordered sequence.

#### 1-1) List demo

```python
>>> [1, 2, 3]
[1, 2, 3]
>>> ['cat', 'bat', 'rat', 'elephant'] ['cat', 'bat', 'rat', 'elephant']
```

#### 1-2) Access List by index

```python
>>> spam = ['cat', 'bat', 'rat', 'elephant']
>>> spam[0]
'cat'
>>> spam[1]
'bat'
>>> spam[1] = 'aardvark'
>>> spam
['cat', 'aardvark', 'rat', 'elephant']
```

#### 1-3) Multi-dimensional List

```python
>>> spam = [['cat', 'bat'], [10, 20, 30, 40, 50]]
>>> spam[0]
['cat', 'bat']
>>> spam[0][1]
'bat'
>>> spam[1][4]
50
```

#### 1-4) Negative Indexes

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

#### 1-5) List with slice

A slice can get several values from a list.

##### list[start:end]

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

#### 1-6) List concatenation and replication

Using + operator combines two lists to create a new one.
Using \* operator to replicate a list.

```python
>>> [1, 2, 3] + ['A', 'B', 'C']
[1, 2, 3, 'A', 'B', 'C']
>>> ['X', 'Y', 'Z'] * 3
['X', 'Y', 'Z', 'X', 'Y', 'Z', 'X', 'Y', 'Z']
>>> spam = [1, 2, 3]
>>> spam = spam + ['A', 'B', 'C']
>>> spam
[1, 2, 3, 'A', 'B', 'C']
```

#### 1-7) Enumerate a List

- Using for in range loop to enumerate a list

```python
>>>for i in [0, 1, 2, 3]:
>>>     print(i)
0
1
2
3

>>>list = [0, 1, 2, 3]
>>>for i in range(4):
>>>     print(i)
0
1
2
3

>>> supplies = ['pens', 'staplers', 'flamethrowers', 'binders']
>>> for i in range(len(supplies)):
    print('Index ' + str(i) + ' in supplies is: ' + supplies[i])
Index 0 in supplies is: pens
Index 1 in supplies is: staplers
Index 2 in supplies is: flamethrowers
Index 3 in supplies is: binders
```

#### 1-8) Element in List

Using in and not in to judge a List containing an element or not.

```python
>>> 'howdy' in ['hello', 'hi', 'howdy', 'heyas'] True
>>> spam = ['hello', 'hi', 'howdy', 'heyas']
>>> 'cat' in spam
False
>>> 'howdy' not in spam
False
>>> 'cat' not in spam
True
```

#### 1-9) Multiple Assignment

Smoetimes we need to assign some elements in a list to multiple variables, like below:

```
>>> cat = ['fat', 'gray', 'loud']
>>> size = cat[0]
>>> color = cat[1]
>>> disposition = cat[2]
```

But, we can have a more elegant way, like below:

```
>>> cat = ['fat', 'gray', 'loud']
>>> size, color, disposition = cat
```
&nbsp;

### 2. Adding and removing elements in List

#### 2-1) append
> appended to the end of the list

eg:
```python
b_list = ['foo', 'peekaboo', 'baz']
b_list.append("dwarf")
b_list
```

Output:
```
 ['foo', 'peekaboo', 'baz', 'dwarf']
```

#### 2-2) insert
>  insert an element at a specific location in the list

eg:
```python
# insert at the index 1(2nd element)
b_list.insert(1, "red")
b_list
```

Output:
```
['foo', 'red', 'peekaboo', 'baz', 'dwarf']
```

#### 2-3) pop
> removes and returns an element at a particular index

eg:
```python
# pop the element of index 2(3rd element): 'peekaboo'
b_list.pop(2)

b_list
```

Output:
```
['foo', 'red', 'baz', 'dwarf']
```

#### 2-4) remove
> remove locates the first such value and removes it from the list

eg:
```python
b_list.append("foo")
b_list
```

Output:
```
['foo', 'red', 'baz', 'dwarf', 'foo']
```

```python
b_list.remove("foo")
b_list
```

Output:
```
['red', 'baz', 'dwarf', 'foo']
```
