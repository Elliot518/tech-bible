[Back](README.md)

## KeyStore Encryption

<hr>


### 1. Generating KeyStore File

- generate jks file

  ```shell
  keytool -genkeypair -keystore keystore.jks   -dname "CN=localhost, OU=Unknown, O=Unknown, L=Unknown, ST=Unknown, C=Unknown"  -keypass password  -storepass password  -keyalg RSA  -sigalg SHA256withRSA  -keysize 2048  -alias certificate-name  -ext SAN=DNS:localhost,IP:0.0.0.0 -validity 9999
  ```

  _This will generate a file with the suffix jks in your command line execution directory_

&nbsp;

### 2. Install Tool

Download [KeyStore Explorer](https://keystore-explorer.org/downloads.html)

![KeyStore Explorer](https://raw.githubusercontent.com/Elliot518/mcp-oss-tech/refs/heads/main/tools/encryption/keystore_explorer.png)

&nbsp;

### 3. Exporting KeyStore File

> Export the jks file you just generated to p12 or pfx file

- 3-1) Click File->Open the jks file you just generated

- 3-2) Right click the certificate->Choose "Export"->Choose "Export Key Pair"
![Export Certificate File](https://raw.githubusercontent.com/Elliot518/mcp-oss-tech/refs/heads/main/tools/encryption/export_jks_p12.png)

- 3-3) Choose p12 or pfx file you want to export
![Export Certificate File](https://raw.githubusercontent.com/Elliot518/mcp-oss-tech/refs/heads/main/tools/encryption/choose_p12_file.png)
_(Don't forget to type in the password you entered when you generated the jks file, then this will generate a p12 or pfx file in your command line execution directory)_
