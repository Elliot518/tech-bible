[Back](README.md)

## Start Go

<hr>


### 1. Install Go

[download go](https://go.dev/dl/)

- 1-1)

  Open the package file you downloaded and follow the prompts to install Go.
  The package installs the Go distribution to /usr/local/go. The package should put the /usr/local/go/bin directory in your PATH environment variable. You may need to restart any open Terminal sessions for the change to take effect.
  <hr>

- 1-2)

  Verify that you've installed Go by opening a command prompt and typing the following command:
  ```shell
  $ go version
  ```
  <hr>

- 1-3)

  Confirm that the command prints the installed version of Go
  ```shell
  go version go1.22.6 darwin/arm64
  ```

&nbsp;

### 2. Install Go Doc

```
go install golang.org/x/tools/cmd/godoc@latest

# start go doc
~/go/bin/godoc -http=:8001
```
You can acceess url: http://localhost:8001/pkg/