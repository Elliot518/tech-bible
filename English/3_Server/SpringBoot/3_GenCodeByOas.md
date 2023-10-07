[Back](README.md)

## Generate Code by OAS

<hr>


### 1. Use Spring Initializr to create a project

![spring](https://raw.githubusercontent.com/Elliot518/mcp-oss-repo/main/springboot/springboot_gradle.png)

&nbsp;


### 2. Add OpenAPI Dependencies

#### 2-1) Open project by IntelliJ IDEA and setup gradle

![setup gradle](https://raw.githubusercontent.com/Elliot518/mcp-oss-repo/main/ide/gradle/gradle_setting.png)

<hr>

#### 2-2)  add the Swagger Gradle plugin under plugins in build.gradle

```groovy
plugins {
	...
	id 'org.hidetake.swagger.generator' version '2.19.2'
}
```

<hr>

#### 2-3) add the following extra dependencies required for OpenAPI support under dependencies in the build.gradle file:

```groovy
dependencies {
    // OpenAPI Starts
    swaggerCodegen 'org.openapitools:openapi-generator-cli:6.2.1'
    compileOnly 'io.swagger:swagger-annotations:1.6.4'
    compileOnly 'org.springframework.boot:spring-boot-starter-validation'
    compileOnly 'org.openapitools:jackson-databind-nullable:0.2.3'
    implementation 'com.fasterxml.jackson.dataformat:jackson-dataformat-xml'
    implementation 'org.springframework.boot:spring-boot-starter-hateoas'
    // required for schema in swagger generated code
    implementation 'io.springfox:springfox-oas:3.0.0'
    // OpenAPI Ends

    implementation 'org.springframework.boot:spring-boot-starter-web'

    ...
}
```

<hr>

#### 2-4) Define the OpenAPI config for code generation

>what model and API package names OpenAPI Generator’s CLI should use, or the library it should use to generate the REST interfaces

configurations can be defined in config.json (/src/main/resources/api/config.json):

```groovy
{
  "library": "spring-boot",
  "dateLibrary": "java8",
  "hideGenerationTimestamp": true,
  "modelPackage": "com.mcp.springboot.oas.model",
  "apiPackage": "com.mcp.springboot.oas",
  "invokerPackage": "com.mcp.springboot.oas",
  "serializableModel": true,
  "useTags": true,
  "useGzipFeature" : true,
  "hateoas": true,
  "unhandledException": true,
  "useSpringBoot3": true,
  "useSwaggerUI": true,
  "importMappings": {
    "ResourceSupport":"org.springframework.hateoas.RepresentationModel",
    "Link": "org.springframework.hateoas.Link"
  }
}
```
<hr>

#### 2-5) Define the OpenAPI Generator ignore file

.openapi-generator-ignore
```
**/*Controller.java
```

<hr>

#### 2-6) Design API by OAS

put the file in /src/main/resources/api

[yaml file](https://github.com/Elliot518/mcp-oss-repo/blob/main/files/yaml/openapi.yaml)

<hr>

#### 2-7) Define a swaggerSources task in the Gradle build file

```groovy
processResources {
	dependsOn(generateSwaggerCode)
}

swaggerSources {
	def typeMappings = 'URI=URI'
	def importMappings = 'URI=java.net.URI'
	eStore {
		def apiYaml = "${rootDir}/src/main/resources/api/openapi.yaml"
		def configJson = "${rootDir}/src/main/resources/api/config.json"
		inputFile = file(apiYaml)
		def ignoreFile = file("${rootDir}/src/main/resources/api/.openapi-generator-ignore")
		code {
			language = 'spring'
			configFile = file(configJson)
			rawOptions = ['--ignore-file-override', ignoreFile, '--type-mappings',
						  typeMappings, '--import-mappings', importMappings] as List<String>
			components = [models: true, apis: true, supportingFiles: 'ApiUtil.java']
			dependsOn validation
		}
	}
}
```

The eStore is the user-defined name, which contains inputFile, pointing 
to the location of the openapi.yaml file. After defining the input, the generator needs to produce the output, which is configured in code.

<hr>

#### 2-8) Add swaggerSources to the compileJava task dependency

```groovy
compileJava.dependsOn swaggerSources.eStore.code
```

<hr>

#### 2-9) Add the generated source code to Gradle sourceSets
This makes the generated source code and resources available for development and build:
```groovy
sourceSets.main.java.srcDir "${swaggerSources.eStore.code.outputDir}/src/main/java"
sourceSets.main.resources.srcDir "${swaggerSources.eStore.code.outputDir}/src/main/resources"
```

<hr>

#### 2-10) Build the project to generate, compile, and build the code


```
./gradlew clean build
```

