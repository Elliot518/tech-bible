[Back](README.md)

## Install Ftp Server

<hr>


### 1. Install an FTP server using Docker

- Start FTP container
    ```shell
    docker run -d \
    --name=my-ftp \
    -p 21:21 \
    -p 20:20 \
    -p 21100-21110:21100-21110 \
    -v ~/ftp:/home/vsftpd \
    -e FTP_USER=ftpuser \
    -e FTP_PASS=123456 \
    -e PASV_ADDRESS=127.0.0.1 \
    -e PASV_MIN_PORT=21100 \
    -e PASV_MAX_PORT=21110 \
    --restart=always \
    fauria/vsftpd
    ````
    _Create an FTP service with the username **ftpuser** and password **123456** (mapping the directory to the local **~/ftp**)_

<hr>

- Stop container: `docker stop my-ftp`
- Start container: `docker start my-ftp`
- View logs (for troubleshooting): `docker logs my-ftp`
- Delete container: `docker rm -f my-ftp`

&nbsp;

### 2. Connection test

- Host: 127.0.0.1
- Port: 21
- Username: ftpuser
- Password: 123456
- Encryption: Use only regular FTP (insecure)
