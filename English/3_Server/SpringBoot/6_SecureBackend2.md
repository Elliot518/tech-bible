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

