[Back](README.md)

## CRUD Functionalities(Advanced Query)

<hr>


### 1. Using environment variables

_The server URL can be repeated multiple times in the source code when we create more CRUD functionalities, and it will change when the backend is deployed to a server other than the local host; therefore, it is better to define it as an **environment variable**. Then, when the URL value changes, we only have to modify it in one place._


#### When using Vite, environment variable names should start with the text VITE_

#### 1-1) Create a new .env file in the root folder of our app
```javascript
VITE_API_URL=http://localhost:8080
```

<hr>

#### 1-2) Separate all API call functions into their own module

Create a new folder named api in the src folder of your project. <br>
Create a new file called carapi.ts in the api folder. <br>

- carapi.ts
```typescript
import { CarResponse } from '../types';
import axios from 'axios';

export const getCars = async (): Promise<CarResponse[]> => {
    const response = await axios.get(`${import.meta.env.VITE_API_URL}/api/cars`);
    
    return response.data._embedded.cars;
}
```

<hr>

#### 1-3) Refactor

Remove the getCars function and unused axios import from the Carlist.tsx file and import it from the carapi.ts file





&nbsp;

### 2. Add paging, filtering, and sorting

Use the MUI DataGrid component to get paging, filtering, and sorting features

#### 2-1) Install the MUI data grid community version
```shell
npm install @mui/x-data-grid
```

<hr>

#### 2-2) Import the DataGrid, GridColDef components to Carlist.tsx

```javascript
import { DataGrid, GridColDef } from '@mui/x-data-grid';
```

_The grid columns are defined in the columns variable, which has the type GridColDef[],  the headerName prop can be used to set the title of the columns. We can also set the width of the columns._

- Carlist.tsx
```typescript
const columns: GridColDef[] = [
    {field: 'brand', headerName: 'Brand', width: 200},
    {field: 'model', headerName: 'Model', width: 200},
    {field: 'color', headerName: 'Color', width: 200},
    {field: 'registrationNumber', headerName: 'Reg.nr.', width: 150},
    {field: 'modelYear', headerName: 'Model Year', width: 150},
    {field: 'price', headerName: 'Price', width: 150},
];
```


<hr>

#### 2-3) Replace table and data map with DataGrid component
_Also remove the unused CarResponse import that we used in the map function._

We now simply set the data source of the data grid as the data, which contains fetched cars and is defined using the rows prop. The DataGrid component requires all rows to have a unique ID property that is defined using the getRowId prop. We can use the link field of the car object because that contains the unique car ID (_links.self.
href).
```typescript
if (!isSuccess) {
    ...
}
else if (error) {
    ...
}
else {
    return (
        <DataGrid
            rows={data}
            columns={columns}
            getRowId={row => row._links.self.href}
        />
    );
}
```

![data grid](https://github.com/Elliot518/mcp-oss-tech/blob/main/frontend/react/data_grid.png?raw=true)