[Back](README.md)

## Upgrade Jenkins Jdk to 17

<hr>


### 1. Check running docker

```shell
# check running docker processes, pick out jenkins ID
docker ps -a
```

&nbsp;

### 2. Stop jenkins docker process

```shell
docker stop [jenkins docker psid]

eg:
docker stop e3fb6f481029
```

&nbsp;

### 3. Delete jenkins docker container

```shell
docker rm [jenkins docker psid]

eg:
docker rm e3fb6f481029
```

&nbsp;

### 4. Rerun jenkins by docker

```shell
docker run -d --name jenkins \
  -p [expose port]:8080 -p 50000:50000 \
  -v /data/jenkins_home:/var/jenkins_home \
  -v [Your JDK17 Home]:/usr/local/java \
  -v [Your Maven Home]:/usr/local/maven \
  jenkinsci/blueocean

eg:
docker run -d --name jenkins \
  -p 8099:8080 -p 50000:50000 \
  -v /data/jenkins_home:/var/jenkins_home \
  -v /soft/jdk-17.0.11:/usr/local/java \
  -v /soft/apache-maven-3.8.1:/usr/local/maven \
  jenkinsci/blueocean
```



