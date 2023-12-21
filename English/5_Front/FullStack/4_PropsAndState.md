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

