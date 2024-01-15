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

A simeple useState demo:
```typescript
import React, { useState } from 'react';

function Example() {
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
```
<hr>

#### Advanced useState hooks

#### 2-1) Add useState to the React import statement
- PersonScore.tsx
    ```typescript
    import { ..., useState } from 'react';
    ```

<hr>

#### 2-2) Add state definitions
eg: for name, score, and loading at the top of the component function
- PersonScore.tsx
    ```typescript
    export function PersonScore() {
        const [name, setName] = useState<string | undefined>();
        const [score, setScore] = useState(0);
        const [loading, setLoading] = useState(true);

        ...
    }
    ```
    _The score state is initialized to 0 and loading is initialized to true_
<hr>

#### 2-3) Change the effect function to set the loading and name state values after the person data has been fetched

- PersonScore.tsx
    ```typescript
    export function PersonScore() {
        ...

        useEffect(() => {
        getPerson().then((person) => {
            setLoading(false);
            setName(person.name);
        });
        }, []);
    }
    ```
    _After the person has been fetched, loading is set to false, and name is set to the person’s name_
<hr>

#### 2-4) Add the following if statement in between the useEffect call and the return statement
- PersonScore.tsx
    ```typescript
    export function PersonScore() {
        useEffect( ... );

        if (loading) {
            return <div>Loading ...</div>;
        }

        return ...
    }
    ```

    _This displays a loading indicator when the loading state is true_

<hr>

#### 2-5) Change the component’s return statement from outputting nothing to outputting the followin
- PersonScore.tsx
```typescript
export function PersonScore() {
    ...

    if (loading) {
        ...
    }

    return (
        <div>
            <h3>
                {name}, {score}
            </h3>
            <button onClick={() => setScore(score + 1)}>Add</button>
            <button onClick={() => setScore(score - 1)}>Subtract</button>
            <button onClick={() => setScore(0)}>Reset</button>
        </div>
    );
}
```
&nbsp;

### 3. Understanding useReducer