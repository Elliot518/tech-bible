[Back](README.md)

## Add the edit functionality

<hr>


> When the Edit button is pressed, it opens a modal form where the user can edit the existing car and save their changes. we pass car data from the grid row to the edit form.

### 1. Create a file called EditCar.tsx in the components folder

We have to define a FormProps type for our props, and this can be defined inside our component because we don’t need this type anywhere else. The type of data that will be passed to the EditCar component is the CarResponse type. We will also create a state for car data like we did in the add functionality in AddCar.tsx.


- EditCar.tsx
    ```typescript
    import { useState } from 'react';
    import { Car, CarResponse } from '../types';

    type FormProps = {
        cardata: CarResponse;
    }
    
    function EditCar({ cardata }: FormProps) {
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

    export default EditCar;
    ```

&nbsp;

### 2. Create a dialog that will be opened when the Edit button is pressed

Create the open state to define if the dialog is visible or hidden. 

Add the functions that open and close the Dialog and save updates.

- EditCar.tsx
    ```typescript
    ...
    import Dialog from '@mui/material/Dialog';
    import DialogActions from '@mui/material/DialogActions';
    import DialogTitle from '@mui/material/DialogTitle';

    ...

    function EditCar({ cardata }: FormProps) {
        
        ...

        const handleClickOpen = () => {
            setOpen(true);
        };

        const handleClose = () => {
            setOpen(false);
        };
        
        const handleSave = () => {
            setOpen(false);
        }

        return(
            <>
                <button onClick={handleClickOpen}>
                    Edit
                </button>
                <Dialog open={open} onClose={handleClose}>
                    <DialogTitle>Edit car</DialogTitle>
                    <DialogActions>
                        <button onClick={handleClose}>Cancel</button>
                        <button onClick={handleSave}>Save</button>
                    </DialogActions>
                </Dialog>
            </>
        );
    }

    export default EditCar;
    ```
&nbsp;

### 3. Import the CarDialogContent component and render it inside the Dialog component


We also need to add the handleChange function, which saves edited values 
to the car state. We pass in the car state and the handleChange function using the props, as we did earlier with the add functionality.

- EditCar.tsx
    ```typescript
    ...
    import CarDialogContent from './CarDialogContent';
    ...

    const handleChange = (event : React.ChangeEvent<HTMLInputElement>) => {
        setCar({...car, [event.target.name]: event.target.value});
    }


    ...


    // render CarDialogContent inside the Dialog
    return(
        <>
            ...
            <Dialog ...>
                ...
                <CarDialogContent car={car} handleChange={handleChange}/>
                ...
            </Dialog>  
        </>
    );
    ```

&nbsp;

### 4. Set the values of the car state using the props in the handleClickOpen function

- EditCar.tsx
    ```typescript
    const handleClickOpen = () => {
        setOpen(true);
        setCar({
            brand: cardata.brand,
            model: cardata.model,
            color: cardata.color,
            registrationNumber: cardata.registrationNumber,
            modelYear: cardata.modelYear,
            price: cardata.price
        });
    };
    ```
&nbsp;

### 5. Add the edit functionality to our data grid in the Carlist component

- Carlist.tsx
```typescript
...
import EditCar from './EditCar';

// Add a new column
const columns: GridColDef[] = [
    ...
    {field: 'price', headerName: 'Price', width: 150},
    {
        field: 'edit',
        headerName: '',
        width: 90,
        sortable: false,
        filterable: false,
        disableColumnMenu: true,
        renderCell: (params: GridCellParams) =>
            <EditCar cardata={params.row} />
    },
    ...
]; 
```

&nbsp;

### 6. Test the Edit button
![edit car](https://github.com/Elliot518/mcp-oss-tech/blob/main/frontend/react/edit_car.png?raw=true)

&nbsp;

### 7. Implement the update request that sends an updated car to the backend
_Send a PUT request to the http://localhost:8080/api/cars/{carid} URL_

In React Query, the mutation function can only take one parameter, but in our case, we have to send the car object (Car type) and its link. We can solve that by passing an object that contains both values.

- types.ts
    ```typescript
    export type CarEntry = {
    car: Car;
    url: string;
    }
    ```

&nbsp;

### 8. Create the function to update the car and export it
- carapi.ts
    ```typescript
    import { ..., CarEntry } from '../types';

    // Add updateCar function
    export const updateCar = async (carEntry: CarEntry): Promise<CarResponse> => {
        const response = await axios.put(carEntry.url, carEntry.car, {
            headers: {
                'Content-Type': 'application/json'
            },
        });

        return response.data;
    }
    ```
&nbsp;

### 9. Import the updateCar function into the EditCar component and use the useMutation hook to send a request

_You've got to invalidate the cars query to re-fetch the list after a successful edit; therefore, you also have to get the query client_

- EditCar.tsx
```typescript
...
import { updateCar } from '../api/carapi';
import { useMutation, useQueryClient } from '@tanstack/react-query';

...

function EditCar({ cardata }: FormProps) {
    // Get query client
    const queryClient = useQueryClient();

    ...

    // Use useMutation hook
    const { mutate } = useMutation(updateCar, {
        onSuccess: () => {
            queryClient.invalidateQueries(["cars"]);
        },
        onError: (err) => {
            console.error(err);
        }
    });
}
```
&nbsp;

### 10. Call mutate in the handleSave function

_As mutate only accepts one parameter, and we have to pass the car object and URL, therefore, we create an object that contains both values and pass the object._

- EditCar.tsx
```typescript
function EditCar({ cardata }: FormProps) {

    ...

    const handleSave = () => {
        const url = cardata._links.self.href;
        const carEntry: CarEntry = {car, url}
        mutate(carEntry);
        setCar({ brand: '', model: '', color: '', registrationNumber: '', modelYear: 0, price: 0 });    
        setOpen(false);
    }

    ...
}
```

&nbsp;

### 11. Test the save function

![edit car1](https://github.com/Elliot518/mcp-oss-tech/blob/main/frontend/react/edit_car1.png?raw=true)
<hr>

![edit car2](https://github.com/Elliot518/mcp-oss-tech/blob/main/frontend/react/edit_car2.png?raw=true)
