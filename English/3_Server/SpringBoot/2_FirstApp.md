[Back](README.md)

## First Application of Spring Boot 3

<hr>


### 1. Spring Initializr

> Use Spring Initializr to create your first skeleton by spring boot 3.

[Spring Initializr](https://start.spring.io/)


![spring](https://raw.githubusercontent.com/Elliot518/mcp-oss-repo/main/springboot/springboot_init.png)

&nbsp;

### 2. Creating a Spring MVC web controller

#### 2-1) Add spring boot web starter

```xml
<dependency>
    <groupId>org.springframework.boot</groupId>
    <artifactId>spring-boot-starter-web</artifactId>
</dependency>
```

This dependency puts Spring MVC in the project’s classpath, and gives access to Spring MVC’s annotations and other components, we can then define web controllers.

<hr>

#### 2-2) Create your first controller

```java
@Controller
public class HomeController {
    @GetMapping("/")
    public String index() {
        return "index";
    }
}
```





