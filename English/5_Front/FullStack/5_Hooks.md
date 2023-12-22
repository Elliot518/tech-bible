[Back](README.md)

## React hooks

<hr>


### 1. What are hooks

> Hooks were introduced in React version 16.8. Hooks allow you to use state and some other React features in functional components.

_Before hooks, you had to write class components if states or complex component logic were needed._


#### Rules for using hooks in React:
- You should always call hooks at the top level in your React function component.

- You shouldn’t call hooks inside loops, conditional statements, or nested functions. 

- Hook names begin with the word use, followed by the purpose they serve.

&nbsp;


### 2. useState

> The useState is a hook function that is used to declare states.

- Scenario

    We will create an example counter that contains a button, and when it is pressed, the counter is increased by 1.
    ![counter component](https://github.com/Elliot518/mcp-oss-tech/blob/main/frontend/react/counter_component.png?raw=true)

    2-1) First, we create a Counter component and declare a state called count with the initial value 0. The value of the counter state can be updated using the setCount function.
    ```javascript
    import { useState } from 'react';

    function Counter() {
        // count state with initial value 0
        const [count, setCount] = useState(0);

        return <div></div>;
    };

    export default Counter;
    ```

    2-2) Next, we render a button element that increments the state by 1. <br>
        We use the onClick event attribute to call the setCount function, and the new value is the current value plus 1. <br>
        We also render the counter state value using {{ counter }}.
    ```javascript
    import { useState } from 'react';

    function Counter() {
        const [count, setCount] = useState(0);

        return (
            <div>
                <p>Counter = {count}</p>
                <button onClick={() => setCount(count + 1)}>
                    Increment
                </button>
            </div>
        );
    };

    export default Counter;
    ```

