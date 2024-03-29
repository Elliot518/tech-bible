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

- ES6 arrow function
    ```javascript
    x => x * 2
    ```

    _The function is a so-called anonymous function, and we can’t call it. Anonymous 
    functions are often used as an argument for other functions. In JavaScript, functions are first-class citizens and you can store functions in variables._
    ```javascript
    const calc = x => x * 2

    // Now, you can use the variable name to call the function, returns 10
    calc(5);
    ```

    _When you have more than one argument, you have to wrap the arguments in parentheses /pəˈrenθəsiːz/ and separate the arguments with a comma to use the arrow function effectively._
    ```javascript
    const calcSum = (x, y) => x + y
    // function call, returns 5
    calcSum(2, 3);
    ```

    _Multiple lines in the function body, you have to use curly brackets and a return statement_
    ```javascript
    const calcSum = (x, y) => {
        console.log('Calculating sum');
        return x + y;
    }
    ```


    _If the function doesn’t have any arguments, then you should use empty parentheses_
    ```javascript
    const sayHello = () => "Hello"
    ```

 <hr>

 #### 5-3) Template literals
> Template literals can be used to concatenate strings.

- traditional way to concatenate strings(use the + operator)

    ```javascript
    let person = {firstName: 'John', lastName: 'Johnson'};
    let greeting = "Hello " + ${person.firstName} + " " + ${person.lastName};
    ```

- template literals(use backticks ``)
    ```javascript
    let person = {firstName: 'John', lastName: 'Johnson'};
    let greeting = `Hello ${person.firstName} ${person.lastName}`;
    ```

<hr>

#### 5-4) Object destructuring

> The object destructuring feature allows you to extract values from an object and assign them to a variable.

_An object_
```javascript
const person = {
    firstName: 'John',
    lastName: 'Johnson',
    email: 'j.johnson@mail.com'
};
```

- example without object destructuring
    ```javascript
    const firstName = person.firstName;
    const lastName = person.lastName;
    const email = person.email;
    ```

- example with object destructuring
    ```javascript
    // creates three variables, firstName, lastName, and email, 
    // which get their values from the person object
    const { firstName, lastName, email } = person;
    ```

<hr>

#### 5-5) Classes and inheritance

> Class definition in ES6 is similar to other object-oriented languages such as Java or C#.

 ES6 class:
 ```javascript
 class Person {
    constructor(firstName, lastName) {
        this.firstName = firstName;
        this.lastName = lastName;
    }
}
```

Inheritance is performed with an extends keyword
```javascript
class Employee extends Person {
	constructor(firstName, lastName, title, salary) {
		super(firstName, lastName);
		this.title = title;
		this.salary = salary;
	}
}
```


Babel is a JavaScript compiler that is used to compile ES6 (or newer versions) to an older version that is compatible with all browsers. You can test the compiler on the Babel website (https://babeljs.io).

&nbsp;

### 6. JSX and styling

> JavaScript XML (JSX) is the syntax extension for JavaScript.

_It is not mandatory to use JSX with React, but there are some benefits that make development easier. For example, JSX prevents injection attacks because all values are escaped in JSX before they are rendered. The most useful feature is that you can embed JavaScript expressions in JSX by wrapping them with curly brackets.JSX is compiled into regular JavaScript 
by Babel._

- JSX Example
```javascript
function App(props) {
	return <h1>Hello World {props.user}</h1>;
}
```

#### Styling

- inline styling
    ```html
    <div style={{ height: 20, width: 200 }}>
        Hello
    </div>
    ```

- use a style object
    ```javascript
    const divStyle = { color: 'red', height: 30 };
    const MyComponent = () => (
        <div style={divStyle}>Hello</div>
    );
    ```

- reference classes from an external CSS file
    ```javascript
    import './App.js';
    ...
    <div className="App-header"> This is my app</div>
    ```
