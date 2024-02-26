[Back](../../README.md)

## 5.5 React Advanced

<hr>


### 1. What is State

**State is what makes your applications move**

> State is a mutable data source that can be used to store data in a React application and can change over time and be used to determine how your component renders


State is mutable, which means that it can be changed over time. <br>
When a state variable changes, your React component will re-render to reflect any changes that the state causes to your UI.

- Some State Examples

    a) Data you just fetched through a request

    b) The light or dark mode option of a UI

    c) A list of errors that you got from filling a form in the UI

&nbsp;

### 2. Manage state with useState

> useState is a React Hook that allows you to hold a stateful value. When calling this hook, it will return the stateful value and a function to update it.

[React Hooks Reference](https://github.com/Elliot518/tech-bible/blob/main/English/5_Front/React/9_UseReactHooks.md)


#### 2-1) Counter Hooks Demo

- Counter Hooks
    ```typescript
    import React, { useState } from 'react'

    const Counter = () => {
    const [counter, setCounter] = useState<number>(0)
    
    const handleCounter = (operation = 'add') => {
        if (operation === 'add') {
        return setCounter(counter + 1)
        }
        
        return setCounter(counter - 1)
    }

    return (
        <p>
        Counter: {counter} <br />
        <button onClick={() => handleCounter('add')}>+ Add</button>
        <button onClick={() => handleCounter('subtract')}>- Subtract</button>
        </p>
    )
    }
    export default Counter;
    ```

![Couter Hooks Demo](https://github.com/Elliot518/mcp-oss-tech/blob/main/frontend/react/state/counter_state.png?raw=true)

The preceding snippet leverages the useState hook to hold our counter state. When we first call useState, the state value is initiated as 0.

[Counter Hooks Demo](https://github.com/Elliot518/react-playground/tree/main/TypeScript/features/hooks/counterHook-demo)
