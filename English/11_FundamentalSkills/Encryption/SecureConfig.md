[Back](README.md)

## Secure Configuration Properties

<hr>


#### You can encrypt configuration properties as another security level for your applications.

### 1. Encrypt Properties Using the Secure Properties Tool

> Use the Secure Properties Tool to encrypt or decrypt text strings, values inside a properties file, or all the contents of a properties file.


Download link: [Secure Properties Tool Jar file](https://docs.mulesoft.com/mule-runtime/4.4/_attachments/secure-properties-tool.jar)


- Encrypt Files

  ```shell
  java -cp secure-properties-tool.jar com.mulesoft.tools.SecurePropertiesTool \
  <method> \
  <operation> \
  <algorithm> \
  <mode> \
  <key> \
  <input file> \
  <output file> \
  --use-random-iv [optional]
  ```

  eg(yaml - Blowfish algorithm):
  ```shell
  java -cp secure-properties-tool.jar com.mulesoft.tools.SecurePropertiesTool \
  file \
  encrypt \
  Blowfish \
  CBC \
  mulesoft \
  example_in.yaml \
  example_out.yaml
  ```
  - input:
    ```yaml
    properties:
    example1:
      value: "Muleman is here"
    example2: "Max the mule"
    ```

  - output:
    ```yaml
    properties:
    example1:
      value: "![qCReIPK3jcqD7WR84ISSIQ==]"
    example2: "![En8lII21ZHrdIaINw0+mSA==]"
    ```

  <hr>

  eg:(properties - Blowfish algorithm):
  ```shell
  java -cp secure-properties-tool.jar com.mulesoft.tools.SecurePropertiesTool \
  file \
  encrypt \
  Blowfish \
  CBC \
  mulesoft \
  example_in.properties \
  example_out.properties
  ```

  - input:
  
    ```
    properties.example1.value=Muleman is here
    properties.example2=Max the mule
    ```

  - output:
    ```
    properties.example1.value=![qCReIPK3jcqD7WR84ISSIQ==]
    properties.example2=![En8lII21ZHrdIaINw0+mSA==]
    ```

  <hr>

  eg:(properties - AES algorithm):
  ```shell
  java -cp secure-properties-tool.jar com.mulesoft.tools.SecurePropertiesTool \
  file \
  encrypt \
  AES \
  CBC \
  1234567890123456 \
  config.yaml \
  config-secure.yaml
  ```

  - input:
    ```yaml
    keystore:
      password: "123456"
    ```

  - output:
    ```yaml
    keystore:
      password: "![M8KptFRwYpNqKBjU6BaP4A==]"
    ```

