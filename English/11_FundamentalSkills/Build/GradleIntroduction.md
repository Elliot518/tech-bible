[Back](README.md)

## Gradle introduction

<hr>

### 1. What is Gradle

> Gradle is a build automation tool that makes the software development process simpler and also unifies the development process. It manages our project dependencies and handles the build process.

### build.gradle file
>  The build.gradle file is used to configure and manage the build process for a software project, it typically includes information about the project’s dependencies, like external libraries and frameworks that are needed for the project to compile. 

The build.gradle file can be customized to fit the specific needs of the project and can be used to automate tasks such as building, testing, and deploying the software.

(_You can use either the Kotlin or Groovy programming languages to write build.gradle files._)

&nbsp;

### 2. Setup gradle in IntelliJ IDEA
![gradle idea](https://github.com/Elliot518/mcp-oss-repo/blob/main/ide/gradle/idea_gradle.png?raw=true)

&nbsp;

### Sample build.gradle file introduction

```groovy
plugins {
    id 'java'
    id 'org.springframework.boot' version '3.1.0'
    id 'io.spring.dependency-management' version '1.1.0'
}
group = 'com.packt'
version = '0.0.1-SNAPSHOT'
sourceCompatibility = '17'

repositories {
    mavenCentral()
}

dependencies {
    implementation 'org.springframework.boot:spring-boot-starter-web'
    developmentOnly 'org.springframework.boot:spring-boot-devtools'
    testImplementation 'org.springframework.boot:spring-boot-starter-test'
}
tasks.named('test') {
    useJUnitPlatform()
}
```

### config comment
- Plugins
    > The plugins block defines the Gradle plugins that are used in the project. In the sample block, we have defined the version of Spring Boot. 

- Repositories
    > The repositories block defines the dependency repositories that are used 
    to resolve dependencies. In the sample, we are using the Maven Central repository from which Gradle pulls the dependencies. 

- Dependencies
    > The dependencies block specifies the dependencies that are used in the 
    project, dependencies are like external libraries and frameworks.

- Tasks
    > The tasks block defines the tasks that are part of the build process, such as testing.

&nbsp;

### Refresh gradle in Eclipse

After you have updated the build.gradle file, you should update your dependencies by selecting the project in Eclipse’s Project Explorer and right clicking to open the context menu. 

Then, select **Gradle | Refresh Gradle Project**, as shown in the next screenshot:


![refresh gradle](https://github.com/Elliot518/mcp-oss-repo/blob/main/ide/gradle/refresh_gradle.png?raw=true)