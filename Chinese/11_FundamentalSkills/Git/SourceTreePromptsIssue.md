[Back](README.md)

### 修复ac系统sourceTree一直提示输入密码的问题

<hr>

### 问题描述:

作为一个习惯使用 SourceTree 在 MacBook Pro 上提交代码的用户, 我在 macOS 上安装了该应用程序。
然而，我发现每次提交代码都需要输入密码，这对我的效率和心情产生了不良影响。

### 解决方法:
1) 打开你的SourceTree、如图 点击终端按钮

![sourcetree](https://raw.githubusercontent.com/Elliot518/mcp-oss-repo/main/other/sourcetree_issue1.png)

2) 在终端中输入以下命令来配置 Git 的凭据助手(这将告诉 Git 使用一个简单的凭据存储方式来记住你的用户名和密码)
```
git config credential.helper store
```

3) 用以下命令拉取代码
```
git pull
```

在弹出的对话框中，依次输入你的用户名和密码。
完成以上步骤后，再次拉取代码时就不会再提示输入密码了。
Git 会自动使用之前存储的凭据进行身份验证。
