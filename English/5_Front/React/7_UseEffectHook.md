[Back](README.md)

## Using the effect Hook

<hr>


### 1. What is effective hook in react

> The effect Hook is used for component side effects. A component side effect is something executed outside the scope of the component such as a web service request.

&nbsp;


### 2. How to define an effective hook

>The effect Hook is defined using the useEffect function from React. useEffect contains two parameters.


- A function that executes the effect
    This is a minimum parameter, this function runs each time the component is rendered

- An optional array of dependencies
    That cause the effect function to rerun when changed
