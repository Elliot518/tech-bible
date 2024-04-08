[Back](README.md)

## Nacos Start Local

<hr>


### 1. Nacos 1.x

#### 1-1) start nacos
```
cd /Users/kg/soft/nacos/bin
sh startup.sh -m standalone
```
<hr> 

#### 1-2) check
```
tail -f /Users/kg/soft/nacos/logs/start.out
```

Browser:

>http://localhost:8848/nacos

<hr>

#### 1-3) shutdown nacos
```
cd /Users/kg/soft/nacos/bin
sh shutdown.sh
```
<hr>

&nbsp;

### 2. Nacos 2.x

#### 2-1) start nacos2
```
cd /Users/kg/soft/nacos2/bin
sh startup.sh -m standalone

```
<hr>

#### 2-2) check
```
tail -f /Users/kg/soft/nacos2/logs/start.out
```

Browser:

>http://localhost:8848/nacos

<hr>

#### 2-3) shutdown nacos2
```
cd /Users/kg/soft/nacos2/bin
sh shutdown.sh
```
<hr>






