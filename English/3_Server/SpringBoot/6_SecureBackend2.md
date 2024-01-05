[Back](README.md)

## Secure Backend(Advanced)

<hr>


### 1. Role-based security

In Spring Security, roles can be used to define coarse-grained role-based security, and users can be assigned to one or multiple roles. <br>

Roles often have a hierarchical structure, for example, ADMIN, MANAGER, USER. <br>


Spring Security also provides authorities, which can be used for more fine-grained access control. <br>

For example, we can define which endpoints require specific roles for access <br>
```
eg:
The /admin/** endpoint requires the ADMIN role for access and the /user/** endpoint requires the USER role for access.
The /user/** endpoint requires the USER role for access.
The Spring Security hasRole() method returns true if the user has the specified role
```

- SecurityConfig.java
```java
@Bean
public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
    http.csrf((csrf) -> csrf.disable()).cors(withDefaults())
        .sessionManagement((sessionManagement) -> 
            sessionManagement.sessionCreationPolicy(SessionCreationPolicy.STATELESS))
        .authorizeHttpRequests((authorizeHttpRequests) -> 
            authorizeHttpRequests.requestMatchers("/admin/**")
            .hasRole("ADMIN").requestMatchers("/user/**")
            .hasRole("USER").anyRequest().authenticated())

    return http.build();
}
```

#### Spring Security provides the @PreAuthorize, @PostAuthorize, @PreFilter, @PostFilter, and @Secured annotations, which are used to apply method-level security.

**Method-level security is not enabled by default in spring-boot-starter-security.** <br> 
You have to enable it in your Spring configuration class, for example, in top-level configuration, by using the @EnableMethodSecurity annotation.

- CardatabaseApplication.java
    ```java
    @EnableMethodSecurity
    public class CardatabaseApplication implements CommandLineRunner {
    }
    ```

<hr>

```
eg:
Users with the USER role can execute the updateCar() method.
Users with the ADMIN role can execute the deleteOwner() method. 
The @PreAuthorize annotation checks the rule before the method is executed. 
If the user does not have a specified role, Spring Security prevents method execution, and an AccessDeniedException is thrown.
```

- CarService.java

    ```java
    @Service
    public class CarService {
        @PreAuthorize("hasRole('USER')")
        public void updateCar(Car car) {
            // This method can be invoked by user with USER role.
        }

        @PreAuthorize("hasRole('ADMIN')")
        public void deleteOwner(Car car) {
            // This method can be invoked by user with ADMIN role.
        }
    }
    ```

For more details about method security in the Spring Security, you can refer to the official documentation: https://docs.spring.io/spring-securityreference/servlet/authorization/method-security.html


&nbsp;

### 2. Using OAuth2 with Spring Boot

In a production environment, it is recommended that you do it using an OAuth2 provider


> OAuth (Open Authorization) is a standard for secure access to protected resources on the internet.

The OAuth standard version 2.0 is commonly used nowadays. There are several OAuth 2.0 providers that implement OAuth authorization for third-party applications. <br>
Some common providers are:

- Auth0: https://auth0.com/
- Okta: https://www.okta.com/
- Keycloak: https://www.keycloak.org/

**You can implement social logins using OAuth2, after which users can log in with their existing credentials from social media platforms such as Facebook.**

OAuth also defines mechanisms for revoking access tokens and handling token expiration

In the OAuth2 process, there're some important terms:

- resource owner 
    refers typically to an end user 

- authorization server 
    It is part of the OAuth provider’s service 
    

- client 
    It is an application that wants to get access to protected resources 
    
- resource server 
    It commonly refers to an API that the client wants to use

#### The simplified steps of the OAuth2 authentication process with a REST API

1. Authentication: 
    The third-party application authenticates by requesting access to protected resources.

2. Authorization: 
    The resource owner authorizes access to their resources, commonly through user login.

3. The authorization server authorizes the resource owner and redirects the user back to the client with an authorization code.

4. The client requests an access token from the authorization server using the authorization code. The access token format is not specified in the standard, and JWTs are quite commonly used.

5. The authorization server validates the access token. If the token is valid, the client application receives an access token.

6. The client can start to use the access token to access protected resources, for example, calling REST API endpoints.


**Spring Boot provides the spring-boot-starter-oauth2-client dependency for OAuth2 authentication and authorization. It is used to simplify OAuth 2.0 integration in your Spring Boot application.** <br>
Spring also has a tutorial on how to implement social login using GitHub: https://spring.io/guides/tutorials/spring-boot-oauth2

