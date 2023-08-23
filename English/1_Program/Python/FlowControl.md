[Back](README.md)

<hr>

### 1. Boolean Values

- True 
- False

==, !=, <, >, <=, >=

- Boolean operators

    and, or, not

&nbsp;

### 2. if / else / elif

```python
name = 'Carol' 
age = 3000 
if name == 'Alice': 
	print('Hi, Alice.') 
elif age < 12: 
	print('You are not Alice, kiddo.') 
else:
	print('You are neither Alice nor a little kid.')
```

&nbsp;

### 3. while Loop Statements

> You can make a block of code execute over and over again using a while statement.
The code in a while clause will be executed as long as the while statement’s condition is True.

eg:
```python
i = 0 
while i < 5: 
	print('Hello, world.') 
	i = i + 1
```

- How to break out of a while loop

    Use break
    ```python
    while True: 
        print('Please type your name.') 
        name = input() 
        if name == 'Exit': 
            break

    # quit loop
    print('Thank you!')
    ```

- continue
    > When the program execution reaches a continue statement, the program execution immediately jumps back to the start of the loop and reevaluates the loop’s condition.

Scenario:

If the user enters any name besides Elliot, the continue statement causes the program execution to jump back to the start of the loop.
Once both the name and password are correct, it jumps out of the while loop to print Access granted.

Code:
```python
while True: 
	print('Who are you?') 
	name = input() 
	if name != 'Elliot': 
		continue 

	print('Hello, Elliot. What is the password? ') 
	password = input() 
	if password == 'wonderful': 
		break 

# end of loop
print('Access granted.')
```


&nbsp;

### 4. for Loops and the range() Function

> If you want to execute a block of code a certain number of times, you can do this with a for loop statement and the range() function.

eg 1:
```python
for i in range(10): 
	print('Number (' + str(i) + ')')
```

Output:
```
Number (0)
Number (1)
...
Number (9)
```

- explanation

    The first time it is run, the variable i is set to 0.
    The variable i will go up to, but will not include, the integer passed to range().

<hr>

eg 2:

```python
total = 0 
for num in range(101): 
	total = total + num 
print(total)
```

Output:
```
5050
```


