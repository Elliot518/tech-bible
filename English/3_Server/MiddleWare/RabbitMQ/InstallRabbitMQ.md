[Back](../README.md)

<hr>

## Install by Docker


### install latest using docker(temporary test)
```shell
# latest RabbitMQ 4.x(using --rm to start a temporary docker container)
docker run -it --rm --name rabbitmq -p 5672:5672 -p 15672:15672 rabbitmq:4-management
```


### install latest using docker(permanant)
```shell
# Startup command (remove --rm and add data volume mount)
docker run -d \
  --name rabbitmq \
  -p 5672:5672 \
  -p 15672:15672 \
  -v ~/rabbitmq/data:/var/lib/rabbitmq \  # Mount the data directory to the host
  -e RABBITMQ_DEFAULT_USER=admin \       # Optional: Set a default username
  -e RABBITMQ_DEFAULT_PASS=password \    # Optional: Set a default password
  rabbitmq:4-management
  ```

