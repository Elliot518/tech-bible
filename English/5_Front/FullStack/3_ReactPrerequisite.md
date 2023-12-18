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

