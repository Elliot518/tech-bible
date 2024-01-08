[Back](README.md)

## Secure Your Application

<hr>


> We will create a component for the login functionality. Next, we will modify our CRUD functionalities in the frondend to send the token in the request’s authorization header to the backend, finally implement the logout functionality.

### 1. Secure the backend

#### 1-1) Modify filterChain method of SecurityConfig class
SecurityConfig.java
```java
@Bean
public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
    http.csrf((csrf) -> csrf.disable()).cors(withDefaults())
            .sessionManagement(
                    (sessionManagement) -> sessionManagement.sessionCreationPolicy(SessionCreationPolicy.STATELESS))
            .authorizeHttpRequests((authorizeHttpRequests) -> authorizeHttpRequests
                    .requestMatchers(HttpMethod.POST, "/login").permitAll().anyRequest().authenticated())
            .addFilterBefore(authenticationFilter, UsernamePasswordAuthenticationFilter.class)
            .exceptionHandling((exceptionHandling) -> exceptionHandling.authenticationEntryPoint(exceptionHandler));
    
    return http.build();
}
```
<hr>

#### 1-2) Run the backend and frontend to check the result

You should now see that the list page and the car list are loading. If you open the developer 
tools and the Network tab, you will notice that the response status is 401 Unauthorized. 
This is actually what we expect because we haven’t yet executed authentication in relation 
to our frontend.
![unauthorized](https://github.com/Elliot518/mcp-oss-tech/blob/main/frontend/secure/unauthorized.png?raw=true)

&nbsp;

### 2. Secure the frontend

#### The sequence diagram of the whole secured process

![secure diagram](https://github.com/Elliot518/mcp-oss-tech/blob/main/frontend/secure/secure_diagram.png?raw=true)

#### 2-1) Creating a login component

Create a new file called Login.tsx in the components folder
- Login.tsx
    ```typescript
    import { useState } from 'react';
    import axios from 'axios';

    function Login() {
        return(
            <></>
        );
    }
    export default Login;
    ```
<hr>

#### 2-2) Add states for user credentials and status of the authentication

_We need two states for the authentication: one for the credentials (username and password), and one boolean value to indicate the status of the authentication._

- Login.tsx
    ```typescript
    ...
    type User = {
        username: string;
        password: string;
    }
    function Login() {
        const [user, setUser] = useState<User>({
            username: '',
            password: ''
        });
        const [isAuthenticated, setAuth] = useState(false);

        ...
    }
    ```

<hr>

#### 2-3) Login UI

- Login.tsx
    ```typescript
    import Button from '@mui/material/Button';
    import TextField from '@mui/material/TextField';
    import Stack from '@mui/material/Stack';

    ...

    return(
        <Stack spacing={2} alignItems="center" mt={2}>
            <TextField
                name="username"
                label="Username"
                onChange={handleChange} />
            <TextField
                type="password"
                name="password"
                label="Password"
                onChange={handleChange}/>
            <Button
                variant="outlined"
                color="primary"
                onClick={handleLogin}>
                Login
            </Button>
        </Stack>
    );
    ```

<hr>

#### 2-4) Implement the change handler function for the TextField components to save typed values to the states

Use the spread syntax because it ensures that you retain all the other properties of the user object that are not modified in this update
- Login.tsx
    ```typescript
    const handleChange = (event: React.ChangeEvent<HTMLInputElement>) => {
        setUser({...user, [event.target.name] : event.target.value});
    }
    ```
<hr>

#### 2-5) Save token to session storage

The login is done by calling the /login endpoint using the POST method and sending the user object inside the body. If authentication succeeds, we get a token in a response Authorization header. We will then save the token to session storage and set the isAuthenticated state value to true.

- Login.tsx
    ```typescript
    const handleLogin = () => {
        axios.post(import.meta.env.VITE_API_URL + "/login", user, {
            headers: { 'Content-Type': 'application/json' }
        })
        .then(res => {
            const jwtToken = res.headers.authorization;
            if (jwtToken !== null) {
                sessionStorage.setItem("jwt", jwtToken);
                setAuth(true);
            }
        })
        .catch(() => setOpen(true));
    }  
    ```
<hr>

#### 2-6) Implement conditional rendering

_Renders the Login component if the isAuthenticated state is false, or the Carlist component if the isAuthenticated state is true_

- Login.tsx
    ```typescript
    ...

    import Carlist from './Carlist';

    if (isAuthenticated) {
        return <Carlist />;
    }
    else {
        // render login component
        return(
            ...
        );
    }
    ```
<hr>

#### 2-7) Render the Login component instead of the Carlist component in the App.tsx file

- App.tsx
    ```typescript
    ...
    import Login from './components/Login';

    function App() {
    return (
        <Container maxWidth="xl">
        ...
        <QueryClientProvider client={queryClient}>
            <Login />
        </QueryClientProvider>
        </Container>
    );
    }
    ```
<hr>


#### 2-8) Check login functionality

If you log in using the credentials(eg: user/user or admin/admin) that we have inserted into the database, you should see the car list page. If you open the developer tools' Application tab, you can see that the token is now saved to session storage

![first login](https://github.com/Elliot518/mcp-oss-tech/blob/main/frontend/secure/first_login.png?raw=true)


&nbsp;

### 3. Implementing REST API calls

#### 3-1) Fetch cars with token

In the file carapi.ts, we first read the token from session storage and then add the Authorization header with the token value to the GET request.
- carapi.ts
    ```typescript
    export const getCars = async (): Promise<CarResponse[]> => {
        const token = sessionStorage.getItem("jwt");
        const response = await axios.get(`${import.meta.env.VITE_API_URL}/api/cars`, {
            headers: { 'Authorization' : token }
        });

        return response.data._embedded.cars;
    }
    ```
<hr>

#### 3-2) Check the data and the header

If you log in to your frontend, you should see the car list populated with cars from the database, and if you check the request content from header tab of the developer tools, you can see that it contains the Authorization header with the token value
![](https://github.com/Elliot518/mcp-oss-tech/blob/main/frontend/secure/reqeust_with_header.png?raw=true)

<hr>

#### 3-3) Modify the other CRUD functionalities in the same way so they work correctly

- carapi.ts (deleteCar)
    ```typescript
    export const deleteCar = async (link: string): Promise<CarResponse> =>
    {
        const token = sessionStorage.getItem("jwt");
        const response = await axios.delete(link, {
            headers: { 'Authorization': token }
        })

        return response.data
    }
    ```

- carapi.ts (addCar)
    ```typescript
    export const addCar = async (car: Car): Promise<CarResponse> => {
        const token = sessionStorage.getItem("jwt");
        const response = await axios.post(`${import.meta.env.VITE_API_URL}/api/cars` car, {
            headers: {
                'Content-Type': 'application/json',
                'Authorization': token
            },
        });

        return response.data;
    }
    ```

- carapi.ts (updateCar)
    ```typescript
    export const updateCar = async (carEntry: CarEntry): Promise<CarResponse> => {
        const token = sessionStorage.getItem("jwt");
        const response = await axios.put(carEntry.url, carEntry.car, {
            headers: {
                'Content-Type': 'application/json',
                'Authorization': token
            },
        });

        return response.data;
    }
    ```

&nbsp;

### 4. Refactoring duplicate code

We can do some refactoring to avoid repeating the same code and make our code easier to maintain, for example, to make it commmon where we retrieve our token from session storage.

#### 4-1) Create a function that retrieves the token from session storage

**creates a configuration object for Axios requests that contains headers with the token**

_Axios provides the AxiosRequestConfig interface, which can be used to configure requests we send using Axios_

- carapi.ts
    ```typescript
    ...
    import axios, { AxiosRequestConfig } from 'axios';
    ...

    const getAxiosConfig = (): AxiosRequestConfig => {
        const token = sessionStorage.getItem("jwt");
        return {
            headers: {
                'Authorization': token,
                'Content-Type': 'application/json',
            },
        };
    };
    ```
<hr>

#### 4-2) Use the getAxiosConfig() function without retrieving a token in each function

Remove the configuration object and call the getAxiosConfig() function 
instead
- carapi.ts
    ```typescript
    export const getCars = async (): Promise<CarResponse[]> => {
    const response = await axios.get(`${import.meta.env.VITE_API_URL}/api/cars`, getAxiosConfig());
        return response.data._embedded.cars;
    }

    export const deleteCar = async (link: string): Promise<CarResponse> => {
    const response = await axios.delete(link, getAxiosConfig());
        return response.data
    }

    export const addCar = async (car: Car): Promise<CarResponse> => {
    const response = await axios.post(`${import.meta.env.VITE_API_URL}/api/cars`, car, getAxiosConfig());
        return response.data;
    }

    export const updateCar = async (carEntry: CarEntry): Promise<CarResponse> => {
    const response = await axios.put(carEntry.url, carEntry.car, getAxiosConfig());
        return response.data;
    }
    ```

Run the front app and you'll find it is the same as before, we can fetch cat list correctly

&nbsp;

### 5. Displaying an error message

We are going to implement an error message that is shown to a user if authentication fails and we will use the Snackbar MUI component to show the message.

#### 5-1) Import Snackbar to the Login.tsx file

- Login.tsx
    ```typescript
    import Snackbar from '@mui/material/Snackbar';
    ```



<hr>

#### 5-2) Add a new state called open to control the visibility of the Snackbar

- Login.tsx
    ```typescript
    const [open, setOpen] = useState(false);
    ```

<hr>

#### 5-3) Add the Snackbar component to the return statement

Add the Snackbar inside the stack just under the Button component. The Snackbar component is used to show toast messages. The component is shown if the open prop value is true. The autoHideDuration defines the number of milliseconds to wait before the onClose function is called.


- Login.tsx
    ```typescript
    <Snackbar
        open={open}
        autoHideDuration={3000}
        onClose={() => setOpen(false)}
        message="Login failed: Check your username and password"
    />
    ```

<hr>

#### 5-4) Set the open state value to true

Open the Snackbar component if authentication fails by setting the open state value to true

- Login.tsx
    ```typescript
    const handleLogin = () => {
        axios.post(import.meta.env.VITE_API_URL + "/login", user, {
            ...
        })
        .then(res => {
            ...
        })
        .catch(() => setOpen(true));
    }  
    ```
<hr>

#### 5-5) Check logging in with the wrong credentials
You will see the following message in the bottom-left corner of the screen

![login fail](https://github.com/Elliot518/mcp-oss-tech/blob/main/frontend/secure/login_fail.png?raw=true)

&nbsp;

### 6. Logging out

