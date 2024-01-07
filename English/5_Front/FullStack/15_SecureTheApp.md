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

