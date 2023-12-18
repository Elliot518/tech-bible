[Back](README.md)

## React Prerequisite

<hr>


### 1. Introduce React Components

> React is component-based, and the components are independent and reusable. Components are the basic building blocks of React.

_When you start to develop a UI with React, it is good to start by creating **mock interfaces**. That way, it will be easy to identify what kinds of components you have to create and how they interact._


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






