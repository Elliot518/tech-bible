

### 1. Background

```
1. Before spring boot2.7 version:

Our automatically configured classes are defined int the META-INF/spring.factories file.

2. It is compatible between spring boot2.7~spring boot3.0 versions

META-INF/spring/org.springframework.boot.autoconfigure.AutoConfiguration.imports and

META-INF/spring.factories of these two files.

3. After spring boot3.0 version, only the use of

META-INF/spring/org.springframework.boot.autoconfigure.AutoConfiguration.imports

to customize our auto-configured classes
```

&nbsp;

### 2. Steps

#### 2-1) Folders structure

![starter folders structure](https://raw.githubusercontent.com/Elliot518/mcp-oss-tech/main/backend/springboot/starter/springboot3_starter_structure.png)

<hr>

#### 2-2) org.springframework.boot.autoconfigure.AutoConfiguration.imports

```
com.mcp.starters.aop.SecureApiAutoConfiguration
```

<hr>

#### 2-3) Import classes in auto config class

- SecureApiAutoConfiguration.java
    ```java
    package com.mcp.starters.aop;

    import com.mcp.starters.aop.config.WebConfig;
    import lombok.extern.slf4j.Slf4j;
    import org.springframework.boot.autoconfigure.AutoConfiguration;
    import org.springframework.context.annotation.Configuration;
    import org.springframework.context.annotation.Import;

    @Slf4j
    @Configuration
    @Import({WebConfig.class, TokenInterceptor.class})
    @AutoConfiguration
    public class SecureApiAutoConfiguration {
        public SecureApiAutoConfiguration() {
            log.info("##### Secure Api auto configuration...");
        }
    }
    ```


