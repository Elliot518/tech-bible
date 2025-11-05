[Back](README.md)

## Install SFTP Server

<hr>


### 1. Install an SFTP server using Docker

- Start SFTP container
    ```shell
    docker run -d \
    --name=my-sftp \
    -p 2222:22 \
    -v ~/sftp:/home/sftpuser/upload \
    atmoz/sftp \
    sftpuser:123456:1001
    ````
    _Create an SFTP service with the username **sftpuser** and password **123456** (mapping the directory to the local **~/sftp**)_

<hr>

- Stop container: `docker stop my-sftp`
- Start container: `docker start my-sftp`
- View logs (for troubleshooting): `docker logs my-sftp`
- Delete container: `docker rm -f my-sftp`

&nbsp;

### 2. Connection test

- Host: 127.0.0.1
- Port: 2222
- Username: sftpuser
- Password: 123456
