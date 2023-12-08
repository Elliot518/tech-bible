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


