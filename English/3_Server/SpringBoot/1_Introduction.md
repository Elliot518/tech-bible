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

### 3. Explain Core Annotations of Spring Boot Skeleton

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

&nbsp;

### 4. What’s new in Spring Boot 3.0

- Observability

  built-in support for distributed tracing to the already existing support for metrics and logging in previous Spring Boot releases, new Observability API in Spring Framework v6.0 and a new module named Micrometer Tracing which is based on Spring Cloud Sleuth.

- Native compilation

  Spring Boot 3.0 supports compiling Spring Boot applications to native images, which are standalone executable files. A native-compiled Spring Boot application starts significantly faster and consumes less memory.

- Virtual threads

  Spring Boot 3.0 supports lightweight threads called virtual threads. Virtual threads are expected to simplify the programming model for developing reactive non-blocking microservices. Virtual threads are currently only available as a preview in Java 19.

&nbsp;

### 5. How to migrate an application from SpringBoot 2 to SpringBoot 3

#### 1) Upgrading Spring Boot 2 applications to the latest v2.7.x(Pivotal's migration guide assumes you are on v2.7)

#### 2) Ensure you have Java 17 or later installed, both in your development and runtime environments. 

#### 3) Remove calls to deprecated methods in Spring Boot 2.x. You can enable the lint:deprecation flag in the Java compiler using (Gradle):
```gradle
tasks.withType(JavaCompile) {
  options.compilerArgs += ['-Xlint:deprecation']
}
```

#### 4) Rename all imports of javax packages that are now part of Jakarta EE to jakarta.

#### 5) For libraries that are not managed by Spring, you need to ensure that you are using versions that are Jakarta compliant, that means using jakarta packages.

#### 6) For breaking changes and other important migration information, read through:

https://github.com/spring-projects/spring-boot/wiki/Spring-Boot-3.0-Migration-Guide

https://docs.spring.io/spring-security/reference/migration/index.html

#### 7) Have end-to-end black-box tests to verify the functionality of your application.

