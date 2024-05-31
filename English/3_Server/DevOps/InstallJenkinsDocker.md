[Back](README.md)

## Install Jenkins(Docker)

<hr>


### 1. Pull docker image（choose jenkinsci/blueocean)
```shell
docker search jenkinsci
docker pull jenkinsci/blueocean
```

&nbsp;

### 2. Shutdown firewall(Optional)
```shell
systemctl stop firewalld.service
systemctl disable firewalld.service 
```

&nbsp;

### 3. Create home and data folders for mapping

```shell
mkdir -p /var/jenkins_home
mkdir -p /data/jenkins_home
chown -R 1000:1000 /data/jenkins_home/
```

&nbsp;

### 4. Run docker (Include jdk and maven)

```shell
docker run -d --name jenkins -p 8099:8080 -p 50000:50000 -v /data/jenkins_home:/var/jenkins_home -v /soft/jdk1.8.0_251:/usr/local/java -v/soft/apache-maven-3.8.1:/usr/local/maven jenkinsci/blueocean
```

&nbsp;

### 5. Validate

Access below address by browser:
http://IP:port/
(eg: http://127.0.0.1:8099/)

cat /data/jenkins_home/secrets/initialAdminPassword

<hr>

## Additional
&nbsp

### 1. Configure password-free to log other servers

```
# Jenkins配置免密，免密登录到其他服务器
sudo useradd kg
sudo passwd kg
```

&nbsp;


### 2. Generate public and private key pairs

```shell
# 产生公钥与私钥对
ssh-keygen -t rsa 

cd ~/.ssh
cat id_rsa.pub >> authorized_keys
```
&nbsp;

### 3. Copy the public key to the target machine

```shell
# 用ssh-copy-id将公钥复制到目标机
ssh-copy-id -i ~/.ssh/id_rsa.pub root@[target server ip]

eg:
ssh-copy-id -i ~/.ssh/id_rsa.pub root@192.168.1.12
```
&nbsp;

### 4. Test password-free login

```shell
ssh root@[target server ip]
ssh root@192.168.1.12

# logout
logout
```

&nbsp;

### 5. Copy the secret key file to the Jenkins directory

```shell
# 把秘钥文件（id_rsa,文件不是文件内容）复制到Jenkins目录
cp -rf id_rsa /data/jenkins_home/
cp -rf id_rsa /var/jenkins_home/

# jenkins安装publish over ssh插件
```
