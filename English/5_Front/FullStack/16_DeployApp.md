[Back](README.md)

## Deploying Your Application

<hr>


### 1. Deploying the backend with AWS

You can build your project using the following Gradle wrapper 
command in your project folder:
```
./gradlew build
```
Alternatively, you can use IDE(IntelliJ IDEA) -> Gradle(clean + build)
This creates a new build/libs folder to your project, where you will find JAR files under {ProjectFolder}/build/libs

By default, two JAR files are created:
1) The file with extension .plain.jar contains Java bytecode and other resources, but it doesn’t contain any application framework or dependencies.
2) The other .jar file is a fully executable archive that you can run using the java -jar your_appfile.jar Java command.

