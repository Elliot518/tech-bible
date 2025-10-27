[Back](README.md)

## Acceleration mirrors config in mainland China

<hr>


### 1. Docker acceleration mirrors config(Linux) 

```shell
sudo mkdir -p /etc/docker

sudo tee /etc/docker/daemon.json <<EOF
{
  "registry-mirrors": [
    "http://hub-mirror.c.163.com",
    "https://docker.1panel.live",
    "https://docker.1ms.run",
    "https://dytt.online",
    "https://docker-0.unsee.tech",
    "https://lispy.org",
    "https://docker.xiaogenban1993.com",
    "https://666860.xyz",
    "https://hub.rat.dev",
    "https://docker.m.daocloud.io",
    "https://demo.52013120.xyz",
    "https://proxy.vvvv.ee",
    "https://registry.cyou"
  ]
}
EOF

# linux
sudo systemctl daemon-reload
sudo systemctl restart docker
```

&nbsp;

### 2. Docker acceleration mirrors config(macOS) 

The easiest way is to use the Docker Desktop graphical interface:

> Click the Docker icon in the menu bar -> Select the "Restart" option

Hedre's the json you set in docker desktop:
```json
{
  "builder": {
    "gc": {
      "defaultKeepStorage": "20GB",
      "enabled": true
    }
  },
  "experimental": false,
  "registry-mirrors": [
    "http://hub-mirror.c.163.com",
    "https://docker.1panel.live",
    "https://docker.1ms.run",
    "https://dytt.online",
    "https://docker-0.unsee.tech",
    "https://lispy.org",
    "https://docker.xiaogenban1993.com",
    "https://666860.xyz",
    "https://hub.rat.dev",
    "https://docker.m.daocloud.io",
    "https://demo.52013120.xyz",
    "https://proxy.vvvv.ee",
    "https://registry.cyou"
  ]
}
```
- setup registry mirrors in docker desktop

  ![docker desktop mirrors](https://raw.githubusercontent.com/Elliot518/mcp-oss-tech/refs/heads/main/container/docker/registry_mirrors_docker.png)




