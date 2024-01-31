[Back](README.md)

## Deep Understanding React Hooks

<hr>


### 1. What is React State

> State is a built-in object in React components

**The state object is where you store property values that belong to the component** <br>
**When the state object changes, the component re-renders** <br>

&nbsp;

### 2. How to use state

#### 2-1) Old version way (Legacy)

In old React version code, we used class and this.setState to use the component state

```typescript
import React from 'react';
import ReactDOM from 'react-dom/client';

class Car extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      brand: "Ford",
      model: "Mustang",
      color: "red",
      year: 1964
    };
  }
  render() {
    return (
      <div>
        <h1>My {this.state.brand}</h1>
        <p>
          It is a {this.state.color}
          {this.state.model}
          from {this.state.year}.
        </p>
      </div>
    );
  }
}

const container = document.getElementById('root');
const root = ReactDOM.createRoot(container);
root.render(<Car />);
```

![state in old react code](https://github.com/Elliot518/mcp-oss-tech/blob/main/frontend/react/state/OldStateInReact.png?raw=true)

<hr>

#### 2-2) New version way (Recommend)

> In new React version code, we use function(or lambda) and useState hook to use the component state


- function way
    ```typescript
    import React, { useState } from 'react';

    function Counter() {
    const [count, setCount] = useState(0);

    return (
        <div>
        <p>You clicked {count} times</p>
        <button onClick={() => setCount(count + 1)}>
            Click me
        </button>
        </div>
    );
    }

    export default Counter;
    ```

- lambda way
    ```typescript
    import React, { useState } from 'react'

    const Counter = () => {
        // declare the counter state with the setCounter setter 
        // and specifying only accept numbers, and setting the initial value to 0
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

<hr>

![counter state](https://github.com/Elliot518/mcp-oss-tech/blob/main/frontend/react/state/counter_state.png?raw=true)


Render the counter state and some buttons to increase or decrease the counter state


### The useState Hook is a game changer in React and makes it very easy to handle the state in a functional component

&nbsp;

