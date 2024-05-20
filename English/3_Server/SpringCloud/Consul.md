[Back](README.md)

## Consul

<hr>


### 1. Install Consul

- macOS
    ```
    brew tap hashicorp/tap
    brew install hashicorp/tap/consul
    ```

&nbsp;

### 2. Start the Consul Agent in Development Mode

```
# nodename: myconsul
consul agent -node=myconsul -dev
```

![spring cloud consul](https://github.com/Elliot518/mcp-oss-tech/blob/main/springcloud/consul/spring_cloud_consul.jpg?raw=true)

&nbsp;

### 3. Monitor

You can run the following command to start the Consul monitor with a log level set to debug
```
consul monitor -log-level=debug
```

