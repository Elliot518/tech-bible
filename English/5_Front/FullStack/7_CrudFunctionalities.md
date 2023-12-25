[Back](README.md)

## Add CRUD Functionalities

<hr>


### 1. Use React Query for networking

The QueryClientProvider component is used to connect and provide QueryClient to your application.

Open your App.tsx file and add the following code
```javascript
...
import { QueryClient, QueryClientProvider } from '@tanstack/react-query';

const queryClient = new QueryClient();

function App() {
  return (
    <Container maxWidth="xl">
      ...
      <QueryClientProvider client={queryClient}>
      </QueryClientProvider>
    </Container>
  );
}

export default App;
```

&nbsp;

### 2. Fetching data from the backend

#### 2-1) Create folders for multiple components

Create a new file called Carlist.tsx in the components folder
```javascript
function Carlist() {
    return(
        <></>
    );
}
export default Carlist;
```

<hr>

#### 2-2) Create a new file where we define our types

_Create the following CarResponse type in the types.ts file and export it so that we can use it in files where it is needed_
```javascript
export type CarResponse = {
  brand: string;
  model: string;
  color: string;
  registrationNumber: string;
  modelYear: number;
  price: number;
  _links: {
    self: {
      href: string;
    },
    car: {
      href: string;
    },
    owner: {
      href: string;
    }
  };
}
```

<hr>

### 2-3) Create a function that fetches data from backend

_fetches cars from our backend by sending a GET request to the http://localhost:8080/api/cars endpoint_

_The function returns a promise that contains an array of CarResponse objects that we defined in our types.ts file._

```javascript
import { CarResponse } from '../types';
import axios from 'axios';

function Carlist() {
    const getCars = async (): Promise<CarResponse[]> => {
        const response = await axios.get("http://localhost:8080/api/cars");
        return response.data._embedded.cars;
    }

    return(
        <></>
    );
}

export default Carlist;
```

<hr>

### 2-4) Use the useQuery hook to fetch data

```javascript
import { useQuery } from '@tanstack/react-query';
...

function Carlist() {
    ...

    const { data, error, isSuccess } = useQuery({
        queryKey: ["cars"], 
        queryFn: getCars
    })
    
    return(
        <></>
    );
}

export default Carlist;
```

<hr>


### 2-5) Use conditional rendering to render UI by fetching result

_Use the map function to transform car objects into table rows_
```javascript
if (!isSuccess) {
    return <span>Loading...</span>
}
else if (error) {
    return <span>Error when fetching data...</span>
}
else {
    return (
        <table>
            <tbody>
            {
                data.map((car: CarResponse) => 
                <tr key={car._links.self.href}>
                    <td>{car.brand}</td>
                    <td>{car.model}</td>
                    <td>{car.color}</td> 
                    <td>{car.registrationNumber}</td> 
                    <td>{car.modelYear}</td>
                    <td>{car.price}</td>
                </tr>)
            }
            </tbody>
        </table>
    );
}
```


