title: 小程序
layout: vbot/page
---
### type

mina

### 特有属性

参数 | 类型 | 描述
--- | --- | ---
title | string | 小程序名称
url | string | 小程序介绍链接

### 例子

```php
$vbot->messageHandler->setHandler(function(Collection $message){
    // ...

    if ($message['type'] === 'mina') {
        Text::send($message['from']['UserName'], '收到小程序：'.$message['title'].$message['url']);
    }
});
```