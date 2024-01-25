[Back](README.md)

## Create microservices skeleton

<hr>


### 1. Using Spring Initializr to generate skeleton code

> Spring Initializr is provided by the Spring team and can be used to configure and 
generate new Spring Boot applications.

The tool helps developers to choose additional Spring modules 
to be used by the application and ensures that dependencies are configured to use compatible versions of the selected modules. The tool supports the use of either Maven or Gradle as a build system and can generate source code for either Java, Kotlin, or Groovy.

It can either be invoked from a web browser using the URL https://start.spring.io/ or using a command-line tool, **spring init**.

#### 1-1) Create the skeleton by command-line

```shell
spring init \
--boot-version=3.1.7 \
--type=gradle-project \
--java-version=17 \
--packaging=jar \
--name=product-service \
--package-name=com.mcp.microservices.core.product \
--groupId=com.mcp.microservices.core.product \
--dependencies=actuator,webflux \
--version=1.0.0-SNAPSHOT \
product-service
```