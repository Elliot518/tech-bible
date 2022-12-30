###1. 查看是否安装 telnet和 依赖的xinetd

```
rpm -qa | grep telnet
```

&nbsp;

###2.没有则安装

```
yum install  xinetd
yum install telnet
yum install telnet-server
```

&nbsp;

###3. 开启telnet

>修改文件/etc/xinetd.d/telnet来开启服务  修改 disable = yes 为 disable = no

touch telnet
```
service telnet         
{  
  flags = REUSE  
  socket_type = stream  
  wait = no  
  user = root  
  server =/usr/sbin/in.telnetd  
  log_on_failure += USERID  
  disable = no   
}
```

&nbsp;

###4.启动服务 telnet 和 xinetd

```
service  xinetd restart
```
查看是否启动
```
ps -ef | grep xinetd
ps -ef | grep telnet
```

&nbsp;

###5. 设置开机启动

```
将xinetd服务加入开机自启动：systemctl enable xinetd.service

将telnet服务加入开机自启动：systemctl enable telnet.socket
```

