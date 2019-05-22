title: 分享
layout: vbot/page
---
### type

share

### 特有属性

参数 | 类型 | 描述
--- | --- | ---
title | string | 标题
description | string | 描述
app | string | 来源APP
url | string | 链接

### 例子

```php
$vbot->messageHandler->setHandler(function(Collection $message){
    // ...

    if ($message['type'] === 'share') {
        Text::send($message['from']['UserName'], '收到分享:'.$message['title'].$message['description'].$message['app'].$message['url']);
    }
});
```