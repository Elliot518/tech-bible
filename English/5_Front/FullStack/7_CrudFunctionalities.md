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

