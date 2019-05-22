title: API
layout: vbot/page
---

在版本 v2.0 , Vbot 支持 API 以便开发者搭建自己的微信网页客户端，要开启 API 功能，必须安装 [swoole](http://www.swoole.com)

### 配置

这里 IP 可以自行设置，例如如果你有公网IP ，这里可以设置公网IP

```php
<?php

return [
    // ...
    'swoole'  => [
        'status' => true,
        'ip'     => '127.0.0.1',
        'port'   => '8866',
    ],
```

### API

API 的格式均为 post json 到 http://ip:port, 如上配置即是 http://127.0.0.1:8866

json 格式均为 

```
[
    'action' => $action,
    'params' => []
]
```

action 为 API 操作，当前仅支持 send 和 search

#### send API

##### params 参数

- type 发送类型，与消息的 type 相同
- username 发送对象
- content send()后面的参数，如果需要多个参数可逗号分隔

##### 发送文字

```json
{"action":"send", "params": {"type":"text","username": "@@5e200a8c6e4fefcc7e5f86ebf6b585c85bb8dd066c32a3b28b4b5cf49cb5d6e5", "content":"hi, this is from api"}}
```

##### 发送名片

```json
{"action":"send", "params": {"type":"card","username": "@@5e200a8c6e4fefcc7e5f86ebf6b585c85bb8dd066c32a3b28b4b5cf49cb5d6e5", "content":"hanson1994,API 测试"}}
```

等等。。。

#### search API

查询 API 可直接操作联系人所包含的方法

##### params 参数

- type 查询的对象，可选 friends/groups/members/specials/officials
- method 执行方法
- filter 方法的参数（必须按顺序）

##### getObject 

```json
{"action":"search","params":{"type":"friends", "method": "getObject","filter":["HanSon","NickName",false,true]}}
```