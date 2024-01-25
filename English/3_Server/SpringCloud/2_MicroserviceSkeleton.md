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

- create single project
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

- create microservices by bash
```shell
cd [ProjectRootFolder]
bash ../Scripts/create-projects.bash
```

bash: <br>
https://github.com/Elliot518/springcloud-academy/blob/main/Scripts/create-projects.bash

&nbsp;




### 2. Setting up multi-project builds in Gradle

#### 2-1) Create the settings.gradle file for all modules

```shell
cd [SourceFolder]

cat <<EOF > settings.gradle
include ':microservices:product-service'
include ':microservices:review-service'
include ':microservices:recommendation-service'
include ':microservices:product-composite-service'
EOF
```
<hr>

#### 2-2) Reuse the gradle file from one of the projects for the multi-project builds

We copy the Gradle executable files that were generated from one of the projects so that we can reuse them for the multi-project builds
```shell
cp -r microservices/product-service/gradle .
cp microservices/product-service/gradlew .
cp microservices/product-service/gradlew.bat .
cp microservices/product-service/.gitignore .
```

<hr>

#### 2-3) Remove the generated Gradle executable files in each project

We no longer need the generated Gradle executable files in each project, so we can remove them with the following commands:
```shell
find microservices -depth -name "gradle" -exec rm -rfv "{}" \; 
find microservices -depth -name "gradlew*" -exec rm -fv "{}" \;
```

<hr>

#### 2-4) Build all the microservices with one command
```shell
./gradlew build
```

- build in IDEA
![build in IDEA](https://github.com/Elliot518/mcp-oss-tech/blob/main/backend/springcloud/multiple_gradle_projects.png?raw=true)

