[Back](README.md)

## Styling React Frontend

<hr>


### 1. Using plain CSS

Create React App has already enabled the use of plain CSS in the project. In fact, if you look in App.tsx, it already uses plain CSS:
- App.tsx
    ```typescript
    import './App.css';

    function App() {
        return (
            <div className="App">
                ...
            </div>
        );
    }
    ```


React uses a className attribute rather than class because class is a reserved word in JavaScript. The className attribute is converted to a class attribute during transpilation.
&nbsp;

### 2. Using plain CSS in the alert component

#### 2-1) Add a CSS file called Alert.css in the src folder

#### 2-2)  Add a container class into Alert.css
- Alert.css
    ```css
    .container {
        display: inline-flex;
        flex-direction: column;
        text-align: left;
        padding: 10px 15px;
        border-radius: 4px;
        border: 1px solid transparent;
    }
    ```
    The style uses an inline flexbox, with the items flowing vertically and left-aligned. We’ve also added a nice rounded border and a bit of padding between the border and child elements.




#### 2-3) Add the following additional classes that can be used within container
```css
.container.warning {
    color: #e7650f;
    background-color: #f3e8da;
}
.container.information {
    color: #118da0;
    background-color: #dcf1f3;
}
```

#### 2-4) Add the following class for the header container element
```css
.header {
    display: flex;
    align-items: center;
    margin-bottom: 5px;
}
```
This will be applied to the element that contains the icon, heading, and close button. It uses a flexbox that flows horizontally with child elements vertically centered. It also adds a small gap at the bottom before the alert message.

#### 2-5) Add the following class for the icon to give it a width of 30 px

```css
.header-icon {
    width: 30px;
}
```

#### 2-6) Add the following class to apply to the heading to make it bold
```css
.header-text {
    font-weight: bold;
}
```

#### 2-7) Add the following class to apply to the close button
```css
.close-button {
    border: none;
    background: transparent;
    margin-left: auto;
    cursor: pointer;
}
```

#### 2-8) Add the following class for the content element

```css
.content {
    margin-left: 30px;
    color: #000;
}
```

#### 2-9) Use state hook to close the alert box

- Alert.tsx
```typescript
export function Alert({ type = 'information', heading, children, closable, onClose }: Props) {
  const [visible, setVisible] = useState(true);
  if (!visible) {
    return null;
  }
  function handleCloseClick() {
    setVisible(false);
    if (onClose) {
      onClose();
    }
  }
  return (
    <div className={`container ${type}`}>
        ...
    </div>
  )
}
```

&nbsp;

### 2. Using CSS modules

#### 2-1) What is CSS modules
> CSS modules is an open source library available on GitHub at https://github.com/
css-modules/css-modules, which can be added to the webpack process to facilitate the 
automatic scoping of CSS class names


A CSS module is a CSS file, just like in the previous section; however, the filename has an extension of .module.css rather than .css. This special extension allows webpack to differentiate a CSS module file from a plain CSS file so that it can be processed differently.

A CSS module file is imported into a React component file as follows:
```css
import styles from './styles.module.css';
```