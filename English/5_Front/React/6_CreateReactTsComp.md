[Back](README.md)

## Creating a React and TypeScript component

<hr>


### 1. Adding a props type

We will use the skeleton created by "Create React App" in our previous chapter.

1-1) Create a new file in the src folder called Alert.tsx
```typescript
import { useState } from 'react';

type Props = {
  type?: string;
  heading: string;
  children: React.ReactNode;
  closable?: boolean;
  onClose?: () => void;
};

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
    <div>
      <div>
        <span role="img" aria-label={type === 'warning' ? 'Warning' : 'Information'}>
          {type === 'warning' ? '⚠' : 'ℹ️'}
        </span>
        <span>{heading}</span>
      </div>
      {closable && (
        <button aria-label="Close" onClick={handleCloseClick}>
          <span role="img" aria-label="Close">
            ❌
          </span>
        </button>
      )}
      <div>{children}</div>
    </div>
  );
}
```

_The interface syntax can also be used to create types as an alternative to type aliases_

<hr>

1-2) Import the Alert component and use it in App.tsx

```typescript
import React from 'react';
import './App.css';
import { Alert } from './Alert';

function App() {
  return (
    <div className="App">
      <Alert heading="Success" closable>
        Everything is really good!
      </Alert>
    </div>
  );
}

export default App;
```

&nbsp;

