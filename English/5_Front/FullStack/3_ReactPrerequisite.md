[Back](README.md)

## React Prerequisite

<hr>


### 1. Introduce React Components

> React is component-based, and the components are independent and reusable. Components are the basic building blocks of React.

_When you start to develop a UI with React, it is good to start by creating **mock interfaces**. That way, it will be easy to identify what kinds of components you have to create and how they interact._


_ECMAScript 2015(ES6) syntax provides many features that make coding cleaner_

#### From the following mock UI, we can see how the UI can be split into components.

- Example
![](https://github.com/Elliot518/mcp-oss-tech/blob/main/frontend/react/react_mock_ui.png?raw=true)

_In this case, there is be an application root component, a search bar component, a table component, and a table row component._

#### The components can then be arranged in a tree hierarchy
- Component Tree

![component tree](https://github.com/Elliot518/mcp-oss-tech/blob/main/frontend/react/component_tree.png?raw=true)

- The root component has two child components: the search component and the table component. 
- The table component has one child component: the table row component. 
- The important thing to understand with React is that the data flow goes from a parent component to a child component.

&nbsp;

### 2. Virtual document object model (VDOM)

> React uses the virtual document object model (VDOM) for selective re-rendering of the UI, which makes it more cost-effective.

The document object model (DOM) is a programming interface for web documents that represents the web page as a structured tree of objects.

The VDOM is a light-weight copy of the DOM, and manipulation of the VDOM is much faster than it is with the real DOM. 

- Compare and Partial Update

    After the VDOM is updated, React compares it to a snapshot that was taken of the VDOM before updates were run. After the comparison, React will know which parts have been changed, and only these parts will be updated to the real DOM.

&nbsp;



### 3. How to create react component 

> A React component can be defined either by using a JavaScript function(a functional component) or the ES6 JavaScript class(a class component).

<hr>

- A text component(function mode)
```javascript
// Using JavaScript function
function App() {
    return <h1>Hello World</h1>;
}
```

<hr>

- A text component(class mode)
```javascript
// Using ES6 class
class App extends React.Component {
    render() {
        return <h1>Hello World</h1>;
    }
}
```

The class component contains the required render() method, which shows and updates the rendered output of the component while the render() method is not needed in the functional component.

_Before React version 16.8, you had to use class components to be able to use states. Now, you can use hooks to create states with functional components as well._


#### If your component returns multiple elements, you have to wrap these inside one parent element

```javascript
// Wrap elements inside the div
function App() {
    return (
        <div>
            <h1>Hello World</h1>
            <h2>This is my first React component</h2>
        </div>
    );
}
```

#### We can also use a React fragment

```javascript
// Wrap elements inside the div
function App() {
    return (
        <React.Fragment>
            <h1>Hello World</h1>
            <h2>This is my first React component</h2>
        </React.Fragment>
    );
}
```

&nbsp;

### 4. Create first React app


Use create-vite to create a react app, see [Create React Vite](2_CreateReactApp.md)
- main.jsx

    ```javascript
    import React from 'react'
    import ReactDOM from 'react-dom/client'
    import App from './App.jsx'
    import './index.css'

    ReactDOM.createRoot(document.getElementById('root')).render(
    <React.StrictMode>
        <App />
    </React.StrictMode>,
    )
    ```

- The react-dom package provides DOM-specific methods for us
    > To render the React component to the DOM, we can use the render method from the react-dom package.

- React.StrictMode
    > React.StrictMode is used to find potential problems in your React app and these are printed in the browser console.
    
    _Strict Mode only runs in development mode and renders your components extra time, so it has time to find bugs._

- The root API is used to render React components inside a browser DOM node
    >  The root calls the render method to render an element to the root.

    _The container in the root API is the ```<div id="root"></div>``` element, which can be found in the index.html_
```javascript
import ReactDOM from 'react-dom/client';
import App from './App';
const container = document.getElementById('root');
// Create a root
const root = ReactDOM.createRoot(container);
// Render an element to the root
root.render(<App />);
```

<hr>

- App.jsx
```javascript
import { useState } from 'react'
import reactLogo from './assets/react.svg'
import viteLogo from '/vite.svg'
import './App.css'

function App() {
  const [count, setCount] = useState(0)

  return (
    <>
      ...
    </>
  )
}

export default App
```

#### At the end of the source code, there is an export default statement that exports the component, after exporting it can be made available to other components by using the import statement.

_There can only be one export default statement per file, but there can be multiple named export statements. Default exports are commonly used to export React components. Named exports are commonly used to export specific functions or objects from a module._

#### Example of export and import a component:

- Export
```javascript
export default React // Default export
export { name } // Named export
```

<hr>

- Import
```javascript
import React from 'react' // Import default value
import { name } from … // Import named value
```


&nbsp;

### 5. ES6 features

> ES6 was released in 2015, and it introduced a lot of new features.

_ECMAScript is a standardized scripting language, and JavaScript is one implementation of it._


#### 5-1) Constants and variables

- Constants
    ```javascript
    const PI = 3.14159;
    ```
    _You will get an error if you try to reassign the PI value_

<hr>

#### The const is block-scoped
_This means that the const variable can only be used inside the block in which it is defined._
```javascript
let count = 10;
if (count > 5) {
    const total = count * 2;
    console.log(total); // Prints 20 to console
}
console.log(total); // Error, outside the scope
```

<hr>

#### If const is an object, its properties or elements can be updated
```javascript
const myObj = {foo: 3};
myObj.foo = 5; // This is ok
```

<hr>

#### 5-2) Arrow functions

- traditional function
    ```javascript
    function(x) {
        return x * 2;
    }
    ```






