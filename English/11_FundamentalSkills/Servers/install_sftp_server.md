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

&nbsp;

- After startup, using **docker ps -a** to show the process below：
![sftp docker ps](https://raw.githubusercontent.com/Elliot518/mcp-oss-tech/refs/heads/main/server/sftp/sftp_docker_ps.png)

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

<hr>

- FileZilla Site Setting
![FileZilla Site Setting](https://raw.githubusercontent.com/Elliot518/mcp-oss-tech/refs/heads/main/server/sftp/filezilla_site_setting.png)



- Remote Site Connected
![Remote Site Connected](https://raw.githubusercontent.com/Elliot518/mcp-oss-tech/refs/heads/main/server/sftp/filezilla_remote_site.png)









