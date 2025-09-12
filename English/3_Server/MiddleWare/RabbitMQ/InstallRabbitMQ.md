[Back](../README.md)

<hr>

## Install by Docker


### 1. install latest using docker(temporary test)
```shell
# latest RabbitMQ 4.x(using --rm to start a temporary docker container)
docker run -it --rm --name rabbitmq -p 5672:5672 -p 15672:15672 rabbitmq:4-management
```


&nbsp;

### 2. install latest using docker(permanant)
```shell
# Startup command (remove --rm and add data volume mount)
# Mount the data directory to the host, Optional: Set a default username and password
docker run -d \
--name rabbitmq \
-p 5672:5672 \
-p 15672:15672 \
-v ~/rabbitmq/data:/var/lib/rabbitmq \
-e RABBITMQ_DEFAULT_USER=admin \
-e RABBITMQ_DEFAULT_PASS=password \
rabbitmq:4-management
```

&nbsp;

<hr>

### Other commonly used commands

&nbsp;

```java
/**
  When you shut down your computer, the Docker container automatically stops.
  The next time you need to start RabbitMQ, you don't need to re-run the full docker run command (because the container already exists).
  You can simply run the following command:
*/
```

### 3. Start the existing rabbitmq container
```
docker start rabbitmq
```

&nbsp;

### 4. Stop the container (data will not be deleted)
```
docker stop rabbitmq
```

&nbsp;

### 5. Delete the container (stop it before deleting)
```
docker rm rabbitmq
```

