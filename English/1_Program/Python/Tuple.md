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

concatenate tuples using the + operator:
```
(4, None, 'foo') + (6, 0) + ('bar',)
```

Multiplying a tuple by an integer, has the effect of concatenating that many copies of the tuple:
```
('foo', 'bar') * 4
```