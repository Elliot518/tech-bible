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

