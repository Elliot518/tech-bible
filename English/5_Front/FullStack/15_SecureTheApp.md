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