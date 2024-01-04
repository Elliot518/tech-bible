[Back](README.md)

## Styling the Frontend with MUI

<hr>


> MUI is Material UI

### 1. Use the MUI Button component

_First, we will replace HTML button elements with the Material UI Button component_


#### 1-1) Import the MUI Button component into the AddCar.tsx and EditCar.tsx files
- AddCar.tsx & EditCar.tsx
    ```typescript
    import Button from '@mui/material/Button';
    ```

<hr>

#### 1-2) Change the buttons to use the Button component in the AddCar component

- AddCar.tsx
```typescript
...

return(
    <>
        <Button onClick={handleClickOpen}>New Car</Button>
        <Dialog ...>
            ...
            <DialogActions>
                <Button onClick={handleClose}>Cancel</Button>
                <Button onClick={handleSave}>Save</Button>
            </DialogActions>
        </Dialog>
    </>
);
```

<hr>


#### 1-3) Change the buttons in the EditCar component to the Button component

- EditCar.tsx
```typescript
return(
    <>
        <Button size="small" onClick={handleClickOpen}>
            Edit
        </Button>
        <Dialog ...>
            ...
            <DialogActions>
                <Button onClick={handleClose}>Cancel</Button>
                <Button onClick={handleSave}>Save</Button>
            </DialogActions>
        </Dialog>
    </>
);
```

<hr>

#### 1-4) Start application and check car list UI

![add mui button](https://github.com/Elliot518/mcp-oss-tech/blob/main/frontend/react/add_mui.png?raw=true)


&nbsp;

### 2. Use the MUI Icon and IconButton components

We will use the IconButton component for the EDIT and DELETE buttons in the 
grid. MUI provides pre-built SVG icons that we have to install by using the following command in the terminal:
```shell
npm install @mui/icons-material
```

We can find a list of icons available in the MUI documentation (https://mui.com/material-ui/material-icons/)

#### 2-1) Use an icon called DeleteIcon in the Carlist.tsx file
- Carlist.tsx
    ```typescript
    import IconButton from '@mui/material/IconButton';
    import DeleteIcon from '@mui/icons-material/Delete';

    ...

    const columns: GridColDef[] = [
        
        ...

        {
            ...
            renderCell: (...) => (
                <IconButton aria-label="delete" size="small"
                    onClick={() => {
                        ...
                    }}
                >
                    <DeleteIcon fontSize="small" />
                </IconButton>        
            )
        }
    ];
    ```
<hr>

#### 2-2) Verify delete button

![verify delete button](https://github.com/Elliot518/mcp-oss-tech/blob/main/frontend/react/mui_delete.png?raw=true)


<hr>

#### 2-3) Implement the EDIT button using the IconButton component

- EditCar.tsx
```typescript
import IconButton from '@mui/material/IconButton';
import EditIcon from '@mui/icons-material/Edit';
```

<hr>

#### 2-4) Render the IconButton and EditIcon in the return statement

- EditCar.tsx
```typescript
return(
    <>
        <IconButton aria-label="edit" size="small" onClick={handleClickOpen}>
            <EditIcon fontSize= "small" />
        </IconButton>      
        ...
    </>
);
```

<hr>

#### 2-5) See both buttons are rendered as icons

![icon button](https://github.com/Elliot518/mcp-oss-tech/blob/main/frontend/react/icon_buttons.png?raw=true)

