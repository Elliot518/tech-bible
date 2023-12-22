[Back](README.md)

## Props and state

<hr>


> Props and state are the input data for rendering a component. The component is re-rendered 
when the props or state change.

&nbsp;

### 1. Props

> Props are inputs to components, and they are a mechanism to pass data from a parent component 
to its child component.

- key-value
    > Props are JavaScript objects, so they can contain multiple key-value pairs.

- immutable
    > Props are immutable, so a component cannot change its props.
    
    _Props are received from the parent component. A component can access props through the props object that is passed to the function component as a parameter._

### Examples

- a static component
    ```javascript
    function Hello() {
        return <h1>Hello John</h1>;
    }
    ```

    ####  To be reusable, instead of using a hardcoded name, we can pass a name to the Hello component by using props

    ```javascript
    function Hello(props) {
        return <h1>Hello {props.user}</h1>;
    }
    ```

    #### The parent component can send props to the Hello component in the following way:
    ```javascript
    <Hello user="Elliot" />
    ```

    #### Output: Elliot

    #### pass multiple props to a component
    - son component
        ```javascript
        function Hello(props) {
            return <h1>Hello {props.firstName} {props.lastName}</h1>;
        }
        ```

    - parent component
        ```javascript
        <Hello firstName="John" lastName="Dale" />
        ```

    #### Output: Hello John Dale

&nbsp;

### 2. State

> In React, the component state is an internal data store that holds information that can change over time.

_The state also affects the rendering of the component. When the state is updated, React schedules a re-render of the component. When the component re-renders, the state retains 
its latest values. State allows components to be dynamic and responsive to user interactions or 
other events._

#### How to create state
> The state is created using the useState hook function. 

- one argument, two-elements-array

    > It takes one argument, which is the initial value of the state, and returns an array of two elements.


    - The first element - the name of the state

    - The second element - a function that is used to update the state value

- syntax
    ```javascript
    const [state, setState] = React.useState(initialValue);
    ```

- example
    
    ```javascript
    import React, { useState } from 'react';

    // creates a state variable called name, and the initial value is Jim
    const [name, setName] = useState('Jim');
    ```

    _The value of the state can now be updated by using the setName function_
    ```javascript
    // Update name state value
    setName('John');
    ```

    #### Never update the state value directly using the = operator!!!
    ```javascript
    // Don't do this, UI won't re-render
    name = 'John';
    ```

<hr>

#### Multiple States
> If you have multiple states, you can call the useState function multiple times

#### Method 1:

- Create States
    ```javascript
    // Create two states: firstName and lastName
    const [firstName, setFirstName] = useState('John');
    const [lastName, setLastName] = useState('Dale');
    ```

- Update States
    ```javascript
    // Update state values
    setFirstName('Jim');
    setLastName('Geek');
    ```

<hr>

#### Method 2:

- Define state using an object
    ```javascript
    const [name, setName] = useState({
        firstName: 'John', 
        lastName: 'Dale'
    });

- Update both fields of state object
    ```javascript
    setName({ firstName: 'Jim', lastName: 'Geek' })
    ```

- partial update of the object,
    ```javascript
    // ES6: clones the name state object and updates the firstName value
    setName({ ...name, firstName: 'Jim' })
    ```

<hr>

#### Scope of the state

> A state can be accessed by using the state name, the scope of the state is the component, so it cannot be used outside the component in which it is defined.

- example 1:
    ```javascript
    // Renders Hello Elliot
    import React, { useState } from 'react';

    function MyComponent() {
        const [firstName, setFirstName] = useState('Elliot');
        return <div>Hello {firstName}</div>;
    }
    ```

- example 2:
    ```javascript
    import React, { useState } from 'react';

    const [name, setName] = useState({
        firstName: 'John', 
        lastName: 'Dale'
    });

    return <div>Hello {name.firstName}, {name.lastName}</div>;
    ```

<hr>

#### Stateless components

> The React stateless component is just a pure JavaScript function that takes props as an argument and returns a React element.

```javascript
function HeaderText(props) {
    return (
        <h1>
            {props.text}
        </h1>
    )
}
export default HeaderText;
```

<hr>

#### Conditional rendering

> You can use a conditional statement to render different UIs if a condition is true or false.

```javascript
function MyComponent(props) {
    const isLoggedin = props.isLoggedin;
    if (isLoggedin) {
        return (
            <Logout />
        )
    }

    return (
        <Login />
    )
}
···
