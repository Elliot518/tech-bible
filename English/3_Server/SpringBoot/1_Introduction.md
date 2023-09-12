[Back](README.md)

## Introduction

<hr>

### 1. What is Spring Boot

- Authoritative Definition

  > Spring Boot Extension is Spring's convention-over-configuration solution for creating stand-alone, production-grade Spring-based Applications that you can "just run".
  
  Minimizes the need for initial configuration
  Most Spring Boot applications need very little Spring configuration.

  Spring Boot also favors a runtime model based 
  on a standalone JAR file, also known as a fat JAR file.

  Before Spring Boot, the most common way to run a Spring application was to deploy it as a WAR file on a Java EE web server, such as Apache Tomcat. 
  And WAR file deployment is still supported by Spring Boot.

[Official Site](https://spring.io/projects/spring-boot#overview)

- Current Latest Version
  | Version | Doc | API |
  | ---- | ---- | ---- |
  | 3.0.1 GA (CURRENT) | [Reference Doc](https://docs.spring.io/spring-boot/docs/current/reference/html/) | [API Doc](https://docs.spring.io/spring-boot/docs/current/api/) |
  | 2.7.7 | [Reference Doc](https://docs.spring.io/spring-boot/docs/2.7.7/reference/html/) | [API Doc](https://docs.spring.io/spring-boot/docs/2.7.7/api/) |

- History Versions
  ![Versions 2017 - 2022](https://raw.githubusercontent.com/Elliot518/mcp-oss-repo/main/springboot/springboot_history_versions.png)


&nbsp;

### 2. Create Spring Boot Skeleton

- How to create a spring boot skeleton

  > We can create a spring boot skeleton by [spring initializr](https://start.spring.io) which is an online official tool.

![spring initializr](https://raw.githubusercontent.com/Elliot518/mcp-oss-repo/main/springboot/spring_initializr.png)

&nbsp;

### 3. Explain Core Conceptions of Spring Boot Skeleton

- @SpringBootApplication

  ```java
  @SpringBootApplication
  public class MyApplication {
    public static void main(String[] args) {
      SpringApplication.run(MyApplication.class, args);
    }
  }
  ```

  Functionalities provided by this annotation:
  - component scanning

    Search Spring components and configuration 
    classes in the package of the application class and all its sub-packages

  -  autoconfiguration
    Search JAR files in the classpath that it can configure automatically(eg: automatically configure Tomcat as an embedded web server if Tomcat in the classpath)

  - The application class itself becomes a configuration class

<hr>


- @Autowired

  Automatically inject a component
<hr>

- @ComponentScan

  Scan one or more packages to auto-wire components

  eg:
  ```java
  @SpringBootApplication
  @ComponentScan({"com.company.a", "com.company.b" })
  public class MyApplication {
    ...
  }
  ```

<hr>

-  @Configuration

    It is java-based configuration, we can use it to override Spring Boot’s default configuration or to add our own configuration

```java
@Configuration
public class SubscriberApplication {
  @Bean
  public xxx someFunc() {
    ...

    return ...;
  }
}
```
