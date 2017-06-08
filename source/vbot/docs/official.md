title: 公众号
layout: vbot/page
---
### type

official

### 特有属性

参数 | 类型 | 描述
--- | --- | ---
title | string | 标题
description | string | 描述
app | string | 公众号来源名称
url | string | 链接
articles | array | 公众号文章列表 [['title' => '标题', 'url' => '链接', 'cover' => '封面URL'], [...]]

### 例子

```php
$vbot->messageHandler->setHandler(function(Collection $message){
    // ...

    if ($message['type'] === 'official') {
        Text::send($message['from']['UserName'], '收到公众号:'.$message['title'].$message['description'].$message['app'].$message['url']);
    }
});
```