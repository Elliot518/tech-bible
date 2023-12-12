[Back](README.md)

## Spring Data REST

<hr>


### 1. Introduction

> Spring Data REST is part of the umbrella Spring Data project and makes it easy to build hypermedia-driven REST web services on top of Spring Data repositories.

It offers an easy and fast way to implement RESTful web services with Spring. Spring 
Data REST provides HATEOAS (Hypermedia as the Engine of Application State) support, an architectural principle that allows clients to navigate the REST API dynamically using hypermedia links. Spring Data REST also provides events that you can use to customize the business logic of your REST API endpoints.

- Official website

    https://spring.io/projects/spring-data-rest

- doc

    https://docs.spring.io/spring-data/rest/docs/3.0.9.RELEASE/reference/html/

### By default, Spring Data REST finds all public repositories from the application and creates RESTful web services for your entities automatically.
_(eg: we have two repositories: CarRepositoryand OwnerRepository; therefore, Spring Data REST creates RESTful web services automatically for those repositories.)_

&nbsp;

### 2. How to use

#### 2-1) add dependency

```groovy
implementation 'org.springframework.boot:spring-boot-starter-datarest'
```

<hr>

#### 2-2) define the endpoint of the service in your application.properties file

```xml
spring.data.rest.basePath=/api
```


Now, you can access the RESTful web service from the localhost:8080/api endpoint. 
By calling the root endpoint of the service, it returns the resources that are available.

![](https://github.com/Elliot518/mcp-oss-repo/blob/main/springboot/springdata/spring_data_rest_root_api.png?raw=true)


_(We can see that there are links to the entity services. 
The Spring Data REST service path name is derived from the entity class name. 
The name will then be pluralized and uncapitalized.)_

If you want to use different path naming, you can use the @RepositoryRestResource annotation in your repository class.
```java
@RepositoryRestResource(path="vehicles")
public interface CarRepository extends CrudRepository<Car, Long> {
}
```


-  _links attribute

    > It is a collection of links, and with these links, you can access the car itself or get the owner of the car. 

    eg: To access one specific car, the path will be: http://localhost:8080/api/cars/{id}

<hr>

#### 2-3) create customized queries

Query parameters are annotated with the @Param annotation

```java
@RepositoryRestResource
public interface CarRepository extends CrudRepository<Car, Long> {
    // Fetch cars by brand
    List<Car> findByBrand(@Param("brand") String brand);
    // Fetch cars by color
    List<Car> findByColor(@Param("color") String color);
}
```

http://localhost:8080/api/cars/search

```json
{
	"_links": {
		"findByBrand": {
			"href": "http://localhost:8080/api/cars/search/findByBrand{?brand}",
			"templated": true
		},
		"findByColor": {
			"href": "http://localhost:8080/api/cars/search/findByColor{?color}",
			"templated": true
		},
		"self": {
			"href": "http://localhost:8080/api/cars/search"
		}
	}
}
```

http://localhost:8080/api/cars/search/findByBrand?brand=Ford


&nbsp;

### 3. Documenting a RESTful API

> A RESTful API should be properly documented so that developers who are consuming it understand its functionality and behavior. The documentation should include what endpoints are available, what data formats are accepted, and how to interact with the API.


- OpenAPI 3 library for Spring Boot 
	>  The OpenAPI(https://springdoc.org) Specification (formerly Swagger Specification) is an API description format for RESTful APIs.
	
	_It can generate documentation automatically_

	#### Other alternatives: RAML(https://raml.org/)

-  How to generate RESTful API documentation using OpenAPI 3
	1) add the OpenAPI library to our Spring Boot application

		Add the following dependency to your build.gradle file:
		```groovy
		implementation group: 'org.springdoc', name: 'springdoc-openapi-starter-webmvc-ui', version: '2.0.2'
		```

	2) create a configuration class called OpenApiConfig for our documentation
		```java
		import org.springframework.context.annotation.Bean;
		import org.springframework.context.annotation.Configuration;
		import io.swagger.v3.oas.models.OpenAPI;
		import io.swagger.v3.oas.models.info.Info;
		@Configuration
		public class OpenApiConfig {
			@Bean
			public OpenAPI myDatabaseOpenAPI() {
				return new OpenAPI()
					.info(new Info()
					.title("My REST API")
					.description("My server api")
					.version("1.0"));
			}
		}
		```

	3) define the path for our documentation and enable Swagger UI in application.properties file
		```java
		springdoc.api-docs.path=/api-docs
		springdoc.swagger-ui.path=/swagger-ui.html
		springdoc.swagger-ui.enabled=true
		```
		tool for visualizing RESTful APIs that are documented using the OpenAPI Specification (https://swagger.io/tools/swagger-ui/)
	
	4) check the documentation in Swagger UI

		When your application is running, navigate to http://localhost:8080/swagger-ui.html and you will see the documentation

		 The documentation is also available in JSON format at http://localhost:8080/api-docs
