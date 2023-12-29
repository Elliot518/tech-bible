[Back](README.md)

## Add the delete functionality

<hr>


> Items can be deleted from the database by sending the DELETE method request to the http://localhost:8080/api/cars/{carId} endpoint.

*We can see that each data object contains a link to itself, which can be accessed from the _links.self.href node. Since we already used the link field in the previous section to set a unique ID for every row in the grid, that row ID can be used in deletion.*


### 1. Create a button for each row in the MUI DataGrid

Use the renderCell column property to define how a cell’s contents are rendered
_Show an alert with the ID when a button is pressed to test that the button is working properly_

- Carlist.tsx
```typescript
...
// Import GridCellParams
import { DataGrid, GridColDef, GridCellParams } from '@mui/x-data-grid';

// Add delete button column to columns
const columns: GridColDef[] = [
    ...
    {
        field: 'delete',
        headerName: '',
        width: 90,
        sortable: false,
        filterable: false,
        disableColumnMenu: true,
        renderCell: (params: GridCellParams) => (
            <button onClick={() => alert(params.row._links.car.href)}>
                Delete
            </button>
        ),
    },
];
```
![mock delete](https://github.com/Elliot518/mcp-oss-tech/blob/main/frontend/react/mock_delete.png?raw=true)

&nbsp;

### 2. Implement the deleteCar function

_A DELETE request to the backend returns a deleted car object_
- carapi.ts
    ```typescript
    export const deleteCar = async (link: string): Promise<CarResponse> => {
        const response = await axios.delete(link);
        return response.data
    }
    ```


&nbsp;

### 3. Use the React Query useMutation hook to call deleteCar function in page

- Carlist.tsx
    ```typescript
    import { useQuery, useMutation } from '@tanstack/react-query';
    import { getCars, deleteCar } from '../api/carapi';
    ...

    // Add the useMutation hook, which calls our deleteCar function
    const { mutate } = useMutation(deleteCar, {
        onSuccess: () => {
            // Car deleted
        },
        onError: (err) => {
            console.error(err);
        },
    });
    ```

&nbsp;

### 4. Call mutate in our delete button and pass the car link as an argument

- Carlist.tsx
    ```typescript
    {
        ...
        renderCell: (...) => (
            <button onClick={() => mutate(params.row._links.car.href)}>
                Delete
            </button>
        )
    }
    ```

&nbsp;

### 5. Start the app and press the delete button

_If you start the app and press the delete button, the car is deleted from the database, but it still exists in the frontend. You can manually refresh the browser, after which the car disappears from the table._

&nbsp;

### 6. Refresh the frontend automatically when a car is deleted

_In React Query, the fetched data is saved to a cache that the query client handles. The QueryClient has a query invalidation feature that we can use to fetch data again._


#### 6-1) Import and call the useQueryClient hook function
- Carlist.tsx
    ```typescript
    import { ..., useQueryClient } from '@tanstack/react-query';
    ...
    function Carlist() {
        const queryClient = useQueryClient();

        ...
    }
    ```

#### 6-2) Call invalidateQueries method to re-fetch our data after successful deletion
pass the key of the query that you want to re-fetch
- Carlist.tsx
    ```typescript
    ...

    const { mutate } = useMutation(deleteCar, {
        onSuccess: () => {
            queryClient.invalidateQueries({ queryKey: ['cars'] });
        },
        ...
    });
    ```
    #### Effect:

    Every time a car is deleted, all the cars are fetched again. The car disappears from the list when the Delete button is pressed.

&nbsp;

### 7. Display a toast message

> Toast message is to show the user some feedback in the case of a successful deletion, or if there are any errors.
![toast message](https://github.com/Elliot518/mcp-oss-tech/blob/main/frontend/react/toast_message.png?raw=true)
_Use the MUI Snackbar component_
#### 7-1) Import the Snackbar component

- Carlist.tsx
```typescript
import Snackbar from '@mui/material/Snackbar';
```

<hr>

#### 7-2) Import the useState hook and define a state called open to handle the visibility of our Snackbar component
_The Snackbar component’s open prop value is a boolean, and if it is true, the component is shown; otherwise, it is hidden.The initial value is false because 
the message is shown only after the deletion._
- Carlist.tsx
```typescript
import { useState } from 'react';
...

function Carlist() {
    const [open, setOpen] = useState(false);

    ...
}
```

<hr>

#### 7-2) Add the Snackbar component in the return statement after the MUI DataGrid component
- Carlist.tsx
    ```typescript
    if (!isSuccess) {
        return <span>Loading...</span>
    }
    else if (error) {
        return <span>Error when fetching data...</span>
    }
    else {
        return (
            <>
                <DataGrid
                    rows={data}
                    columns={columns}
                    getRowId={row => row._links.self.href} />
                
                <Snackbar
                    open={open}
                    autoHideDuration={2000}
                    onClose={() => setOpen(false)}
                    message="Data deleted" />
            </>
        );
    ```
<hr>

#### 7-3) Set the open state to true after the successful deletion in our useMutation hook
- Carlist.tsx
    ```typescript
    const { mutate } = useMutation(deleteCar, {
        onSuccess: () => {
        setOpen(true);
        ...
        },
    }); 
    ```

&nbsp;

### 8. Add a confirmation dialog window

To avoid accidental deletion of a car, it would be useful to have a confirmation dialog after the Delete button has been pressed.
![confirm dialog](https://github.com/Elliot518/mcp-oss-tech/blob/main/frontend/react/confirm_dialog.png?raw=true)

- Carlist.tsx
    ```typescript
    {
        ...
        renderCell: (params: GridCellParams) => (
        <button onClick={() => {
            if (window.confirm(`Are you sure you want to delete ${params.row.brand} ${params.row.model}?`)) {
                mutate(params.row._links.car.href);
            } 
        }}       
        >
            Delete
        </button>
        ),
    },
    ```
