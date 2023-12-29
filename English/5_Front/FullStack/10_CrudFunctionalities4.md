[Back](README.md)

## Add the insert functionality

<hr>


> We implement the insert feature by using the MUI modal dialog.

### 1. Create a new file in the components folder for adding feature

- AddCar.tsx
    ```typescript
    import Dialog from '@mui/material/Dialog';
    import DialogActions from '@mui/material/DialogActions';
    import DialogContent from '@mui/material/DialogContent';
    import DialogTitle from '@mui/material/DialogTitle';

    function AddCar() {
        return(
            <></>
        );
    }

    export default AddCar;
    ```

&nbsp;

### 2. Create a type for the car object

- types.ts
    ```typescript
    export type Car = {
        brand: string;
        model: string;
        color: string;
        registrationNumber: string;
        modelYear: number;
        price: number;
    }
    ```

&nbsp;

### 3. Declare a state of type Car that contains all car fields using the useState hook

- AddCar.tsx
```typescript
import { useState } from 'react';
...
import { Car } from '../types';

function AddCar() {
    const [open, setOpen] = useState(false);
    const [car, setCar] = useState<Car>({
        brand: '',
        model: '',
        color: '',
        registrationNumber: '',
        modelYear: 0,
        price: 0
    });

    return(
        <></>
    );
}

export default AddCar;
```

&nbsp;

### 4. Add two functions to close and open the dialog form

The handleClose and handleOpen functions set the value of the open state, which affects the visibility of the modal form.

-  AddCar.tsx
    ```typescript
    // Open the modal form
    const handleClickOpen = () => {
        setOpen(true);
    };

    // Close the modal form
    const handleClose = () => {
        setOpen(false);
    };    
    ```

