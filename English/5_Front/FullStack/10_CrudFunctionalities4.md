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
&nbsp;

### 5. Add the Dialog component inside the AddCar component’s return statement

- AddCar.tsx
```typescript
...
const handleChange = (event : React.ChangeEvent<HTMLInputElement>) => {
    setCar({...car, [event.target.name]: event.target.value});
}

return(
    <>
        <button onClick={handleClickOpen}>New Car</button>
        <Dialog open={open} onClose={handleClose}>
            <DialogTitle>New car</DialogTitle>
            <DialogContent>
                <input placeholder="Brand" name="brand"
                    value={car.brand} onChange={handleChange}/><br/>
                <input placeholder="Model" name="model"
                    value={car.model} onChange={handleChange}/><br/>
                <input placeholder="Color" name="color"
                    value={car.color} onChange={handleChange}/><br/>
                <input placeholder="Year" name="modelYear"
                    value={car.modelYear} onChange={handleChange}/><br/>
                <input placeholder="Reg.nr" name="registrationNumber"
                    value={car.registrationNumber} onChange={handleChange}/><br/>
                <input placeholder="Price" name="price"
                    value={car.price} onChange={handleChange}/><br/>
            </DialogContent>
            <DialogActions>
                <button onClick={handleClose}>Cancel</button>
                <button onClick={handleClose}>Save</button>
            </DialogActions>
        </Dialog>
    </>
);
```

&nbsp;

### 6. Implement the addCar function

In the carapi.ts file, we use the Axios post method to send the POST request to the backend api/cars endpoint
- carapi.ts
    ```typescript
    import { ..., Car} from '../types';

    // Add a new car
    export const addCar = async (car: Car): Promise<CarResponse> => {
        const response = await axios.post(`${import.meta.env.VITE_API_URL}/api/cars`, car, {
            headers: {
                'Content-Type': 'application/json',
            }, 
        });

        return response.data;
    }
    ```

&nbsp;

### 7. Use the React Query useMutation hook, just like in the delete functionality

Invalidate the cars query after the car has been added successfully
- AddCar.tsx
```typescript
...
import { useMutation, useQueryClient } from '@tanstack/react-query';
import { addCar } from '../api/carapi';

// Add inside the AddCar component function
const queryClient = useQueryClient();

const { mutate } = useMutation(addCar, {
    onSuccess: () => {
        queryClient.invalidateQueries(["cars"]);
    },
    onError: (err) => {
        console.error(err);
    },
});  
```

&nbsp;

### 8. Import the AddCar component into the Carlist.tsx file
- Carlist.tsx
    ```typescript
    ...
    import AddCar from './AddCar';
    ```
&nbsp;

### 9. Add the AddCar component to the Carlist.tsx file’s return statement
- Carlist.tsx
    ```typescript
    ...

    // Render the AddCar component 
    return (
    <>
        <AddCar />
        ...
    </>
    ```

&nbsp;

### 10. Start app to see the model form result

_If you press the New Car button, it should open the modal form_
![add car](https://github.com/Elliot518/mcp-oss-tech/blob/main/frontend/react/new_car.png?raw=true)