[Back](README.md)

## Install by Docker

<hr>


```bash
docker pull n8nio/n8n:latest

# temp
docker run -it --rm \
  --name n8n \
  -p 5678:5678 \
  -v ~/.n8n:/home/node/.n8n \
  n8nio/n8n:latest

  # permanant
  docker run -it \
  --name n8n \
  -p 5678:5678 \
  -v ~/.n8n:/home/node/.n8n \
  n8nio/n8n:latest
```

![n8n workflow local](https://raw.githubusercontent.com/Elliot518/mcp-oss-tech/refs/heads/main/ai/workflow/n8n/n8n_workflows_local.png)

