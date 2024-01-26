[Back](README.md)

## Dictionary

<hr>


> Like a list, a dictionary is a mutable collection of many values. But unlike
indexes for lists, indexes for dictionaries can use many different data
types, not just integers. Indexes for dictionaries are called keys, and a key
with its associated value is called a key-value pair.

- Example

    ```python
    myCat = {'size': 'fat', 'color': 'gray', 'disposition': 'loud'}
    ```
    The values for these keys are 'fat', 'gray', and 'loud', respectively

&nbsp;

### Dictionary vs List


Unlike lists, items in dictionaries are unordered. The first item in a list
named spam would be spam[0]. But there is no “first” item in a dictionary.

Because dictionaries are not ordered, they can’t be sliced like lists.
Trying to access a key that does not exist in a dictionary will result in
a KeyError error message, much like a list’s “out-of-range” IndexError
error message.
