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
    );
    ```

&nbsp;

### 10. Start app to see the model form result

_If you press the New Car button, it should open the modal form_
![add car](https://github.com/Elliot518/mcp-oss-tech/blob/main/frontend/react/new_car.png?raw=true)

&nbsp;

### 11. Create a function called handleSave in the AddCar.tsx file to save a new car
- AddCar.tsx
    ```typescript
    const handleSave = () => {
        // Save car and close modal form
        mutate(car);
        setCar({ brand: '', model: '', color: '', registrationNumber: '', modelYear: 0, price: 0 });
        handleClose();
    }  
    ```

&nbsp;

### 12. change the AddCar component’s onClick save button to call the handleSave function

- AddCar.tsx
    ```typescript
    <DialogActions>
        ...
        <button onClick={handleSave}>Save</button>
    </DialogActions>
    ```

&nbsp;

### 13. Save data test
_After saving, the list page is refreshed, and the new car can be seen in the list_

![add car1](https://github.com/Elliot518/mcp-oss-tech/blob/main/frontend/react/add_car1.png?raw=true)

<hr>

![add car2](https://github.com/Elliot518/mcp-oss-tech/blob/main/frontend/react/add_car2.png?raw=true)

&nbsp;

### 14. code refactoring for edit functionality

_When we start to implement the edit functionality, we will actually need the same fields in the Edit form as in the New Car form._

**We split the conetnt(all text fields) into a new component, which can then be used in both the New Car and Edit forms. To do that, we create a new file called CarDialogContent.tsx in the components folder.**

1) Create a new type called DialogFormProps in CarDialogContent.tsx file

2) Move our DialogContent component from the AddCar component to the 
CarDialogContent component

- CarDialogContent.tsx
    ```typescript
    import DialogContent from '@mui/material/DialogContent';
    import { Car } from '../types';

    type DialogFormProps = {
    car: Car;
    handleChange: (event: React.ChangeEvent<HTMLInputElement>) => void;
    }

    function CarDialogContent({ car, handleChange }: DialogFormProps) {
    return (
        <>
        <DialogContent>
            <input placeholder="Brand" name="brand"
            value={car.brand} onChange={handleChange}/><br/>
            <input placeholder="Model" name="model"
            value={car.model} onChange={handleChange}/><br/>
            <input placeholder="Color" name="color"
            value={car.color} onChange={handleChange}/><br/>
            <input placeholder="Year" name="modelYear"
            value={car.modelYear} onChange={handleChange}/><br/>
            <input placeholder="Reg.nr." name="registrationNumber"
            value={car.registrationNumber} onChange={handleChange}/><br/>
            <input placeholder="Price" name="price"
            value={car.price} onChange={handleChange}/><br/>
        </DialogContent>  
        </>
    );
    }
    export default CarDialogContent;
    ```

3) Import the CarDialogContent to the AddCar component, pass the car state and the handleChange function to the component using props,  remove the unused MUI DialogContent import from the AddCar component
- AddCar.tsx
    ```typescript
    ...
    //import DialogContent from '@mui/material/DialogContent';
    import CarDialogContent from './CarDialogContent';
    ...

    function AddCar() {
        ...

        return(
            <>
                ...
                <Dialog open={open} onClose={handleClose}>
                    ...
                    <CarDialogContent car={car} handleChange={handleChange} />
                    ...
                </Dialog>
            </>
        );
    }

    ...
    ```
    Test the refacored code to see it works as before!

