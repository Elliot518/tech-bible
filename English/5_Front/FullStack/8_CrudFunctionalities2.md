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

