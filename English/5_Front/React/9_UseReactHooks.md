[Back](README.md)

## Use React Hooks

<hr>


### 1. What are React Hooks

> React Hooks are functions that let developers use state and other React features in functional components. 

Before the introduction of hooks in React version 16.8, stateful logic could only be implemented in class components. With hooks, functional components can now have state, lifecycle methods, and other features that were previously exclusive to class components.


Three commonly used React Hooks:
- useState

    Allows functional components to have state variables.

- useEffect

    Performs side effects in functional components, similar to lifecycle methods in class components. A component side effect is something executed outside the scope of the component such as a web service request.

- useContext

    Provides a way to consume the values of a React context.

&nbsp;

### 2. Using state Hooks

The useState Hook allows state to be defined in a variable. 

The syntax for useState is as follows:
```typescript
const [state, setState] = useState(initialState);
```
