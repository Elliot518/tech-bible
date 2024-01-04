[Back](README.md)

## Export the data to CSV

<hr>


### 1. Add the GridToolbar import to the Carlist.tsx file

The GridToolbar component is a toolbar for the MUI data grid that contains nice functionalities

- Carlist.tsx
    ```typescript
    import { DataGrid, GridColDef, GridCellParams, GridToolbar } from '@mui/x-data-grid';
    ```
&nbsp;

### 2. Enable our toolbar, which contains the Export button and other buttons

Use the slots prop and set the value to toolbar
- Carlist.tsx
    ```typescript
    return (
        <>
        <AddCar />
        <DataGrid
            ...
            slots={{ toolbar: GridToolbar }}
        />
        ...
    );
    ```
&nbsp;

### 3. Test the EXPORT button
_You will see the EXPORT button in the grid. If you press the button and select Download as CSV, the grid data is exported to a CSV file_

![export feature](https://github.com/Elliot518/mcp-oss-tech/blob/main/frontend/react/export_feature.png?raw=true)
